// NOTE: Shader automatically converted from Godot Engine 4.6.stable's StandardMaterial3D.

shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_burley, specular_schlick_ggx, unshaded;

uniform vec4 albedo : source_color;
uniform sampler2D texture_albedo : source_color, filter_nearest, repeat_enable;

uniform float pallet_swap_precision : hint_range(0.0, 1.0, 0.01) = 0.1;

uniform vec4 color_1 : source_color;
uniform vec4 color_2 : source_color;
uniform vec4 color_3 : source_color;
uniform vec4 color_4 : source_color;
uniform vec4 color_5 : source_color;
uniform vec4 color_6 : source_color;

vec3 swap_color(vec3 color){
	
	vec4 original_colors[6];
	vec4 replace_colors[6] = vec4[6] (color_1,color_2,color_3,color_4,color_5,color_6);
	for (int i = 0; i < 6; i ++) {
		float clarity = (1.0 / 6.0) * float(i);
		
		original_colors[i] = vec4(clarity,clarity,clarity,1.0);
		
		if (distance(color, original_colors[i].xyz) <= pallet_swap_precision){
			return replace_colors[i].xyz;
		}
	}
}

void fragment() {

	vec4 albedo_tex = texture(texture_albedo, UV);
	ALBEDO = swap_color(albedo.rgb * albedo_tex.rgb);
	
	
	
}
