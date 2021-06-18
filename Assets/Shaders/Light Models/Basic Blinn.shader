Shader "Custom/LightModels/BlinLight"
{
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
        #pragma surface surf BlinnBasic

        half4 LightingBlinnBasic(SurfaceOutput s,half3 lightDir,half3 viewDir,half atten)
        {
            //to calculate halfway
            half3 h = normalize(lightDir + viewDir);

            //Diffuse value of the coloring 
            half diff = max(0, dot(s.Normal, lightDir));

            //dot product of normal and halfway
            float nh = max(0, dot(s.Normal, h));
            //for specular lighting 48 is what unity uses
            float spec = pow(nh, 48.0);

            half4 c;
            c.rgb = (s.Albedo * _LightColor0.rgb *diff + _LightColor0.rgb * spec ) * atten;
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
