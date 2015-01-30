## Post/Redirect/Get Pattern

### Get vs Post

| Browser Action | Get               | Post                    |
|----------------|-------------------|-------------------------|
| Back           | Harmless          | Data is submitted again |
| Refresh/Reload | Harmless          | Data is submitted again    |
| Bookmark      | Can be bookmarked | Cannot be bookmarked    |

In an HTTP GET request, a browser requests data from the server
http://en.wikipedia.org/wiki/Post/Redirect/Get

## RESTful Routes

| HTTP Verb     |       Path        | Controller#Action     |                   Used for                    |
|:---------:    |:----------------: |:-----------------:    |:--------------------------------------------: |
| GET           | /users           | users#index          | show all users                  |
| GET           | /users/new       | users#new            | show form page for creating a new user  |
| POST          | /users           | users#create         | create a new user (form action on submit)                           |
| GET           | /users/:id       | users#show           | show a user                      |
| GET           | /users/:id/edit  | users#edit           | show form page for editing a user       |
| PUT           | /users/:id       | users#update         | update a user                       |
| DELETE        | /users/:id       | users#destroy        | delete a user                       |


### How to Enable GET/POST/PUT/DELETE Controller Actions
RESTful routes include the HTTP request methods GET, POST, PUT, and DELETE.
However, HTML form submissions only support HTTP request methods POST and GET.
To extend our controllers to use PUT and DELETE, we must configure our
Sinatra app to use `method_override`. When enabled, an HTTP request method
can be overridden by the value of a hidden form input to look like another
request method (e.g. PUT, DELETE).

See the below instructions on how to enable this feature:

#### Enable `Rack::MethodOverride` in Sinatra
Add ` enable :method_override` to ` config/environment.rb`

##### Usage

```html
<form action="[controller action]" method="post">
  <input type="hidden" name="_method" value="[put/delete]" />
</form>
```

##### Examples
###### PUT
View

```html
<form action="/users/:id/edit" method="post">
  <input type="hidden" name="_method" value="put" />
  <input type="text" name="username" placeholder="Enter new username"/>
  <input type="submit" value="Save Changes">
</form>
```

Controller

```ruby
put '/users/:id/edit' do
  user = User.find(params[:id])
  name = params[:name]

  user.update(name: name)
end
```

###### DELETE

View

```html
<form action="/users/:id" method="post">
  <input type="hidden" name="_method" value="delete" />
  <input type="submit" value="Delete Account" />
</form>
```
Controller

```ruby
delete '/users/:id' do
  User.destroy(params[:id])
end
```