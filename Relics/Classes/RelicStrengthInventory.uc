class RelicStrengthInventory expands RelicInventory;

#exec MESH IMPORT MESH=RelicStrength ANIVFILE=MODELS\RelicStrength_a.3d DATAFILE=MODELS\RelicStrength_d.3d X=0 Y=0 Z=0 MLOD=0.5
#exec MESH ORIGIN MESH=RelicStrength X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=RelicStrength SEQ=All                      STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RelicStrength SEQ=base                     STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW   MESHMAP=RelicStrength MESH=RelicStrength
#exec MESHMAP SCALE MESHMAP=RelicStrength X=0.1 Y=0.1 Z=0.2
#exec TEXTURE IMPORT NAME=JRelicStrength_01 FILE=Textures\RelicStrength.PCX GROUP=Skins //Material #1
#exec MESHMAP SETTEXTURE MESHMAP=RelicStrength NUM=1 TEXTURE=JRelicStrength_01

#exec AUDIO IMPORT FILE="Sounds\StrengthUse.WAV" NAME="StrengthUse" GROUP="Relics"

var float FireTime;
var TournamentWeapon StrengthWeapon;

function bool HandlePickupQuery( inventory Item )
{
	if (Item.IsA('UDamage'))
		return true;
	else
		return Super.HandlePickupQuery( Item );
}

function PickupFunction(Pawn Other)
{
	local Inventory I;
	
	Super.PickupFunction(Other);

	// remove any damage amplifiers
	for ( I=Owner.Inventory; I!=None; I=I.Inventory )
		if ( I.IsA('UDamage') )
		{
			I.SetTimer(0.2, false);
			UDamage(I).FinalCount = 0;
		}
}

state Activated
{
	function BeginState()
	{
		Pawn(Owner).DamageScaling = 2.0;
		SetStrengthWeapon();
		Super.BeginState();
	}

	function EndState()
	{
		Pawn(Owner).DamageScaling = 1.0;
		if (  StrengthWeapon != None )
			StrengthWeapon.Affector = None;
		Super.EndState();
	}
}

function SetStrengthWeapon()
{
	// Make old weapon normal again.
	if ( StrengthWeapon != None )
		StrengthWeapon.Affector = None;

	StrengthWeapon = TournamentWeapon(Pawn(Owner).Weapon);

	if ( StrengthWeapon != None )
		StrengthWeapon.Affector = self;
}

function ChangedWeapon()
{
	if( Inventory != None )
		Inventory.ChangedWeapon();

	SetStrengthWeapon();
}

simulated function FireEffect()
{
	SetLocation(Owner.Location);
	SetBase(Owner);
	PlaySound(sound'StrengthUse', SLOT_Interact, 6);
	PlaySound(sound'StrengthUse', SLOT_Interact, 6);
	FlashShell(0.15);
}

defaultproperties
{
	ShellSkin=Texture'Relics.Skins.RelicPurple'
	PickupMessage="You picked up the Relic of Strength!"
	PickupViewMesh=Mesh'RelicStrength'
	PickupViewScale=0.700000
	Icon=Texture'Relics.Icons.RelicIconStrength'
	Physics=PHYS_Rotating
	Texture=Texture'Relics.Skins.JRelicStrength_01'
	Skin=Texture'Relics.Skins.JRelicStrength_01'
	CollisionHeight=40.000000
	LightHue=185
	LightSaturation=0
}
