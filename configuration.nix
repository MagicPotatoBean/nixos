# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: let
  fenix = import (fetchTarball "https://github.com/nix-community/fenix/archive/main.tar.gz") {};
  nixvim =
    import
    (builtins.fetchGit {
      url = "https://github.com/nix-community/nixvim";
      # ref = "nixos-24.05";
    });
in {
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
    nixvim.nixosModules.nixvim
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
    # openvpn.servers = {
    #   protonVPN = {config = ''config /home/zoe/.dotfiles/openvpn/proton.conf '';};
    # };
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
  users.users.zoe = {
    isNormalUser = true;
    description = "Zoe";
    extraGroups = ["networkmanager" "wheel" "dialout"];
    packages = with pkgs; [
      firefox
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
  services.xserver.excludePackages = [pkgs.xterm];
  programs = {
    # Set up neovim as default editor
    nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      clipboard.providers.wl-copy = {
        enable = true;
        package = pkgs.wl-clipboard;
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
          options.silent = true;
        }
        {
          key = "<leader>ris";
          action = "rt.inlay_hints.set";
          options.silent = true;
        }
        {
          key = "<leader>riu";
          action = "rt.inlay_hints.unset";
          options.silent = true;
        }
        {
          key = "<leader>rm";
          action = "rt.expand_macro.expand_macro";
          options.silent = true;
        }
        {
          key = "<leader>rg";
          action = "function() rt.crate_graph.view_crate_graph(\"x11\", nil) end";
          options.silent = true;
        }
        {
          key = "<leader>ca";
          action = ":Lspsaga code_action<CR>";
          options.silent = true;
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
            completion = {
              min_chars = 2;
            };
            workspaces = [
              {
                name = "college-work";
                path = "/home/zoe/Documents/college/obsidian_vault"; # Using ~ goes to /root/...
              }
            ];
          };
        };
        markdown-preview = {
          enable = true;
          settings = {
            auto_close = false;
            auto_start = true;
            browser = "firefox";
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
            rust-analyzer.enable = true;
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
          indent = true;
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
      #      (
      #        pkgs.vscode-with-extensions.override {
      #          vscodeExtensions = with pkgs.vscode-extensions;
      #            [
      #              ms-vscode.cpptools
      #              bbenoist.nix
      #              rust-lang.rust-analyzer
      #              jnoortheen.nix-ide
      #              usernamehw.errorlens
      #              ms-vscode.live-server
      #              vscodevim.vim
      #              # Built in extensions
      #            ]
      #            ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      #              # Custom extensions
      #            ];
      #        }
      #      )
      pkgs.tree
      pkgs.netcat-gnu
      pkgs.spotify
      pkgs.gimp
      pkgs.drive
      pkgs.jellyfin-ffmpeg
      (import /etc/nixos/edit.nix)
      pkgs.unzip
      pkgs.winetricks
      pkgs.wineWowPackages.stable
      pkgs.steam
      pkgs.discord
      pkgs.keepassxc
      pkgs.libreoffice
      pkgs.libtelnet
      (import "/etc/nixos/rebuild.nix")
      (import "/etc/nixos/reload.nix")
      pkgs.openssl
      pkgs.wacomtablet
      pkgs.obsidian
      pkgs.git
      pkgs.nix-ld
      pkgs.gh
      pkgs.alejandra
      pkgs.inetutils
      pkgs.gcc
      fenix.minimal.toolchain
      pkgs.bacon
      pkgs.rustfmt
      pkgs.extundelete
      pkgs.nerdfonts
      pkgs.neofetch
      pkgs.wl-clipboard
      pkgs.usbutils
      pkgs.file
      pkgs.awscli2
      pkgs.gnomeExtensions.gsnap
      pkgs.cargo-generate
      pkgs.python3
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
      pkgs.lutris
      pkgs.nixos-generators
      pkgs.time
      pkgs.pkg-config
      pkgs.rpi-imager
      pkgs.clippy
    ];
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
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
