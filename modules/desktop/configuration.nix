{ pkgs, config, ...}:
{
    hostName = "desktop"; # Define your hostname.
    logind.lidSwitchExternalPower = "ignore";
}
