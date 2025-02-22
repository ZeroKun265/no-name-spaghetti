shader_type canvas_item;

// Parameters that can be modified in the script
uniform float param_frequency : hint_range(0.1, 5.0);
uniform float param_amplitude : hint_range(-1.0, 1.0);
uniform vec4 line_color = vec4(0.207, 0.432, 0.105, 1.0);
uniform vec4 rect_color = vec4(0, 0, 0, 1.0);
// Function to define the mathematical formula
float math_function(float x) {
    return sin(param_frequency * x); // y = a*x² + b
}

void fragment() {
    vec2 uv = UV; // UV coordinates from 0 to 1
	vec2 center = vec2(0.5, 0.5);
    float line_thickness = 0.010; // Thickness of the line

    // ---- Draw Rectangle (lower layer) ----
    vec2 half_size = vec2(0.3, 0.2);
    // Check if we're near the border of the rectangle
    bool inside_rect_x = abs(uv.x - center.x) <= half_size.x + line_thickness / 2.0;
    bool inside_rect_y = abs(uv.y - center.y) <= half_size.y + line_thickness / 2.0;
    
    bool on_border_x = abs(uv.x - center.x) >= half_size.x - line_thickness / 2.0 && inside_rect_x;
    bool on_border_y = abs(uv.y - center.y) >= half_size.y - line_thickness / 2.0 && inside_rect_y;
    
    if (inside_rect_x && inside_rect_y && (on_border_x || on_border_y)) {
		COLOR = rect_color;
	} 

	
    float x = (uv.x - 0.5) * 10.0; // Scale x from -5 to 5
    float y = math_function(x); // Calculate y based on x

    float plot_y = 0.5 - y * 0.1; // Scale y to fit the sprite

    // Draw the line by checking if the current pixel is near the calculated y
    float distance_to_line = abs(uv.y - plot_y);
    if (distance_to_line < line_thickness) {
        COLOR = line_color; // Draw the line
    }
}
