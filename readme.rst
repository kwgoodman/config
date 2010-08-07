======
config
======

I use a `git repo <http://github.com/kwgoodman/config>`_ to sync the config
files on my desktop and laptop. And to set up new computers.

Workflow: change a config file on one computer, then commit and push. To update
the other computer, just pull.

To set up a new computer (**be careful**, I think this will overwrite any
config files you have):
::
    $ git init
    $ git pull git@github:kwgoodman/config.git
    $ git remote add origin git@github:kwgoodman/config.git 
