{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
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
	];

  starship.enable=true;
  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";
  scripts.start.exec = ''
    echo "Enter starship"
    eval "$(starship init bash)"
  '';

  enterShell = ''
    start
  '';

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
