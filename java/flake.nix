{
  description = "Java development template";

  inputs = {
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    utils,
    ...
  }:
    utils.lib.eachDefaultSystem
    (
      system: let
        javaVersion = 17;
        overlays = [
          (final: prev: rec {
            jdk = prev."jdk${toString javaVersion}";
            gradle = prev.gradle.override { java = jdk; };
            maven = prev.maven.override { inherit jdk; };
          })
        ];
        pkgs = import nixpkgs {inherit system overlays;};
      in rec
      {
        # Used by `nix develop`
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            jdk
            # maven
            # gradle
          ];
        };
      }
    );
}
