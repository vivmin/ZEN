#include "script_component.hpp"
/*
 * Author: mharis001
 * Sets the stance of units in given selection.
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: Mode <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[unit], "AUTO"] call zen_context_actions_fnc_setStance
 *
 * Public: No
 */

params ["_objects", "_mode"];

{
    if (alive _x && {_x isKindOf "CAManBase"} && {!isPlayer _x}) then {
        [QEGVAR(common,setUnitPos), [_x, _mode], _x] call CBA_fnc_targetEvent;
    };
} forEach _objects;
