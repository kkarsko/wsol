class CustomHUD extends MobileHUD;

function DrawHUD() {

	super.DrawHUD();
	
	Canvas.SetPos(100,100);
	Canvas.DrawText(CustomPawn(PlayerOwner.Pawn).resource);
	Canvas.SetPos(200,100);
	Canvas.DrawText(CustomPawn(PlayerOwner.Pawn).rechargeProgress);
}
