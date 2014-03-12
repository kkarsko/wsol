class CustomPawn extends GamePawn;

/** the amount of Resource currently available */
var() int resource;
/** the amount of maximum Resource */
var() int maxResource;
/** the interval between Resource regeneration (seconds) */
var() int rechargeInterval;
/** the amount of Resource gained every [rechargeInterval] seconds */
var() int rechargeAmount;
/** the number of seconds passed since the last regeneration of resource */
var float rechargeProgress;

/** in Tick() regens are handled */
event Tick(float dTime) {
    rechargeProgress += dTime;
    if(rechargeProgress>=rechargeInterval) {
        resource += rechargeAmount;
        if (resource>maxResource) resource=maxResource;
        rechargeProgress = 0;
    }
}

/** should be overriden by subs
 *  look into inheritance! */
exec function primarySkill() { if (loseResource(10)); }
/** should be overriden by subs
 *  look into inheritance! */
exec function secondarySkill() { if (loseResource(20)); }

/** call this whenever [resource] should be decreased
 *  do not manipulate [resource] directly */
function bool loseResource(int amount) {
    local bool neg;
    resource -= amount;
    if(neg = (resource<0)) resource = 0;
    return neg;
}

/** call this whenever [resource] should be decreased
 *  do not manipulate [resource] directly */
function bool gainResource(int amount) {
    local bool neg;
    resource += amount;
    if(neg = (resource<0)) resource = 0;
    return neg;
}

defaultproperties //never, ever, EVER do defprop in K&R style!
{
    resource=100
    rechargeInterval=3
    rechargeAmount=1
    maxResource=100
}
