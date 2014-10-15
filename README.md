[![Build Status](https://travis-ci.org/jozw/who-called.svg)](https://travis-ci.org/jozw/who-called)

#Who Called?
This app allows users to register unknown numbers, create a testimony or confirm other testimonies.

##Tools
Ruby 2.1.2<br />
ActiveRecord<br />
Rails 4.1.6<br />
PostgreSQL<br />

##Setup
In your terminal, clone this repository:

```console
$ git clone https://github.com/jozw/who-called.git
```

Make sure you've installed [PostgreSQL](http://www.postgresql.org/download/).

Install all the dependencies:

```console
$ bundle install
```

Set up the databases on your local machine:

```console
$ rake db:create
$ rake db:schema:load
```

Start the rails server:

```console
$ rails s
```

Now, it will be available at `http://localhost:3000`.

RSpec and Capybara tests can be run in the terminal root:

```console
$ rspec
```

##License
MIT
