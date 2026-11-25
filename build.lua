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
