# TikZ `externalpageref` library

This repository povides a TikZ library that adds support for `\pageref` in
externalized TikZ figures.

## Motivation

TikZ is a library for drawing figures directly in LaTeX which also allows to
externalize complex figures. Externalization of figures greatly reduces the
overall compilation time of the main document.

While TikZ allows to refer to labels created in externalized pictures, the label
support is limited. Specifically, referring to page numbers using the `\pageref`
command does not work out of the box. The typeset page number points
unconditionally to the first page in the document, because `\thepage` is not
correctly expanded. `\pageref` support is, however, essential for usage of
packages such as `varioref`.

This library solves the problem using a Perl script that ensures correct
expansion.

## Getting Started

Usage is straightforward: simply load the library in your preamble:

```tex
\usetikzlibrary{pageref}
```

No other changes are needed.


## License

The library is licensed under the [LPPL](https://www.latex-project.org/lppl).
