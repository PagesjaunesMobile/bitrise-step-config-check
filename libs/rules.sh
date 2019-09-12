function read_value {
  value=$(echo "$values" | grep -e "^$1 = " | head -n 1)
  value=$(echo $value | awk -F" = " '{print $2}')
  echo "$value"
}

function equal {
  value="$(read_value $1)"
  if [ "$value" == "$2" ]; then
	  msg_success "\"$1\" equals \"$2\""
		return 0
  else
		msg_error "\"$1\" equals \"$value\", should be \"$2\""
		return 1
	fi
}

function configs {
  if [ "$config_list" == "$1" ]; then
	  msg_success "Config list equals \"$1\""
		return 0
  else
		msg_error "Config list equals \"$config_list\", should be \"$1\""
		return 1
	fi
}

function xcode {
  if [ "$xcode_version" == "$1" ]; then
	  msg_success "Xcode version equals \"$1\""
		return 0
  else
		msg_error "Xcode version equals \"$xcode_version\", should be \"$1\""
		return 1
	fi
}

function pod {
  if [ "$cocoapods_version" == "$1" ]; then
	  msg_success "Cocoapods version equals \"$1\""
		return 0
  else
		msg_error "Cocoapods version equals \"$cocoapods_version\", should be \"$1\""
		return 1
	fi
}


function contain {
  value="$(read_value $1)"
  if [[ "$value" =~ .*$2.* ]]; then
		msg_success "\"$1\" contains \"$2\""
		return 0
	else
		msg_error "\"$1\" should contain \"$2\""
		return 1
	fi
}

function not_contain {
  value="$(read_value $1)"
  if [[ "$value" =~ .*$2.* ]]; then
		msg_error "\"$1\" contains \"$2\""
		return 1
	else
		msg_success "\"$1\" does not contain \"$2\""
		return 0
	fi
}
