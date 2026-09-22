{
  description = "MadeWithML Flake";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
  };

  outputs = inputs: {
    devShells = builtins.mapAttrs (system: pkgs: {
      default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          (python311.withPackages (
            ps: with ps; [
              uv
              setuptools
              wheel
            ]
          ))
          # Infra
          kind
          kubectl
          kubernetes-helm
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
