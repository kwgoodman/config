======
config
======

I use a git repo and ghar_ to sync the `config files`_ on my desktop and
laptop.  And to set up new computers.

To set up a new computer, first install ghar::

    $ cd ~
    $ git clone https://github.com/philips/ghar.git
    $ export PATH=$PATH:`pwd`/ghar/bin/

You may wish to make the previous line permanent by adding the following to
your .bashrc (or .bash_profile)::

    export PATH=$PATH:~/ghar/bin/

Then clone my (or your) config repo(s)::

    $ cd ghar
    $ git clone git@github.com:kwgoodman/config.git

Next tell ghar to install (symlink) your config files::

    $ ghar install

Let's check the status::

    $ ghar install --status

ghar does not overwrite existing files so move your existing config files (such
as .bashrc) before running ``ghar install``.

.. _`config files`: http://github.com/kwgoodman/config
.. _ghar: https://github.com/philips/ghar
