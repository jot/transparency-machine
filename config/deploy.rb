STAGES = %w(staging production) 

STAGES.each do |name|
  desc "Set the target stage to `#{name}'."
  task(name) do
    set :stage, name.to_sym
    load "config/deploy/#{stage}"
   end
end

on :start, :except => STAGES do
	if !exists?(:stage)
	  abort "no stage specified, please choose one of #{STAGES.join(", ")}"
	end
end


namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end
