# InsHack@ti App

[![made-with-python](https://img.shields.io/badge/Made%20with-Python2-1f425f)](https://www.python.org/)

#### Edit config for user creation

Edit row 64 in `butchery/schema.sql` as needed.

```sql
insert into users ( name, username, password ) values ( '<FriendlyName>', '<LoginUsername>', '<HashedPassword>' );
```


#### To setup and start the application

1. Run `./setup.sh`

2. Follow the instructions to create the needed folders and files

3. Run `./run.sh`

The service will be available on `localhost:5000`

If you need to reset some parts of the application, just stop the service and run `./setup.sh` again.

#### Start the exploit launcher

As for now, you need to do this manually by running `python2 exploit_launcher.py`

#### Start the flag submitter

As for now, you need to do this manually by running `python2 flag_submitter.py`
