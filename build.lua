-- SPDX-FileCopyrightText: 2026 Sergiu Deitsch
-- SPDX-License-Identifier: LPPL-1.3c+

module = 'tikzexternalpageref'

installfiles = {'*.code.tex'}

-- TikZ externalizes every picture in a separate pdflatex run started through
-- \write18.
checkengines = {'pdftex'}
checkopts = '-interaction=nonstopmode -shell-escape'
-- The first run externalizes the pictures and defers their labels to the .aux
-- file. The second run reads the labels. The third run confirms that the
-- page numbers are stable.
checkruns = 3

uploadconfig = {
    pkg = 'tikzexternalpageref',
    summary = 'Page references in externalized TikZ pictures',
    description = 'The pageref TikZ library corrects the page numbers of labels in externalized TikZ pictures, so that \\pageref and the page references of varioref, cleveref and zref point to the page the picture lands on',
    author = 'Sergiu Deitsch',
    email = 'sergiu.deitsch@gmail.com',
    ctanPath = '/graphics/pgf/contrib/tikzexternalpageref',
    repository = 'https://github.com/sergiud/tikzexternalpageref',
    bugtracker = 'https://github.com/sergiud/tikzexternalpageref/issues',
    update = false,
    uploader = 'Sergiu Deitsch',
    version = '0.2',
    topic = {
        'label-ref',
        'pgf-tikz',
    },
    license = 'lppl1.3c',
    announcement_file = 'announcement',
}
