{inputs, ...}:
{
   programs.firefox = {
	enable = true;
	profiles.jdcombat = {
	    extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
		ublock-origin
		sponsorblock
		darkreader
		return-youtube-dislikes
		tabliss
	    ];
	};
   };
}
