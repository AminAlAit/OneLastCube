//
// Simple passthrough fragment shader
//
uniform vec3 u_vParams;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float rand(vec2 co)
{
    highp float a = 12.9898;
    highp float b = 78.233;
    highp float c = 43758.5453;
    highp float dt= dot(co.xy ,vec2(a,b));
    highp float sn= mod(dt,3.14);
    return fract(sin(sn) * c) * 12.0;
}

void main()
{
	vec4 originalColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float red = 0.0;
	float green = 0.0;
	float blue = 0.0;
	float alpha = 1.0;
	float k = u_vParams.r;
	if (u_vParams.g > 60.0)
		k = rand(v_vTexcoord);
	if (originalColor.r == 0.0)
		gl_FragColor = originalColor;
	else {
		//k = rand();
		
		if (k <= 3.0)
			red = 30.0;
		else
			if (k <= 7.0)
				green = 30.0;
			else
				blue = 30.0;
		vec4 color = vec4(red, green, blue, alpha);
	
	    gl_FragColor = color;
	}
}
