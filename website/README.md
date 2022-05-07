# README

## Development environment setup

### Development database setup

```bash
sudo apt-get update
sudo apt install postgresql postgresql-contrib
# 14.2-1.pgdg20.04+1+b1
sudo service postgresql start
sudo -u postgres psql -c 'SHOW config_file'
# To allow connecting from Windows, update config file: listen_address = '*'
sudo service postgresql restart
sudo -u postgres psql
CREATE USER eco PASSWORD 'secret' CREATEDB;
\q
sudo /etc/postgresql/14/main/pg_hba.conf

# Add the following lines (uncommented) to pg_hba.conf:
# host    all             all              0.0.0.0/0                       scram-sha-256
# host    all             all              ::/0                            scram-sha-256
sudo service postgresql restart
cd webapp
bin/rails db:setup
bin/rails db:migrate
```
