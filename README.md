# EHR Timeline
A web application to display a patient's history.

## Development Setup

### Install Ruby on Rails & PostgreSQL for your machine:
Ruby (2.6.4) & Rails (5.2.3): 
https://gorails.com/setup/

> **TCNJ students using a VM:** In the installruby.sh file, change the ruby and rails versions accordingly!

### Install this repository: 

    git clone https://github.com/kalolad1/ehr-timeline.git

Once cloned, navigate to the servd/code directory and install the project dependencies. 

    bundle install
    
If you encounter errors, try restarting PostgreSQL and installing additional updates.

For CentOS:
```sh
$ systemctl restart postgresql-9.6
$ sudo yum install postgresql96-libs
$ sudo yum install postgresql96-devel
```
For MacOS:
```sh
$ pg_ctl -D /usr/local/var/postgres start
   ```

### Create the databases:

    rake db:create
    rake db:migrate:reset
    rake db:migrate
    rake db:seed

### Run the app.

    rails s (or rails server)
