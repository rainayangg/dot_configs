local status, vimwiki = pcall(require, "vimwiki")
if (not status) then return end

vim.g.vimwiki_list = {
  {
    path             = '$HOME/vimwiki',
    path_html        = '$HOME/vimwiki_html',
    template_path    = '$HOME/vimwiki/templates',
    template_default = 'default',
    template_ext     = '.html',
    auto_export      = 1,
    auto_diary_index = 1
  }
}
