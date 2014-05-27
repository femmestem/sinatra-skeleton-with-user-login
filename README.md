# MVC_Sinatra-BCrypt
==================

Model-View-Controller skeleton with Sinatra framework, BCrypt user authentication, and RESTful
routes method_override enabled.

This skeleton is NOT optimized for production purposes!
It is meant as a teaching guide with extensive notes on how methods, gems, modules and RESTful routes work.

### Quickstart:
1. Run ```$ bundle install``` from inside the source directory
Note: To prevent gem version conflicts, either delete `Gemfile.lock` before running
```$ bundle install``` or run ```$ bundle exec rake``` for rake commands.
2. Run ```$ shotgun```
3. Open a browser window with address http://localhost:9393


### Troubleshooting Shotgun

Running command ```$ shotgun``` returns:

>>
== Shotgun/Thin on http://127.0.0.1:9393/
Thin web server (v1.6.2 codename Doc Brown)
Maximum connections set to 1024
Listening on 127.0.0.1:9393, CTRL+C to stop
/Users/Titannia/.rvm/gems/ruby-1.9.3-p545/gems/eventmachine-1.0.3/lib/eventmachine.rb:526:in `start_tcp_server': no acceptor (port is in use or requires root privileges) (RuntimeError)


1. Find the process ID for the session of shotgun that is running in the background

```$ ps ax | grep shotgun```

returns

>>
16361 s000  S+     0:00.65 /Users/Host/.rvm/gems/ruby-1.9.3-p545/bin/shotgun

2. Terminate the process using the ```$ kill -9``` command and process id

```$ kill -9 16361```

### Troubleshooting Postgres

Error

>>
ActiveRecord::NoDatabaseError: FATAL:  role "postgres" does not exist```

1. Execute the following command in your terminal

```$ createuser -s -r postgres```
