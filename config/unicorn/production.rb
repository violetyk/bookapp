app_path = '/home/vagrant/bookapp'
app_shared_path = "#{app_path}/shared"

worker_processes 5

working_directory "#{app_path}/current/"
listen "#{app_shared_path}/tmp/sockets/unicorn.sock"

stdout_path "#{app_shared_path}/log/unicorn.stdout.log"
stderr_path "#{app_shared_path}/log/unicorn.stderr.log"

pid "#{app_shared_path}/tmp/pids/unicorn.pid"

preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection

  # 各ワーカープロセスがforkしたmemcachedとのコネクションを共有しないように、リセット
  # if defined?(ActiveSupport::Cache::DalliStore) && Rails.cache.is_a?(ActiveSupport::Cache::DalliStore)
    # Rails.cache.reset
    # ObjectSpace.each_object(ActionDispatch::Session::DalliStore) { |obj| obj.reset }
  # end
end
