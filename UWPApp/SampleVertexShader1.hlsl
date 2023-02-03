cbuffer ModelViewProjectionConstantBuffer : register(b0)
{
	matrix model;
	matrix view;
	matrix projection;
};

struct VertexShaderInput
{
	float3 pos : POSITION;
	float3 color : COLOR0;
};

struct PixelShaderInput
{
	float4 pos : SV_POSITION;
	float3 color : COLOR0;
};

PixelShaderInput main(VertexShaderInput input)
{
	PixelShaderInput output;
	//float4 pos = float4(input.pos, 1.0f);

	float3 inPos = input.pos;
	inPos.xyz *= float3(0.2, 0.2, 0.2);
	inPos.xyz -= float3(1.f, 0, 0);
	float4 pos = float4(inPos, 1.0f);

	pos = mul(pos, model);
	pos = mul(pos, view);
	pos = mul(pos, projection);

	output.pos = pos;
	float4 color = float4(1, 0.2, 0.2, 0.2);
	output.color = color;

	return output;
}
