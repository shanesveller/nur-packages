{ nixpkgs, declInput }: let pkgs = import nixpkgs {}; in {
  jobsets = pkgs.runCommand "spec.json" {} ''
    cat <<EOF
    ${builtins.toXML declInput}
    EOF
    cat > $out <<EOF
    {
        "enabled": 1,
        "hidden": false,
        "description": "Jobsets",
        "nixexprinput": "src",
        "nixexprpath": "jobspec.nix",
        "checkinterval": 300,
        "schedulingshares": 1,
        "enableemail": false,
        "emailoverride": "",
        "keepnr": 10,
        "inputs": {
          "src": { "type": "git", "value": "https://github.com/shanesveller/nur-packages.git develop", "emailresponsible": false },
          "nixpkgs": { "type": "git", "value": "https://github.com/nixos/nixpkgs-channels nixos-19.03", "emailresponsible": false }
        }
    }

    EOF
  '';
}

