{
  config,
  pkgs,
  ...
}: {
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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

  # Enable the GNOME Desktop Environment.
  services.xserver = {
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
      text-scaling-factor=1.25

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
    layout = "gb";
    xkbVariant = "";
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
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zoe = {
    isNormalUser = true;
    description = "Zoe";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      firefox
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    (
      pkgs.vscode-with-extensions.override {
        vscodeExtensions = with pkgs.vscode-extensions;
          [
            bbenoist.nix
            rust-lang.rust-analyzer
            jnoortheen.nix-ide
          ]
          ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          ];
      }
    )
    pkgs.gh
    pkgs.alejandra
    pkgs.gcc
    pkgs.cargo
    pkgs.rustc
    pkgs.rustup
    pkgs.obsidian
    pkgs.git
    pkgs.home-manager
    pkgs.steam-run
    pkgs.neovim
    wget
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
