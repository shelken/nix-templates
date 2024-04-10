update-all:
    #!/usr/bin/env zsh
    for dir in *(D); do
      if [[ -d "$dir" ]]; then    
        nix flake update "./$dir"
      fi
    done
    nix flake update
