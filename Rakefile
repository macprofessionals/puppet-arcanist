require 'rake'

desc "Start VM and run all tests in it (will not destroy VM)"
task :spec do
    system('vagrant', 'up')
    system('vagrant', 'ssh', '-c', 'cd /vagrant && bundle exec rake spec:localhost') || exit($?.exitstatus)
end


namespace :spec do
    desc "Run all tests in a fresh VM, and destroy it when done"
    task :clean do
        # destroy a running VM, if one exists, so we are sure to be running
        # tests on a fresh VM.
        system('vagrant', 'destroy', '-f')
        begin
            Rake::Task[:spec].execute
        ensure
            system('vagrant', 'destroy', '-f')
        end
    end

    desc "Run tests on the local host (will run manifests: invoke from a VM)"
    begin
        require 'rspec/core/rake_task'
        RSpec::Core::RakeTask.new(:localhost) do |t|
            t.pattern = 'spec/localhost/*_spec.rb'
        end
    rescue LoadError
        task :localhost do
            abort('This task requires that RSpec is installed to run.')
        end
    end
end


task :default => :spec
