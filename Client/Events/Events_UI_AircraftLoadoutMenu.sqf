private ["_action"];
_action = _this select 0;

switch (_action) do {
	
	case "onLoad": 
	{
		call CTI_ALM_CLEAR_ALL_PREVIOUS_CHOICES;
		call CTI_ALM_HIDE_ALL_MOUNTPOINTS;
		call CTI_ALM_UPDATE_VEHICLE_SELECT_LIST;
	};
	case "onUnload": 
	{
		call CTI_ALM_CLEAR_ALL_PREVIOUS_CHOICES;
	};
	
	//Select a weapon loadout options
	case "onAmmoListLBSelChanged": 
	{
		if ( CTI_DEBUG ) then
		{
			systemChat format [ "Triggering onAmmoListLBSelChanged()" ];
		};
		// Get relative mount row
		_mount_row = _this select 2;
		
		// Disable if not researched
		_mount_row call CTI_ALM_LOCK_IF_NOT_RESEARCHED;
		
		// Update cost field
		_mount_row call CTI_ALM_UPDATE_TEXT_COST_ROW_N;
		
		// Get current selected vehicle
		_selected_vehicle = call CTI_GET_SELECTED_VEHICLE;
		
		// Refresh costs of chosen loadout
		_selected_vehicle call CTI_ALM_UPDATE_CURRENT_LOADOUT;
		
	};
	case "onWeaponMountPressed": 
	{
		if ( CTI_DEBUG ) then
		{
			systemChat format [ "Triggering onWeaponMountPressed()" ];
		};
		
		_idc = _this select 1;
		_control = ((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( _idc ));
		if ( ( ctrlText _control ) == "NO" ) then
		{
			_control ctrlSetTextColor [0.1, 1, 0.1, 1];
			_control ctrlSetText "YES";
		}
		else
		{
			_control ctrlSetTextColor [1, 0.1 , 0.1, 1];
			_control ctrlSetText "NO";
		};
		
		// Get current selected vehicle
		_selected_vehicle = call CTI_GET_SELECTED_VEHICLE;
		
		// Refresh costs of chosen loadout
		_selected_vehicle call CTI_ALM_UPDATE_CURRENT_LOADOUT;
		
	};
	case "onWeaponListLBSelChanged": 
	{
		
		DEBUG_onWeaponListLBSelChanged = true;
		
		if ( DEBUG_onWeaponListLBSelChanged ) then
		{
			systemChat format [ "Triggering onWeaponListLBSelChanged()" ];
		};
		_control_select = _this select 1;
		_relative_idc = _this select 2;
		_current_idc = _control_select select 0;
		_changeto = _control_select select 1;
		
		_vehicle = call CTI_GET_SELECTED_VEHICLE;
		
		// Grab vehicle loadout choices
		_loadout_selections = _vehicle getVariable "cti_custom_aircraft_loadout_v2";
		
		// Determine vehicle type
		_typeOfValue = typeOf _vehicle;
		
		// Grab the weapon configurations available for this vehicle
		_gun_configs = missionNamespace getVariable ( format [ "CTI_LOADOUT_%1_MNT_OPTIONS" , _typeOfValue ] );
		
		//Loadout chosen index
		_loadout_index = ( ( ( call CTI_GET_SELECTED_LOADOUT_INDEX ) *2 ) + 1 );
		
		if ( DEBUG_onWeaponListLBSelChanged ) then
		{
			systemChat format [ "_loadout_index = %1" , _loadout_index  ];
		};
		
		// Mountpoint options for chosen loadout
		_all_mountpoint_options = _gun_configs select _loadout_index;
		
		//Get options for mountpoint
		if ( _relative_idc < ( count ( _all_mountpoint_options ) ) ) then
		{
			if ( DEBUG_onWeaponListLBSelChanged ) then
			{
				systemChat format [ "_relative_idc = %1" , _relative_idc  ];
			};
			
			_a_mountpoint_options = _all_mountpoint_options select _relative_idc;
			
			// Extract chosen mountpoint options
			_mount_loadout = _loadout_selections select ( _relative_idc + 1 );
			_mount_loadout_weapon_index = _mount_loadout select 0;
			_mount_loadout_magazine_index = _mount_loadout select 1;
			_mount_loadout_enabled  = _mount_loadout select 2;
			
			// if ( DEBUG_onWeaponListLBSelChanged ) then
			// {
				// systemChat format [ "_mount_loadout_weapon_index = %1" , _mount_loadout_weapon_index  ];
				// systemChat format [ "_mount_loadout_magazine_index = %1" , _mount_loadout_magazine_index  ];
				// systemChat format [ "_mount_loadout_enabled = %1" , _mount_loadout_enabled  ];
			// };
			
			//Get chosen weapon and magazine classnames 
			// _weapon_classname = _a_mountpoint_options select _mount_loadout_weapon_index;
			// _selected_magazine_config = ( _a_mountpoint_options select ( _mount_loadout_weapon_index + 1 ) );
			
			_weapon_classname = _a_mountpoint_options select ( _changeto * 2 );
			_selected_magazine_config = ( _a_mountpoint_options select ( ( _changeto * 2 ) + 1 ) );
			
			if ( DEBUG_onWeaponListLBSelChanged ) then
			{
				systemChat format [ "_weapon_classname = %1" , _weapon_classname  ];
			};
			
			// Clear out configuration details for the magazine related to this mount point
			lbClear ((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39040 + ( _relative_idc ) ) );
			
			// Loop through each of the magazine options for this weapon
			for [ {_index_magazine = 0},{ _index_magazine < ( count ( _selected_magazine_config ))},{ _index_magazine = _index_magazine + 1}] do 
			{
				
				// Extract the magazine option ( classname , cost );
				_magazine_options = _selected_magazine_config select _index_magazine;
				_magazine_classname = _magazine_options select 0;
				_magazine_cost = _magazine_options select 1;
				
				// Determine magazine name to display
				_magazine_name = getText ( configFile >> "CfgMagazines" >> _magazine_classname >> "displayName" );
				if ( _magazine_name == "" ) then { _magazine_name = getText ( configFile >> "CfgMagazines" >> _magazine_classname >> "displayNameShort" ); };
				if ( _magazine_name == "" ) then { _magazine_name = "Rounds" };
				
				// Determine count to display
				_magazine_count = getNumber  ( configFile >> "CfgMagazines" >> _magazine_classname >> "count" );
				
				// Update magazine list of options
				((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39040 + _relative_idc )) lbAdd ( format[ "%1 X %2" , _magazine_count , _magazine_name ] );
			};
			
			// Default select first element
			((uiNamespace getVariable "cti_dialog_ui_aircraftloadoutmenu") displayCtrl ( 39040 + _relative_idc )) lbSetCurSel 0;
		}
		else
		{
			if ( DEBUG_onWeaponListLBSelChanged ) then
			{
				systemChat format [ "_relative_idc = %1" , _relative_idc  ];
				systemChat format [ "count ( _all_mountpoint_options ) = %1" , count ( _all_mountpoint_options )  ];
				systemChat format [ "_relative_idc >=( count ( _all_mountpoint_options ) )" ];
			};
		};
		
	
	};
	case "onLoadoutListLBSelChanged": 
	{
		if ( CTI_DEBUG ) then
		{
			systemChat format [ "Triggering onLoadoutListLBSelChanged()" ];
		};
		
		call CTI_ALM_HIDE_ALL_MOUNTPOINTS;
		
		call CTI_ALM_UPDATE_WEAPON_OPTIONS;
		
		call CTI_ALM_SET_ALL_WEAPONS_TO_FIRST_CHOICE;
		
		call CTI_ALM_SET_ALL_MAGAZINES_TO_FIRST_CHOICE;
		
		call CTI_ALM_UNSET_ALL_MOUNT_BUTTONS;
		
		if ( CTI_DEBUG ) then
		{
			systemChat format [ "Exiting onLoadoutListLBSelChanged()" ];
		};
	};
	case "onVehicleListLBSelChanged": 
	{
		if ( CTI_DEBUG  ) then
		{
			systemChat format [ "Triggering onVehicleListLBSelChanged()" ];
		};
		// Hide all visible mount points
		call CTI_ALM_HIDE_ALL_MOUNTPOINTS;
		
		// Get current selected vehicle
		_selected_vehicle = call CTI_GET_SELECTED_VEHICLE;
		
		// Check if busy
		if ( _selected_vehicle call CTI_ALM_ACQUIRE_BUSY_LOCK ) then
		{
			// Don't need to hold onto lock
			_selected_vehicle call CTI_ALM_RELEASE_BUSY_LOCK;
			
			// Update list of possible loadouts for this vehicle
			_selected_vehicle call CTI_ALM_UPDATE_LOADOUT_OPTIONS;
			
			// Set loadout to first choice
			call CTI_ALM_SET_LOADOUT_TO_FIRST_CHOICE;
			
			// Read and update current vehicle loadout
			_selected_vehicle call CTI_ALM_UPDATE_CURRENT_LOADOUT;
		}
		else
		{
			hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Cannot change loadout while re-arming. Try again once re-arming is done.";
		};
	};
	case "onAcceptPressed": 
	{
		if ( CTI_DEBUG ) then
		{
			systemChat format [ "Triggering onAcceptPressed()" ];
		};
		// Get current selected vehicle
		_selected_vehicle = call CTI_GET_SELECTED_VEHICLE;
		
		if ( _selected_vehicle call CTI_ALM_ACQUIRE_BUSY_LOCK ) then
		{
			// Don't need to hold onto lock
			_selected_vehicle call CTI_ALM_RELEASE_BUSY_LOCK;
			
			// Calculate cost total cost
			_selected_cost_total = call CTI_ALM_CALCULATE_CHOSEN_LOADOUT_COST;
			_vehicle_loadout_value = _selected_vehicle getVariable "cti_custom_aircraft_loadout_v2_cost";
			
			// Get current funds
			_funds = call CTI_CL_FNC_GetPlayerFunds;
			
			// Subtract from players funds
			_total_cost_difference = ( _vehicle_loadout_value - _selected_cost_total );
			
			if ( _funds >= _total_cost_difference ) then
			{
				( _total_cost_difference ) call CTI_CL_FNC_ChangePlayerFunds;
				
				//Remove all existing weapons
				_wait = _selected_vehicle call CTI_ALM_PURGE_ALL_WEAPONS;
				
				// Accept vehicle loadout
				_wait = _selected_vehicle call CTI_ALM_ACCEPT_VEHICLE_LOADOUT;
				
				// Save the selected cost onto the vehicle
				_selected_vehicle setVariable [ "cti_custom_aircraft_loadout_v2_cost" , _selected_cost_total ];
				
				// Reresh vehicle loadout
				_wait = _selected_vehicle call CTI_ALM_UPDATE_CURRENT_LOADOUT;
			}
			else
			{
				hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Cannot perform this operation. Insufficient funds.";
			};
		}
		else
		{
			hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Cannot perform this operation on a unit already being re-armed";
		};
	};
	case "onCancelPressed": 
	{
		// Clear all previous choices
		call CTI_ALM_CLEAR_ALL_PREVIOUS_CHOICES;
		
		//Close main dialog
		closeDialog 39000;
	};
};