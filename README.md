# DIV 2/3 & Gemix Studio Syntax Highlighting for Vim

Vim & NeoVIM syntax, ftdetect & compiler plugin for DIV 2, DIV 3 DX and Gemix
Studio.

Based on the original files of Casper van Beuzekom (cmvanb) for DIV2,
on https://github.com/cmvanb/dotfiles/tree/master/.vim

Features:

* Complete working syntax for DIV 2/ 3. Highlights language keywords,
    built-in commands, string literals, numbers,  (most) operators, comments,
    todo comments and compiler options.
* Partial (WIP) syntax for Gemix Studio language
* Auto detects DIV and Gemix source code files.
* Also, tries to guess the correct file encoding.
* Compiler plugin, only works for Gemix, and process the output of Gemix
    Studio compiler.

## Configuration

By default assumes that a .prg file it's a Gemix Studio file. Then, tries to
find any Gemix only keyword on in it. If it fails, then assumes that the file
it's a DIV 2 / DIV 3 file. This could be changed using the
`g:gemix_by_default`. Setting it at 1, enforces to assume always that are Gemix
Studio source files :

```viml
let g:gemix_by_default = 1  " By default 0. If set 1, then assumes always that are Gemix source files
```

The list of keywords that searchs to discriminate between DIV 2/3 and Gemix
Studio, are set by `g:gemix_detect_keywords` (see `:help pattern`).

## Screenshots

![Imgur](https://i.imgur.com/AXkjzLJ.png)
![Imgur](https://i.imgur.com/zMmD2cv.png)
