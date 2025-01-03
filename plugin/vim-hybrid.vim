vim9script

try
  colorscheme hybrid
catch
  colorscheme habamax
  finish
endtry

# TODO: add more hi groups like pmenu match stuff to hybrid
hi! link CurSearch IncSearch

