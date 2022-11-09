#! /usr/bin/env ruby

require 'tty-prompt'
require 'open3'
require 'pry'

class GitBranchSelector
  attr_reader :flag, :branch_lookback_count

  def initialize(flag:, branch_lookback_count:)
    @flag = flag
    @branch_lookback_count = branch_lookback_count
  end

  def build_menu
    branches, = Open3.capture3('git branch')
    if branches == ''
      puts %q(
        No branches to list. Ensure you're using this within a Git repository.
      )
      return
    end
    return show_list if flag == 'list'

    selected_option = TTY::Prompt.new.select(
      "Pick a branch",
      cycle: true,
      symbols: { marker: '☾' },
      per_page: cleaned_branches.length,
      filter: true,
      help: '(Arrows, numbers, type to filter, enter to select)',
      show_help: :always
    ) do |menu|
      menu.enum ':'

      cleaned_branches.each_with_index do |b, index|
        menu.choice b, index + 1
      end
    end

    branch_name = cleaned_branches[selected_option - 1]

    cmd = flag == 'copy' ? "echo #{branch_name} | pbcopy" : "git checkout #{branch_name}"

    Open3.capture3(cmd)
  end

  def show_list
    cleaned_branches.each_with_index do |b, i|
      puts "#{i + 1}: #{b}"
    end
  end

  def cleaned_branches
    get_branches.split("\n").map do |branch|
      branch.split(/\s+\d+\t\s+/).last
    end
  end

  def get_branches
    get_branches_cmd = "git log -g --grep-reflog 'checkout:' --format='%gs' | sed -E 's/checkout: moving from .* to//g' | awk '!seen[$0]++' | head -n #{branch_lookback_count} | cat -n"

    recent_branches, = Open3.capture3(get_branches_cmd)
    recent_branches
  end
end
