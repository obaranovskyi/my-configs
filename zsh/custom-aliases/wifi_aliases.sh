alias osx-wifi-show='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan';
alias osx-wifi-on='networksetup -setairportpower en0 on';
alias osx-wifi-off='networksetup -setairportpower en0 off';
alias osx-wifi-find-network-name='networksetup -listallhardwareports';
alias osx-wifi-speed-test='speedtest-cli'

alias owfs="osx-wifi-show"
alias owfon="osx-wifi-on"
alias owfoff="osx-wifi-off"
alias owffnn="osx-wifi-find-network-name"
alias owfst="osx-wifi-speed-test"

osx-wifi-help() {
    echo "\n${COLOR_YELLOW}  Wifi:";
    echo "${COLOR_BLUE}  osx-wifi-show, owfs ${COLOR_GREEN}- show available networks";
    echo "${COLOR_BLUE}  osx-wifi-on, owfon ${COLOR_GREEN}- turn on wifi";
    echo "${COLOR_BLUE}  osx-wifi-off, owfoff ${COLOR_GREEN}- turn off wifi";
    echo "${COLOR_BLUE}  osx-wifi-find-network-name, owffnn ${COLOR_GREEN}- show your wifi network name";
    echo "${COLOR_BLUE}  osx-wifi-speed-test, owfst ${COLOR_GREEN}- make wifi speed test";
}

