# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  inputs,
  ...
}: let
  mkdp_css =
    pkgs.writeText "markdown.css"
    ''
      /*
       * github like style
       * https://github.com/iamcco/markdown.css/blob/master/dest/github/markdown.css
       */

      :root {
          --color-text-primary: #333;
          --color-text-tertiary: #777;
          --color-text-link: #4078c0;
          --color-bg-primary: #fff;
          --color-bg-secondary: #fafbfc;
          --color-bg-tertiary: #f8f8f8;
          --color-border-primary: #ddd;
          --color-border-secondary: #eaecef;
          --color-border-tertiary: #d1d5da;
          --color-kbd-foreground: #444d56;
          --color-markdown-blockquote-border: #dfe2e5;
          --color-markdown-table-border: #dfe2e5;
          --color-markdown-table-tr-border: #c6cbd1;
          --color-markdown-code-bg: #1b1f230d;
      }
      [data-theme="dark"] {
          --color-text-primary: #c9d1d9;
          --color-text-tertiary: #8b949e;
          --color-text-link: #58a6ff;
          --color-bg-primary: #0d1117;
          --color-bg-secondary: #0d1117;
          --color-bg-tertiary: #161b22;
          --color-border-primary: #30363d;
          --color-border-secondary: #21262d;
          --color-border-tertiary: #6e7681;
          --color-kbd-foreground: #b1bac4;
          --color-markdown-blockquote-border: #3b434b;
          --color-markdown-table-border: #3b434b;
          --color-markdown-table-tr-border: #272c32;
          --color-markdown-code-bg: #f0f6fc26;
      }

      .markdown-body ol ol,
      .markdown-body ul ol,
      .markdown-body ol ul,
      .markdown-body ul ul,
      .markdown-body ol ul ol,
      .markdown-body ul ul ol,
      .markdown-body ol ul ul,
      .markdown-body ul ul ul {
        margin-top: 0;
        margin-bottom: 0;
      }
      .markdown-body {
        font-family: "Helvetica Neue", Helvetica, "Segoe UI", Arial, freesans, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        font-size: 16px;
        color: var(--color-text-primary);
        line-height: 1.6;
        word-wrap: break-word;
        padding: 45px;
        background: var(--color-bg-primary);
        border: 1px solid var(--color-border-primary);
        -webkit-border-radius: 0 0 3px 3px;
        border-radius: 0 0 3px 3px;
      }
      .markdown-body > *:first-child {
        margin-top: 0 !important;
      }
      .markdown-body > *:last-child {
        margin-bottom: 0 !important;
      }
      .markdown-body .table-of-contents ol {
        list-style: none;
      }
      .markdown-body .table-of-contents > ol {
        padding-left: 0;
      }
      .markdown-body * {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
      }
      .markdown-body h1,
      .markdown-body h2,
      .markdown-body h3,
      .markdown-body h4,
      .markdown-body h5,
      .markdown-body h6 {
        margin-top: 1em;
        margin-bottom: 16px;
        font-weight: bold;
        line-height: 1.4;
      }
      .markdown-body h1 .anchor,
      .markdown-body h2 .anchor,
      .markdown-body h3 .anchor,
      .markdown-body h4 .anchor,
      .markdown-body h5 .anchor,
      .markdown-body h6 .anchor {
        margin-left: -24px;
        visibility: hidden;
      }
      .markdown-body h1:hover .anchor,
      .markdown-body h2:hover .anchor,
      .markdown-body h3:hover .anchor,
      .markdown-body h4:hover .anchor,
      .markdown-body h5:hover .anchor,
      .markdown-body h6:hover .anchor {
        visibility: visible;
      }
      .markdown-body p,
      .markdown-body blockquote,
      .markdown-body ul,
      .markdown-body ol,
      .markdown-body dl,
      .markdown-body table,
      .markdown-body pre {
        margin-top: 0;
        margin-bottom: 16px;
      }
      .markdown-body h1 {
        margin: 0.67em 0;
        padding-bottom: 0.3em;
        font-size: 2.25em;
        line-height: 1.2;
        border-bottom: 1px solid var(--color-border-secondary);
      }
      .markdown-body h2 {
        padding-bottom: 0.3em;
        font-size: 1.75em;
        line-height: 1.225;
        border-bottom: 1px solid var(--color-border-secondary);
      }
      .markdown-body h3 {
        font-size: 1.5em;
        line-height: 1.43;
      }
      .markdown-body h4 {
        font-size: 1.25em;
      }
      .markdown-body h5 {
        font-size: 1em;
      }
      .markdown-body h6 {
        font-size: 1em;
        color: var(--color-text-tertiary);
      }
      .markdown-body hr {
        margin-top: 20px;
        margin-bottom: 20px;
        height: 0;
        border: 0;
        border-top: 1px solid var(--color-border-primary);
      }
      .markdown-body ol,
      .markdown-body ul {
        padding-left: 2em;
      }
      .markdown-body ol ol,
      .markdown-body ul ol {
        list-style-type: lower-alpha;
      }
      .markdown-body ol ul,
      .markdown-body ul ul {
        list-style-type: circle;
      }
      .markdown-body ol ul ul,
      .markdown-body ul ul ul {
        list-style-type: square;
      }
      .markdown-body ol ol ol,
      .markdown-body ul ol ol,
      .markdown-body ol ul ol,
      .markdown-body ul ul ol {
        list-style-type: lower-roman;
      }
      .markdown-body ol {
        list-style-type: decimal;
      }
      .markdown-body ul {
        list-style-type: disc;
      }
      .markdown-body dl {
        margin-bottom: 1.3em
      }
      .markdown-body dl dt {
        font-weight: 700;
      }
      .markdown-body dl dd {
        margin-left: 0;
      }
      .markdown-body dl dd p {
        margin-bottom: 0.8em;
      }
      .markdown-body blockquote {
        margin-left: 0;
        margin-right: 0;
        padding: 0 15px;
        color: var(--color-text-tertiary);
        border-left: 4px solid var(--color-markdown-blockquote-border);
      }
      .markdown-body table {
        display: block;
        width: 100%;
        overflow: auto;
        word-break: normal;
        word-break: keep-all;
        border-collapse: collapse;
        border-spacing: 0;
      }
      .markdown-body table tr {
        background-color: var(--color-bg-primary);
        border-top: 1px solid var(--color-markdown-table-tr-border);
      }
      .markdown-body table tr:nth-child(2n) {
        background-color: var(--color-bg-tertiary);
      }
      .markdown-body table th,
      .markdown-body table td {
        padding: 6px 13px;
        border: 1px solid var(--color-markdown-table-border);
        vertical-align: top;
      }
      .markdown-body kbd {
        display: inline-block;
        padding: 5px 6px;
        font: 14px SFMono-Regular,Consolas,Liberation Mono,Menlo,monospace;
        line-height: 10px;
        color: var(--color-kbd-foreground);
        vertical-align: middle;
        background-color: var(--color-bg-secondary);
        border: 1px solid var(--color-border-tertiary);
        border-radius: 3px;
        box-shadow: inset 0 -1px 0 var(--color-border-tertiary);
      }
      .markdown-body pre {
        word-wrap: normal;
        padding: 16px;
        overflow: auto;
        font-size: 85%;
        line-height: 1.45;
        background-color: var(--color-bg-tertiary);
        -webkit-border-radius: 3px;
        border-radius: 3px;
      }
      .markdown-body pre code {
        display: inline;
        max-width: initial;
        padding: 0;
        margin: 0;
        overflow: initial;
        font-size: 100%;
        line-height: inherit;
        word-wrap: normal;
        white-space: pre;
        border: 0;
        -webkit-border-radius: 3px;
        border-radius: 3px;
        background-color: transparent;
      }
      .markdown-body pre code:before,
      .markdown-body pre code:after {
        content: normal;
      }
      .markdown-body code {
        font-family: Consolas, "Liberation Mono", Menlo, Courier, monospace;
        padding: 0;
        padding-top: 0.2em;
        padding-bottom: 0.2em;
        margin: 0;
        font-size: 85%;
        background-color: var(--color-markdown-code-bg);
        -webkit-border-radius: 3px;
        border-radius: 3px;
      }
      .markdown-body code:before,
      .markdown-body code:after {
        letter-spacing: -0.2em;
        content: "\00a0";
      }
      .markdown-body a {
        color: var(--color-text-link);
        text-decoration: none;
        background: transparent;
      }
      .markdown-body img {
        max-width: 100%;
        max-height: 100%;
      }
      .markdown-body strong {
        font-weight: bold;
      }
      .markdown-body em {
        font-style: italic;
      }
      .markdown-body del {
        text-decoration: line-through;
      }
      .task-list-item {
        list-style-type: none;
      }
      .task-list-item input {
        font: 13px/1.4 Helvetica, arial, nimbussansl, liberationsans, freesans, clean, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        margin: 0 0.35em 0.25em -1.6em;
        vertical-align: middle;
      }
      .task-list-item input[disabled] {
        cursor: default;
      }
      .task-list-item input[type="checkbox"] {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 0;
      }
      .task-list-item input[type="radio"] {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 0;
      }
    '';
in {
  nixpkgs.overlays = [inputs.fenix.overlays.default];

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.nixvim.nixosModules.nixvim
  ];
  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    resumeDevice = "/dev/mapper/myroot";
  };

  networking = {
    # Open ports in the firewall.
    firewall.allowedTCPPorts = [80 21 3000];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    hostName = "elitebook"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  services = {
    logind.lidSwitchExternalPower = "ignore";
    xserver = {
      enable = true;
      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      # Reinstate the minimize/maximize buttons!
      # To list all possible settings, try this:
      # > gsettings list-schemas
      # then pick one and use it here:
      # > gsettings list-recursively <schema-name>
      # Try to keep the settings groups in alphabetical order.
      desktopManager.gnome.extraGSettingsOverrides = ''
        [org.gnome.desktop.interface]
        gtk-theme='Nordic'
        text-scaling-factor=1

        [org.gnome.desktop.wm.preferences]
        button-layout=':minimize,maximize,close'
        resize-with-right-button=true
        theme='Nordic'

        [org.gnome.nautilus.preferences]
        always-use-location-entry=true

        [org.gnome.settings-daemon.plugins.color]
        night-light-enabled=true
        night-light-temperature=2500
        night-light-schedule-automatic=true

        [org.gnome.SessionManager]
        auto-save-session=true

        [org.gtk.Settings.FileChooser]
        sort-directories-first=false

        [org.gnome.shell.app-switcher]
        current-workspace-only=true

        [org.gnome.shell.window-switcher]
        current-workspace-only=true
      '';
      # Configure keymap in X11
      xkb = {
        layout = "gb";
        variant = "";
      };
    };
  };
  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    mutableUsers = true;
    users = {
      zoe = {
        isNormalUser = true;
        description = "Zoe";
        extraGroups = ["networkmanager" "wheel" "dialout"];
        packages = with pkgs; [
          firefox
        ];
      };
    };
  };

  # Add new CA certificates
  security.pki.certificates = [
    ''      SFCF
      =========
      -----BEGIN CERTIFICATE-----
      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
      -----END CERTIFICATE-----''
    ''      Smoothwall
      =========
      -----BEGIN CERTIFICATE-----
      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
      ntNGe+V1+s6MhuJGs8Dyd6pqOi+ki5u2SY59mw==
      -----END CERTIFICATE-----''
  ];

  # Disable gnome-tour, xterm
  environment = {
    gnome.excludePackages = [pkgs.gnome-tour];
    interactiveShellInit = ''
      cat ~/Documents/todo.txt
      PATH=$PATH:$HOME/.cargo/bin
    '';
  };
  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";
  services.xserver.excludePackages = [pkgs.xterm];
  programs = {
    # Set up neovim as default editor
    nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      extraConfigVim = "set noshowmode";
      clipboard = {
        register = "unnamedplus";
        providers.wl-copy = {
          enable = true;
        };
      };
      opts = {
        number = true;
        relativenumber = true;
        expandtab = true;
        tabstop = 4;
        shiftwidth = 4;
        cursorline = true;
        signcolumn = "yes";
      };
      globals.mapleader = " ";
      keymaps = [
        {
          key = "<leader>bc";
          action = ":BufferLinePick<CR>";
          options = {
            silent = true;
            desc = "Select buffer";
          };
        }
        {
          key = "<leader>bmn";
          action = ":BufferLineMoveNext<CR>";
          options = {
            silent = true;
            desc = "Move buffer to the right";
          };
        }
        {
          key = "<leader>bmp";
          action = ":BufferLineMovePrev<CR>";
          options = {
            silent = true;
            desc = "Move buffer to the left";
          };
        }
        {
          key = "<leader>bn";
          action = ":BufferLineCycleNext<CR>";
          options = {
            silent = true;
            desc = "Switch to the next buffer";
          };
        }
        {
          key = "<leader>bp";
          action = ":BufferLineCyclePrev<CR>";
          options = {
            silent = true;
            desc = "Switch to the last buffer";
          };
        }
        {
          key = "<leader>g";
          action = ":LazyGit<CR>";
          options = {
            silent = true;
            desc = "Open Lazygit";
          };
        }
        {
          key = "<leader>ld";
          action = ":Lspsaga goto_definition<CR>";
          options = {
            silent = true;
            desc = "Go to definition";
          };
        }
        {
          key = "<leader>ln";
          action = ":Lspsaga rename<CR>";
          options = {
            silent = true;
            desc = "Rename";
          };
        }
        {
          key = "<leader>lh";
          action = ":Lspsaga hover_doc<CR>";
          options = {
            silent = true;
            desc = "Hover docs";
          };
        }
        {
          key = "<leader>lf";
          action = ":Lspsaga finder<CR>";
          options = {
            silent = true;
            desc = "Finder";
          };
        }
        {
          key = "<leader>ca";
          action = ":Lspsaga code_action<CR>";
          options = {
            silent = true;
            desc = "Open code actions";
          };
        }
        {
          key = "<leader>oe";
          action = ":set conceallevel=2<CR>";
          options = {
            silent = true;
            desc = "Enable obsidian concealment";
          };
        }
        {
          key = "<leader>od";
          action = ":set conceallevel=0<CR>";
          options = {
            silent = true;
            desc = "Disable obsidian concealment";
          };
        }
        {
          key = "<leader>me";
          action = ":MarkdownPreview<CR>";
          options = {
            silent = true;
            desc = "Enable markdown preview";
          };
        }
        {
          key = "<leader>md";
          action = ":MarkdownPreviewStop<CR>";
          options = {
            silent = true;
            desc = "Disable markdown preview";
          };
        }
      ];
      colorschemes.catppuccin = {
        enable = true;
        settings = {
          color_overrides.frappe = {
            base = "#282c34";
          };
          flavour = "frappe";
          integrations = {
            cmp = true;
            gitsigns = true;
            nvimtree = true;
            treesitter = true;
          };
        };
      };
      plugins = {
        # Nix
        nix.enable = true;

        # UI
        lualine = {
          enable = true;
          globalstatus = true;
          theme = "onedark";
          componentSeparators = {
            left = "|";
            right = "|";
          };
          sectionSeparators = {
            left = "";
            right = "";
          };
        };

        # markdown
        obsidian = {
          enable = true;
          settings = {
            ui = {
              enable = true;
              checkboxes = {
                " " = {
                  char = "☐";
                  hl_group = "ObsidianTodo";
                };
                "x" = {
                  char = "☑";
                  hl_group = "ObsidianDone";
                };
                "~" = {
                  char = "☒";
                  hl_group = "ObsidianTilde";
                };
              };
              hl_groups = {
                ObsidianDone = {
                  bold = true;
                  fg = "#98c379";
                  # original: fg = "#89ddff";
                };
                ObsidianExtLinkIcon = {
                  fg = "#c792ea";
                };
                ObsidianHighlightText = {
                  bg = "#75662e";
                };
                ObsidianRefText = {
                  fg = "#c792ea";
                  underline = true;
                };
                ObsidianRightArrow = {
                  bold = true;
                  fg = "#f78c6c";
                };
                ObsidianTag = {
                  fg = "#89ddff";
                  italic = true;
                };
                ObsidianTilde = {
                  bold = true;
                  fg = "#ff5370";
                };
                ObsidianTodo = {
                  bold = true;
                  fg = "#f78c6c";
                };
              };
            };
            completion = {
              min_chars = 2;
            };
            workspaces = [
              {
                name = "college-work";
                path = "/home/zoe/Documents/college/obsidian_vault"; # Using ~ goes to /root/...
              }
            ];
            mappings = {
              "<leader>oc" = {
                action = "require(\"obsidian\").util.toggle_checkbox";
                opts = {
                  buffer = true;
                  desc = "Toggle checkbox";
                };
              };
              "<leader>ol" = {
                action = "require(\"obsidian\").util.gf_passthrough()";
                opts = {
                  buffer = true;
                  desc = "Follow obsidian link";
                };
              };
              "<CR>" = {
                action = "require(\"obsidian\").util.smart_action()";
                opts = {
                  silent = true;
                };
              };
            };
          };
        };
        markdown-preview = {
          enable = true;
          settings = {
            browser = "firefox";
            markdown_css = "${mkdp_css}";
          };
        };

        # bufferline
        bufferline.enable = true;

        # lsp
        lint = {
          lintersByFt = {
            rust = ["cargo clippy --fix --allow-dirty"];
            nix = ["alejandra ./*.nix"];
          };
        };
        autoclose = {
          enable = true;
          keys = {
            "(" = {
              escape = false;
              close = true;
              pair = "()";
            };
            "[" = {
              escape = false;
              close = true;
              pair = "[]";
            };
            "{" = {
              escape = false;
              close = true;
              pair = "{}";
            };
          };
        };
        cmp = {
          enable = true;
          settings = {
            sources = [
              {name = "nvim_lsp";}
              {name = "vsnip";}
              {name = "cmp-buffer";}
            ];
            mapping = {
              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<CR>" = "cmp.mapping.confirm({ select = true })";
              "<C-d>" = "cmp.mapping.scroll_docs(-4)";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
            };
          };
        };
        cmp-vsnip.enable = true;
        cmp-buffer.enable = true;
        cmp-nvim-lua.enable = true;
        cmp-nvim-lsp.enable = true;
        lsp = {
          enable = true;
          servers = {
            rust-analyzer = {
              enable = true;
              package = pkgs.rust-analyzer-nightly;
              installRustc = false;
              installCargo = false;
            };
            zls.enable = true;
            nixd.enable = true;
          };
        };
        lsp-format.enable = true;
        lspsaga = {
          enable = true;
          codeAction.keys.quit = ["q" "<Esc>"];
        };

        # which-key
        which-key = {
          enable = true;
          showHelp = true;
          showKeys = true;
        };

        # git
        lazygit.enable = true;
        gitsigns = {
          enable = true;
          settings = {
            signcolumn = true;
            signs = {
              add = {
                text = "│";
              };
              change = {
                text = "│";
              };
              changedelete = {
                text = "~";
              };
              delete = {
                text = "_";
              };
              topdelete = {
                text = "‾";
              };
              untracked = {
                text = "┆";
              };
            };
          };
        };

        # rust
        rust-tools.enable = true;
        bacon.enable = true;
        crates-nvim.enable = true;

        # treesitter
        treesitter-context.enable = true;
        treesitter-refactor = {
          enable = true;
          navigation.enable = true;
          smartRename.enable = true;
        };
        treesitter = {
          enable = true;
          nixGrammars = true;
          settings.indent.enable = true;
        };
      };
    };

    # Set up GPG
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    # Enable steam
    steam.enable = true;

    # Sets up nix-ld to allow arbitrary binaries
    nix-ld.enable = true;

    # Sets up all the libraries to load
    nix-ld.libraries = with pkgs; [
      # Required libraries
      stdenv.cc.cc.lib
      libGL
      libz
      haskellPackages.gssapi
    ];
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = [
      pkgs.tree
      pkgs.netcat-gnu
      pkgs.gimp
      pkgs.drive
      pkgs.jellyfin-ffmpeg
      (import ./edit.nix)
      pkgs.unzip
      pkgs.winetricks
      pkgs.wineWowPackages.stable
      pkgs.keepassxc
      pkgs.libreoffice
      pkgs.libtelnet
      (import ./rebuild.nix)
      (import ./reload.nix)
      pkgs.openssl
      pkgs.wacomtablet
      pkgs.git
      pkgs.nix-ld
      pkgs.gh
      pkgs.alejandra
      pkgs.inetutils
      pkgs.gcc
      pkgs.bacon
      pkgs.rustfmt
      pkgs.extundelete
      pkgs.nerdfonts
      pkgs.wl-clipboard
      pkgs.usbutils
      pkgs.file
      pkgs.awscli2
      pkgs.gnomeExtensions.gsnap
      pkgs.cargo-generate
      pkgs.ghc
      pkgs.haskellPackages.cabal-install
      pkgs.espflash
      pkgs.gnupg1
      pkgs.pinentry-gnome3
      pkgs.gdrive3
      pkgs.distrobox
      pkgs.docker_26
      pkgs.pkg-config
      pkgs.gparted
      pkgs.nixos-generators
      pkgs.time
      pkgs.pkg-config
      pkgs.rpi-imager
      pkgs.clippy
      pkgs.prismlauncher
      pkgs.jdk17
      pkgs.zig_0_12
      pkgs.fzf
      pkgs.kitty
      # Requires unfree
      pkgs.spotify
      pkgs.obsidian
      pkgs.lutris
      pkgs.discord
    ];
  };
  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };
  # Adding a comment to force rebuilding.
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  #efore changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
