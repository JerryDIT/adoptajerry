Adopt a Jerry!
=============

[adoptajerry.cc](http://adoptajerry.cc) is the central repo to highlight the Jerry family.  
It aims to be a crowd-sourced portfolio for the purpose of inspiration,
replicability, and dreams achievement.

Learn more about the [Jerry Do It Together](http://youandjerrycan.org) project.

Vision
------

### Original idea - 2012
Watch the [video-prototyping](http://vimeo.com/46923757) of the application as
it was envisioned in 2012.

### Present - sept. 2014
[adoptajerry](http://adoptajerry.cc) is a free software web application. The master branch is running in production.

### Future
adoptajerry is able to run on different servers. Each instance of the app have its own database that sync up and down to the database of reference. The application accessible at [adoptajerry.cc](http://adoptajerry.cc) is serving data from the database of reference.
The application remains free software under AGPLv3. And the content of the database might be distributed under an open data license such as the [Open Data Commons Open Database License \(ODbL\)](http://opendatacommons.org/licenses/odbl/summary/). The choice of the license is something to be discussed within the JerryClan.

#### Example of use case
adoptajerry can run on an offline local network hosted on a Jerry Computer during a workshop. When the workshop is done, the instance is plugged to the internet and its database automatically synchronized to the database of reference.

Contribute
----------
### Report bugs and ask for new features

Do it [in the issues](https://github.com/JerryDIT/adoptajerry/issues) using the appropriate `tag`

### Contribute to the code

#### Install the app locally

  1. [Fork the main repo](https://github.com/JerryDIT/adoptajerry/fork) on your github acount.

  2. clone your fork locally

    `git clone git@github.com:YOUR_NAME/adoptajerry.git`

  2. cd into the directory

    `cd adoptajerry`

  3. install the dependencies

    `bundle install`

  4. run the migrations

    `rake db:migrate`

  4. start your app

    `rails server`

Your app is running on <http://localhost:3000>

#### Do some work

  1. [Fix a bug or work on a feature](https://github.com/JerryDIT/adoptajerry/issues)
      `git branch your-contribution`

  2. When you're happy, push your work to your fork

    `git push origin your-contribution`

  3. Do a pull request from the github interface.


### Say hello :)

If you are willing to put energy into the project let's get in touch on the forum : [Jerry DIT - Tech Lab](https://groups.google.com/forum/#!forum/techlab-jerrydit)

License
-------

Adoptajerry is Copyright © 2014 [JerryDIT](http://youandjerrycan.org). It is free software under AGPLv3, and may be redistributed under the terms specified in the [LICENSE](https://github.com/JerryDIT/adoptajerry/blob/master/LICENSE).
