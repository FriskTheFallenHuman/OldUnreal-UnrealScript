//=============================================================================
// RocketTrail.
//=============================================================================
class RocketTrail extends Effects;

#exec TEXTURE IMPORT NAME=JRFlare FILE=MODELS\flare9.PCX

defaultproperties
{
	bTrailerSameRotation=True
	Physics=PHYS_Trailer
	RemoteRole=ROLE_None
	DrawType=DT_Sprite
	Style=STY_Translucent
	Sprite=Texture'JRFlare'
	Texture=Texture'JRFlare'
	Skin=Texture'JRFlare'
	DrawScale=0.500000
	bUnlit=True
	Mass=8.000000
}
