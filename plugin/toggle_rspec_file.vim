scriptencoding utf-8

if exists('g:loaded_toggle_rspec_file')
    finish
endif
let g:loaded_toggle_rspec_file = 1

let s:save_cpo = &cpo
set cpo&vim

" do something

let &cpo = s:save_cpo
unlet s:save_cpo
