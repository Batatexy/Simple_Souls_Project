var right = keyboard_check(ord("D")) or keyboard_check(vk_right)
var left = keyboard_check(ord("A")) or keyboard_check(vk_left)
var down = keyboard_check(ord("S")) or keyboard_check(vk_down)
var up = keyboard_check(ord("W")) or keyboard_check(vk_up)

if global.morte=0{
	
if mouse_check_button_pressed(mb_left) and global.weapon!=0 and global.atk=0 and atkfat=0 and global.playerhit=0{
	spd-=spdatk
	global.sides+=1
	global.atk=1
	
	global.atktimer=atkvar
	atkfatinc+=atkfatincnumber
	atkfattimer=atkfatinc
	atkfat=1
	}

if global.atk=1{
	global.atktimer-=1

	if global.atktimer<=0{
		spd+=spdatk
		global.atktimer=atkvar
		global.atk=0
	}
}

if mouse_check_button_pressed(mb_right) and global.weapon!=0 and global.atk=0 and atkfat=0 and global.playerhit=0{
	spd-=spdatk*1.2
	global.atk=2
	global.atktimer=atkvar
	
	atkfatinc+=atkfatincnumber
	atkfattimer=atkfatinc
	atkfat=1
	}











if global.atk=2{
	global.atktimer-=0.5

	if global.atktimer<=0{
		spd+=spdatk*1.2
		global.atktimer=atkvar
		global.atk=0
	}
}








if atkfat=1{
	atkfattimer-=1

	if atkfattimer<=0{
		atkfat=0
		atkfattimer=0
	}
}
atkfatinc-=atkfatdec
	if atkfatinc<1{
	atkfatinc=1
}

if (right) && (up) and !place_meeting(x+hb,y-hb , wall)
{
direction=45
speed=spd
}
else if (right) && (down) and !place_meeting(x+hb,y+hb , wall) 
{
direction=315
speed=spd
}
else if (left && up) and !place_meeting(x-hb,y-hb , wall)
{
direction=135
speed=spd
}
else if (left && down) and !place_meeting(x-hb,y+hb , wall)
{
direction=225
speed=spd
}
else if right and !place_meeting(x+hb,y , wall)
{
direction=0
speed=spd
}
else if up and !place_meeting(x,y-hb , wall)
{
direction=90
speed=spd
}
else if left and !place_meeting(x-hb,y , wall)
{
direction=180
speed=spd
}
else if down and !place_meeting(x,y+hb , wall)
{
direction=270
speed=spd
}
else{speed=0} 

if global.atk=0{

if keyboard_check_pressed(ord("1")) and global.weapon1=1{
	global.weapon=1
	global.dmg = 4
	spdatk=3.5
	atkvar=30
	weapon_obj.visible=true
}else

if keyboard_check_pressed(ord("2")) and global.weapon2=1{
	global.weapon=2
	global.dmg = 3
	spdatk=4
	atkvar=30
	weapon_obj.visible=true
}else

if keyboard_check_pressed(ord("3")) and global.weapon3=1{
	global.weapon=3
	global.dmg = 0
	spdatk=5
	atkvar=100
	weapon_obj.visible=true
}else

if keyboard_check_pressed(ord("4")) and global.weapon4=1{
	global.weapon=4
	global.dmg = 0
	spdatk=5
	atkvar=10
	weapon_obj.visible=true
}}





}



if global.playerhit=1{
	hittimer-=1
	sprite_index=Sprite20
	image_alpha=0.5
	if hittimer=27{global.vida-=global.dmgreceive}
	if hittimer<=0{
	hittimer=hitvar
	global.playerhit=0
	}
}else{
	sprite_index=Sprite3
	image_alpha=1}







if global.vida<=0{
	global.morte=1
	global.atk=0
	speed=0
	spd=0
	visible=false
	sprite_index=hollow
}

if keyboard_check(ord("R")){
	game_restart()
}