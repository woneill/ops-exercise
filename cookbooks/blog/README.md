# blog

This cookbook configures a blog. What's considered a blog?

* nginx
* HHVM
* WordPress

## recipes
There's only one recipe: `default.rb`

### default
The default recipe will stage up a ready-to-install version of WordPress. Final
installation can be done by accessing [http://<servername>/wp-admin/install.php](http://localhost/wp-admin/install.php)
