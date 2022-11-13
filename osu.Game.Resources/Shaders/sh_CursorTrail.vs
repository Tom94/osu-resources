attribute vec2 m_Position;
attribute vec4 m_Colour;
attribute vec2 m_TexCoord;
attribute vec4 m_TexRect;
attribute float m_Time;

varying vec4 v_Colour;
varying vec2 v_TexCoord;
varying vec4 v_TexRect;
varying vec2 v_BlendRange;

uniform mat4 g_ProjMatrix;

uniform float g_FadeClock;
uniform float g_FadeExponent;

#include "sh_Masking.vs.h"

void main(void)
{
    v_Colour = vec4(m_Colour.rgb, m_Colour.a * pow(clamp(m_Time - g_FadeClock, 0.0, 1.0), g_FadeExponent));
     
    v_TexCoord = m_TexCoord;
    v_TexRect = m_TexRect;
    v_BlendRange = vec2(0.0);
    
    gl_Position = g_ProjMatrix * vec4(m_Position, 1.0, 1.0);

    initMasking(vec3(m_Position, 1.0));
}
