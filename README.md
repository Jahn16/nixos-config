# nixos-config
## Changing the configuration
### System
```
sudo -i nixos-rebuild switch --flake ~/nixos-config#<host>
```
### Home Manager
```
home-manager switch --flake ~/nixos-config#jahn
```
## Updating
1. Update flake.lock
```
nix flake update
```
2. Run the other commands listed in [Changing the configuration](#changing-the-configuration)
