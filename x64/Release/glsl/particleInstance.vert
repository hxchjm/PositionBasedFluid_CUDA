#version 330 core
layout (location = 0) in vec3 position;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec2 texcoord;
layout (location = 3) in vec3 color;
layout (location = 4) in vec4 particles;

out vec3 FragPos;
out vec2 Texcoord;
out vec3 Normal;
out vec3 Color;
out vec4 FragPosLightSpace;

uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 projectMatrix;
uniform mat4 lightSpaceMatrix;

void main(){
	Color = color;
	Normal = normal;
	Texcoord = texcoord;
	FragPos = vec3(modelMatrix * vec4(position,1.0f));
	FragPos += particles.xyz;
	FragPosLightSpace = lightSpaceMatrix * vec4(FragPos,1.0f);
	gl_Position = projectMatrix * viewMatrix * vec4(FragPos,1.0f);
}