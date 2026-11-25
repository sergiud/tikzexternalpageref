# TikZ `externalpageref` library

This repository provides a TikZ library that adds support for `\pageref` in
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

This library defers the labels of externalized pictures until the page is
shipped out and replaces only their page numbers, so that they refer to the
page the picture lands on. Everything else about the labels stays as TikZ
writes it. It runs
entirely in TeX and needs neither external programs nor `-shell-escape`.

## Getting Started

Usage is straightforward: simply load the library in your preamble:

```tex
\usetikzlibrary{pageref}
```

The library works together with the TikZ `external` library. It does not
require `-shell-escape` itself, but TikZ needs it to externalize pictures in its
default mode, unlike in the mode `list and make`.

## Testing

The regression tests in `testfiles/` run with
[l3build](https://ctan.org/pkg/l3build):

```sh
l3build check
```


## License

The library is licensed under the [LPPL](https://www.latex-project.org/lppl).
