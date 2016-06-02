# webserver

This cookbook configures a webserver. What's considered a webserver?

* nginx
* HHVM

## attributes

`node['testing']` - flag only used with test-kitchen to setup a sample config to confirm HHVM installation

## recipes
There's only one recipe: `default.rb`

### default
The default recipe will install nginx albeit without any default site configuration. It will also install HHVM and configure it to be a drop in replacement for php