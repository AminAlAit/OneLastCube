
	Thanks for using this open-source lighting engine for GameMaker Studio 2 projects.

	Known issues

		- light_trace_polygon doesn't produce a closed polygon,
		  only an issue with shadows smaller than the shadow caster
	  
		- Variables eLight.ShadowLength and obj_shadow_caster.shadow_length are a dirty hack
		  to control shadow drops. See feature wishlist.
	
	Feature ideas

		- Optimizations
		  Trade-off with usability / learnability

		- Soft shadows
	
		- Multiple polygons per shadow caster
	
		- Shadow map layers; assign lights and shadow casters to different layers, producing per-layer shadow maps
	
		- Z axis and shadow caster height
		  use eLight.Z and remove eLight.ShadowLength and obj_shadow_caster.shadow_length hack
	
		- Obstruct area light emitter with shadow casters
		  Area lights shouldn't be obstructed but I can see game-specific reasons why you might want to,
		  so it would be nice to have as a toggle-on