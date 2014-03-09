class CustomGameInfo extends GameInfo;

auto State PendingMatch
{
Begin: //sadly enough, it won't compile w/o the label
    StartMatch();
}

function StartMatch() {
	local PlayerController PlayerController;
	local WorldInfo WorldInfo;
	local name q;
	q='Q';
	WorldInfo = class'WorldInfo'.static.GetWorldInfo();
	

	if (WorldInfo != None) {
	  PlayerController = WorldInfo.GetALocalPlayerController();
	  if (PlayerController != None && PlayerController.PlayerInput != None) {
		//SET THE KEYBINDS HERE, and also find out about the config fuckup
		PlayerController.PlayerInput.SetBind(q, "SpendResource 0");
	  }
	}
}

defaultproperties
{
    HUDType=class'CustomGame.CustomHUD'
    PlayerControllerClass=class'CustomGame.CustomPlayerController'
    DefaultPawnClass=class'CustomGame.CustomPawn'
    bDelayedStart=false
}
