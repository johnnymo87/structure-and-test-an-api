Install rvm if you don't have it
```
$ \curl -sSL https://get.rvm.io | bash -s stable
$ rvm reload
$ rvm install ruby-2.3.0
```

Install gems
```
$ git clone git@github.com:johnnymo87/structure-and-test-an-api.git
$ cd structure-and-test-an-api
$ echo "rvm use 2.3.0@structure-and-test-an-api --create" > .rvmrc
$ cd ../structure-and-test-an-api
<Accept prompt from RVM>
$ gem install bundler
$ bundle install
```

Run tests
```
rspec
```
