-- SPDX-FileCopyrightText: 2026 Sergiu Deitsch
-- SPDX-License-Identifier: LPPL-1.3c+

module = 'tikzexternalpageref'

sourcefiles = {'*.dtx', '*.ins', '*.pl'}
installfiles = {'*.code.tex', '*.pl'}

-- Externalization compiles every picture in a separate pdflatex run started
-- through \write18, and the library runs Perl the same way.
checkengines = {'pdftex'}
checkopts = '-interaction=nonstopmode -shell-escape'
-- The first run externalizes the pictures and copies their labels to the .aux
-- file. The second run reads the labels. The third run confirms that the
-- page numbers are stable.
checkruns = 3

-- Tests see the TeX tree below texmfdir through TEXINPUTS.
texmfdir = './build/texmf'

-- Move the Perl script from the test directory into the TeX tree, where an
-- installation puts it. The tests then fail if the library expects the script
-- in the working directory.
function checkinit_hook()
    local scriptdir = texmfdir .. '/tex/latex/' .. module
    local errorlevel = mkdir(scriptdir)
    if errorlevel ~= 0 then return errorlevel end
    errorlevel = cp('*.pl', unpackdir, scriptdir)
    if errorlevel ~= 0 then return errorlevel end
    return rm(testdir, '*.pl')
end
