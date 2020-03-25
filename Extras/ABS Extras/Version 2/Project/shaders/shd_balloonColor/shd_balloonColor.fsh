//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 balloonColor;
void main()
{
	vec4 originalColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float alpha = 1.0;
	
	if (originalColor.r == 0.0)
		gl_FragColor = originalColor;
	else {
		
		vec4 color = vec4(balloonColor.r, balloonColor.g, balloonColor.b, alpha);
	
	    gl_FragColor = color;
	}
}
