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
    local PlayerController PlayerController;
    local WorldInfo WorldInfo;
    local name q;
    q='Q';
    WorldInfo = class'WorldInfo'.static.GetWorldInfo();
    

    if (WorldInfo != None) {
      PlayerController = WorldInfo.GetALocalPlayerController();
      if (PlayerController != None && PlayerController.PlayerInput != None) {
        //SET THE KEYBINDS HERE
        PlayerController.PlayerInput.SetBind(q, "SpendResource 0");
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
