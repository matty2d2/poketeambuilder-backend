#!/bin/bash

# Drop the database
rails db:drop

# Create the database
rails db:create

# migrate the database
rails db:migrate

#re-seed the database
rails db:seed