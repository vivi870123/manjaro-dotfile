local vim = vim

local fzf_to_qf_ref = mines.utils.funcref:create(function (_, lines)
  mines.qf.build_list(lines)
end , { name = 'fzf_to_qf' })


local settings = {
  -- ale
  ale_hover_cursor = 0,
  ale_linters = {
    javascript = { "eslint" };
    typescript = { "eslint", "tslint" };
  },
  ale_linters_explicit = 1,

  -- anzu
  anzu_status_format = '%p(%i/%l) %w',

  -- autopairs
  AutoPairsFlyMode = 0,
  AutoPairsMultilineClose = 0,

  -- bookmarks
  bookmark_auto_save_file = os.getenv('DATA_PATH') .. '/bookmarks',
  bookmark_no_default_key_mappings = 1,
  bookmark_disable_ctrlp = 1,
  bookmark_location_list = 1,
  bookmark_sign = '⚐',

  -- calendar
  calendar_google_calendar = 1,
  calendar_google_task = 1,

  -- caser
  caser_prefix = '<Space>cc',

  -- clever_f
  clever_f_fix_key_direction = 1,

  -- colorschemes
  gruvbox_italic = 1,
  gruvbox_filetype_hi_groups = 1,
  gruvbox_plugin_hi_groups = 1,
  gruvbox_transp_bg = 1,
  gruvbox_contrast_dark = 'soft',
  gruvbox_contrast_light = 'hard',
  gruvbox_invert_indent_guides = 1,

  jellybeans_use_term_italics = 1,

  nord_italic_comments = 1,
  nord_bold = 1,
  nord_italic = 1,
  nord_uniform_diff_background = 1 ,
  nord_bold_vertical_split_line = 1,

  oceanic_next_terminal_bold = 1,
  oceanic_next_terminal_italic = 1,

  onedark_terminal_italics = 1,
  onedark_hide_endofbuffer = 1,

  seoul256_background = 233,
  seoul256_light_background = 256,

  solarized_visibility = 'high',

  -- committia
  committia_min_window_width = 70,

  -- completion
  completion_auto_change_source = 1,
  completion_enable_auto_hover = 1,
  completion_enable_auto_paren = 0,
  completion_enable_auto_popup = 1,
  completion_enable_auto_signature = 1,
  completion_enable_snippet = 'ultisnips',
  completion_matching_strategy_list = {'exact', 'fuzzy', 'substring'},
  completion_sorting = 'none',
  completion_timer_cycle = 200,
  completion_trigger_on_delete = 1,
  completion_chain_complete_list = {
    default = {
      default = {
        { complete_items = { 'lsp', 'snippets' }},
        { complete_items = { 'buffer', 'buffers' }}
      },
      string = {
        { complete_items = { 'path' }},
        { complete_items = { 'buffer', 'buffers' }}
      },
      comment = {
        { complete_items = { 'path' }},
        { complete_items = { 'buffer', 'buffers' }}
      }
    },
    typescript =  {
      { complete_items = { 'lsp' }},
      { complete_items = { 'ts', 'buffers' }}
    };
    javascript =  {
      { complete_items = { 'lsp' }},
      { complete_items = { 'ts', 'buffers' }}
    };
  },

  completion_customize_lsp_label = {
    Function = ' [function]',
    Method = ' [method]',
    Reference = ' [refrence]',
    Enum = ' [enum]',
    Field = 'ﰠ [field]',
    Keyword = ' [key]',
    Variable = ' [variable]',
    Folder = ' [folder]',
    Snippet = ' [snippet]',
    Operator = ' [operator]',
    Module = ' [module]',
    Text = 'ﮜ[text]',
    Class = ' [class]',
    Interface = ' [interface]'
  },

  -- dadbd=od-ui
  db_ui_show_help = 0,
  db_ui_win_position = 'right',
  db_ui_execute_on_save    = 0,
  db_ui_show_database_icon = 1,
  db_ui_use_nerd_fonts = 1,
  db_ui_winwidth = 35,
  db_ui_save_location = os.getenv('DATA_PATH') .. '/db_ui_queries',

  -- devicons
  WebDevIconsUnicodeDecorateFileNodesExactSymbols = {
    ['.gitlab-ci.yml'] = '',
    ['.prettierrc'] = '',
    ['.gitignore'] = '',
    ['gitconfig']  = '',
    gitignore_global = '',
    ['.gitattributes'] = '',
    ['.gitmodules'] = '',
    ['yarn.lock'] = '',
    ['.dockerignore'] = '',
    ['.babelrc'] = '',
    ['.editorconfig'] = '',
    ['package.json'] = '',
    ['todo.txt'] = '🗹',
  },
  WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {
    ['docker-compose.*\\.yml$'] = '',
    ['\\.env'] = '',
    ['^dockerfile'] = '',
    vimrc = '',
    zlogin = '',
    zlogout = '',
    zpreztorc = '',
    zprofile = '',
    zshenv = '',
    zshrc = '',
    ['\\.?profile$'] = '',
    bash_profile = '',
  },

  -- diagnostics
  diagnostic_enable_virtual_text = 0,
  diagnostic_insert_delay = 1,
  diagnostic_show_sign = 1,
  diagnostic_sign_priority = 10000,
  space_before_virtual_text = 4,

  -- doge
  doge_enable_mappings = [[v:false]],
  doge_mapping_comment_jump_forward = '<c-j>' ,
  doge_mapping_comment_jump_backward = '<c-k>',

  -- dsf
  dsf_no_mappings = 1,

  -- easymotion
  EasyMotion_do_mapping = 0,
  EasyMotion_prompt = 'Jump to → ',
  EasyMotion_keys = 'fjdksweoavn',
  EasyMotion_smartcase = 1,

  -- echodoc
  ['echodoc#enable_at_startup'] = 1,
  ['echodoc#type'] = 'echo',

  -- fixcursorhold
  cursorhold_updatetime = 800,

  -- floaterm
  floaterm_position = 'center',
  floaterm_width = vim.fn.float2nr(vim.o.columns * 0.9),
  floaterm_height = vim.fn.float2nr(vim.o.lines * 0.75),
  floaterm_winblend = 10,
  floaterm_background = '#36353d',
  floaterm_autoclose = 2,

  -- FZF
  fzf_action = {
    ['ctrl-t'] = 'tab split',
    ['ctrl-x'] = 'split',
    ['ctrl-v'] = 'vsplit',
  },
  fzf_layout= { window = mines.fzf.float_window() },
  fzf_files_options = [[--bind 'ctrl-l:execute(bat --paging=always {} > /dev/tty)']],
  fzf_preview_floating_window_winblend = 10,

  -- FzfPreview
  fzf_preview_fzf_preview_window_option = 'right:50%',

  -- vim-gfm_syntax
  gfm_syntax_enable_always = 0,
  gfm_syntax_highlight_emoji = 0,
  gfm_syntax_enable_filetypes = {'markdown'},

  -- gitgutter
  gitgutter_highlight_lines = 0,
  gitgutter_realtime = 1,
  gitgutter_eager = 1,
  gitgutter_map_keys = 0,
  gitgutter_sign_added = '▎',
  gitgutter_sign_modified = '▎',
  gitgutter_sign_removed = '▍',
  gitgutter_sign_removed_first_line = '▘',
  gitgutter_sign_removed_above_and_below = '_¯',
  gitgutter_sign_modified_removed = '▍',
  gitgutter_preview_win_floating = 1,
  gitgutter_sign_allow_clobber = 0,
  gitgutter_sign_priority = 0,

  -- indentLine
  indentLine_enabled= 1,
  indentLine_faster	= 1,
  indentline_char	= '┆',
  indentLine_concealcursor = 'niv',
  indentLine_color_term = 239,
  indentLine_color_gui = '#725972',
  indentLine_showFirstIndentLevel = 1,
  indentLine_setColors = 0,
  indentLine_bufTypeExclude = {'help', 'terminal', 'startify'},
  indentLine_filetypeExclude = {'vista', 'vista_kind', 'markdown', 'txt', 'startify'},

  -- iron
  iron_map_defaults = 0,
  iron_map_extended = 0,

  -- limelight
  limelight_conceal_ctermfg = '240',
  limelight_conceal_guifg = '#777777',
  limelight_conceal_guifg = 'DarkGray',
  limelight_conceal_guifg = '#777777',

  -- markdown_toc
  vmt_auto_update_on_save = 0,

  -- matchup
  matchup_matchparen_deferred = 1,
  matchup_matchparen_deferred_show_delay = 100,
  matchup_matchparen_hi_surround_always = 1,
  matchup_override_vimtex = 1,
  matchup_delim_start_plaintext = 0,
  matchup_transmute_enabled = 0,

  -- obession
  session_dir = os.getenv('DATA_PATH') .. '/session',
  obsession_no_bufenter = 1,

  -- php-cs-fixer
  php_cs_fixer_path = "php-cs-fixer",
  php_cs_fixer_rules = "@PSR2",

  -- php.vim
  php_var_selector_is_identifier = 1,
  php_html_load = 0,

  -- prettier
  ['prettier#exec_cmd_async'] = 1,

  -- rainbow
  rainbow_active = 1,
  rainbow_conf = {
    separately = {
      nerdtree = 0,
      fzf = 0 }
    },

  ['rainbow_conf.separately'] = {{ nerdtree = 0, fzf = 0 }},
  -- sandwich
  sandwich_no_default_key_mappings = 1,
  operator_sandwich_no_default_key_mappings = 1,
  textobj_sandwich_no_default_key_mappings = 1,

  -- spelunker.vim
  spelunker_max_suggest_words = 10,

  -- splitjoin
  splitjoin_php_method_chain_full = 1,

  -- startify
  startify_change_to_vcs_root = 1,
  startify_files_number = 10,
  startify_change_to_dir = 0,
  startify_relative_path = 1,
  startify_use_env = 1,
  startify_lists = {
    {type = 'dir',       header = {'   Files ' .. vim.fn.getcwd()}},
  },

  -- textobj_multiblock
  textobj_multiblock_no_default_key_mappings = 1,

  -- typescript
  typescript_compiler_binary = 'node_modules/.bin/tsc',
  typescript_compiler_options = '--noEmit',

	-- ultisnips
	UltiSnipsExpandTrigger = '<C-l>',
	UltiSnipsListSnippets = '',
	UltiSnipsJumpForwardTrigger = '<C-j>',
	UltiSnipsJumpBackwardTrigger = '<C-k>',
	UltiSnipsSnippetDirectories = {os.getenv('VIM_PATH') .. '/ultisnips'},
	UltiSnipsEditSplit = 'context',

  -- undotree
  undotree_DiffAutoOpen = false,
  undotree_DiffpanelHeight = 10,
  undotree_DiffCommand = 'diff',
  undotree_HelpLine = false,
  undotree_HighlightChangedText = 1,
  undotree_HighlightSyntaxAdd = 'DiffAdd',
  undotree_HighlightSyntaxChange = 'DiffChange',
  undotree_HighlightSyntaxDel = 'DiffDelete',
  undotree_RelativeTimestamp = 1,
  undotree_SetFocusWhenToggle = 1,
  undotree_SplitWidth = 35,
  undotree_TreeNodeShape = '*',
  undotree_WindowLayout= 3,

  -- vim-smoothie
  smoothie_no_default_mappings = [[v:true]],

  -- vim-test
  ['test#strategy'] = 'asyncrun',

  -- vimwiki
  calendar_frame = 'default',
  vimwiki_use_calendar = 1,
  vimwiki_hl_headers = 1,
  vimwiki_hl_cb_checked = 1,
  vimwiki_autowriteall = 0,
  vimwiki_ext2syntax = {
    md = 'markdown',
    Rmd = 'markdown',
    rmd = 'markdown',
    mdown = 'markdown',
    markdown = 'markdown',
  },
  vimwiki_list = {{
    path = os.getenv('HOME') .. '/Documents/vimwiki',
    syntax = 'markdown',
    ext = '.md'
  }},

  -- vista
  ['vista#renderer#enable_icon'] = 1,
  vista_floating_delay = 1000,
  vista_default_executive = 'ctags',
  vista_close_on_jump = 1,
  vista_disable_statusline = vim.fn.exists('g:loaded_lightline'),
  vista_echo_cursor_strategy = 'floating_win',
  vista_fzf_preview = { 'right:50%'},
  vista_icon_indent = {" ", " "},
  vista_sidebar_width = 30,
  vista_vimwiki_executive = 'markdown',
  vista_executive_for = {
    c = 'coc',
    cpp =	'coc',
    css =	'coc',
    haskell = 'coc',
    html = 'coc',
    javascript = 'coc',
    javascriptreact = 'coc',
    js =		'coc',
    json =  'coc',
    jsx =	'coc',
    julia = 'coc',
    latex = 'coc',
    less = 'coc',
    lua =	'coc',
    ocaml = 'coc',
    pandoc = 'markdown',
    python = 'coc',
    rust = 'coc',
    sass = 'coc',
    scss = 'coc',
    sh =		'coc',
    tex =	'coc',
    typescript = 'coc',
    typescriptreact = 'coc',
    vim = 'coc',
    vimwiki = 'markdown',
    wiki = 'markdown'
  }
}

mines.command [[highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#36353d]]

for key,value in pairs(settings) do
  vim.g[key] = value
end

mines.command(([[let g:fzf_action['ctrl-q'] = %s]]):format(fzf_to_qf_ref:get_vim_ref_string()))
