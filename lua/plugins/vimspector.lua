-- Vimspector, Debugging in vim.
-- https://github.com/puremourning/vimspector

return {
{
  'puremourning/vimspector',
  -- build = './install_gadget.py --enable-python --enable-c --enable-bash --enable-rust',
  -- | -------------------| ---------------------------- | -------------------- |
  -- | Language           | `install_gadget.py`          | `:VimspectorInstall` |
  -- | -------------------| ---------------------------- | -------------------- |
  -- | C, C++, Rust,      | --all or --enable-c (or cpp) | vscode-cpptools      |
  -- | Python             | --enable-python              | debugpy              |
  -- build = ':VimspectorInstall debugpy vscode-cpptools',  -- post-install/update hook.
  -- Installation with `:VimspectorInstall` deactivated in favor of Mason.
  ft = {'c', 'cpp', 'python', 'rust', 'bash'},
},
}
