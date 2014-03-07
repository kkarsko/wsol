/**
 * Copyright 1998-2014 Epic Games, Inc. All Rights Reserved.
 */
class CustomPawn extends GamePawn
	config(Game);

/** the amount of Resource currently available */
var int resource;
/** the interval between Resource regeneration (seconds) */
var int rechargeInterval;
/** the amount of Resource gained every [rechargeInterval] seconds */
var int rechargeAmount;
/** the number of seconds passed since the last regeneration of resource */
var float rechargeProgress;
	
event Tick(float dTime) {
	rechargeProgress += dTime;
	if(rechargeProgress>=rechargeInterval) {
		resource += rechargeAmount;
		rechargeProgress = 0;
	}
}
	
defaultproperties {
	
}