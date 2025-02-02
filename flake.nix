{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
    	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
	url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
	inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, ... }@inputs:
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
		config = {
			allowUnfree = true;
			allowUnfreePredicate = (_: true);
		};
	in
  	{
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix 
				inputs.home-manager.nixosModules.default
			];
		};

	};

}
