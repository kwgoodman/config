======
config
======

I use a `git repo <http://github.com/kwgoodman/config>`_ to sync the config
files on my desktop and laptop. And to set up new computers.

I'm using ghar_ to manage all this.

Example
-------

To set up a new computer, first install ghar::

    $ cd ~
    $ git clone https://github.com/philips/ghar.git
    $ export PATH=$PATH:`pwd`/ghar/bin/ # You may wish to make this permanent

Then clone my (or your) config repo(s)::

    $ cd ghar
    $ git clone git@github.com:kwgoodman/config.git

Next tell ghar to install your config files::

    $ ghar install

Let's check the status::

    $ ghar install --status

ghar does not overwrite existing files so you may wish to move/backup your
existing config files (such as .bashrc) before running `ghar install`.

.. _ghar: https://github.com/philips/ghar
