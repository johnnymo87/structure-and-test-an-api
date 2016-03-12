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

Setup the database
```
rake db:setup
```

Run tests
```
rspec
```

Run the server locally
```
rails s
```

[View a sample payload in your browser](http://localhost:3000/organisations/00000000-0000-0000-0000-000000000000/volunteer_opportunities.json)
```
{
  "volunteer_opportunities": [
    {
      "id": "c4334ef4-71de-44fc-b690-9e8cf2114be3",
      "organisation_id": "00000000-0000-0000-0000-000000000000",
      "is_current": false,
      "name": "Opportunity 1",
      "organisation_name": "Organisation 1",
      "start_date": "05/15/2014",
      "end_date": "05/14/2015",
      "duration": 364
    },
    {
      "id": "25fb8dfe-8f77-4a21-9636-95c088e6d317",
      "organisation_id": "00000000-0000-0000-0000-000000000000",
      "is_current": true,
      "name": "Opportunity 2",
      "organisation_name": "Organisation 1",
      "start_date": "05/15/2015",
      "end_date": null,
      "duration": null
    }
  ],
  "meta": {
    "moment_date_format": "MM/DD/YYYY"
  }
}
```
