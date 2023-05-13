# my-dev-environment

Welcome to my developer environment. The motivation behind this repository is to collect all configuration made to my workspace and organize it, so it is easy to setup a new machine or share it with others who might be interested in giving it a try. With this setup I aim to write code the most efficient way and am happy to accept suggestions to improve that goal!

## Getting started

### macOS

Since the standard terminal for macOS doesn't support custom colorschemes I am going with [iTerm2](https://iterm2.com/). After installing it you can set the terminal font. For that I went with [Meslo Nerd Font](https://github.com/romkatv/powerlevel10k/blob/master/font.md). Simply download the four .ttf files and double click on each file to install it. Then open iTerm2 &rarr; Settings &rarr; Profiles &rarr; Text &rarr; Font &rarr; set to MesloLGS NF. If you decide to choose a different font make sure that the font supports "" and "" as these symbols are going to be the arrows we use for nvim-tree. Lastly import the [.zshrc](https://github.com/kfc-manager/my-dev-environment/blob/main/.zshrc) file to your profile and we are done with setting up iTerm2.

For the next step we are going to install the text editor [Neovim](https://neovim.io/) and plugins to our needs. After installing it copy the [/nvim](https://github.com/kfc-manager/my-dev-environment/tree/main/.config/nvim) folder in your .config folder. After that open [nvim/lua/kalle/plugins-setup.lua](https://github.com/kfc-manager/my-dev-environment/blob/main/.config/nvim/lua/kalle/plugins-setup.lua) with nvim and enter ":w" in the command line. With that packer and all plugins imported in the file should be installed and after restarting Neovim it should be good to go.

Next we have to install some programs to make full use of the plugin [vimtex](https://github.com/lervag/vimtex) so we are able to compile LaTeX into a .pdf file. First of all we are going to install [MacTex](https://www.tug.org/mactex/mactex-download.html). After installing it open TeX Live Utility and install "latexmk". Now that we have a compiler the last thing that is missing is a PDF-Viewer that listens to the changes made to our LaTeX project. For that I use [Skim](https://skim-app.sourceforge.io/). You can set it to your default PDF-Viewer by clicking on a .pdf file &rarr; Get Info &rarr; Open with &rarr; Skim. Now everytime you compile a .tex file in Neovim with the command ":VimtexCompile" it should automatically open Skim and detect all changes made to the .tex file after saving with the command ":w".
