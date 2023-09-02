# Testbed

This is just a repository to handle stuff regarding test/lab servers I may setup for individual or temporary purposes.

## Current Information
The current testlab is for testing out some integration between Jetbrains Products and Github, and also checking out Upsource since it's available on Docker.


### Setup Information
If you want to use this, you will want to probably adjust the things in here -- for example changing the reserved IP. You will also need to configure
each product (TeamCity, Hub, YouTrack, and Upsource). It is recommended to configure Hub and TeamCity first, as YouTrack and UpSource should tie into
Hub for authentication and TeamCity does not without a plugin. After setting up TeamCity, install the proper plugins and connect Hub to TeamCity (add `/hub`
at the end of the Hub URL btw) you should have everything linked together and you can just disable logins after everyone logs in. 

If you want to use something like LDAP or Active Directory or what have you, you will also need to adjust this, and probably other things, to set that up.

Also note that the installation here is *empheral* so if any docker service goes down, it will not persist on restart, you will probably want to add volumes to persist
data and setup a postgres install. This is just provided for testing/short-lived instances where that level of persistance isn't necessary.

Also if you want to access the resources you have to go to [url]:[port] (8080 - Hub, 8000 - YouTrack, 8111 - TeamCity, 8222 - UpSource), if you want [service].[url] then
you will need to probably add nginx and its configuration somewhere in here.
