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
- ``4:t$`` insert copy of next 4 lines at end of file
- ``4:t0`` insert copy of next 4 lines at top of file
- ``:t14`` insert copy of current line after line 14

====================
text object commands
====================

"A command using a motion, e.g., ``cw``, operates from the current cursor
position. A command using a text-object_, e.g., ``ciw`` operates on the whole
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
- ``vaw`` select current word plus trailing whitespace on one side of word
- ``vip`` select current paragraph
- ``vis`` select current sentence (or block of code!)
- ``ci)`` change everything between enclosing parentheses (or use ``"``, ``'``, ``]``, etc)
- ``ca)`` same as above but include parentheses
- ``>ip`` indent inner paragraph

Many text object commands have motion command equivalents. For example ``viw``
is the same as ``bve`` (or ``ve`` if the cursor is already on the first
character of the word).

When using a command like ``ci"`` the cursor does not have to be between the
quotes. It will change the text of the next quoted string on the current line.

I use a `vim plugin to make indent objects`_ that can be used to select text at
the current indentation level or higher. It is useful for treating Python code
in a `if` or `for` loop as a text object. For example, the command ``cii``
changes all code that is indented as much as the current line or more.

===========
insert mode
===========

- ``<C-t>`` insert one shiftwidth of indent at the start of current line
- ``<C-d>`` delete one shiftwidth of indent at the start of current line
- ``<C-w>`` delete word to the left of cursor (same as bash)
- ``<C-u>`` delete back to start of line (same as bash)
- ``<C-r>0`` paste yank register
- ``<C-r>"`` paste unnamed register
- ``<C-r>=6*35<CR>`` inserts 210

===========
normal mode
===========

- ``v/foo`` select from cursor to "foo" (``n`` for next; ``v?foo`` backwards)
- ``ev2B`` select current WORD and previous word
- ``^2X`` move current line two spaces left
- ``[n]H`` move cursor to nth line of screen
- ``M`` move cursor to middle line of screen
- ``[n]L`` move cursor to nth line from bottom of screen
- ``zz`` center screen on cursor
- ``gv`` select last visual selection, enter visual mode
- ``gp``, ``gP`` same as ``p``, ``P`` but leaves cursor at end
- ``1$``, ``2$`` end of current, next line, etc.

=======
ex mode
=======

- ``:s/^/  /`` move current line two spaces right
- ``:7pu`` put yanked text on new line after line 7
- ``:7pu!`` put yanked text on new line before line 7
- ``4:`` shorthand for range ``:.,.+3``
- ``<C-w>`` delete word to the left of cursor (same as bash)
- ``<C-u>`` delete back to start of line (same as bash)

===========
visual mode
===========

- ``o`` go to other end of highlighted text
- ``u``, ``U`` change selection to lower, upper case
- ``I``, ``A`` insert at start, end of selection (``i``, ``a`` don't work)
- ``p`` replaces selection

=========
registers
=========

- ``""`` unnamed, used by ``c``, ``d``, ``y``, ``x``, ``s``, etc.
- ``"0`` yank
- ``"-`` deleted or changed text less than one line
- ``"+`` system clipboard
- ``"*`` last system-selected text
- ``".`` last inserted text
- ``"{1-9}`` most recent ``"1``, second most recent ``"2``, etc. delete

===============
automatic marks
===============

From 'Practical Vim' by Drew Neil:

- `````` position before the last jump within current file
- ```.`` location of last change
- ```^`` location of last insert
- ```[``, ```]`` start, end of last change or yank
- ```<``, ```>`` start, end of last visual selection

==========
references
==========

If you read this far then you wasted your time. You should have been reading
'Practical Vim' by Drew Neil.

.. _text-object: http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide
.. _`vim plugin to make indent objects`: https://github.com/michaeljsmith/vim-indent-object
