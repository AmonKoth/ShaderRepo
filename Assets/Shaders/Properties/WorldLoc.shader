Shader "Custom/Properties/WorldLocShader"
{
	//Object gets it's color values from own location
	Properties{
		_myRange("Brightness Range", Range(0,5)) = 1
	
	}
		SubShader{
			CGPROGRAM
			#pragma surface surf Lambert

		half _myRange;

			  
		struct Input {

			float3 worldPos;
		};
		void surf(Input IN, inout SurfaceOutput o)
		{

			o.Albedo = (_myRange * IN.worldPos).rgb;

		}

		ENDCG
	}
			Fallback "Diffuse"
}