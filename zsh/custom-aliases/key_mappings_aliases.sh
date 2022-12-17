# Mac key mappings
setup_keys() {
    hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x7000000e6,
    "HIDKeyboardModifierMappingDst":0x7000000e4}]
    }' && hidutil property --set '{"UserKeyMapping":
        [{"HIDKeyboardModifierMappingSrc":0x7000000e7,
        "HIDKeyboardModifierMappingDst":0x7000000e6},
        {"HIDKeyboardModifierMappingSrc":0x7000000e6,
        "HIDKeyboardModifierMappingDst":0x7000000e7}]
    }'
}

alias setup-keys="setup_keys"

function key-mappings-help() {
    echo "\n${COLOR_YELLOW}  Key Mappings:";
    echo "${COLOR_BLUE}  setup-keys ${COLOR_GREEN}- remap right option to control, and right alt to command";
}

