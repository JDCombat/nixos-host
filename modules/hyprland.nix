{
 wayland.windowManager.hyprland = {
	enable = true;
	xwayland.enable = true;
    	settings = {
		"$mod" = "SUPER";
		"$terminal" = "kitty";
		"$menu" = "wofi --show drun";
	
		monitor = ",prefered,auto,auto";
	
		env = [
		  "XCURSOR_SIZE,24"
		  "HYPRCURSOR_SIZE,24"
		  "LIBVA_DRIVER_NAME,nvidia"
		  "__GLX_VENDOR_LIBRARY_NAME,nvidia"
		  "NVD_BACKEND,direct"
		  "NIXOS_OZONE_WL,1"
		];

		exec-once = [
			"hyprpolkitagent"
			"dunst"
			"waybar"
			"vesktop"
		];
	
		general = {
			 gaps_in = 5;
			 gaps_out = 20;
			 border_size = 2;
			"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
			"col.inactive_border" = "rgba(595959aa)";
		
			resize_on_border = false;
			
			allow_tearing = false;
			
			layout = "dwindle";
		};
			
		bind = [
		      	"$mod, X, killactive"
			"$mod, Q, exec, $terminal"
			"$mod, M, exit"
			"$mod, W, exec, $menu"
			"$mod, V, togglefloating"
			"$mod, P, pseudo"
			"$mod, J, togglesplit"

			"$mod, left, movefocus, l"
			"$mod, right, movefocus, r"
			"$mod, up, movefocus, u"
			"$mod, down, movefocus, d"

			"$mod, 1, workspace, 1"
			"$mod, 2, workspace, 2"
			"$mod, 3, workspace, 3"
			"$mod, 4, workspace, 4"
			"$mod, 5, workspace, 5"
			"$mod, 6, workspace, 6"
			"$mod, 7, workspace, 7"

			"$mod SHIFT, 1, movetoworkspace, 1"
			"$mod SHIFT, 2, movetoworkspace, 2"
			"$mod SHIFT, 3, movetoworkspace, 3"
			"$mod SHIFT, 4, movetoworkspace, 4"
			"$mod SHIFT, 5, movetoworkspace, 5"
			"$mod SHIFT, 6, movetoworkspace, 6"
			"$mod SHIFT, 7, movetoworkspace, 7"

		];


		bindm = [
			"$mod, mouse:272, movewindow"
			"$mod, mouse:273, resizewindow"
		];
		
		bindel = [ 
			",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
			",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
			",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
			",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
			",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
			",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
		];
		
		# Requires playerctl
		bindl = [ 
			", XF86AudioNext, exec, playerctl next"
			", XF86AudioPause, exec, playerctl play-pause"
			", XF86AudioPlay, exec, playerctl play-pause"
			", XF86AudioPrev, exec, playerctl previous"
		];

		windowrule = "opacity 0.9 0.8, ^(kitty)$";
		windowrulev2 = [
			"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
			"suppressevent maximize, class:.*"
		];

		workspace = [
			"1, persistent:true,monitor:HDMI-A-1"
			"2, persistent:true,monitor:DP-2"
			"3, persistent:true,monitor:DP-2"
			"4, persistent:true,monitor:DP-2"
			"5, persistent:true,monitor:DP-2"
			"6, persistent:true,monitor:DP-2"
			"7, persistent:true,monitor:DP-2"
		];

		
		animations = {
		    enabled = true;
		
		    # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
		
		    bezier = [
			"easeOutQuint,0.23,1,0.32,1"
		     	"easeInOutCubic,0.65,0.05,0.36,1"
		    	"linear,0,0,1,1"
		    	"almostLinear,0.5,0.5,0.75,1.0"
		    	"quick,0.15,0,0.1,1"
			];
		
		    animation = [
			"global, 1, 10, default"
		    	"border, 1, 5.39, easeOutQuint"
		    	"windows, 1, 4.79, easeOutQuint"
		    	"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
		    	"windowsOut, 1, 1.49, linear, popin 87%"
		    	"fadeIn, 1, 1.73, almostLinear"
		    	"fadeOut, 1, 1.46, almostLinear"
		    	"fade, 1, 3.03, quick"
		    	"layers, 1, 3.81, easeOutQuint"
		    	"layersIn, 1, 4, easeOutQuint, fade"
		    	"layersOut, 1, 1.5, linear, fade"
		    	"fadeLayersIn, 1, 1.79, almostLinear"
		    	"fadeLayersOut, 1, 1.39, almostLinear"
		    	"workspaces, 1, 1.94, almostLinear, slide"
		    	"workspacesIn, 1, 2.0, almostLinear, slide"
		    	"workspacesOut, 1, 2.0, almostLinear, slide"
			];	
	};
		decoration = {
		    rounding = 10;
		    #rounding_power = 2.0;
		
		    # Change transparency of focused and unfocused windows
		    active_opacity = 1.0;
		    inactive_opacity = 1.0;
		
		    shadow = {
			enabled = true;
			range = 4;
			render_power = 3;
			color = "rgba(1a1a1aee)";
		    };
		
		    # https://wiki.hyprland.org/Configuring/Variables/#blur
		    blur = {
			enabled = true;
			size = 3;
			passes = 1;
		
			vibrancy = 0.1696;
		    };
		};

		input = {
		    kb_layout = "pl";
		    kb_variant = "";
		    kb_model = "";
		    kb_options = "";
		    kb_rules = "";
		
		    follow_mouse = 1;
		
		    sensitivity = 0.5;
		
		    force_no_accel = true;
		
		    touchpad = {
		        natural_scroll = false;
		    };
	};
    };
  };

}
