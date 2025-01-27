#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Fix rotating garrisoned units
["ModuleCurator_F", "Init", {
    params ["_logic"];

    _logic addEventHandler ["CuratorObjectEdited", {
        params ["", "_object"];
        if (_object getVariable [QGVAR(garrisoned), false]) then {
            [QEGVAR(common,doWatch), [_object, (ASLtoAGL eyePos _object) vectorAdd (vectorDir _object)], _object] call CBA_fnc_targetEvent;
        };
    }];
}, true, [], true] call CBA_fnc_addClassEventHandler;

ADDON = true;
