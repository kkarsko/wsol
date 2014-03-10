class CustomHUD extends MobileHUD;

function DrawHUD() {
    // ALWAYS call super! :D
    super.DrawHUD();
    
    Canvas.SetPos(sizeX/2,sizeY-10); //center at the bottom
    Canvas.DrawText(CustomPawn(PlayerOwner.Pawn).resource);
    Canvas.SetPos((sizeX/2)+100,sizeY-10);
    Canvas.DrawText(CustomPawn(PlayerOwner.Pawn).rechargeProgress);
}
