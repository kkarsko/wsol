class CustomGameInfo extends GameInfo;

/** what does this do? */
auto State PendingMatch
{
Begin: //sadly enough, it won't compile w/o the label
    StartMatch();
}

/** a hacky method for creating the necessary keybinds
 *  DO find a better solution! something with config files */
function StartMatch() {
    local PlayerController pc;
    local WorldInfo wi;
	//SetBind doesn't take literals, assign them to vars here
    local name q;
	local name e;
    q='Q';
    e='E';
    wi = class'WorldInfo'.static.GetWorldInfo();
    

    if (wi != None) {
      pc = wi.GetALocalPlayerController();
      if (pc != None && pc.PlayerInput != None) {
        //SET THE KEYBINDS HERE
        pc.PlayerInput.SetBind(q, "primarySkill");
        pc.PlayerInput.SetBind(e, "secondarySkill");
      }
    }
}

defaultproperties //never, ever, EVER do defprop in K&R style!
{
    HUDType=class'CustomGame.CustomHUD'
    PlayerControllerClass=class'CustomGame.CustomPlayerController'
    DefaultPawnClass=class'CustomGame.CustomPawn'
    bDelayedStart=false
}
