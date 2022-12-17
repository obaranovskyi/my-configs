# TODO: To understand what is going on here
# TODO: This is under construction
# Only for the learning purpose

function echo_tab() {
  echo "\t $1"
}

# usage:
# repeat_seq 80 '-'; echo
function repeat_seq() {
	local start=1
	local end=${1:-80}
	local str="${2:-=}"
	local range=$(seq $start $end)
  local repeats=""

	for i in $range ; do
    repeats+=$str;
  done

  echo_tab $repeats
}


function format_array () {
    local header="$1"
    echo_tab $header

    local header_len=${#header}
    repeat_seq $header_len "-";

    local formatted=""

    # remove first item from the arguments array
    shift; 

    local array_to_format=("$@")
    for item in "${array_to_format[@]}"; do
        formatted+="\t ${item}\n";
    done

    echo $formatted
}

communication=("hello and hi" "hi" "bye")

format_array "Header" "${communication[@]}"
