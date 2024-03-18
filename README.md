# Notes app
***

## Setup

### Prerequisites

The following software must be installed:
- **docker**              (must docker 25 or newer)
- **docker compose**      (must be docker compose v2  [Check more in detail](https://docs.docker.com/compose/migrate/)) 

The following packages must be installed:
- **git**
- **make**

### Instructions

1.  To download the project, use one of the following command:
    ```bash
    git clone git@github.com:yhalapup/notes.git 
    ```
    or
    ```bash
    git clone https://github.com/yhalapup/notes.git
    ```

***
All the following commands use inside the root project directory
***

2. To run inside docker from current host user:

   ```bash
   id
   ```
   It shows the current user id and group id.

   ```bash
   cp .env.example .env
   ```
   Change the file according to corresponding USER_ID and GROUP_ID

3. Add configuration for docker compose:
   ```bash
   cp -r docker/.env.example/ docker/.env
   ```
   Don't change values in this configuration.

4. Start docker services, using the command:
    ```bash
   make up 
   ```
   Check in other terminal that services started.
   ```bash
   docker compose ps
   ```
   An output similar to the following is expected:
   ```bash
    NAME                    IMAGE                 COMMAND                  SERVICE         CREATED          STATUS          PORTS
    mongodb                 mongo:7.0             "docker-entrypoint.s…"   mongodb         53 seconds ago   Up 51 seconds   0.0.0.0:27017->27017/tcp, :::27017->27017/tcp
    notes-db-1              notes-db              "docker-entrypoint.s…"   db              53 seconds ago   Up 51 seconds   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp
    notes-externalnotes-1   notes-externalnotes   "/docker/entrypoints…"   externalnotes   53 seconds ago   Up 51 seconds   0.0.0.0:4567->4567/tcp, :::4567->4567/tcp
    notes-mongodb-ui-1      mongo-express:1.0.2   "/sbin/tini -- /dock…"   mongodb-ui      53 seconds ago   Up 51 seconds   0.0.0.0:8081->8081/tcp, :::8081->8081/tcp
    notes-notesconsumer-1   notes-notesconsumer   "docker-entrypoint.s…"   notesconsumer   53 seconds ago   Up 51 seconds   
    notes-redis-1           redis:7.2             "docker-entrypoint.s…"   redis           53 seconds ago   Up 51 seconds   0.0.0.0:6379->6379/tcp, :::6379->6379/tcp
    notes-scheduler-1       notes-scheduler       "/docker/entrypoints…"   scheduler       53 seconds ago   Up 51 seconds   
    notes-web-1             notes-web             "/docker/entrypoints…"   web             53 seconds ago   Up 51 seconds   0.0.0.0:3000->3000/tcp, :::3000->3000/tcp
    notes-worker-1          notes-worker          "/docker/entrypoints…"   worker          53 seconds ago   Up 51 seconds   0.0.0.0:8000->8000/tcp, :::8000->8000/tcp
   ```

5. Run database migrations:
   ```bash
   make dbmigrate
   ``` 
6. To seed the database, run the following command:
   ```bash
   make dbseed
   ``` 

### Useful commands

To run Rspec tests, run the following command:
   ```bash
   make rspec
   ```

To run RSpec tests and generate test coverage, run the following command:
   ```bash
   make rspec-coverage
   ```
