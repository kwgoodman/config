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

========
vim tips
========

I know how to insert and save. For everything else I use the arrow keys. These
vim notes are my journey to salvation.

==================
copy or move lines
==================

The command to copy (t) or move (m) lines of text::

    :[range]{t, m}[address]

For example:

- ``:10t20`` insert copy of line 10 on a new line after line 20
- ``:10m20`` move line 10 to a new line after line 20
- ``:10t.`` insert copy of line 10 on a new line after current line
- ``:10,13t20`` insert copy of lines 10-13 on new lines after line 20

=====================
text objects commands
=====================

"A command using a motion, e.g., ``cw``, operates from the current cursor
position.  A command using a text-object_, e.g., ``ciw`` operates on the whole
object regardless of the cursor position."

Text object commands have the form::

    {command} {extent} {object}

where:

========  ====================================================================
command   ``c`` (change), ``d`` (delete), ``v`` (select), ``y`` (yank), etc
extent    ``i`` (inner), ``a`` (include enclosing quotes, parentheses, etc)
object    ``w`` (word), ``s`` (sentence), ``p`` (paragraph), ``"``, ``)``, etc
========  ====================================================================

Examples:

- ``diw`` delete current word
- ``vaw`` select current word plus trailing whitespace
- ``vip`` select current paragraph
- ``vis`` select current sentence (or block of code!)
- ``ci)`` change everything between enclosing parentheses (or use ``"``, ``'``, ``]``, etc)
- ``ca)`` same as above but include parentheses
- ``>ip`` indent inner paragraph

Many text object commands have motion command equivalents. For example ``viw``
is the same as ``bve`` (or ``ve`` if the cursor is already on the first
character of the word.)

====================
insert mode commands
====================

- ``CTRL-T`` insert one shiftwidth of indent at the start of current line
- ``CTRL-D`` delete one shiftwidth of indent at the start of current line
- ``CTRL-W`` delete word to the left of cursor

====
misc
====

- ``v/foo`` select from cursor to "foo" (``n`` for next; ``v?foo`` backwards)
- ``ev2B`` select current word and previous word
- ``:s/^/  /`` move current line two spaces right
- ``^2X`` move current line two spaces left
- ``H`` move cursor to first line of screen
- ``M`` move cursor to middle line of screen
- ``L`` move cursor to last line of screen
- ``zz`` center screen on cursor

.. _`config files`: http://github.com/kwgoodman/config
.. _ghar: https://github.com/philips/ghar
.. _text-object: http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide
