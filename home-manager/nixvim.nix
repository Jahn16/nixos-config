{ pkgs, lib, inputs, ... }:
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      autoindent = true;
      smartcase = true;
      cursorline = true;
      background = "dark";
      undodir = "/home/jahn/.vim/undodir";
      undofile = true;
    };
    globals = {
      mapleader = " ";
    };
    colorschemes.cyberdream.enable = true;
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<CR>";
        options = {
          silent = true;
          desc = "Toggle File Explorer";
        };
      }
      {
        mode = "n";
        key = "<leader>r";
        action = "<cmd>SessionRestore<CR>";
        options = {
          silent = true;
          desc = "Restore session";
        };
      }

    ];
    extraConfigLua = ''
      local imap_expr = function(lhs, rhs)
        vim.keymap.set('i', lhs, rhs, { expr = true })
      end
      imap_expr('<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
      imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
    '';
    plugins = {
      tmux-navigator.enable = true;
      nvim-tree.enable = true;
      which-key.enable = true;
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
        };
      };
      mini = {
        enable = true;
        modules = {
          statusline = { };
          comment = { };
          surround = { };
          completion = { };
          indentscope = { symbol = "│"; };
          starter = { };
          pairs = { };
          diff = { };
          git = { };
        };
      };
      auto-session =
        {
          enable = true;
          extraOptions = {
            auto_restore_enabled = false;
          };
        };
      harpoon = {
        enable = true;
        keymaps = {
          addFile = "<leader>ha";
          toggleQuickMenu = "<leader>he";
          navFile = {
            "1" = "<leader>hh";
            "2" = "<leader>hj";
            "3" = "<leader>hk";
            "4" = "<leader>hl";
          };
        };
      };
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
      conform-nvim = {
        enable = true;
        formattersByFt = {
          python = [ "isort" "lua" ];
          javascript = [ "prettier" ];
          typescript = [ "prettier" ];
          svelte = [ "prettier" ];
          go = [ "gofmt" "goimports" ];
          nix = [ "nixpkgs_fmt" ];
        };
        formatOnSave = { };
      };
      lint = {
        enable = true;
        lintersByFt =
          {
            python = [ "flake8" "mypy" ];
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
          tsserver.enable = true;
          html.enable = true;
          svelte.enable = true;
        };
        keymaps = {
          diagnostic = {
            "<leader>ld" = {
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
