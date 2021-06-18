Shader "Custom/Properties/Cubemap"
{

	//Reflect a Cubemap Image for example Skybox According to the Camera's Position
	Properties{

		_myCube("Cube", CUBE) = ""{}
	}
		SubShader{
			CGPROGRAM
			#pragma surface surf Lambert


		samplerCUBE _myCube;
			  
		struct Input {

			float3 viewDir;
		};
		void surf(Input IN, inout SurfaceOutput o)
		{

			o.Emission = texCUBE(_myCube, IN.viewDir).rgb;
		}

		ENDCG
	}
			Fallback "Diffuse"
}