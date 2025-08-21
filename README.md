# ⚡️ My Neovim Config — Modular, Fast & Developer Friendly

Welcome to my Neovim configuration!  
This setup is designed for **maximum productivity**, modularity, and a modern developer experience.  
Whether you code in JavaScript/TypeScript, React, or just want a clean, efficient editor, this config is for you.

---

## 🚀 Features

- **🧩 Modular structure:** Drop new keymaps/plugins/snippets in dedicated folders, they’re auto-loaded.
- **🎨 Beautiful theme:** Solarized Osaka, optimized for JavaScript/React.
- **⚡️ Fast startup:** No lag, no slow animations.
- **🧠 Smart autocomplete:** CMP & Copilot for blazing fast coding. (Copilot is not active by default you have to activate it by make enabled=true in the plugin file)
- **📦 Pre-configured tools:** LSP, formatting, file explorer, status line, import management, and more.
- **💡 Easily hackable:** Every config is in a self-contained file.
- **🔖 Ready for snippets:** Modular snippet system with import support.

---

## 📁 File Structure

```bash
.
├── init.lua                  # Entry point
├── lazy-lock.json            # Plugin lockfile (auto-managed)
├── lazyvim.json              # LazyVim config
├── stylua.toml               # (Legacy) Formatter config
├── lua/
│   ├── config/
│   │   ├── autocmds.lua      # (Currently empty - autocommands are moved to plugins)
│   │   ├── keymaps.lua       # Loads all keymaps in lua/keymaps/
│   │   ├── lazy.lua          # Disables nvim's default file explorer
│   │   └── options.lua       # Vanilla options
│   ├── keymaps/
│   │   ├── buffers.lua
│   │   ├── fileControl.lua
│   │   ├── navigation.lua
│   │   ├── neoTree.lua
│   │   ├── refreshConfig.lua
│   │   └── selection.lua
│   ├── plugins/
│   │   ├── auto-js-config.lua    # Auto-create jsconfig.json per JS project
│   │   ├── cmp.lua               # CMP completion engine settings
│   │   ├── colorScheme.lua       # Theme
│   │   ├── conform.lua           # Formatter
│   │   ├── copilot.lua           # GitHub Copilot
│   │   ├── desableMiniAnimate.lua# Disables slow animations
│   │   ├── hop.lua               # Fast navigation
│   │   ├── lualine.lua           # Minimal statusline
│   │   ├── neoTree.lua           # File explorer
│   │   ├── nvimColorizer.lua     # Color highlighting
│   │   ├── oil.lua               # Modern file manager
│   │   ├── rainbowDelemiter.lua  # Rainbow parentheses
│   │   ├── snacks.lua            # Extra utilities
│   │   ├── snippets.lua          # Enhanced snippet support (with imports)
│   │   ├── todoCmts.lua          # TODO comments
│   │   └── typescriptTools.lua   # TS tools, auto-imports, error handling
│   └── snippets/
│       └── basic.json            # Your snippets here!
```

---

## ✨ Highlights

### 🔑 Keymaps

- All custom keymaps are in `lua/keymaps/`.
- To add a new one, just drop a `.lua` file in that folder!
- They’re auto-loaded and easy to organize by feature or language.

### 🧩 Plugins

- Plugins are defined in `lua/plugins/` as separate files.
- Each file returns a table describing the plugin and its config.
- Add/remove/modify plugins by just editing or adding files.

### 🚀 Autocompletion & Snippets

- **CMP** gives you fast, context-aware code completion.
- **GitHub Copilot** is enabled for smart suggestions.
- Snippet system supports imports for more flexible templates.

### 📂 File Explorer & Navigation

- **Neo-tree** replaces the default file explorer for a better UX.
- **Hop** lets you jump anywhere on the screen with minimal keystrokes.
- **Oil**: modern file manager, a must-have!

### 🎨 Theme & UI

- **Solarized Osaka**: my favorite for JavaScript/React.
- **Lualine**: minimal, focused statusline.
- **No slow animations** (especially on low-end machines).

### 🛠️ Formatting & Linting

- **Conform**: for code formatting.
- **typescriptTools**: for organizing imports and clean TypeScript error display.

---

## 🧑‍💻 How to Use

1. **Clone this repo** into your `~/.config/nvim` (or wherever you keep your Neovim config):
   ```bash
   git clone https://github.com/d3bugProject/nvimDotFiles.git ~/.config/nvim
   ```
2. **Open Neovim** and let LazyVim install everything.
3. **Restart Neovim** after first launch.
4. **Customize**:
   - Add your keymaps in `lua/keymaps/`
   - Tweak or add plugins in `lua/plugins/`
   - Add your snippets in `lua/snippets/`

---

## 🗝️ nvim-surround: Keymaps essentiels

> ⚡️ Plugin recommandé : [`kylechui/nvim-surround`](https://github.com/kylechui/nvim-surround)  
> Ajoute, change et supprime les entourants (parenthèses, guillemets, tags, etc.) en un clin d'œil !
>
> **Astuce** : Pour entourer avec un tag HTML, utilise `ysiwt`, tape le nom du tag, puis `<Entrée>`.  
> Voici un mémo des principales commandes :

| Commande              | Effet                                                          | Exemple                            |
| --------------------- | -------------------------------------------------------------- | ---------------------------------- |
| `ys<motion><char>`    | Ajoute un entourant autour du texte sélectionné par `<motion>` | `ysiw"` → `"mot"`                  |
| `yss<char>`           | Ajoute un entourant à la ligne entière                         | `yss{` → `{ma ligne}`              |
| `cs<old><new>`        | Change l’entourant existant pour un autre                      | `cs"'` → remplace "..." par '...'  |
| `ds<char>`            | Supprime l’entourant                                           | `ds"` → supprime les guillemets    |
| `S<char>` (en visuel) | Entoure la sélection visuelle                                  | (sélection) `S[` → `[texte]`       |
| `ysiwt` puis `<tag>`  | Entoure avec un tag HTML personnalisé                          | `ysiwt` → `div` → `<div>mot</div>` |

**Principaux `<char>` :** `"`, `'`, `(`, `[`, `{`, `<`, `t` (tag HTML)

---

## 📝 Next Steps

- [ ] Fill the `lua/snippets/` folder with more powerful templates!
- [ ] Write docs for each plugin.
- [ ] Tweak the color scheme for your taste.

---

## ❤️ Credits

- [LazyVim](https://lazyvim.org/)
- [Solarized Osaka](https://github.com/kenchaaan/solarized-osaka.nvim)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Hop](https://github.com/phaazon/hop.nvim)
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)
- ...and all the amazing plugin authors!

---

## 🗨️ Feedback & Ideas

Feel free to open issues or PRs for suggestions, improvements, or bug reports!

---

<p align="center">
  <img src="https://raw.githubusercontent.com/nvim-lua/nvim-lua-guide/master/images/nvim-logo.png" width="80" alt="neovim logo" />
</p>
