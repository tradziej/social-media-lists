# Social Media Lists

## System Dependencies
- Ruby 2.5.3 (install with [rbenv](https://github.com/sstephenson/rbenv))
- Rubygems
- Bundler (`gem install bundler`)
- PostgreSQL

## Installation and usage
```
bundle install
```
```
bundle exec rake db:setup
```
```
rails s
```

## Tests
```
bundle exec rspec spec/
```

### Implementation details
Application allows to collect and filters social media posts by lists of authors, social media sites and/or publication date range.

`federal_legislators` table is populated by external scrapers and treated like source of true. Scrapers could create, update or delete records so there should be a way to observe and respond to changes. I would use a [database triggers](https://en.wikipedia.org/wiki/Database_trigger) to achieve that.

Application should be robust and should work forever. To prevent things to become inconsistent in the future I would use a soft deletion (mark records as unusable without deleting it from the database). There is also a strong need to keep all username changes (e.g. by [paper_trail](https://github.com/paper-trail-gem/paper_trail) gem or similar).

#### What I did
- database design and models
- database seeds
- basic interface
- service object for queries
- pagination
- unit and system tests
- proposed improvements