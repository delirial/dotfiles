# this is the first input and the first function use by devenv
{ pkgs, ... }:
{
  name="dotfiles";

  packages = [
  	pkgs.git
	pkgs.neovim 
	pkgs.openssh
	pkgs.github-cli
	pkgs.rustup
	pkgs.direnv
	pkgs.tmux
	pkgs.tmuxinator
	pkgs.tmuxPlugins.resurrect
	pkgs.vimPlugins.packer-nvim
	pkgs.starship
	pkgs.cmake
	];

  starship.enable=true;
  devcontainer.enable = true;

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
