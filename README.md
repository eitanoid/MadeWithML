[Made with ml](https://madewithml.com/)

Attempt at following the MadeWithML course but with Kubernetes instead of Local or Anyscale

# Setup

0. Update `.env` file to match your Github username:
```sh
#.env
GITHUB_USERNAME=name
```

1. Install dependancies
```sh
nix develop
```

2. Install Python packages
```sh
just install
```

3. Bootstrap a Kind cluster
```sh
just up
```
