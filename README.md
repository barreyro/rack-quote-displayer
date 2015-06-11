~*~ Practicing Rack Middleware ~*~
=========================

A practice designed to learn more about Rack middleware and
[Ricky Gervais Quotes](http://www.rickygervaisquotes.com/).


### Goal

Rack is a minimal and modular interface for developing web applicatons.
Rack middleware is a extension that sits between an HTTP request and an
application, thus the middleware term. You goal is to create a Rack
middleware that serves random quotes. The middleware, when complete, can
be inserted into an existing application to provide a fun set of quotes.
A sample fixture has been added for quotes by
[Ricky Gervais](http://www.rickygervaisquotes.com/).


### Expectations

* Use Bundler for gem dependencies
* Adhere to the standards of Rack and middleware
* Code is tested with RSpec
* Quotes come from examples in fixtures directory


### Request/Response

    Request: /quote

    Response Body: -example quote-

    Format: text/plain


### Testing

All tests are written with the Rspec framework.
The following command summonds tests:

    $ rspec spec

_Does not test with an HTTP web interface, only tests library methods
and how they would respond if embedded in a web application._


### Resources

The following links were used to understand rack middleware:

[Bundler](http://bundler.io/)

[Rack](http://rack.github.io/)

[RSpec](http://rspec.info/)

[Running Rack Apps](http://zaiste.net/2012/08/concisely_about_rack_applications/)

[Rack-Test](https://github.com/brynary/rack-test)

[Rack-Tutorials](https://github.com/rack/rack/wiki/Tutorials)

[Rack RailsCast](http://railscasts.com/episodes/151-rack-middleware)

### Future implentations

* Setup continuous integration with Magnum CI, Travis CI, or Semaphore
* Integrate quotes via an online API
