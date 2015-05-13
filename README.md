[![Code Climate](https://codeclimate.com/github/languageapp/chirpy/badges/gpa.svg)](https://codeclimate.com/github/languageapp/chirpy)
[![Build Status](https://travis-ci.org/kevinlanzon/languageapp-chirpy.svg?branch=master)](https://travis-ci.org/kevinlanzon/languageapp-chirpy)
Chirpy
==========
[Makers Academy](http://www.makersacademy.com) Final Project.

Chirpy is a social language learning mobile application that connects users who wish to learn and teach each other foreign languages. The application was built using Ruby on Rails and AngularJS. Materialize CSS was used for the applications styling.


Technologies used
----
- Ruby
- Ruby on Rails
- JavaScript
- AngularJS
- RSpec
- Protractor
- FactoryGirl
- Websockets
- AWS S3
- HTML
- CSS

Screenshot
---
<div align="center">
        <img width="100%" src="/app/assets/images/chirpy_homepage.png">

</div>
Heroku (live)
-----

[Chirpy](https://chirpy-lang.herokuapp.com/)

Features
--------

- Instant chat messaging to other users using websockets technology
- Internationalisation: click on a country flag on the homepage and all webpages will then be translated into that language. This will also persist on future logins
- AngularJS used to filter users by target language
- Ability to display only online users
- Authentification during the sign-up process
- CSS animation used for background "moving clouds"

*[postscript - the profiles controller is still rather "fat" and will therefore be subject to further refactoring in the near future (JN, 23/4/15)]*

How to clone this repo
----
```sh
git clone git@github.com:languageapp/chirpy.git
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

collaborators
----
- [Joe Newman](https://github.com/jjnewman)
- [Kevin Lanzon](https://github.com/kevinlanzon)
- [Julian Veling](https://github.com/veliancreate)
- [Paul Fitzgerald](https://github.com/Pau1fitz)
- [Erik Griffin](https://github.com/ErikAGriffin)
