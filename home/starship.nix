{ ... }:
{
  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      add_newline = true;
      git_branch = {
        symbol = " ";
      };
      python.symbol = " ";
      golang.symbol = " ";
      cmd_duration.disabled = true;
      nix_shell.disabled = true;
      kubernetes = {
        disabled = false;
        detect_folders = [ "charts/" "templates/" ];
      };
      custom.task = {
        symbol = " ";
        style = "blue";
        command = "task count +PENDING project:\${PWD##*/}";
        when = "[ $(task count +PENDING project:\${PWD##*/}) -gt 0 ]";
      };
    };
  };
}
