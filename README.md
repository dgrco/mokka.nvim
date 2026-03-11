# mokka.nvim

A delightful Neovim colorscheme inspired by various themes like Monokai, Mariana and more.

![neovim](https://img.shields.io/badge/neovim-0.8+-green?style=flat-square)
![license](https://img.shields.io/badge/license-MIT-blue?style=flat-square)


## Palletes
<!-- PALETTES_START -->
<details>
<summary><strong>mokka</strong></summary>

| Role       | Color                                                                  | Hex       |
|------------|------------------------------------------------------------------------|--------|
| bg0        | ![#1e1c1a](https://placehold.co/12x12/1e1c1a/1e1c1a.png) Background   | `#1e1c1a` |
| bg1        | ![#252220](https://placehold.co/12x12/252220/252220.png) Cursorline   | `#252220` |
| bg2        | ![#2d2a27](https://placehold.co/12x12/2d2a27/2d2a27.png) Sidebars     | `#2d2a27` |
| bg3        | ![#38342f](https://placehold.co/12x12/38342f/38342f.png) Selection    | `#38342f` |
| bg4        | ![#4f493f](https://placehold.co/12x12/4f493f/4f493f.png) UI chrome    | `#4f493f` |
| fg0        | ![#f8f8f2](https://placehold.co/12x12/f8f8f2/f8f8f2.png) Bright text  | `#f8f8f2` |
| fg1        | ![#d8d4c8](https://placehold.co/12x12/d8d4c8/d8d4c8.png) Normal text  | `#d8d4c8` |
| fg2        | ![#9e998a](https://placehold.co/12x12/9e998a/9e998a.png) Subtle       | `#9e998a` |
| fg3        | ![#6b6557](https://placehold.co/12x12/6b6557/6b6557.png) Dim          | `#6b6557` |
| red        | ![#f92672](https://placehold.co/12x12/f92672/f92672.png) Keywords     | `#f92672` |
| orange     | ![#fd971f](https://placehold.co/12x12/fd971f/fd971f.png) Types        | `#fd971f` |
| yellow     | ![#e6db74](https://placehold.co/12x12/e6db74/e6db74.png) Strings      | `#e6db74` |
| green      | ![#a6e22e](https://placehold.co/12x12/a6e22e/a6e22e.png) Functions    | `#a6e22e` |
| cyan       | ![#66d9ef](https://placehold.co/12x12/66d9ef/66d9ef.png) Builtins     | `#66d9ef` |
| blue       | ![#66d9ef](https://placehold.co/12x12/66d9ef/66d9ef.png) Tags         | `#66d9ef` |
| purple     | ![#ae81ff](https://placehold.co/12x12/ae81ff/ae81ff.png) Numbers      | `#ae81ff` |
| pink       | ![#f92672](https://placehold.co/12x12/f92672/f92672.png) Operators    | `#f92672` |
| err        | ![#f92672](https://placehold.co/12x12/f92672/f92672.png) Error        | `#f92672` |
| warn       | ![#e6db74](https://placehold.co/12x12/e6db74/e6db74.png) Warning      | `#e6db74` |
| info       | ![#66d9ef](https://placehold.co/12x12/66d9ef/66d9ef.png) Info         | `#66d9ef` |
| hint       | ![#a6e22e](https://placehold.co/12x12/a6e22e/a6e22e.png) Hint         | `#a6e22e` |
| added      | ![#a6e22e](https://placehold.co/12x12/a6e22e/a6e22e.png) Added        | `#a6e22e` |
| changed    | ![#fd971f](https://placehold.co/12x12/fd971f/fd971f.png) Changed      | `#fd971f` |
| removed    | ![#f92672](https://placehold.co/12x12/f92672/f92672.png) Removed      | `#f92672` |

</details>

<details>
<summary><strong>mariana</strong></summary>

| Role       | Color                                                                  | Hex       |
|------------|------------------------------------------------------------------------|--------|
| bg0        | ![#1e2730](https://placehold.co/12x12/1e2730/1e2730.png) Background   | `#1e2730` |
| bg1        | ![#242f39](https://placehold.co/12x12/242f39/242f39.png) Cursorline   | `#242f39` |
| bg2        | ![#2b3642](https://placehold.co/12x12/2b3642/2b3642.png) Sidebars     | `#2b3642` |
| bg3        | ![#33404e](https://placehold.co/12x12/33404e/33404e.png) Selection    | `#33404e` |
| bg4        | ![#3e4d5c](https://placehold.co/12x12/3e4d5c/3e4d5c.png) UI chrome    | `#3e4d5c` |
| fg0        | ![#d8dee9](https://placehold.co/12x12/d8dee9/d8dee9.png) Bright text  | `#d8dee9` |
| fg1        | ![#b8c0cc](https://placehold.co/12x12/b8c0cc/b8c0cc.png) Normal text  | `#b8c0cc` |
| fg2        | ![#8895a0](https://placehold.co/12x12/8895a0/8895a0.png) Subtle       | `#8895a0` |
| fg3        | ![#5c6773](https://placehold.co/12x12/5c6773/5c6773.png) Dim          | `#5c6773` |
| red        | ![#ec5f67](https://placehold.co/12x12/ec5f67/ec5f67.png) Keywords     | `#ec5f67` |
| orange     | ![#f99157](https://placehold.co/12x12/f99157/f99157.png) Types        | `#f99157` |
| yellow     | ![#fac863](https://placehold.co/12x12/fac863/fac863.png) Strings      | `#fac863` |
| green      | ![#99c794](https://placehold.co/12x12/99c794/99c794.png) Functions    | `#99c794` |
| cyan       | ![#5fb3b3](https://placehold.co/12x12/5fb3b3/5fb3b3.png) Builtins     | `#5fb3b3` |
| blue       | ![#6699cc](https://placehold.co/12x12/6699cc/6699cc.png) Tags         | `#6699cc` |
| purple     | ![#c594c5](https://placehold.co/12x12/c594c5/c594c5.png) Numbers      | `#c594c5` |
| pink       | ![#ec5f67](https://placehold.co/12x12/ec5f67/ec5f67.png) Operators    | `#ec5f67` |
| err        | ![#ec5f67](https://placehold.co/12x12/ec5f67/ec5f67.png) Error        | `#ec5f67` |
| warn       | ![#fac863](https://placehold.co/12x12/fac863/fac863.png) Warning      | `#fac863` |
| info       | ![#6699cc](https://placehold.co/12x12/6699cc/6699cc.png) Info         | `#6699cc` |
| hint       | ![#99c794](https://placehold.co/12x12/99c794/99c794.png) Hint         | `#99c794` |
| added      | ![#99c794](https://placehold.co/12x12/99c794/99c794.png) Added        | `#99c794` |
| changed    | ![#f99157](https://placehold.co/12x12/f99157/f99157.png) Changed      | `#f99157` |
| removed    | ![#ec5f67](https://placehold.co/12x12/ec5f67/ec5f67.png) Removed      | `#ec5f67` |

</details>
<!-- PALETTES_END -->

## Requirements

- Neovim 0.8+
- `termguicolors` enabled (the plugin sets this for you)

## Installation

**lazy.nvim:**
```lua
{
  "dgrco/mokka.nvim",
  priority = 1000,
  config = function()
    require("mokka").setup({...}) -- See Default Configuration
    vim.cmd("colorscheme mokka")
  end,
}
```

## Default Configuration

```lua
require("mokka").setup({
  variant = "mokka", -- "mokka" | "mariana"
  italics = false, -- enable italics on keywords, types, comments
})
```

Options must be set before calling `vim.cmd("colorscheme mokka")`, or passed through `setup()` which applies the colorscheme immediately.

## Plugin support

Mokka ships highlight groups for:

- **Treesitter** — full `@` capture group coverage
- **LSP** — diagnostics, inlay hints, code lens, semantic tokens
- **Telescope** / **fzf-lua**
- **mini.nvim** — statusline, tabline, files, pick, icons, clue, diff, notify, indentscope, jump, surround, cursorword, trailspace, operators, completion
- **nvim-cmp** / **blink.cmp**
- **Lualine** / **Heirline**
- **nvim-tree** / **neo-tree**
- **Gitsigns**
- **indent-blankline** / **ibl**
- **Noice**
- **Which-key**
- **nvim-dap** / **nvim-dap-ui**
- **Trouble**
- **Lazy.nvim**
- **Mason**
- **render-markdown**
- **Aerial**
- **vim-illuminate**
- **Flash** / **Hop** / **Leap**
- **nvim-notify**
- **Snacks.nvim**
- **Alpha** / **Dashboard**

## Terminal themes

Ready-to-use themes for terminal emulators are in the `extras/` directory:

| File | Terminal |
|------|----------|
| `extras/{variant}-kitty.conf` | [Kitty](https://sw.kovidgoyal.net/kitty/) |
| `extras/{variant}-alacritty.toml` | [Alacritty](https://alacritty.org/) |
| `extras/{variant}-foot.ini` | [Foot](https://codeberg.org/dnkl/foot) |

### Kitty
Copy or symlink `extras/{variant}-kitty.conf` to `~/.config/kitty/themes/{variant}.conf` and add to `kitty.conf`:
```
include themes/{variant}.conf
```

### Alacritty
Copy `extras/{variant}-alactitty.toml` to `~/.config/alacritty/themes/{variant}.toml` and add to `alacritty.toml`:
```toml
import = ["~/.config/alacritty/themes/{variant}.toml"]
```

### Foot
Copy `extras/{variant}-foot.ini` to `~/.config/foot/themes/{variant}` and add to `foot.ini`:
```ini
[colors]
include=~/.config/foot/themes/{variant}
```

## Development

The palettes are defined in `lua/mokka/palettes/{variant}.ini`. The files `lua/mokka/palettes/{variant}.lua` and everything in `extras/` are autogenerated — do not edit them directly.

After changing the palette, regenerate:
```sh
python3 scripts/generate.py
```

Requires Python 3 and no external dependencies.
