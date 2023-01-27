![logo](https://user-images.githubusercontent.com/13404717/59300590-da2b6600-8c8f-11e9-82b2-ab3dc856ffdb.jpeg)

# youtrack-rest-client

Ruby client for the [Youtrack REST API](https://www.jetbrains.com/help/youtrack/standalone/youtrack-rest-api-reference.html)

## Usage

## Installation

TBD

### Authentication

**With your permanent token (
see [Manage-Permanent-Token](https://www.jetbrains.com/help/youtrack/incloud/Manage-Permanent-Token.html)):**

```ruby
require 'youtrack'

# 1. create an instance, pass your youtrack instance url and access token
youtrack = Youtrack::Client.new(base_url: "https://example.myjetbrains.com", token: "perm:your-token")

# 2. make requests!
youtrack.users.current.email
```

### [Users](https://www.jetbrains.com/help/youtrack/incloud/api-entity-User.html)

```ruby

# get the current user
youtrack.users.current

# get all users
youtrack.users.all

# search users
youtrack.users.all("query" => "admin")

# get a user by id
youtrack.users.by_id('1-1')

```

### [Projects](https://www.jetbrains.com/help/youtrack/incloud/api-entity-Project.html)

```ruby

# get all projects
youtrack.projects.all

# search projects
youtrack.projects.all(query: "DEMO")

# get a project by its id
youtrack.projects.by_id('0-0')

```

### [Issues](https://www.jetbrains.com/help/youtrack/incloud/api-entity-Issue.html)

```ruby
# search/list issues
youtrack.issues.search('project: T1')
```

```ruby
# get issue by id
youtrack.issues.by_id('T1-2')
```

```ruby
# delete an issue
youtrack.issues.delete('2-2')
```

```ruby
# create a new issue 
youtrack.issues.create({
                         summary: 'lorem ipsum',
                         description: 'created using rest api',
                         project: {
                           id: '0-0'
                         }
                       })
# you can also pass a model instance
youtrack.issues.create(Youtrack::Models::Issue.new(summary: "demo issue",
                                                   description: "demo issue description",
                                                   project: client.projects.by_id("0-0")))


```

### [Commands](https://www.jetbrains.com/help/youtrack/incloud/api-entity-CommandList.html)

```ruby
# execute command for issue(s)
youtrack.issues.command("State Open", client.issues.search("DEMO-12"))
# pass the ids directly
youtrack.issues.command("State Open", %w[T1-1 T1-2 T1-3])
```

## Contributing

If you encounter any missing features or bugs, you're welcome to open an Issue! PRs are welcome too ;-)

1. Fork it ( https://github.com/shanehofstetter/youtrack-rest-client-ruby/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
