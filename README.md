# Emacs-config

A collection of custom files for Emacs24 +

This repo consists of custom themes, auto-complete and python for Emacs-24+

For more Custom themes- [CLICK HERE!!](http://emacsthemes.caisah.info/)
##Usage

Clone this repo and copy the files to `~/.emacs.d`
```
git clone https://github.com/munendrasn/emacs-config.git
mv ~/emacs-config ~/.emacs.d
```
# Emacs-themes
To load a new theme, add the following to your init.el
```
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'hickey t) # name of the theme
```
You can browse the themes with
```
M-x load-theme <RET> name-of-theme
```
# Emacs-for-python
Refer [this](http://tkf.github.io/emacs-jedi/released/) for complete information on installing jedi and its requirement.
