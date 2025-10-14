vim9script
finish

try
  colorscheme hybrid
catch
  colorscheme sorbet
  finish
endtry

# TODO: add more hi groups like pmenu match stuff to hybrid
hi! link CurSearch IncSearch

