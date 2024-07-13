{ ... }:
{
  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      add_newline = true;
      os = {
        disabled = false;
        symbols = {
          NixOS = " ";
          Arch = " ";
        };
      };
      directory = {
        format = "[  $path]($style)[$read_only]($read_only_style)";
      };
      git_branch = {
        symbol = " ";
      };
      python.symbol = " ";
      golang.symbol = " ";
      format = "$os $directory $git_branch$git_status$python$golang$nodejs\n$character";
    };
  };
}
