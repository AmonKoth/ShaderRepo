Shader "Custom/LambertModel"
{
    //Very Basic Light Model does not support the properties of most of the modern light models like specular lighting or glossness
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)


    }
    SubShader
    {
        Tags{
            "Queue"= "Geometry"
}
        
        CGPROGRAM
        #pragma surface surf LambertBasic

        half4 LightingLambertBasic(SurfaceOutput s,half3 lightDir,half atten) 
        {
            half NdotL = dot(s.Normal,lightDir);
            half4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * (NdotL * atten);
            c.a = s.Alpha;
            return c;

        
        }


        struct Input
        {
            float2 uv_MainTex;
        };
        fixed4 _Color;


        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;

        }
        ENDCG
    }
    FallBack "Diffuse"
}
