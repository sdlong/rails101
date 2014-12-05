worker_processes 2 # this should be >= nr_cpus
stderr_path "log/unicorn.error.log"
stdout_path "log/unicorn.log"

listen "/home/apps/rails101/shared/tmp/unicorn.sock"
pid "tmp/pids/unicorn.pid"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
      notify_irc if sig == :QUIT
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiceRecord::Base) and
    ActiveRecord::Base.establish_connection
end