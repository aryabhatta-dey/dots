# Dots
There are lots like them but these are mine;)
Thank you for visiting, hope you find them useful and pleasing!

![Screenshot](https://github.com/aryabhatta-dey/Dots/blob/master/setup.png "Screenshot")

# Workflow


The workflow is highly keyboard based. I figured 98% of the time I use 6 programs only. Why not directly map them to keybindings. For eg **$mod+v** opens vim with a fzf prompt opened so you start searching quickly and opening the required file.

## Clipboard

My clipboard solution uses a bash script and [christoomey/vim-system-copy](https://github.com/christoomey/vim-system-copy) for vim to interact with wl-clipboard. The idea came [from me not being satisfied](https://www.reddit.com/r/swaywm/comments/g7vimq/whats_you_clipboard_solution/) with how [clipman](https://github.com/yory8/clipman) works.

[I tried](https://github.com/vim/vim/issues/5157) to use vim with wl-clipboard. But if you use this then there is a flickering that happens as vim opens the other window after running the command and then again redraws very quickly. Also I couldn't copy lines starting with " using this. So using christoomey's plugin is the best way imo for wl-clipboard integration with vim.

To open the clipboard do **$mod+z**.

To clear the clipboard contents do **Mod4+z**.

## Cool things you might like

The weather module on the waybar. I took it from https://github.com/Robinhuett/dotfiles/tree/master/.config/waybar and modified it a little.

## To do

Try to write a script for automating the show song info feature of [fmui](https://github.com/seebye/fmui). Fmui as it stands is extremely buggy to the point you cannot even search for songs having i in their name or the artist's name without triggering the info screen.
