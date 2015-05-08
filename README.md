# sensu-docker
Run the Sensu client in a Docker container

There are a few things you will need to keep in mind when working with this repo.

First, you will need to copy the certs that you are using in your Chef environment in to the `/ssl/cert.pem` and `/ssl/key.pem` locations.

This is what allows the Sensu client to connect to the Sensu server for communications.

The other thing that is important to note is that you will need to manually add checks in to this repo.  So for example, if there is a specific plugin you need, a good place to look is the [Sensu community plugins](https://github.com/sensu/sensu-community-plugins) repo.

You can copy the specific script you are interested in to the `/plugins` directory.

By default there are a number of basic checks that are built in to help monitor your servers including the following:

 * check-cpu
 * check-disk
 * check-procs
 * check-ram
 
To view all of the built in check you can look at the `/plugins` directory.
