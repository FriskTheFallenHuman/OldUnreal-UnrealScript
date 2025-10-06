//=============================================================================
// FemaleOneBot.
//=============================================================================
class FemaleOneBot extends FemaleBot;

function ForceMeshToExist()
{
	Spawn(class'FemaleOne');
}

defaultproperties
{
	CarcassType=Class'FemaleOneCarcass'
	Skin=Texture'UnrealShare.Skins.gina'
	Mesh=LodMesh'Female1'
}
