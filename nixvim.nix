{ config, libs, pkgs, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
  });
in
{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true; 
    defaultEditor = true; 
    viAlias = true; 
    vimAlias = true; 
    vimdiffAlias = true; 
    colorschemes.catppuccin = { 
      enable = true; 
      settings = { 
        flavour = "mocha"; 
	integrations = { 
	  aerial = true;
	  alpha = true;
	  cmp = true; 
	  dashboard = true;
	  flash = true; 
	  fzf = true;
	  grug_far = true; 
	  gitsigns = true; 
	  headlines = true;
	  illuminate = true;
	  indent_blankline.enabled = true;
	  leap = true;
	  lsp_trouble = true;
	  mason = true;
	  markdown = true;
	  mini = true; 
	  native_lsp = { 
	    enabled = true; 
	    underlines = { 
	      errors = ["undercurl"];
	      hints = ["undercurl"]; 
	      warnings = ["undercurl"]; 
	      information = ["undercurl"]; 
	    };
	  }; 
	  navic = {
	    enable = true;
	    custom_bg = "lualine";
	  };
	  neotest = true;
	  neotree = true; 
	  noice = true; 
	  notify = true;
	  semantic_tokens = true;
	  snacks = true; 
	  telescope = true;
	  treesitter = true; 
	  treesitter_context = true;
	  which_key = true; 
	}; 
      }; 
    }; 
    plugins = { 
      ts-comments.enable = true; 
      lazydev = {
        enable = true;
	settings.library = [
	  {
	    path = "\${3rd}/luv/library";
	    words = [ "vim%.uv" ];
	  }
	  {
	    path = "LazyVim";
	    words = [ "LazyVim" ];
	  }
	  {
	    path = "snacks.nvim";
	    words = [ "Snacks" ];
	  }
	  {
	    path = "lazy.nvim";
	    words = [ "LazyVim" ];
	  }
	];
      };
      grug-far = { 
        enable = true; 
	settings.headerMaxWidth = 80; 
      }; 
      flash.enable = true; 
      which-key = {
        enable = true;
	settings = {
	  preset = "helix";
	  defaults = [];
	  spec = [
	    {
	      mode = [ "n" "v" ];
	      __unkeyed-1 = {
	        __unkeyed = "<leader><tab>";
		group = "tabs";
	      };
	      __unkeyed-2 = {
	        __unkeyed = "<leader>c";
		group = "code";
	      };
	      __unkeyed-3 = {
	        __unkeyed = "<leader>d";
		group = "debug";
	      };
	      __unkeyed-4 = {
	        __unkeyed = "<leader>dp";
		group = "profiler";
	      };
	      __unkeyed-5 = {
	        __unkeyed = "<leader>f";
		group = "file/find";
	      };
	      __unkeyed-6 = {
	        __unkeyed = "<leader>g";
		group = "git";
	      };
	      __unkeyed-7 = {
	        __unkeyed = "<leader>gh";
		group = "hunks";
	      };
	      __unkeyed-8 = {
	        __unkeyed = "<leader>q";
		group = "quit/session";
	      };
	      __unkeyed-9 = {
	        __unkeyed = "<leader>s";
		group = "search";
	      };
	      __unkeyed-10 = {
	        __unkeyed = "<leader>u";
		group = "ui";
		icon = {
		  icon = "󰙵 ";
		  color = "cyan";
		};
	      };
	      __unkeyed-11 = {
	        __unkeyed = "<leader>x";
		group = "diagnostics/quickfix";
		icon = {
		  icon = "󱖫 ";
		  color = "green";
		};
	      };
	      __unkeyed-12 = {
	        __unkeyed = "[";
		group = "prev";
	      };
	      __unkeyed-13 = {
	        __unkeyed = "]";
		group = "next";
	      };
	      __unkeyed-14 = {
	        __unkeyed = "g";
		group = "goto";
	      };
	      __unkeyed-15 = {
	        __unkeyed = "gs";
		group = "surround";
	      };
	      __unkeyed-16 = {
	        __unkeyed = "z";
		group = "fold";
	      };
	      __unkeyed-17 = {
	        __unkeyed = "<leader>b";
		group = "buffer";
		expand.__raw = ''function() 
		  return require("which-key.extras").expand.buf() 
		end'';
	      };
	      __unkeyed-18 = {
	        __unkeyed = "<leader>w";
		group = "windows";
		proxy = "<c-w>";
		expand.__raw = ''function()
		  return require("which-key.extras").expand.win()
		end'';
	      };
	      __unkeyed-19 = {
	        __unkeyed = "gx";
		desc = "Open with system app";
	      };
	    }
	  ];
	};
      }; 
      gitsigns = {
        enable = true;
	settings = { 
	  signs = { 
	    add.text = "▎"; 
	    change.text = "▎"; 
	    delete.text = ""; 
	    topdelete.text = ""; 
	    changedelete.text = "▎"; 
	    untracked.text = "▎"; 
	  }; 
	  signs_staged = { 
	    add.text = "▎";
	    change.text = "▎";
	    delete.text = ""; 
	    topdelete.text = ""; 
	    changedelete.text = "▎"; 
	  }; 
	  on_attach = ''function(buffer) 
	    local gs = package.loaded.gitsigns

	    local function map(mode, l, r, desc) 
	      vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc }) 
	    end 

	    -- stylua: ignore start 
	    map("n", "]h", function() 
	      if vim.wo.diff then 
	        vim.cmd.normal({ "]c", bang = true }) 
	      else 
	        gs.nav_hunk("next") 
	      end 
	    end, "Next Hunk") 
	    map("n", "[h", function() 
	      if vim.wo.diff then 
	        vim.cmd.normal({ "[c", bang = true }) 
	      else 
	        gs.nav_hunk("prev") 
	      end 
	    end, "Prev Hunk") 
	    map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk") 
	    map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk") 
	    map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
	    map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
	    map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer") 
	    map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk") 
	    map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer") 
	    map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline") 
	    map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line") 
	    map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer") 
	    map("n", "<leader>ghd", gs.diffthis, "Diff This") 
	    map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~") 
	    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk") 
          end'';
	  __unkeyed.__raw = ''function() 
	    Snacks.toggle({ 
	      name = "Git Signs", 
	      get = function()
	        return require("gitsigns.config").config.signcolumn
              end, 
	      set = function(state) 
	        require("gitsigns").toggle_signs(state) 
	      end, 
	    }):map("<leader>uG") 
	  end'';
	};
      }; 
      trouble = { 
        enable = true; 
	settings.modes = { 
	  lsp.win.position = "right"; 
	}; 
      }; 
      todo-comments.enable = true; 
      conform-nvim = { 
        enable = true; 
	settings = { 
	  __unkeyed.__raw = ''function()
	    local plugin = require("lazy.core.config").plugins["conform.nvim"]
	    if plugin.config ~= M.setup then
	      LazyVim.error({
	        "Don't set `plugin.config` for `conform.nvim`.\n",
	        "This will break **LazyVim** formatting.\n",
	        "Please refer to the docs at https://www.lazyvim.org/plugins/formatting",
	      }, { title = "LazyVim" })
	    end
	    ---@type conform.setupOpts
	    local opts = {
	      default_format_opts = {
	        timeout_ms = 3000,
	        async = false, -- not recommended to change
	        quiet = false, -- not recommended to change
	        lsp_format = "fallback", -- not recommended to change
	      },
	      formatters_by_ft = {
	        lua = { "stylua" },
	        fish = { "fish_indent" },
	        sh = { "shfmt" },
	      },
	      formatters = {
	        injected = { options = { ignore_errors = true } },
	      },
	    }
	    return opts
	  end'';
	}; 
      }; 
      lint = {
        enable = true;
      }; 
      lz-n.enable = true; 
      nvim-autopairs = { 
        enable = true;   
      }; 
      cmp = { 
        enable = true; 
	autoEnableSources = true; 
	settings.sources = [ 
	  {name = "nvim_lsp";} 
	  {name = "path";} 
	  {name = "buffer";} 
	]; 
      }; 
      neo-tree = { 
        enable = true; 
	closeIfLastWindow = true; 
	filesystem = { 
	  followCurrentFile.enabled = true; 
	  useLibuvFileWatcher = true; 
	}; 
	window = { 
	  mappings = { 
	    l = "open"; 
	    h = "close_node"; 
	    "<space>" = "none"; 
	  }; 
	}; 
      }; 
      treesitter = { 
        enable = true; 
	settings.highlight.enable = true; 
	#settings.indent.enable = true; 
      }; 
      treesitter-textobjects.enable = true; 
      ts-autotag.enable = true; 
      bufferline = { 
        enable = true; 
	settings.options.offsets = [{ 
	  filetype = "neo-tree"; 
	  text = "Neo-tree"; 
	  highlight = "Directory"; 
	  text_align = "left"; 
	}]; 
      }; 
      lualine.enable = true; 
      noice.enable = true; 
      mini.enable = true; 
      nui.enable = true; 
      snacks.enable = true; 
      persistence.enable = true; 
      web-devicons.enable = true; 
    };
  };
}
