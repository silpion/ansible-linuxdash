# Role Name

This role installs the [linux-dash](https://github.com/afaqurk/linux-dash)
web application for simple server health overview.


## Requirements

None.


## Role Variables

* ``linuxdash_user``: Configure user to run the linux-dash (default: ``dash``)
* ``linuxdash_group``: Configure group to run the linux-dash (default: ``dash``)
* ``linuxdash_home_dir``: Configure installation directory (default: ``/srv/linuxdash``)

### nginx configuration

* ``linuxdash_nginx_listen``: Configure nginx port to listen (default: ``8088``)
* ``linuxdash_nginx_server_name``: Configure nginx virtual host server name (default: ``localhost``)
* ``linuxdash_nginx_log_error``: Configure nginx error log location (default: ``/var/log/nginx/linuxdash.error.log``)
* ``linuxdash_nginx_log_access``: Configure nginx access log location (default: ``/var/log/nginx/linuxdash.access.log``)


## Dependencies

None.


## Example Playbook

    - hosts: all
      roles:
         - { role: linuxdash }


## License

Apache Version 2.0

## Integration testing

This role provides integration tests using the Ruby RSpec/serverspec framework
with a few drawbacks at the time of writing this documentation.

- Currently supports ansible_os_family == 'Debian' only.

Running integration tests requires a number of dependencies being
installed. As this role uses Ruby RSpec there is the need to have
Ruby with rake and bundler available.

    # install role specific dependencies with bundler
    bundle install

<!-- -->

    # run the complete test suite with Docker
    rake suite

<!-- -->

    # run the complete test suite with Vagrant
    RAKE_ANSIBLE_USE_VAGRANT=1 rake suite


## Author

Mark Kusch @mark.kusch silpion.de


<!-- vim: set nofen ts=4 sw=4 et: -->
