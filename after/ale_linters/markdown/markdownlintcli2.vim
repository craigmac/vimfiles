" Author: C.D. MacEachern
" Description: Adds support for markdownlint-cli2 tool

call ale#linter#Define('markdown', {
\   'name': 'markdownlintcli2',
\   'executable': 'markdownlint-cli2',
\   'lint_file': 1,
\   'output_stream': 'stderr',
\   'command': '%e %s',
\   'callback': 'ale#handlers#markdownlint#Handle'
\})
