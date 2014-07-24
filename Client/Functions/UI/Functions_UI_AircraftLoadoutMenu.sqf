CTI_AL_NOWEAPON_TEXT="**NONE**";
CTI_AL_ALL_MAGAZINE_COMBOBOX_DETAILS = [ 39040 , 39041 , 39042 , 39043 , 39044 , 39045 , 39046 ];
CTI_AL_ALL_WEAPON_COMBOBOX_DETAILS = [ 39030 , 39031 , 39032 , 39033 , 39034 , 39035 , 39036 ];
CTI_AL_ALL_WEAPON_CHECKBOX_DETAILS = [ 39050 , 39051 , 39052 , 39053 , 39054 , 39055 , 39056 ];
CTI_ALM_VEHICLE_SELECT_LIST_IDC = 39010;
CTI_ALM_LOADOUT_SELECT_LIST_IDC = 39021;

CTI_ALM_WEAPON_COMBOBOX_START_IDC = 39030;
CTI_ALM_MAGAZINE_COMBOBOX_START_IDC = 39040;
CTI_ALM_WEAPON_CHECKBOX_START_IDC = 39050;
CTI_ALM_COST_TEXT_START_IDC = 39060;

CTI_UI_DO_STUFF_TEMPLATE = {

};

/*
 * Function: Set a list of dialog list boxes to a particular index
 * Input: [ [ _control_1 , _control_2 , ... ] , _index ]
 * Return: <NONE>
*/
CTI_ALM_SET_DEFAULT_CURSOR_TO =
{
	{
		((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( _x )) lbSetCurSel ( _this select 1 );
	} forEach ( _this select 0 );
};

CTI_ALM_MAGAZINE_LIST_SET_CURSOR =
{
	{
		((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( _x )) lbSetCurSel 0;
	} forEach ( CTI_AL_ALL_MAGAZINE_COMBOBOX_DETAILS );
};

CTI_ALM_WEAPON_LIST_SET_CURSOR =
{
	{
		((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( _x )) lbSetCurSel 0;
	} forEach ( CTI_AL_ALL_WEAPON_COMBOBOX_DETAILS );
};

CTI_ALM_UPDATE_CURRENT_LOADOUT =
{
	_vehicle = _this;
	
	_typeOfValue = typeOf _vehicle;
	
	// Extract current vehicle loadout configuration details
	_loadout_details = _vehicle getVariable "cti_custom_aircraft_loadout_v2";
	
	// Extract selected loadout
	_loadout_index_chosen = _loadout_details select 0;
	
	
	
	// Clear the display
	
	// Lookup weapon details for this vehicle
	_loadout_options = missionNamespace getVariable ( format [ "CTI_LOADOUT_%1_MNT_OPTIONS" , _typeOfValue ] );
	
	player sidechat format [ "TYPEOF %1" , _typeOfValue ];
	
	_text_to_display = "<t size='1' color='#0066ff'>CURRENT</t><br />";
	
	_loadout_name = _loadout_options select ( _loadout_index_chosen - 1 );
	_text_to_display = format [ "%1<t size='0.9' color='#3399ff'> Loadout: %2</t><br />" , _text_to_display , _loadout_name ];
	
	// Get specific loadout
	_loadout_specifics = _loadout_options select _loadout_index_chosen;
	
	// Loop through each mount point of the vehicle
	for [ {_mount_index = 1},{ _mount_index < ( count ( _loadout_details ) )},{ _mount_index = _mount_index + 1}] do 
	{
		// Plane chosen details
		_mount_details =_loadout_details select _mount_index;
		
		// Loadout mount specific options
		_mount_options = _loadout_specifics select ( _mount_index - 1 );
		
		// _element = [ 0 , 0 , false ];
		
		// Extract chosen weapon details for the mount
		_weapon_classname = _mount_options select ( _mount_details select 0 ); 
		// player globalchat format [ "%1" , ( _mount_details select 0 )  ];
		// player globalchat format [ "classname %1" , _weapon_classname  ];
		_magazine_chosen = ( ( ( _mount_options select ( ( _mount_details select 0 ) + 1 ) ) ) select ( _mount_details select 1 ) ); 
		_magazine_classname = _magazine_chosen select 0;
		_magazine_cost = _magazine_chosen select 1;
		
		_magazine_displayname = _magazine_classname call CTI_GET_MAGAZINE_DISPLAY_NAME;
		_weapon_displayname = _weapon_classname call CTI_GET_WEAPON_DISPLAY_NAME;
		
		_is_mounted = _mount_details select 2;
		
		player sidechat format [ "MNT %1 => %2 => %3 => %4" , _mount_index , _weapon_displayname , _magazine_displayname , _is_mounted ];
		
		_text_to_display = format [ "%1<t size='0.85' color='#6699ff'>" , _text_to_display ];
		if ( _is_mounted ) then
		{
			_text_to_display = format [ "%1Mount #%2: %3 | %4 <br />" , _text_to_display , _mount_index , _weapon_displayname , _magazine_displayname ];
			
			// Add the weapon so that the player can see it empty and has desire to "rearm"
			_vehicle addWeaponGlobal _weapon_classname;
		}
		else
		{
			_text_to_display = format [ "%1Mount #%2: ** EMPTY ** <br />" , _text_to_display ,_mount_index ];
		};
		_text_to_display = format [ "%1</t>" , _text_to_display ];
		
		

	};
	
	_text_to_display = format [ "%1<br /><br />" , _text_to_display ];
	
	// Get value of current loadout
	_current_value = _vehicle getVariable "cti_custom_aircraft_loadout_v2_cost";
	
	// Get value of selected loadout
	_selected_cost_total = call CTI_ALM_CALCULATE_CHOSEN_LOADOUT_COST;
	
	_text_to_display = format [ "%1<t size='1' color='#00FF33'>Selected $: %2</t><br />" , _text_to_display , _selected_cost_total ];
	_text_to_display = format [ "%1<t size='1' color='#CCFFFF'>Current  $: %2</t><br />" , _text_to_display , _current_value ];
	_text_to_display = format [ "%1<t size='1' color='#CCFFFF'>------------------------------</t><br />" , _text_to_display , _current_value ];
	_text_to_display = format [ "%1<t size='1' color='#FFFFFF'>Total    $: %2</t><br />" , _text_to_display , ( _current_value - _selected_cost_total ) ];
	
	
	((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl 39303 ) ctrlSetStructuredText parseText ( _text_to_display );
	

};


CTI_ALM_SET_ALL_WEAPONS_TO_FIRST_CHOICE =
{
	{
		if ( ( lbSize _x ) > 0 ) then
		{
			lbSetCurSel [_x, 0];
		};
	} forEach ( CTI_AL_ALL_WEAPON_COMBOBOX_DETAILS );
};

CTI_ALM_SET_LOADOUT_TO_FIRST_CHOICE =
{
	lbSetCurSel [ CTI_ALM_LOADOUT_SELECT_LIST_IDC , 0];
};


CTI_ALM_SET_ALL_MAGAZINES_TO_FIRST_CHOICE =
{
	{
		if ( ( lbSize _x ) > 0 ) then
		{
			lbSetCurSel [_x, 0];
		};
	} forEach ( CTI_AL_ALL_MAGAZINE_COMBOBOX_DETAILS );
};

CTI_ALM_UNSET_ALL_MOUNT_BUTTONS =
{
	{
		if ( ( ctrlText _control ) != "N/A" ) then
		{
			_control = ((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( _x ));
			_control ctrlSetTextColor [ 1, 0.1 , 0.1, 1];
			_control ctrlSetText "NO";
		};
	} forEach ( CTI_AL_ALL_WEAPON_CHECKBOX_DETAILS );
};

CTI_ALM_CHECKBOX_INDEX_N_SET =
{
	_n = _this;
	_control = ((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39050 + _n ));
	_return = false;
	if ( ( ( ctrlText _control  ) == "YES" ) && ( ctrlShown _control ) ) then
	{
		_return = true;
	};
	_return
};

CTI_ALM_LOCK_TRANSACTION =
{
	_value = uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu_transaction_lock";
	_value
};

CTI_ALM_UNLOCK_TRANSACTION =
{
	uiNamespace setVariable [ "cti_dialog_ui_aircraftloadoutmenu_transaction_lock" , 0 ];
};

CTI_ALM_UPDATE_VEHICLE_SELECT_LIST =
{
	// Get the locations of the ammo replenishing vehicles and structures
	_structures = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideStructures;
	_repair_depots = [CTI_REPAIR, _structures, player] call CTI_CO_FNC_GetSideStructuresByType;
	_ammo_depots = [CTI_AMMO, _structures, player] call CTI_CO_FNC_GetSideStructuresByType;
	
	// Get the vehicles from this players team
	_list = [group player, false] Call CTI_CO_FNC_GetTeamVehicles;
	{if ( (vehicle _x == _x ) && ( local ( vehicle _x ) )) then {[_list, _x] call CTI_CO_FNC_ArrayPush}} forEach units player;
	
	// Only ammo depots permit weapon customisation
	_available_ammo_depots = [vehicle player, _ammo_depots, CTI_SERVICE_AMMO_DEPOT_RANGE] call CTI_UI_Service_GetBaseDepots;
	
	// Check distance against the depot and get those vehicles near the depot
	{
		_range = _x select 1;
		{
			{
				if !(_x in _list) then {[_list, _x] call CTI_CO_FNC_ArrayPush};
			} forEach (_x nearEntities [["Car", "Ship", "Motorcycle", "Tank", "Air", "StaticWeapon"], _range]);
		} forEach (_x select 0);
	} forEach [[_available_ammo_depots, CTI_SERVICE_AMMO_DEPOT_RANGE]];

	_list_real = [];
	
	{ // Loop through each vehicle in range of a ammo/repair building/vehicle
		
		
		_load_content = false;
		if (_x isKindOf "Air") then 
		{
			_vehicle = vehicle _x;
			_available_ammo_depots = [_vehicle, _ammo_depots, CTI_SERVICE_AMMO_DEPOT_RANGE] call CTI_UI_Service_GetBaseDepots;
			if (count _available_ammo_depots > 0 ) then { _load_content = true };
		};
		
		if (_load_content) then 
		{ //--- Load in the list
			[_list_real, _x] call CTI_CO_FNC_ArrayPush;
			
			// Applies only to aircraft
			if (_x isKindOf "Air") then 
			{
				_vehicle = vehicle _x;
				_var_name = if (isNil {_vehicle getVariable "cti_customid"}) then {typeOf _vehicle} else {missionNamespace getVariable format["CTI_CUSTOM_ENTITY_%1", _vehicle getVariable "cti_customid"]};
				_var_classname = missionNamespace getVariable _var_name;
				_label = if !(isNil '_var_classname') then {_var_classname select CTI_UNIT_LABEL} else {getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName")};
				_crew = crew _vehicle;
				_digits = "";
				if (count _crew > 0 && group _vehicle == group player) then 
				{
					_digit_parsed = [];
					{if (group _x == group player) then {[_digit_parsed, _x call CTI_CL_FNC_GetAIDigit] call CTI_CO_FNC_ArrayPush}} forEach _crew;
					{
						if (_forEachIndex >= 3) exitWith {_digits = _digits + "..."};
						_digits = _digits + (_x);
						if (_forEachIndex < (count _digit_parsed)-1 && _forEachIndex < 2) then {_digits = _digits + ","};
					} forEach _digit_parsed;
					if (_digits != "") then {_digits = format["[%1] ",_digits]};
				};
				((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl 39010 ) lnbAddRow [_digits+_label];
			};
		};
	} forEach _list;
	
	// Save list of vehicles
	uiNamespace setVariable ["cti_dialog_ui_aircraftloadoutmenu_vehicle_list", _list_real];
};

CTI_ALM_CLEAR_ALL_PREVIOUS_CHOICES =
{
	// Clear selected vehicle
	uiNamespace setVariable ["cti_dialog_ui_aircraftloadoutmenu_vehicle_list", nil];
	uiNamespace setVariable ["cti_dialog_ui_aircraftloadoutmenu_selected_weapon_options", nil];
	uiNamespace setVariable ["CTI_ALM_UI_CURRENT_VEHICLE_LOADOUT_OPTIONS", nil];
};

CTI_ALM_HIDE_ALL_MOUNTPOINTS =
{
	for "_index" from 0 to ((count (CTI_AL_ALL_MAGAZINE_COMBOBOX_DETAILS))-1) do
	{
		// Hide weapon combo boxes
		((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39030 + _index ) ) ctrlShow false;
		// Hide weapon combo frames
		((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39080 + _index ) ) ctrlShow false;
		// Hide magazine combo boxes
		((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39040 + _index ) ) ctrlShow false;
		// Hide magazine frames
		((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39090 + _index ) ) ctrlShow false;
		// Hide weapon check boxes
		((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39050 + _index ) ) ctrlShow false;
		// Hide weapon costs
		((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39060 + _index ) ) ctrlShow false;
	};
};

CTI_ALM_SHOW_MOUNTPOINT_N =
{
	_n = _this;
	((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39030 + _n ) ) ctrlShow true;
	// Hide weapon combo frames
	((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39080 + _n ) ) ctrlShow true;
	// Hide magazine combo boxes
	((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39040 + _n ) ) ctrlShow true;
	// Hide magazine frames
	((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39090 + _n ) ) ctrlShow true;
	// Hide weapon check boxes
	((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39050 + _n ) ) ctrlShow true;
	// Hide weapon costs
	((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39060 + _n ) ) ctrlShow true;
};

CTI_ALM_GET_VEHICLE_LOADOUT_OPTIONS =
{
	missionNamespace getVariable ( format [ "CTI_LOADOUT_%1_MNT_OPTIONS" , ( typeOf _this ) ] );
};



CTI_ALM_UPDATE_LOADOUT_OPTIONS =
{
	_selected = _this;
	
	// Grab vehicle type
	_typeOfValue = typeOf _selected;
	
	// Grab the weapon configurations available for the vehicle
	_gun_configs = missionNamespace getVariable ( format [ "CTI_LOADOUT_%1_MNT_OPTIONS" , _typeOfValue ] );
	
	// Clear loadout menu
	lbClear ((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl 39021 );
	
	_loudout_values = [];
	for [ {_index_loadout = 0},{ _index_loadout < ( count ( _gun_configs ))},{ _index_loadout = _index_loadout + 2}] do 
	{
		_loadout_name = _gun_configs select _index_loadout;
		
		((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl 39021 ) lbAdd _loadout_name;
		
		// Build up a list of all the configurations
		[ _loudout_values, (_gun_configs select ( _index_loadout + 1 ))] call CTI_CO_FNC_ArrayPush;
		
	};
	
	// Store weapon configuration for later reference
	uiNamespace setVariable ["cti_alm_to_be_replaced" , _loudout_values ];
	
	
	//_selected getVariable "cti_custom_aircraft_loadout_v2";
	player globalChat format [ "NEW COUNT: %1", (count (_selected getVariable "cti_custom_aircraft_loadout_v2")) ];
	
};


CTI_ALM_UPDATE_WEAPON_OPTIONS =
{
	_changeto = ( call CTI_GET_SELECTED_LOADOUT_INDEX );
	_selected_weapon_config = (uiNamespace getVariable "cti_alm_to_be_replaced") select _changeto;
	_selected_weapon_values = [];
	for [ {_index_mount = 0},{ _index_mount < ( count ( _selected_weapon_config ))},{ _index_mount = _index_mount + 1}] do 
	{
		_index_mount call CTI_ALM_SHOW_MOUNTPOINT_N;
		lbClear ((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39030 + ( _index_mount ) ) );
		_weapon_options = _selected_weapon_config select _index_mount;
		_weapons_in_mount = [];
		for [ {_index_weapon = 0},{ _index_weapon < ( count ( _weapon_options ))},{ _index_weapon = _index_weapon + 2}] do 
		{
			_weapon_classname = _weapon_options select _index_weapon;
			_weapon_magazines = _weapon_options select ( _index_weapon + 1 );
			[ _weapons_in_mount, _weapon_magazines ] call CTI_CO_FNC_ArrayPush;
			//player globalchat format [ "%1" , _weapon_classname ];
			_weapon_name = getText ( configFile >> "CfgWeapons" >> _weapon_classname >> "displayName" );
			((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39030 + _index_mount )) lbAdd _weapon_name;
		};
		
		[ _selected_weapon_values, _weapons_in_mount ] call CTI_CO_FNC_ArrayPush;
		
		//Add special NONE option last
		//((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39030 + _index_mount )) lbAdd "**NONE**";
		//((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39030 + _index_mount )) lbSetCurSel 0;
		
	};
	
	uiNamespace setVariable ["cti_dialog_ui_aircraftloadoutmenu_selected_weapon_options" , _selected_weapon_values ];
	//[ CTI_AL_ALL_WEAPON_COMBOBOX_DETAILS , 0 ] call CTI_ALM_SET_DEFAULT_CURSOR_TO;

};

CTI_GET_SELECTED_VEHICLE = 
{
	_selected_index = lnbCurSelRow CTI_ALM_VEHICLE_SELECT_LIST_IDC;
	_selected = (uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu_vehicle_list") select _selected_index;
	_selected
};

CTI_GET_SELECTED_LOADOUT_INDEX = 
{
	_selected_index = lbCurSel CTI_ALM_LOADOUT_SELECT_LIST_IDC;
	_selected_index
};

CTI_GET_SELECTED_WEAPON_ROW_N = 
{
	_n = _this;
	_selected_index = lbCurSel ( CTI_ALM_WEAPON_COMBOBOX_START_IDC + _n );
	_selected_index
};


/*
  Name: CTI_GET_SELECTED_MAGAZINE_ROW_N
  
  Purpose: Returns the name of the magazine at mount row n
  
  Arguments: #
    0	[Integer]: Index of row
  
  Returned: #
    0	[String]: Classname of magazine
*/
CTI_GET_SELECTED_MAGAZINE_ROW_N = 
{
	_n = _this;
	_selected_index = lbCurSel ( CTI_ALM_MAGAZINE_COMBOBOX_START_IDC + _n );
	_selected_index
};

/*
  Name: CTI_GET_SELECTED_MAGAZINE_NAME_ROW_N
  
  Purpose: Returns the name of the magazine at mount row n
  
  Arguments: #
    0	[Integer]: Index of row
  
  Returned: #
    0	[String]: Classname of magazine
*/
CTI_GET_SELECTED_MAGAZINE_NAME_ROW_N = 
{
	_n = _this;
	
	// Get current selected vehicle
	_selected_vehicle = call CTI_GET_SELECTED_VEHICLE;
	
	// Get loadout options
	_vehicle_loadout_options = _selected_vehicle call CTI_ALM_GET_VEHICLE_LOADOUT_OPTIONS;
	
	// Get the selected row from the loadout combobox
	_loadout_selected_row = ( call CTI_GET_SELECTED_LOADOUT_INDEX );
	
	// Get the selected row from weapon combobox
	_weapon_selected_row = ( _mount_row call CTI_GET_SELECTED_WEAPON_ROW_N );
	
	// Get the selected row from magazine combobox
	_magazine_selected_row = ( _mount_row call CTI_GET_SELECTED_MAGAZINE_ROW_N );
	
	_chosen_loadout = _vehicle_loadout_options select ( ( _loadout_selected_row * 2 ) + 1 );
	
	_chosen_mount = _chosen_loadout select _n;
	
	_chosen_weapon_magazine_options = _chosen_mount select ( ( _weapon_selected_row * 2 ) + 1 ) ;
	
	_chosen_magazine_options = _chosen_weapon_magazine_options select _magazine_selected_row;
	
	_chosen_magazine_classname = _chosen_magazine_options select 0;
	
	_chosen_magazine_classname
};


/*
  Name: CTI_ALM_LOCK_IF_NOT_RESEARCHED
  
  Purpose: Prevents a particular mount being selectable if not researched
  
  Arguments: #
    0	[Integer]: Index of row
  
  Returned: #
    [NONE]
*/
CTI_ALM_LOCK_IF_NOT_RESEARCHED =
{
	_mount_row = _this;
	
	_mount_magazine_classname = _mount_row call CTI_GET_SELECTED_MAGAZINE_NAME_ROW_N;
	
	//Mount 
	
	_upgrades = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideUpgrades;
	
	_disable = 0;
	// Check if AA
	if ( ( _mount_magazine_classname in CTI_ALM_AA_RESEARCHED_MAGAZINES ) && ( ( _upgrades select CTI_UPGRADE_AIR_AA ) == 0 ) ) then
	{
		_disable = 1;
	};
	
	// Check if AT
	if ( ( _mount_magazine_classname in CTI_ALM_ATGM_RESEARCHED_MAGAZINES ) && ( ( _upgrades select CTI_UPGRADE_AIR_AT ) == 0 ) ) then
	{
		_disable = 1;
	};
	
	// Check if FFAR
	if ( ( _mount_magazine_classname in CTI_ALM_FFAR_RESEARCHED_MAGAZINES ) && ( ( _upgrades select CTI_UPGRADE_AIR_FFAR ) == 0 ) ) then
	{
		_disable = 1;
	};
	
	// Check if CM
	if ( ( _mount_magazine_classname in CTI_ALM_CM_RESEARCHED_MAGAZINES ) && ( ( _upgrades select CTI_UPGRADE_AIR_CM ) == 0 ) ) then
	{
		_disable = 1;
	};
	
	
	_mount_idc = _mount_row + CTI_ALM_WEAPON_CHECKBOX_START_IDC;
	_control = ((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( _mount_idc ));
	
	if ( _disable == 1 ) then
	{
		_control ctrlEnable false;
		_control ctrlSetTextColor [0.2, 0.2 , 0.2, 1];
		_control ctrlSetText "N/A";
	}
	else
	{
		_control ctrlEnable true;
		_control ctrlSetTextColor [1, 0.1 , 0.1, 1];
		_control ctrlSetText "NO";
	};
	

};

/*
  Name: CTI_GET_CURRENT_TEXT_COST_ROW_N
  
  Purpose: Returns the text value of a mount row
  
  Arguments: #
    0	[Integer]: Index of row
  
  Returned: #
    0	[String]: Text of cost entry
*/
CTI_GET_CURRENT_TEXT_COST_ROW_N = 
{
	_n = _this;
	_text = ctrlText ( CTI_ALM_COST_TEXT_START_IDC + _n );
	_text
};


/*
  Name: CTI_SET_TEXT_COST_ROW_N
  
  Purpose: Sets the text value of a mount row
  
  Arguments: #
    0	[Integer]: Index of row
  
  Returned: #
    [NONE]
*/
CTI_SET_TEXT_COST_ROW_N = 
{
	_newtext = _this select 0;
	_n = _this select 1;
	_cost_text_control = ((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( CTI_ALM_COST_TEXT_START_IDC + _n ));
	_cost_text_control ctrlSetText format [ "%1" , _newtext ];
};

/*
  Name: CTI_ALM_UPDATE_TEXT_COST_ROW_N
  
  Purpose: Updates the cost of a mount point row based on the selected magazine
  
  Arguments: #
    0	[Integer]: Index of row
  
  Returned: #
    [NONE]
*/
CTI_ALM_UPDATE_TEXT_COST_ROW_N =
{
	_n = _this;
	
	// Get current selected vehicle
	_selected_vehicle = call CTI_GET_SELECTED_VEHICLE;
	
	// Get loadout options
	_vehicle_loadout_options = _selected_vehicle call CTI_ALM_GET_VEHICLE_LOADOUT_OPTIONS;
	
	// Get the selected row from the loadout combobox
	_loadout_selected_row = ( call CTI_GET_SELECTED_LOADOUT_INDEX );
	
	// Get the selected row from weapon combobox
	_weapon_selected_row = ( _mount_row call CTI_GET_SELECTED_WEAPON_ROW_N );
	
	// Get the selected row from magazine combobox
	_magazine_selected_row = ( _mount_row call CTI_GET_SELECTED_MAGAZINE_ROW_N );
	
	_chosen_loadout_name = _vehicle_loadout_options select ( _loadout_selected_row * 2 );
	
	_chosen_loadout = _vehicle_loadout_options select ( ( _loadout_selected_row * 2 ) + 1 );
	
	_chosen_mount = _chosen_loadout select _n;
	
	_chosen_weapon_classname = _chosen_mount select ( _weapon_selected_row * 2 ) ;
	
	_chosen_weapon_magazine_options = _chosen_mount select ( ( _weapon_selected_row * 2 ) + 1 ) ;
	
	_chosen_magazine_options = _chosen_weapon_magazine_options select _magazine_selected_row;
	
	_chosen_magazine_classname = _chosen_magazine_options select 0;
	
	_chosen_magazine_cost = _chosen_magazine_options select 1;
	
	// Update cost of mount row
	[ _chosen_magazine_cost , _mount_row ] call CTI_SET_TEXT_COST_ROW_N;
};



/*
  Name: CTI_ALM_ACCEPT_VEHICLE_LOADOUT
  
  Purpose: Assigns the loadout selection mapping to the selected vehicle
  
  Arguments: #
    0	[Object]: Vehicle to purge weapons from
  
  Returned: #
    [NONE]
*/
CTI_ALM_ACCEPT_VEHICLE_LOADOUT =
{
	_selected = _this;
	
	_loadout_details = [];
	
	// Determine the chosen loadout index
	_selected_loadout_index = (( lbCurSel CTI_ALM_LOADOUT_SELECT_LIST_IDC ) * 2 ) + 1;
	
	// Add the loadout index
	_loadout_details = _loadout_details + [ _selected_loadout_index ];
	
	// Get the weapons for each of the mounts
	{
		_weapon_combobox_idc = _x;
		
		// Check if mount point is visible
		if ( ctrlShown ((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( _weapon_combobox_idc )) ) then
		{
			
			_index_position = (_weapon_combobox_idc - CTI_ALM_WEAPON_COMBOBOX_START_IDC );
			_magazine_combobox_idc = _index_position + CTI_ALM_MAGAZINE_COMBOBOX_START_IDC;
			_selected_weapon_index = ( lbCurSel _weapon_combobox_idc ) * 2;
			_selected_magazine_index = lbCurSel _magazine_combobox_idc;
			_mount_set = _index_position call CTI_ALM_CHECKBOX_INDEX_N_SET;
			
			
			[ _loadout_details, ( [ _selected_weapon_index , _selected_magazine_index , _mount_set ] ) ] call CTI_CO_FNC_ArrayPush;
		};
	} forEach ( CTI_AL_ALL_WEAPON_COMBOBOX_DETAILS );
	
	
	_selected setVariable [ "cti_custom_aircraft_loadout_v2" , _loadout_details ];
};

/*
  Name: CTI_ALM_PURGE_ALL_WEAPONS
  
  Purpose: Removes all the existing weapons from an air vehicle
  
  Arguments: #
    0	[Object]: Vehicle to purge weapons from
  
  Returned: #
    [NONE]
*/
CTI_ALM_PURGE_ALL_WEAPONS =
{

	
	_vehicle = _this;
	
	if ( _vehicle isKindof "Air" ) then
	{
		
		// Remove all current weapons
		{ 
			_vehicle removeWeaponGlobal _x;
		} foreach ( weapons _vehicle );
		
		// Remove all current magazines
		{
			_vehicle removeMagazineGlobal _x;
		} foreach ( magazines _vehicle );
		
		// Grab vehicle loadout choices
		_loadout_selections = _vehicle getVariable "cti_custom_aircraft_loadout_v2";
		
		
		// Determine vehicle type
		_typeOfValue = typeOf _vehicle;
		
		// Grab the weapon configurations available for this vehicle
		_gun_configs = missionNamespace getVariable ( format [ "CTI_LOADOUT_%1_MNT_OPTIONS" , _typeOfValue ] );
		
		//Loadout chosen index
		_loadout_index = _loadout_selections select 0;
		
		// Mountpoint options for chosen loadout
		_all_mountpoint_options = _gun_configs select _loadout_index;
		
		_weapons_to_add = [];
		_magazines_to_add = [];
		
		// Loop through each mount point
		for [ {_mount_index = 0},{ _mount_index < ( count ( _all_mountpoint_options ))},{ _mount_index = _mount_index + 1}] do 
		{
			
			//Get options for mountpoint
			_a_mountpoint_options = _all_mountpoint_options select _mount_index;
			
			// Extract chosen mountpoint options
			_mount_loadout = _loadout_selections select ( _mount_index + 1 );
			_mount_loadout_weapon_index = _mount_loadout select 0;
			_mount_loadout_magazine_index = _mount_loadout select 1;
			_mount_loadout_enabled  = _mount_loadout select 2;
			
			_magazine_options = ( _a_mountpoint_options select ( _mount_loadout_weapon_index + 1 ) ) select ( _mount_loadout_magazine_index );
			_magazine_classname = _magazine_options select 0;
			
			//Get chosen weapon and magazine classnames 
			_weapon_classname = _a_mountpoint_options select _mount_loadout_weapon_index;
			_weapons_to_add = _weapons_to_add + [ _weapon_classname ];
			_magazines_to_add = _magazines_to_add + [ _magazine_classname ];
		};
		
		
		// Remove all weapons and magazines
		{ _vehicle removeWeaponGlobal _x } foreach ( _weapons_to_add );
		
		// Remove all magazines
		{ _vehicle removeMagazineGlobal _x } foreach ( _magazines_to_add );
		
	
	};
};


/*
  Name: CTI_ALM_CALCULATE_CHOSEN_LOADOUT_COST
  
  Purpose: Calculates the cost of loadout by summing all the selected mount costs
  
  Arguments: #
    [NONE]
  
  Returned: #
    0	[Integer]: The cost of the selected mount options
*/
CTI_ALM_CALCULATE_CHOSEN_LOADOUT_COST =
{
	_total_cost = 0;
	// Loop through each visible mount point
	for [ { _mount_row = 0 },{ _mount_row < 7 },{ _mount_row = _mount_row + 1 } ] do
	{
		// Add the cost if the checkbox is set and visible
		if ( _mount_row call CTI_ALM_CHECKBOX_INDEX_N_SET ) then
		{
			_total_cost = _total_cost + parseNumber ( _mount_row call CTI_GET_CURRENT_TEXT_COST_ROW_N );
		};
	};
	_total_cost
};


/*
  Name: CTI_ALM_REFRESH_LOADOUT_ON_MOUNTED
  
  Purpose: Updates the vehicle loadout based on the assigned mount choices.
  
  Arguments: #
    0	[Object]: The vehicle
  
  Returned: #
    [NONE]
*/

CTI_ALM_REFRESH_LOADOUT_ON_MOUNTED =
{
	_vehicle = _this;
	
	// Grab vehicle loadout choices
	_loadout_selections = _vehicle getVariable "cti_custom_aircraft_loadout_v2";
	
	// Determine vehicle type
	_typeOfValue = typeOf _vehicle;
	
	// Grab the weapon configurations available for this vehicle
	_gun_configs = missionNamespace getVariable ( format [ "CTI_LOADOUT_%1_MNT_OPTIONS" , _typeOfValue ] );
	
	//Loadout chosen index
	_loadout_index = _loadout_selections select 0;
	
	// Mountpoint options for chosen loadout
	_all_mountpoint_options = _gun_configs select _loadout_index;
	
	_magazines_to_add = [];
	_weapons_to_add = [];
	
	// Loop through each mount point
	for [ {_mount_index = 0},{ _mount_index < ( count ( _all_mountpoint_options ))},{ _mount_index = _mount_index + 1}] do 
	{
		
		//Get options for mountpoint
		_a_mountpoint_options = _all_mountpoint_options select _mount_index;
		
		// Extract chosen mountpoint options
		_mount_loadout = _loadout_selections select ( _mount_index + 1 );
		_mount_loadout_weapon_index = _mount_loadout select 0;
		_mount_loadout_magazine_index = _mount_loadout select 1;
		_mount_loadout_enabled  = _mount_loadout select 2;
		
		//Get chosen weapon and magazine classnames 
		_weapon_classname = _a_mountpoint_options select _mount_loadout_weapon_index;
		_magazine_options = ( _a_mountpoint_options select ( _mount_loadout_weapon_index + 1 ) ) select ( _mount_loadout_magazine_index );
		_magazine_classname = _magazine_options select 0;
		_magazine_cost = _magazine_options select 1;
		
		// Always add the magazine
		_vehicle addMagazineGlobal _magazine_classname;
		
		if not ( _mount_loadout_enabled ) then
		{
			_vehicle addWeaponGlobal _weapon_classname;
			_vehicle setAmmo [ _weapon_classname , 0 ];
			_vehicle removeWeaponGlobal _weapon_classname;
		}
		else
		{
			_vehicle addWeaponGlobal _weapon_classname;
		};
	};
	
};

/*
  Name: CTI_ALM_ACQUIRE_BUSY_LOCK
  
  Purpose: Semaphore function to prevent multiple rearming
  related actions being performned on a vehicle.
  
  Arguments: #
    0	[Object]: The vehicle
  
  Returned: #
    0	[Boolean]: Lock succesfully acquired
*/
CTI_ALM_ACQUIRE_BUSY_LOCK =
{
	_return = false;
	if  ( ( isNil { _this getVariable "cti_custom_aircraft_loadout_v2_arming_busy" } ) || ( ! ( _this getVariable "cti_custom_aircraft_loadout_v2_arming_busy" ) ) ) then
	{
		_this setVariable [ "cti_custom_aircraft_loadout_v2_arming_busy" , true ];
		_return = true;
	};
	_return
};


/*
  Name: CTI_ALM_RELEASE_BUSY_LOCK
  
  Purpose: Immediately release semaphore lock on vehicle
  
  Arguments: #
    0	[Object]: The vehicle
  
  Returned: #
    NONE
*/
CTI_ALM_RELEASE_BUSY_LOCK =
{
	_this setVariable [ "cti_custom_aircraft_loadout_v2_arming_busy" , false ];
};

/*
  Name: CTI_AL_GET_STANDARD_EMPTY_LOADOUT
  
  Purpose: Immediately release semaphore lock on vehicle
  
  Arguments: #
    0	[Object]: The vehicle
  
  Returned: #
    NONE
*/
CTI_AL_GET_STANDARD_EMPTY_LOADOUT =
{
	_vehicle = _this;
	_vehicle_classname = typeOf _vehicle;
	
	_loadout_options = missionNamespace getVariable ( format [ "CTI_LOADOUT_%1_MNT_OPTIONS" , _vehicle_classname ] );
	_default_option_mount_points = _loadout_options select 1; // First element is name, second element is loadout array tree ...
	
	_return = [ 1 ]; // Add the first loadout as default
	{
		_element = [ 0 , 0 , false ];
		[ _return, _element ] call CTI_CO_FNC_ArrayPush;
	} forEach ( _default_option_mount_points ); 
	_return
};


/*
  Name: CTI_GET_MAGAZINE_DISPLAY_NAME
  
  Purpose: Create a printable magazine name based on a magazine nameclass
  
  Arguments: #
    0	[String]: Magazine classname
  
  Returned: #
    0	[String]: Magazine printable name
*/
CTI_GET_MAGAZINE_DISPLAY_NAME =
{
	_magazine_classname = _this;
	_magazine_name = getText ( configFile >> "CfgMagazines" >> _magazine_classname >> "displayName" );
	_magazine_count = getNumber ( configFile >> "CfgMagazines" >> _magazine_classname >> "count" );
	if ( _magazine_name == "" ) then { _magazine_name = getText ( configFile >> "CfgMagazines" >> _magazine_classname >> "displayNameShort" ); };
	if ( _magazine_name == "" ) then { _magazine_name = "Rounds" };
	_magazine_name = format [ "%1 x %2" , _magazine_count , _magazine_name ];
	_magazine_name
};

/*
  Name: CTI_GET_WEAPON_DISPLAY_NAME
  
  Purpose: Create a printable weapon name based on a weapon nameclass
  
  Arguments: #
    0	[String]: Weapon classname
  
  Returned: #
    0	[String]: Weapon printable name
*/
CTI_GET_WEAPON_DISPLAY_NAME =
{
	_weapon_classname = _this;
	_weapon_name = getText ( configFile >> "CfgWeapons" >> _weapon_classname >> "displayName" );
	_weapon_name
};
