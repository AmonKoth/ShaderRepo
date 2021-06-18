Shader "Custom/Properties/StandartProperties"
{
	//Standart Stuff
	Properties{
		_myColor("Color",Color) = (1,1,1,1)
		_myRange("Brightness Range", Range(0,5)) = 1
		_myTex("Texture", 2D) = "white" {}


	}
		SubShader{
			CGPROGRAM
			#pragma surface surf Lambert

		fixed4 _myColor;
		half _myRange;
		sampler2D _myTex;

			  
		struct Input {
			float2 uv_myTex;

		};
		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = (_myRange * tex2D(_myTex,IN.uv_myTex) *_myColor).rgb;
		
		}

		ENDCG
	}
			Fallback "Diffuse"
}