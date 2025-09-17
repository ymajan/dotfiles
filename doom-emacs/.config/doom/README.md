# Doom Emacs Configuration

This directory contains the Doom Emacs setup. Core files are located at the top
level:

- `config.el` – main configuration loaded by Doom.
- `init.el` – Doom module selection.
- `packages.el` – extra package declarations.

Additional configuration is organised under `modules/`:

```
modules/
  org/
    note-taking.el     ; Org‑roam and related note tools
    org-mode.el        ; general Org defaults
  os/
    macos-modifiers.el ; macOS modifier keys
  reference/
    ref-management.el  ; citation utilities
  extras/
    archived.el        ; older or optional features
```

Each file can be loaded individually from `config.el`.
