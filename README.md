CGBC Web
========
This repository contains the source files for the CGBC website.

CGBC
----
Cedar Grove is a Baptist Church located in Asheboro, North Carolina. Through this project, we hope to facilitate information sharing among members of our church, as well as outreach to potential visitors. 

Running Locally
---------------
To run a local version of the web app, you will need to install Ruby and Bundler. With those in place, clone this repository to a local folder, cd into that folder, and run the following commands:
```
bundle install --without production
rake db:migrate
rails server
```
Once the `rails server` command is running, opening a browser to `localhost:3000` will open a local version of the page. 

To run unit tests, use the `rspec` command from the top level project directory.

Administration
--------------
Some content for the site is user managed. Sermons, Events, and Newsletters are all handled on a simple admin page. This is set up to allow each of these content streams to be handled directly by the person or persons involved with them. 

There is no direct link to the admin page until logged in. To get to the sign-on page, navigate to `/admin` by editing the browser url. There is no account creation form, instead new accounts should be created and modified via the rails console. New user accounts should be created with the recipient's email address, and the user then needs to use the 'create new password' form to get valid credentials.  Each user should be given only the permissions they need. 

For the purposes of local development and debugging, the development version of the site has a default user `test@example.com` with password `12345678`. 
