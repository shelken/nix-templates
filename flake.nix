{
  description = "Personal Nix flake templates: base, pi-extension";

  outputs = _: let
    base = {
      path = ./base;
      description = "Base development template using mise (no flake)";
      welcomeText = ''
        Base mise template created. Run: mise trust && mise install && mise run setup
      '';
    };
  in {
    templates = {
      inherit base;

      # `nix flake init -t <flake>` without a fragment uses this one.
      default = base;

      pi-extension = {
        path = ./pi-extension;
        description = "Pi extension template using mise (no flake)";
        welcomeText = ''
          pi extension template created. Run: mise install && bun install
        '';
      };
    };
  };
}
