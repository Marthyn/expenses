# Expenses

App to track your monthly expenses like groceries, alcohol and funtivities!

This was based on [Hours](https://github.com/defactosoftware/hours)

![Graph](http://i.imgur.com/bbKBMsz.png)
![Statistics](http://i.imgur.com/KODlKXF.png)
![Form](http://i.imgur.com/XDJQuc8.png)

## Roadmap

- i18n
- Weekly digest mail
  - warn about getting close to budget limit
  - update on what your biggest expense was
  - most used category/shop
  - Compliment if you're under budget
- Daily reminder
  - Remind to log expenses
  - Warning if over budget or close to going over budget
  - Warning if last days expenses were majorly over budget
  - Compliment if you're under budget
- API
- Export to Excel
- Pagination

DB schema

http://dbpatterns.com/documents/57075b5a1514b4252236dc06/

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application like this:

    % foreman start

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
