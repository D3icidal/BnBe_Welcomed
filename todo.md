todo.md

nov 11:
finished restructuring home db for v2 of schema
Fix host html
Add home html

===

next time:
add delete for homes (changes is_active col)

design and implement a way to have user (manual chosen user to avoid authen hassle) create and add home
make sure CRUD works for Homes
index for site
host edit
start guest section

Associations:
Home

nov 14:
restructured all tables (schema v2)
added associations
tested associations
added sample data into DB
add PAGEFLOW / SITEFLOW text file with firstglance general idea about what webpages there will be.

====

nov 18:
change from html front end stuff to json returns

if host only has 1 index = redirect to single show isntead
create sample html
add routes

switch to api returns
refactor pageflow wireframe
front end vue

===

Nov 21:

Create pages
create login
minimize/minify?
maybe start designing wireframe of pages
devise? https://stephenhowells.net/rails-5-user-registration-with-devise-vue-js-and-axios/

=========

Nov 25:
Auth
change from 'host' to 'users'
Working on host login - finish routes for it.
create more vue pages (add/create new home for a host, edit home ammenities/features, home-guest entry form)

next time:
finish test vue home edit screen
BUG: keep getting logged out of vue constantly. loosing jwt?
figure out how to handle guest login - what do you do with password, does it need to be hashed or can it be plaintext since it is onetime use,
create. a home-guest page
add login/signup with devise
figure out how to implement devise and redo host schema to match
