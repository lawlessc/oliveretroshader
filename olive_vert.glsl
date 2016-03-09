

precision lowp float;
uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;
uniform mat4 textureMatrix;
attribute vec4 position;
attribute vec2 texture0;
varying  lowp vec2 v_texCoord;
void main() {
v_texCoord  = (textureMatrix * vec4(texture0, 0, 1)).xy;
	gl_Position = modelViewProjectionMatrix * position;
}