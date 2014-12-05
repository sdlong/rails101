worker_processes 2 # this should be >= nr_cpus
stderr_path "log/unicorn.error.log"
stdout_path "log/unicorn.log"

listen "/home/apps/rails101/shared/tmp/unicorn.sock"
pid "tmp/pids/unicorn.pid"