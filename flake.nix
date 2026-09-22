{
  description = "MadeWithML Flake";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
  };

  outputs = inputs: {
    devShells = builtins.mapAttrs (system: pkgs: {
      default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          (python3.withPackages (
            ps: with ps; [

              # Core ML & Distributed Computing
              torch
              ray
              pandas
              numpy
              scikit-learn

              # Data Validation & Testing
              pytest

              # what the tutorial says
              uv
              setuptools
              wheel

            ]
          ))
          # Infra
          kind
          kubectl
          helm
          skaffold
        ];

        shellHook = ''
          echo "----------------------------------------------------"
          echo "  MadeWithML Dev Environment Loaded!"
          echo "  Python: $(python --version)"
          echo "----------------------------------------------------"
          if [[ ! -d .venv ]] ; then uv venv; fi
          source .venv/bin/activate
          exec zsh
        '';
      };

    }) inputs.nixpkgs.legacyPackages;
  };
}
