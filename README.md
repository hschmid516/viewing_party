[![Build Status](https://travis-ci.org/azu/travis-badge.svg?branch=master)](https://travis-ci.org/azu/travis-badge)

# Viewing Party

## Table of Contents

- [Overview](#overview)
- [Tools Utilized](#framework)
- [Setup](#setup)
- [Contributors](#contributors)

# README

### <ins>Overview</ins>
Viewing Party is a 10-day, 2 person project, during Module 3 of 4 for Turing School's Back End Engineering Program.

Our challenge was to build an application in which users can explore movie options and create a viewing party event for the user and friend's. 

For this project, we consumed an authenticated JSON API from the Movie Database to access movie details, cast, reviews, etc. We used self referential ActiveRecord associations to create friends for users. The application requires authentication and authorization to access pages throughout the website. Continuous integration was utilized with Travis CI, and the application was deployed to Heroku. By maintaining a TDD mindset, we were able to make sure our features and models were being tested consistently throughout the development process.


[Technical Requirements](https://backend.turing.edu/module3/projects/viewing_party/requirements)

#### Schema Design
![image](https://user-images.githubusercontent.com/78242081/137946242-35781cb0-1b3f-4b65-a2a5-63e745242a6c.png)

#### Framework
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
  <img src="https://img.shields.io/badge/HTML5-0EB201.svg?&style=flaste&logo=html5&logoColor=white" />
  <img src="https://img.shields.io/badge/CSS3-1572B6.svg?&style=flaste&logo=css3&logoColor=white" />
</p>

#### Tools
<p>
  <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Heroku-430098.svg?&style=flaste&logo=heroku&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/travis_CI-3EAAAF?style=for-the-badge&logo=travisci&logoColor=white" />
</p>

#### Gems
<p>
  <img src="https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/faker-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" /> </br>
  <img src="https://img.shields.io/badge/launchy-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/orderly-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/bcrypt-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/factory--bot-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
</p>

#### Development Principles
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />  
</p>

### <ins>Setup</ins>

* Ruby version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```

* [System dependencies](https://github.com/hschmid516/little-esty-shop/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 5.2.6
    ```

* Database creation
    ```bash
    $ rails db:{drop,create,migrate}
    Created database 'viewing_party_development'
    Created database 'viewing_party_test'
    ```

* How to run the test suite
    ```bash
    $ bundle exec rspec -fd
    ```

* [Local Deployment](http://localhost:3000), for testing:
    ```bash
    $ rails s
    => Booting Puma
    => Rails 5.2.6 application starting in development
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:3000
    Use Ctrl-C to stop

    ```
* [Heroku Deployment](https://potato-viewing-party.herokuapp.com/), for production

### <ins>Contributors</ins>
<p>
  <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" />
</p>

- [Henry Schmid](https://www.linkedin.com/in/henry-schmid)
- [Jes Jones](https://www.linkedin.com/in/justjj/)

<p>
  <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />
</p>

- [Henry Schmid](https://github.com/hschmid516)
- [Jes Jones](https://github.com/JeJones21)
