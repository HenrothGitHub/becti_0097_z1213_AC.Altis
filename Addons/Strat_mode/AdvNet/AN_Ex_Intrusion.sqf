#define Intru_step 300
AN_E_INTRU=false;
AN_E_Intrusion_Start={
	_vehicle=_this select 0;
	_caller=_this select 1;
	_progress = 0;
	["Intrusion (Do not move or exit Vehicle)",0,1,0] call HUD_PBar_start;
	AN_E_INTRU=true;
	while {!CTI_GameOver && alive _vehicle && alive _caller && (vehicle _caller) == _vehicle && speed _vehicle <1 && speed _vehicle > -1 && _progress <= 1} do {
		_progress = _progress + (1/Intru_step);
		_progress call HUD_PBar_update;
		sleep 1;
	};
	if (_progress >=1) then {
		{
			if (isPlayer _x) then { _x setVariable ["CTI_Net",(_vehicle getVariable "CTI_Net"),true];};
			//if (isPlayer _x) then { _x setVariable ["CTI_Net",1,true];};
			true
		} count (crew _vehicle);
		//_vehicle  setVariable ["CTI_Net",1,true];
	} else {
		0 spawn {
			hintSilent "Intrusion Failed";
			sleep 3;
			hintSilent "";
		};
	};
	AN_E_INTRU=false;
	0 call HUD_PBar_stop;
};



/*
AN_E_Intrusion_Actions={
	_vehicle=_this;
	if (isNil {_vehicle getVariable "CTI_Net"}) exitWith {false};
	if (isNil {_vehicle getVariable "AN_iNet"}) exitWith {false};
	if !(((_vehicle getVariable "CTI_Net") call CTI_CO_FNC_GetSideFromID) in [east,west]) exitWith {false};
	_vehicle addAction ["<t color='#006400'>Start Intrusion</t>", "", [], -200, false, true, "", "(_target getVariable ['CTI_Net',-10]) > 0 !(_target getVariable ['CTI_Net',-11] == CTI_P_SideID) && isPlayer _this && speed _target <1 && speed _target >-1 && (vehicle _this) == _target && alive _target && ((CTI_P_SideLogic getVariable 'cti_upgrades') select CTI_UPGRADE_EXPI) > 0 "];
	//_vehicle addAction ["<t color=/'#006400'>Start Intrusion</t>", AN_E_Intrusion_Start , [], -200, false, true, "", " isPlayer _this && speed _target <1 && speed _target >-1 && (vehicle _this) == _target && alive _target"];
};*/