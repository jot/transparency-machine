load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy'

task :permissions do
  dirs = [deploy_to, releases_path, shared_path]
  dirs += %w(system log pids).map { |d| File.join(shared_path, d) }
  run "#{try_sudo} mkdir -p #{dirs.join(' ')} && #{try_sudo} chmod 755 #{dirs.join(' ')} && #{try_sudo} chown -R deploy:deploy #{dirs.join(' ')}"
end

namespace :db do
  namespace :create do
    task :all do
    	%w{development staging production test}.each do |env|
    		ENV['COMMAND']="mysqladmin --password=ojK393D8 --user=root create rewiredstate_#{env}"
    		invoke
    	end
    end
  end
end
