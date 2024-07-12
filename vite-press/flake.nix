{
  description = "vite-press flake";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    pre-commit-hooks,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      overlays = [
        (self: super: rec {
          nodejs = super.nodejs_20;
          pnpm = super.nodePackages.pnpm;
          yarn = super.yarn.override {inherit nodejs;};
          prettier = super.nodePackages.prettier;
        })
      ];
      pkgs = import nixpkgs {inherit overlays system;};
      packages = with pkgs; [
        node2nix
        nodejs
        pnpm
        yarn
        prettier

        git
        typos
        alejandra
      ];
    in {
      checks = {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            alejandra.enable = true; # formatter
            typos = {
              enable = true;
              settings = {
              write = true; # Automatically fix typos
              ignored-words = [];
              };
            }; # Source code spell checker
            prettier = {
              enable = true;
              settings = {
                write = true; # Automatically format files
                configPath = "./.prettierrc.yaml"; # relative to the flake root
              };
            }; # 主要用于文档检查
            # deadnix.enable = true; # detect unused variable bindings in `*.nix`
            # statix.enable = true; # lints and suggestions for Nix code(auto suggestions)
          };
        };
      };

      devShells.default = pkgs.mkShell {
        inherit packages;

        shellHook = ''
          echo "node `${pkgs.nodejs}/bin/node --version`"
          #${self.checks.${system}.pre-commit-check.shellHook}
          exec zsh
        '';
      };
    });
}
