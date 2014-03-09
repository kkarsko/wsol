class CustomPawn extends GamePawn;

/** the amount of Resource currently available */
var() int resource;
/** the amount of maximum Resource */
var int maxResource;
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
		if (resource>maxResource) resource=maxResource;
        rechargeProgress = 0;
    }
}

exec function SpendResource(int amount) {
	resource-=amount+10;
}

defaultproperties
{
    resource=100
    rechargeInterval=3
    rechargeAmount=1
	maxResource=100
}
