# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name      = 'git-branch-selector'
  s.version   = '1.0.0'
  s.platform  = Gem::Platform::RUBY
  s.summary   = 'A Git Branch Selector for your most recently used branches.'
  s.description = 'This is a Git branch selection tool. It provides a way to quickly look back at your most recently checked-out branches. You can list the branches, use the selector tool to add the branch name to your clipboard, or checkout to the selected branch.'
  s.required_ruby_version = '>= 2.7.6'
  s.authors   = ['Ryan Back']
  s.email     = ['ryanpback@gmail.com']
  s.license   = 'MIT'
  s.files     = Dir.glob('{lib,bin}/**/*')
  s.require_path = 'lib'
  s.homepage = 'https://github.com/ryanpback/git-branch-selector'
  s.executables = ['git-branch-selector']
  s.add_dependency 'optparse', '~> 0.1'
  s.add_dependency 'open3', '~> 0.1'
  s.add_dependency 'tty-prompt', '~> 0.23'
  s.add_dependency 'pry', '~> 0.14'
end
