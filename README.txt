1 NAME
======

  senf --- secured env files


2 VERSION
=========

  0.1.0


3 SYNOPSIS
==========

  ,----
  | senf setup  # setup store
  | senf add-group webapp
  | senf new webapp dev  # create envfile for dev
  | 
  | senf run webapp dev -- ./run-webapp
  `----


4 DESCRIPTION
=============

  ,----
  | senf <command> <args>
  | Secured env -> senv -> senf (mustard in German)
  | Commands:
  | setup                                    -- Initialize a new secured env store
  | add-group <name>                         -- Add a new group.
  | new <group> <environment>                -- Create a new encrypted env file
  | show <group> <environment>               -- Show envfile.
  | edit <group> <environment>               -- Edit envfile.
  | run <group> <environment> -- <process>   -- Start <process> with env vars from group/env
  | help                                     -- Display help
  | version                                  -- Show version
  `----


5 INSTALLATION
==============

  1. Install [age]
  2. Run `make install', optionally setting `prefix'
     1. `make prefix=/opt/senf install'


[age] <https://github.com/FiloSottile/age>


6 AUTHOR
========

  Sebastian Christ (<mailto:rudolfo.christ@pm.me>)


7 COPYRIGHT
===========

  Copyright (c) 2023 Sebastian Christ (rudolfo.christ@pm.me)


8 LICENSE
=========

  Released under the MPL-2.0 license.
