class CustomGameInfo extends GameInfo;

auto State PendingMatch
{
    StartMatch();
}

defaultproperties
{
    HUDType=class'GameFramework.MobileHUD'
    PlayerControllerClass=class'CustomGame.CustomPlayerController'
    DefaultPawnClass=class'CustomGame.CustomPawn'
    bDelayedStart=false
}
