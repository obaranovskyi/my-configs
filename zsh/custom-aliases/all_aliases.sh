export CUSTOM_ALIASES_DIR="${CUSTOM_CONFIG_DIR}/custom-aliases"

source $CUSTOM_ALIASES_DIR/common_aliases.sh;
source $CUSTOM_ALIASES_DIR/git_aliases.sh;
source $CUSTOM_ALIASES_DIR/python_aliases.sh;
source $CUSTOM_ALIASES_DIR/tmux_aliases.sh;
source $CUSTOM_ALIASES_DIR/key_mappings_aliases.sh;
source $CUSTOM_ALIASES_DIR/wifi_aliases.sh;
source $CUSTOM_ALIASES_DIR/navigation.sh;
source $CUSTOM_ALIASES_DIR/create-project.sh;
source $CUSTOM_ALIASES_DIR/cs.sh;
source $CUSTOM_ALIASES_DIR/browser.sh;

syshelp() {
    common-help
    git-help
    python-help
    tmux-help
    key-mappings-help
    osx-wifi-help
    navigation-help
    create-project-help
    cs-help
    browser-help
}
