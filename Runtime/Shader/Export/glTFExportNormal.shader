﻿Shader "Hidden/glTFExportNormal"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}
			
			sampler2D _MainTex;
			
			float4 frag (v2f i) : SV_Target
			{
				float4 col = tex2D(_MainTex, i.uv);
				// If a texture is marked as a normal map
				// the values are stored in the A and G channel.
				float3 unpacked = UnpackNormal(col);
				// unpacked.xyz = LinearToGammaSpace(unpacked.xyz);
				float4 result = float4(unpacked * 0.5f + 0.5f, 1);
				#ifdef UNITY_COLORSPACE_GAMMA
				#else
				// hack for linear color space, need to figure out
				// right way to sample textures.
				result.xyz = GammaToLinearSpace(result.xyz);
				#endif
				return result;
			}

			ENDCG
		}
	}
}
