telescope-color-names.nvim
==========================

This is Neovim plugin is an extension to the
[Telescope](https://github.com/nvim-telescope/telescope.nvim) fuzzy-finder.
It allows picking an X11 / web color name, like `PapayaWhip` or `LemonChiffon`.

Installation
------------

Using [Packer](https://github.com/wbthomason/packer.nvim):

```
... (telescope config goes here) ..

use({
  'https://github.com/nat-418/telescope-color-names.nvim',
  config = function()
    require('telescope').load_extension('color_names')
  end
})
```

Usage
-----

```
:Telescope color_names
```
