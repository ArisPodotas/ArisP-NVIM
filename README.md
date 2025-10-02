# Introduction

This repository contains my local neovim config. I'm on a windows 11 laptop (now also on a GNU/Linux laptop that you can check that branch for) and I made all the config off of kickstart.nvim (), building slowly while my preferences change (you wont find too many traces of kickstart here anymore).

# Philosophy

A set of keybinds using a specific plugin should be in the same file as the plugin itself and a set of visual changes using a plugin should be in the plugin file so onedark changes are in the onedark file and animatins are in the file.
# Contributing? 

I guess you can fork this repo but for what purpose?

# Todo

- [ ] Remove the firendly snippets already builtin to the kickstart.nvim files and write your own snippets from here on (move them to ftplugins)
- [ ] Find how to do advanced treesitter text objects and things like go to next ""
- [ x ] Make a file sourcing keybind setup
- [ x ] Split files into separate folders and sub files for all the config
- [ x ] Autopairs and keymaps for disabling with context
- [ x ] Blink update
- [ x ] Mini map
- [ x ] Replacing redundant things with mini
- [ x ] 2d jumper
- [ x ] Debugger
- [ x ] ftplugins

# Stats

This sections is to have a few tracking changes of startup time

Pre ftplugin snippet moving (I moved all the snippets of ftplugins to not source on init)

348.445  000.003: --- NVIM STARTED ---
This was on windows right now on GNU/Linux it's like 86ms

# Note

To fix netrw you need to go int the ui file and make sure the if statement recognizes mini.icons and then set the icon to be returned to the mini one you'll see it on the page
