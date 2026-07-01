precision highp float;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;

uniform sampler2D samp_shadowmap_near;
varying vec3 v_ShadowCoordNear;

uniform sampler2D samp_shadowmap_far;
varying vec3 v_ShadowCoordFar;

void main()
{
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	vec3 L1 = normalize(vec3(1));
	vec3 C1 = vec3(1);
	vec3 L2 = normalize(vec3(-1, -1, 0));
	vec3 C2 = vec3(0.4);
	vec3 ambient = vec3(0.1);
	
	float shadow_bias = 0.001;
	
	float NdotL = dot(normalize(v_vNormal), L1);
	vec3 light = ambient + NdotL * C1;
	
	if (v_ShadowCoordNear.x >= 0.0 && v_ShadowCoordNear.x <= 1.0 && v_ShadowCoordNear.y >= 0.0 && v_ShadowCoordNear.y <= 1.0) {
        float shadowmap_value = texture2D(samp_shadowmap_near, v_ShadowCoordNear.xy).r;
	    if (v_ShadowCoordNear.z > shadowmap_value + shadow_bias) {
	        light = ambient;
	    }
	}
	else if (v_ShadowCoordFar.x >= 0.0 && v_ShadowCoordFar.x <= 1.0 && v_ShadowCoordFar.y >= 0.0 && v_ShadowCoordFar.y <= 1.0) {
        float shadowmap_value = texture2D(samp_shadowmap_far, v_ShadowCoordFar.xy).r;
	    if (v_ShadowCoordFar.z > shadowmap_value + shadow_bias) {
	        light = ambient;
	    }
	}
	
	NdotL = dot(normalize(v_vNormal), L2);
	light += NdotL * C2;
	
	gl_FragColor.rgb *= clamp(light, vec3(0), vec3(1));
}
