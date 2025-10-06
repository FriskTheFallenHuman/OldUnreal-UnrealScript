class UTBloodPool expands Scorch;

#exec TEXTURE IMPORT NAME=BloodPool6 FILE=TEXTURES\DECALS\BSplat1-S.PCX LODSET=2
#exec TEXTURE IMPORT NAME=BloodPool7 FILE=TEXTURES\DECALS\BSplat5-S.PCX LODSET=2
#exec TEXTURE IMPORT NAME=BloodPool8 FILE=TEXTURES\DECALS\BSplat2-S.PCX LODSET=2
#exec TEXTURE IMPORT NAME=BloodPool9 FILE=TEXTURES\DECALS\Spatter2.PCX LODSET=2

var texture Splats[5];

simulated function BeginPlay()
{
	if ( class'GameInfo'.Default.bLowGore )
	{
		destroy();
		return;
	}
	
	if ( Level.bDropDetail )
		Texture = splats[2 + Rand(3)];
	else
		Texture = splats[Rand(5)];;
}

defaultproperties
{
	Splats(0)=Texture'BloodPool6'
	Splats(1)=Texture'BloodPool8'
	Splats(2)=Texture'BloodPool9'
	Splats(3)=Texture'BloodPool7'
	Splats(4)=Texture'BloodSplat4'
	Texture=Texture'BloodSplat1'
	DrawScale=0.750000
}
