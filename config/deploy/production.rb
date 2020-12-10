server "42.192.39.173", user: "ubuntu", roles: %w{app db web}, my_property: :my_value
server "42.192.39.173", user: "ubuntu", roles: %w{app web}, other_property: :other_value
set :rvm_ruby_version, '2.7.2'
