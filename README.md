[![Coverage Status](https://coveralls.io/repos/github/andela-gogbara/Shortr/badge.svg?branch=master)](https://coveralls.io/github/andela-gogbara/Shortr?branch=master)
[![Code Climate](https://codeclimate.com/github/andela-gogbara/Shortr/badges/gpa.svg)](https://codeclimate.com/github/andela-gogbara/Shortr)
[![Circle CI](https://circleci.com/gh/andela-gogbara/Shortr.svg?style=svg)](https://circleci.com/gh/andela-gogbara/Shortr)

# Shortr

Shortr tries to replicate the [bitly](https://www.bit.ly) url shortener service.

To use, visit http://shotr.herokuapp.com

## Features

Shortr is a great url shortening service built with ruby on rails. It allows users to generate short url from long urls that redirect to the original address.

Anonymous or registered users can generate short URLs from long URLs. However, only registered users can choose a custom shortened URL.

Shortr allows unlimited number of URL-shortening for users, and provides click-statistics to enable registered users keep track of how many times shortened URL has been visited.

Shortr allows registered users to manage URLs seamlessly. A registered user could decide to set shortened URL to be inactive or delete URL altogether. The target of a shortened URL could also be changed easily by users who created them.


## Installation
Web application is written with Ruby using the Ruby on Rails framework.

To install Ruby visit [Ruby Lang](https://www.ruby-lang.org). [v2.2.3p173]

To install Rails visit [Ruby on Rails](http://rubyonrails.org/). [v4.2.4]

## Shortr Gem
Shortr has api you can use to shorten links by using the shortr-gem. Checkout the gem page for more details
see https://github.com/andela-gogbara/Shortr-gem

## Using the App

1. Once you have Ruby and Rails installed, clone the repo by running

        $ git clone https://github.com/andela-gogbara/Shortr

        $ bundle install

3. Then run the following command to set up the database:

        $ rake db:migrate

4. Once the command runs successfully, start the Rails server by running:

        $ rails server

4. To access the app, visit http://localhost:3000 in a web browser

## Testing

To test the web application, run the following command to carry out all tests:

        $ bundle exec rake spec

To view test descriptors, run the following command:

        $ bundle exec rake spec -fd

## Dependencies
Sidekiq is used to handle background tasks, see https://github.com/mperham/sidekiq

## Limitations
1. Users are not able to sign up with Open ID.
2. Profile management by users is not available yet.

## Contributing

1. Fork it by visiting - https://github.com/andela-gogbara/Shortr/fork

2. Create your feature branch

        $ git checkout -b new_feature

3. Contribute to code

4. Commit changes made

        $ git commit -a -m "descriptive_message_about_change"

5. Push to branch created

        $ git push origin new_feature

6. Then, create a new Pull Request
