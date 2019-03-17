# Link Squish!

This is a link shortening app. I wanted to use Rails 5 and play around with some newer features like actioncable, so I did.

You can create a shortened link and make it active or not.  Then, any time the shortened link is clicked, the hit count will update. This happens via actioncable, so updated counts happen in real time.


### Prerequisites

You will need Rails 5 on your local machine. Additionally you will need to install redis, node, and have a minimum of Ruby version 2.3.3


### Installing

Assuming you use homebrew for OS X...

```
brew services start postgresql
brew services start redis
```

Then clone the repo...

```
git clone git@github.com:cheeseandpepper/link_squish.git
cd link_squish
```

Finaly setup the db and start the server...

```
bundle exec rake db:setup
bundle exec rake db:migrate
RAILS_ENV=development bundle exec rails s
```

Now go to `localhost:3000` to see it in your browser.

## Running the tests

```
bundle exec rspec
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
