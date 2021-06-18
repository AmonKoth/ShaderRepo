Shader "Custom/Utility/RimLight"
{
    Properties
    {
        _RimLight("Color" , Color) = (0,0.5,0.5)
        _RimPower("Rim Power",Range(0.5,8.0)) =3.0

    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert



        struct Input
        {
            float3 viewDir;
        };

        fixed4 _RimLight;
        float _RimPower;
        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim =1- saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = _RimLight.rgb * pow(rim, _RimPower);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
