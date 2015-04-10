Roadtryp (api?) 
=======

This is a second stab at prototyping Roadtryp [see our static mocks and discussions in this repo](http://github.com/davidrleonard/roadtrip) at #SNDMakes in DC.

What's this one do?
=======

A database-driven wizard for building Roadtryp photo journeys out of structured news pages. It supports Tribune right now, because I could Nokogiri that pretty fast... It deploys locally and on Heroku.

Is the code good?
=======

No but it's a prototyping session so, uhh, whatever. Pull Requests welcome. Done is better than perfect. It'd be rewritten for production. Whatever platitude thing that makes you OK with how bad the code is.

What's it built with
=======

* Ruby
* Sinatra
* PosgreSQL
* Other fun gems

Deploying it locally
=======

1. Clone the repo and cd and such and such.
2. You'll need to have Ruby and Postgres installed. Good luck on that front. (A better README in the future, too.)
3. Once you've got those installed, make a .env file in the root directory. Put your local Postgres credentials in there for development. See config/ for more info on format.
4. Then....

```
bundle install
bundle exec rake db:migrate
bundle exec ruby app.rb
```

Navigate to '/' and have some fun.

Deploying it locally
=======

Push it up to heroku. With the heroku toolbelt installed locally, do:

```
heroku run bundle exec rake db:migrate
```
You should be all set.

Warranty
======
None, it's alpha, don't use it in production, it's broken already.

LICENSE
=========

Copyright (c) 2015 Ashlyn Still, Chloe Manger, Emily Withrow, Crystal Gammon, David Leonard

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.