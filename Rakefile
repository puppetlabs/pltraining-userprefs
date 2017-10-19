require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-syntax/tasks/puppet-syntax'

desc "Create PR to release branch"
task :release do
      `hub pull-request -h puppetlabs:master -b puppetlabs:release`
end
