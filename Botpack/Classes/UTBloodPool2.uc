class UTBloodPool2 expands UTBloodPool;

simulated function Timer()
{
	// Check for nearby players, if none then destroy self

	if ( !bAttached )
	{
		Destroy();
		return;
	}

	if ( !bStartedLife )
	{
		RemoteRole = ROLE_None;
		bStartedLife = true;
	}
}

defaultproperties
{
	Splats(0)=Texture'BloodSplat7'
	Splats(1)=Texture'BloodSplat5'
	Splats(2)=Texture'BloodSplat1'
	Splats(3)=Texture'BloodSplat3'
	DrawScale=0.680000
}
