private ["_params", "_action"];

// Parameters passed by the action
_params = _this select 3;
_action = _params select 0;

////////////////////////////////////////////////
// Handle actions
////////////////////////////////////////////////
if (_action == "action_revive") then
{
	[_this select 0, _this select 1] spawn FAR_HandleRevive;
};

if (_action == "action_stabilize") then
{
	[cursorTarget] spawn FAR_HandleStabilize;
};

if (_action == "action_suicide") then
{
	player setDamage 1;
	CTI_P_PreBuilding = false;
};

if (_action == "action_drag") then
{
	[cursorTarget] spawn FAR_Drag;
};

if (_action == "action_release") then
{
	[] spawn FAR_Release;
};