/// @description initializing variable's

#region enums

enum states {
	normal,
	roll,
	air,
}

enum animations {
	idle,
	walk,
	run,
	roll,
	lookup,
	duck,
	peelout,
	spindash,
}

#endregion

#region player vars

state = states.air;
ground = true;

hsp = 0;
vsp = 0;

gsp = 0;

wRad = 7;
hRad = 16;
pRad = 8;

acc = 0.046875;
dcc = 0.5;
frc = acc;
top = 6;

airAcc = 0.09375;
jmp = 6.5;
grv = 0.21875;

angle = 0;
mode = 0;

#endregion

image_speed = 0;