//=============================================================================
// FemaleTwoBot.
//=============================================================================
class FemaleTwoBot extends FemaleBot;

function ForceMeshToExist()
{
	Spawn(class'FemaleTwo');
}

defaultproperties
{
	CarcassType=Class'FemaleTwoCarcass'
	Skin=Texture'UnrealShare.Skins.Sonya'
	Mesh=LodMesh'Female2'
}
