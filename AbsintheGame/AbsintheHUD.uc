class AbsintheHUD extends MobileHUD;

var Font PlayerFont;
var int y;

function DrawHUD() {
    // ALWAYS call super! :D
    super.DrawHUD();
    
    y=sizeY-30;
    Canvas.SetDrawColorStruct(RedColor);
    Canvas.SetPos(10,y); //center at the bottom
    Canvas.DrawText(CustomPawn(PlayerOwner.Pawn).resource);
}
