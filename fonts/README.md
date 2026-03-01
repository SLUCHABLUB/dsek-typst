This repository uses 3 fonts. Domitian, for most text; TeX Gyre Heros, for headings and LTH Symbols, for certain symbols.

The fonts can be acquired from here:

| Font           | Source                                                    |
| -------------- | --------------------------------------------------------- |
| Domitian       | https://github.com/dbenjaminmiller/domitian               |
| TeX Gyre Heros | https://www.gust.org.pl/projects/e-foundry/tex-gyre/heros |
| LTH Symbols    | *TODO*                                                    |

Domitian and TeX Gyre Heros have multiple faces (.otf files).
They can then be compiled into a single (.otc) file using

```sh
uvx fonttools ttLib -o Domitian.otc Domitian-*.otf
uvx fonttools ttLib -o texgyreheros.otc texgyreheros-*.otf
```

or equivalent command using another python package manager.
