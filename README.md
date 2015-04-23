Chirpy
==========
[Makers Academy](http://www.makersacademy.com) Final Project.

Chirpy is a social language learning mobile application that connects users who wish to learn and teach each other foreign languages. The application was built using Ruby on Rails and AngularJS. Materialize CSS was used for the application's styling.

[![Code Climate](https://codeclimate.com/github/jjnewman/languageapp-chirpy/badges/gpa.svg)](https://codeclimate.com/github/jjnewman/languageapp-chirpy)

Technologies used
----
- Ruby
- Ruby on Rails
- JavaScript
- AngularJS
- RSpec
- Protractor
- Websockets
- HTML
- CSS

Screenshot
---
<div align="center">
        <img width="40%" src="/app/assets/images/chirpy_homepage.png">
</div>

Features
---
- Instant chat messaging to other users using websockets technology
- Internationalisation: click on a country flag on the homepage and all webpages will then be translated into that language. This will also persist on future logins.
- AngularJS used to filter users by target language
- Ability to display only online users
- Authentification during the sign-up process
- CSS animation used for background "moving clouds" 


How to clone this repo
----
```sh
git clone git@github.com:jjnewman/languageapp-chirpy.git
```

How to run
----
```sh
run bundle install
rake db:migrate
rails s
```

How to run tests
----
```sh
run rspec
```
