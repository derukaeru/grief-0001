shader_type canvas_item;

uniform float sx;
uniform float sy;

void vertex() {
	UV.x += TIME * sx;
	UV.y += TIME * sy;
}
