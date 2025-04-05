{
  description = "A collection of flake templates";

  outputs = { self }: {

    templates = {

      default = {
        path = ./default;
        description = "A very basic flake";
      };

      typescript = {
        path = ./typescript;
        description = "A template installing node,typescript and common dependencies";
        welcomeText = ''
          # Getting Started
          - run `nix develop` to enter the development environment
        '';
      };
    };

    defaultTemplate = self.templates.default;

  };
}
