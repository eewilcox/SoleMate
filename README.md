[ ![Codeship Status for eewilcox/SoleMate](https://codeship.com/projects/badf67a0-bf2e-0134-ed2b-0ef15c5d34cb/status?branch=master)](https://codeship.com/projects/196544)

[![Coverage Status](https://coveralls.io/repos/github/eewilcox/SoleMate/badge.svg?branch=master)](https://coveralls.io/github/eewilcox/SoleMate?branch=master)

[![Code Climate](https://codeclimate.com/github/eewilcox/SoleMate/badges/gpa.svg)](https://codeclimate.com/github/eewilcox/SoleMate)

# SoleMate

## Description

SoleMate is a website that allows users to submit shoes, as well as some detailed information about the shoe. Users can submit a rating and optional text review for any shoe entered in our site's database. The submitter of the shoe will receive an email whenever their shoe is reviewed by someone. Users can also upvote or downvote a review, and the shoe's reviews will be sorted on the page by their vote score. 

Heroku Link: https://solemate.herokuapp.com/


![SoleMate](image.png)

## Authors
* Kate Brown (https://github.com/kb8158)
* Dino Dourountoudakis (https://github.com/douroudous)
* John Nolan (https://github.com/JBNolan)
* Emma Wilcox (https://github.com/eewilcox)

## Features

* Creating and signing into a user account
* Adding shoes to the database
* Adding ratings/reviews for a shoe
* Upvoting/downvoting shoe reviews
* Emailing a user once their shoe has been reviewed

## Technologies

* Ruby on Rails
* ReactJS
* PostgreSQL

## Local Setup

```
git clone https://github.com/eewilcox/SoleMate.git
cd solemate
bundle install
npm install
rake db:create && rake db:migrate && rake db:rollback && rake db:migrate
```

## To-Do List

* Change colors on upvotes/downvotes based on user’s current review vote status.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eewilcox/SoleMate. Use the [fork-and-branch](http://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/) workflow to contribute.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
