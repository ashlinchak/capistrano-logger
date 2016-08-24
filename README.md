# Capistrano::Logger
Show your logs with Capistrano.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-logger', group: :development, github: 'ashlinchak/capistrano-logger'
```
or:
```ruby
gem 'capistrano-logger', group: :development
```
And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install capistrano-logger
```

## Configuration
Require in `Capfile` to use it:
```ruby
require 'capistrano/logger'
```

Add configuration options for your deployment environment (if you need to change default behavior):

```ruby
# production.rb

set :logger_default_file, "#{deploy_to}/shared/log/puma_error.log" # default <release_path>/log/<rails_env>.log

set :logger_lines, 500 # default 100

set :logger_file_aliases, {
      puma_err: "#{deploy_to}/shared/log/puma_error.log",
      nginx_err: '/var/log/nginx/error.log'
}
```

## Usage

Show last 100 lines from the `production.log`:
```
$ bundle exec cap production logger:show
```

Show last 50 lines from the `puma_error.log` using `logger_file_aliases` setting:
```
$ bundle exec cap production logger:show LINES=50 ALIASE=puma_err
```
Show last 50 lines from the target file on the server:
```
$ bundle exec cap production logger:show LINES=50 FILE=/var/log/mysql.log
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ashlinchak/capistrano-logger.

## License

Copyright (c) 2016 Alexander Shlinchak

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
