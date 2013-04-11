# BlogAPI
=======

Simple blog API with Grape

## Setup

### Cloning
To clone this repository on your local computer run:
```bash
git clone git://github.com/biske/BlogAPI.git
```

### Installing required gems
To install required gems needed by BlogAPI, type:
```bash
bundle install
```

### Setup database
To setup and populate database with sample data, type:
```bash
ruby db/schema.rb
ruby db/seeds.rb
```

### Run tests
To run rspec tests, type:
```bash
rspec api_spec.rb
```

## Run application
To run application, type:
```bash
rackup -p 3333
```
Then go to browser and insert some url, for ex.:
```bash
http://localhost:3333/users
```


* Note: All commands should be issued from application root path.

# Licence

Copyright (C) 2013 Ivan Bisevac

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.