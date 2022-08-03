# README

## Development environment setup

```bash
# install rbenv and ruby 2.7.6
sudo apt install rbenv
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
rbenv install 2.7.6
rbenv local 2.7.6
sudo apt-get install libpq-dev
sudo apt-get install libvips
# or: sudo snap install libvips
sudo apt-get install ruby-railties # to not have to use bin/rails everywhere
gem install bundler -v '~> 2.3'
bin/bundle install
```

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
sudo vim /etc/postgresql/14/main/pg_hba.conf

# Add the following lines (uncommented) to pg_hba.conf:
# host    all             all              0.0.0.0/0                       scram-sha-256
# host    all             all              ::/0                            scram-sha-256
sudo service postgresql restart

rails db:create
rails db:migrate
rails db:seed:all
```

### Dev run

```
rails server
```

### On Ecosystem data

https://www.oneearth.org/announcing-the-release-of-ecoregion-snapshots/

Now freely available on One Earth organized into the Bioregions 2020
framework, these Ecoregion Snapshots become the “travel brochures” that
highlight the most outstanding features of each place and why these
natural treasures should be conserved.

_Now, readers are one click away from learning about the ecoregions they
are interested in or have visited. At the same time, this information can
be incorporated by conservationists and policy-makers to guide the
development of ecoregion plans. In the near future, these snapshots will
also be compiled as a stand-alone collection and available for download._

The copy of all Ecoregion Snapshots are licensed under Creative Commons
Attribution-NonCommercial (CC BY-NC), and can be shared and used for
non-commercial purposes. To cite this version of Ecoregion Snapshots,
please use the following format:

[Ecoregion name]. Ecoregion Snapshots: Descriptive Abstracts of the
Terrestrial Ecoregions of the World. 2021. Developed by One Earth and
RESOLVE. Version 2021 <www.oneearth.org>. Downloaded on [Date, Year].