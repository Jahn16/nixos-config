{ pkgs, lib, inputs, ... }:
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    opts = {
      number = true;
      relativenumber = true;
      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      autoindent = true;
      ignorecase = true;
      smartcase = true;
      cursorline = true;
      background = "dark";
      undodir = "/home/jahn/.vim/undodir";
      undofile = true;
      foldmethod = "expr";
      foldexpr = "v:lua.vim.treesitter.foldexpr()";
    };
    globals = {
      mapleader = " ";
    };
    colorschemes.cyberdream = {
      enable = true;
      settings = {
        transparent = true;
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>r";
        action = "<cmd>SessionRestore<CR>";
        options = {
          silent = true;
          desc = "Restore session";
        };
      }
      {
        mode = "n";
        key = "<leader>d";
        action = ":lua require('neogen').generate()<CR>";
        options = {
          silent = true;
          desc = "Generate docstring";
        };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":lua MiniFiles.open()<CR>";
        options = {
          silent = true;
          desc = "Open file explorer";
        };
      }
      { mode = "n"; key = "<leader>cc"; action = "<cmd>CodeCompanionChat Toggle<CR>"; options = { silent = true; desc = "Open chat"; }; }
      { mode = "n"; key = "<leader>ha"; action.__raw = "function() require'harpoon':list():add() end"; }
      { mode = "n"; key = "<leader>he"; action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end"; }
      { mode = "n"; key = "<leader>hj"; action.__raw = "function() require'harpoon':list():select(1) end"; }
      { mode = "n"; key = "<leader>hk"; action.__raw = "function() require'harpoon':list():select(2) end"; }
      { mode = "n"; key = "<leader>hl"; action.__raw = "function() require'harpoon':list():select(3) end"; }
      { mode = "n"; key = "<leader>h;"; action.__raw = "function() require'harpoon':list():select(4) end"; }

    ];
    extraConfigLua = ''
      local imap_expr = function(lhs, rhs)
        vim.keymap.set('i', lhs, rhs, { expr = true })
      end
      imap_expr('<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
      imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
    '';
    plugins = {
      web-devicons.enable = true;
      tmux-navigator.enable = true;
      which-key.enable = true;
      neogen.enable = true;
      copilot-lua = {
        enable = true;
        settings = {
          suggestion.enabled = false;
          panel.enabled = false;
        };
      };
      codecompanion.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = {
            action = "find_files";
            options.desc = "Find Files";
          };
          "<leader>fl" = {
            action = "live_grep";
            options.desc = "Live Grep";
          };
          "gr" = {
            action = "lsp_references";
            options.desc = "Goto references";
          };

        };
      };
      fugitive.enable = true;
      mini = {
        enable = true;
        modules = {
          statusline = { };
          surround = { };
          indentscope = { symbol = "│"; };
          starter = { };
          pairs = { };
          diff = { };
          git = { };
          files = { };
        };
      };
      auto-session =
        {
          enable = true;
          settings = {
            auto_restore_enabled = false;
          };
        };
      harpoon.enable = true;
      noice = {
        enable = true;
      };
      treesitter = {
        enable = true;
        settings = {
          indent.enable = true;
          highlight.enable = true;
          auto_install = false;
          ensure_installed = [ "python" "go" "typescript" "svelte" "nix" ];
          parser_install_dir = "/home/jahn/.local/share/nvim/treesitter";
        };
      };
      friendly-snippets.enable = true;
      blink-copilot.enable = true;
      blink-cmp = {
        enable = true;
        settings = {
          sources = {
            default = [
              "lsp"
              "path"
              "snippets"
              "buffer"
              "copilot"
            ];
            providers = {
              copilot = {
                async = true;
                module = "blink-copilot";
                name = "copilot";
                score_offset = 100;
              };
            };
          };
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_format = "fallback";
          };
          formatters_by_ft = {
            python = [ "ruff_fix" "ruff_format" ];
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
            html = [ "prettier" ];
            svelte = [ "prettier" ];
            go = [ "gofmt" "goimports" ];
            nix = [ "nixpkgs_fmt" ];
            yaml = [ "yamlfix" ];
            rust = [ "rustfmt" ];
            json = [ "prettier" ];
          };
        };
      };
      lint = {
        enable = true;
        lintersByFt = {
          python = [ "ruff" "mypy" ];
          go = [ "golangcilint" ];
          javascript = [ "eslint" ];
          typescript = [ "eslint" ];
          svelte = [ "eslint" ];
          nix = [ "nix" ];
        };
      };
      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          gopls.enable = true;
          ts_ls.enable = true;
          html.enable = true;
          svelte.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
        keymaps = {
          diagnostic = {
            "<leader>ll" = {
              action = "open_float";
              desc = "Line Diagnostics";
            };
            "[d" = {
              action = "goto_next";
              desc = "Next Diagnostic";
            };
            "]d" = {
              action = "goto_prev";
              desc = "Previous Diagnostic";
            };
          };
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto definition";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gi = {
              action = "implementation";
              desc = "Goto implementation";
            };
            "<leader>lr" = {
              action = "rename";
              desc = "Rename";
            };
            K = "hover";
          };
        };
      };
    };
  };
}
