![logo](https://user-images.githubusercontent.com/13404717/59300590-da2b6600-8c8f-11e9-82b2-ab3dc856ffdb.jpeg)

# youtrack-rest-client
Client library for the [youtrack rest api](https://www.jetbrains.com/help/youtrack/standalone/youtrack-rest-api-reference.html)

## Usage

### Authentication

**With your permanent token (see [Manage-Permanent-Token](https://www.jetbrains.com/help/youtrack/incloud/Manage-Permanent-Token.html)):**
```ruby
require 'youtrack'

client = Youtrack::Client.new(base_url: "https://example.myjetbrains.com", token: "perm:your-token")

# make requests!
puts client.users.current.email
```


## Contributing

If you encounter any missing features or bugs, you're welcome to open an Issue! PRs are welcome too ;-)

1. Fork it ( https://github.com/shanehofstetter/youtrack-rest-client-ruby/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
