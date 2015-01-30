# Sinatra Sandbox with User Login

The purpose of this app is to learn and practice Model-View-Controller (MVC)
Design Patterns and RESTful route conventions.
User authentication has already been implemented with BCrypt so developers can
focus on creating RESTful routes in the controller with corresponding views.
Some views have already been provided to offer inspiration and guidance, but
not all may be needed; this depends on the developer's design decisions.

## Quickstart

Requires: Ruby 1.9.x <= 2.1.x, Postgres

1.  Install packages and dependencies `$ bundle install`
2.  Create a database `$ rake db:create`
3.  Migrate the provided Users table to the database `$ rake db:migrate`
4.  Launch the application server `$ bundle exec shotgun config.ru`
5.  Open a new browser window and point the address to http://localhost:9393

## Testing

If you'd like to start testing methods and playing with data before building
your views:

1. Run `$ rake db:seed` to seed the database with fake users from `/db/seeds.rb`
2. Launch the Tux Sinatra console with `$ tux`.
    Similar to Rails Console, Tux is an interface for querying the database
using Ruby instead of SQL. For example:
    - PostgreSQL command for finding all Users with last name beginning with "C"

    ```SQL
    $ psql -d sinatra-skeleton-with-user-login_development
    psql (9.4.0)
    Type "help" for help.

    >> SELECT * FROM users
    >>   WHERE last_name
    >>   LIKE 'C%';
    ```
    - Tux command for finding all Users with last name beginning with "C"
    ```
    $ tux
    Loading development environment...
    >> User.where("last_name like 'C%'")
    ```
    (Note: Do not structure queries like this in your app! They'll be vulnerable to <a href="http://guides.rubyonrails.org/security.html#sql-injection">SQL injection attacks</a>.)

## Troubleshooting

### PostgreSQL error

`=> ActiveRecord::NoDatabaseError: FATAL:  role "postgres" does not exist`

Run `$ createuser -s -r postgres`

### Shotgun error

```bash
=> == Shotgun/Thin on http://127.0.0.1:9393/
Thin web server (v1.6.2 codename Doc Brown)
Maximum connections set to 1024
Listening on 127.0.0.1:9393, CTRL+C to stop
/Users/Host/.rvm/gems/ruby-1.9.3-p545/gems/eventmachine-1.0.3/lib/eventmachine.rb:526:in `start_tcp_server': no acceptor (port is in use or requires root privileges) (RuntimeError)
```

You may have an instance of the server running in the background.

To terminate it, run `$ kill -9 $(ps aux | awk '/[s]hotgun/ {print $2}')`

## Contributing

You can help make this skeleton more awesome! There are three ways to contribute:

1. Ask for a bug fix or enhancement
2. Submit a pull request for a bug fix or enhancement
3. Code review an open pull request

When you give and receive feedback, remember to A.S.K. (Make it Actionable, Specific, and Kind)
