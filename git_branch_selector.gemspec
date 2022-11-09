# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name      = 'git-branch-selector'
  s.version   = '0.0.1'
  s.platform  = Gem::Platform::RUBY
  s.summary   = 'A Git Branch Selector for your most recently used branches.'
  s.description = %q(
    This is a Git branch selection tool. It provides a way to quickly look back at your most recently checked-out branches. You can list the branches, use the selector tool to add the branch name to your clipboard, or checkout to the selected branch.

    Usage:
    You can always refer to the help menu with `git-branch-selector --help`

    List branches: `git-branch-selector -l`
    Copy selected branch name to clipboard: `git-branch-selector -c`
    Checkout to selected branch: `git-branch-selector`

    All options allow for the `-n` flag to show the count of branches you'd like displayed. Default is 15.
    `git-branch-selector -n 50`
  )
  s.required_ruby_version = '>= 3.1.1'
  s.authors   = ['Ryan Back']
  s.email     = ['ryanpback@gmail.com']
  s.license   = 'MIT'
  s.files     = Dir.glob('{lib,bin}/**/*')
  s.require_path = 'lib'
  s.executables = ['git_branch_selector']
  s.add_dependency 'optparse', '~> 0.1'
  s.add_dependency 'open3', '~> 0.1'
  s.add_dependency 'tty-prompt', '~> 0.23'
  s.add_dependency 'pry', '~> 0.14'
end
