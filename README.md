# Testbed

This is just a repository to handle stuff regarding test/lab servers I may setup for individual or temporary purposes.

### Current Setup Information
The current setup has a weird/eclectic set of services:
- Jetbrains YouTrack (Issue Tracking)
- Jetbrains TeamCity (CI/CD)
- Jetbrains Upsource (Code Review)
- Jetbrains Hub      (SSO/SAML 2.0 provider)

- OneDev (CI/CD, Code Forge, etc)

- LLDAP (LDAP provider)
- cgit (Basic Git Repository)

It also creates a secondary agent on a separate server for CI/CD purposes.

Most of the setup is ephemeral, but onedev and cgit aren't (due to their own requirements).

If you want to use this, you will want to probably adjust the things in here -- for example changing the reserved IP. You will also need to configure
each product (TeamCity, Hub, YouTrack, etc). It is recommended to configure Hub and TeamCity first, as YouTrack and Space should tie into
Hub for authentication and TeamCity does not without a plugin. After setting up TeamCity, install the proper plugins and connect Hub to TeamCity (add `/hub`
at the end of the Hub URL btw) you should have everything linked together and you can just disable logins after everyone logs in.

Also note that the installation here is *empheral* so if any docker service goes down, it will not persist on restart, you will probably want to add volumes to persist
data and setup a postgres install. This is just provided for testing/short-lived instances where that level of persistance isn't necessary.


### Using LLDAP with YouTrack/Hub
There are no real configuration options for YouTrack, however this is to help elaborate on how to set it up.

Server Url: ldap://lldap:3890
Search Base: ou=people,dc=example,dc=com
Bind Account: Fixed
Bind DN: uid=admin,ou=people,dc=example,dc=com
Bind Password: ADMIN PASS

please note that LLDAP is readonly.

### Issues with Hub Integration in TeamCity  
For some reason there's been a break in compatibility for TeamCity and Hub integration.

I was able to fix it by granting "System Admin" role when setting it up and then revoking that role after set-up.

### Prior Information/Tags
#### Jetbrains-HubSoftware-Ephemeral
The current testlab is for testing out some integration between Jetbrains Products and Github, and also checking out Upsource since it's available on Docker.

Checkout the tag for more information.
