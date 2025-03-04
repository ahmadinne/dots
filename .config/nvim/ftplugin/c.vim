if executable('clang-format')
  setlocal formatprg=clang-format\ --assume-filename=a.c
  let b:undo_ftplugin .= ' fp<'
endif
