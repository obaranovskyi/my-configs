####################################
# This script starts on osx login. #
####################################

# Setup right Cmnd key on external keyboard
hidutil property --set '{"UserKeyMapping":
[{"HIDKeyboardModifierMappingSrc":0x7000000e6,
"HIDKeyboardModifierMappingDst":0x7000000e4}]
}' && hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x7000000e7,
    "HIDKeyboardModifierMappingDst":0x7000000e6},
    {"HIDKeyboardModifierMappingSrc":0x7000000e6,
    "HIDKeyboardModifierMappingDst":0x7000000e7}]
}'

# Setup borders 
/usr/local/bin/borders active_color=0xFFB30458 inactive_color=0xff494d64 width=10.0

# New way to start jankyborders
# brew services start borders
# /usr/local/bin/borders active_color=0xFFB30458 inactive_color=0xff494d64 width=10.0

# Open Amethyst
open -a "Amethyst"
