# Cookbook usage with chef solo

## Prerequisites

On your local machine:

- install ChefDK
- `export PATH="/opt/chefdk/bin:$PATH"`
- `/opt/chefdk/embedded/bin/gem install knife-solo`

## Bootstrap (run this just once)

    knife solo bootstrap -N dev2.talenttag.ru -r recipe[talenttag] --bootstrap-version 11.16.4-1 178.62.200.27

## Cook (one every recipe change)

    knife solo cook 178.62.200.27 -N dev2.talenttag.ru
