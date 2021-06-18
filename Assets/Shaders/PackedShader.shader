Shader "Custom/PackedShader"{

	Properties{
		_myColor("Example Color",Color) = (1,1,1,1)
	}
		SubShader{

		CGPROGRAM
		#pragma surface surf Lambert

		struct Input {
		float uvMainTex;
};

	fixed4 _myColor;

	void surf(Input In, inout SurfaceOutput o) {
	o.Albedo = _myColor.rgb;
	o.Alpha = _myColor.a;

	}
	ENDCG


	}
}