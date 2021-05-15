scriptencoding utf-8

if exists('g:loaded_toggle_rspec_file')
    finish
endif
let g:loaded_toggle_rspec_file = 1

let s:save_cpo = &cpo
set cpo&vim

command! ToggleRspecFile lua require('toggle_rspec_file').toggle_rspec_file()

let &cpo = s:save_cpo
unlet s:save_cpo
