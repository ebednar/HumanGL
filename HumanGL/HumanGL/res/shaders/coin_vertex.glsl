#version 410 core

layout(location = 0) in vec3 position;
layout(location = 1) in vec2 texCoord;
layout(location = 2) in vec3 normCoord;

out vec3 vColor;
out vec3 vNormal;
out vec3 vFragPos;

uniform mat4 u_M;
uniform mat4 u_V;
uniform mat4 u_P;

void main()
{
    vFragPos = vec3(u_M * vec4(position, 1.0f));
    vNormal = mat3(transpose(inverse(u_M))) * normCoord;
    vColor = vec3(1.0f, 0.84f, 0.0f);
    gl_Position = u_P * u_V * u_M * vec4(position, 1.0f);
}