# set :stage, :production
# set :rails_env, :production

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
role :app, %w{vagrant@192.168.33.10} # application server
role :web, %w{vagrant@192.168.33.10} # web server
role :db,  %w{vagrant@192.168.33.10} # db server

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
# server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
server 'vagrant@192.168.33.10',
  user: 'vagrant',
  roles: %w{web app db},
  ssh_options: {
    user: 'vagrant', # overrides user setting above
    # keys: %w(/home/user_name/.ssh/id_rsa),
    # forward_agent: false,
    # auth_methods: %w(publickey password)
    auth_methods: %w(password),
    password: 'vagrant'
  }
# setting per server overrides global ssh_options
