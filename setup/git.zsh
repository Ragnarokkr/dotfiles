#!/usr/bin/env zsh

# Creates and configures .gitconfig file

git_command() {
	local git_exec=$(command -v git)

	if [[ -z $git_exec ]]; then
		echo "ERROR: git package is required to be installed to continue" >&2
		exit 1
	else
		echo $git_exec
	fi
}

git_config() {
	local params='config --global'
	
	if [[ $# -eq 1 ]]; then
		echo $($git_exec ${=params} $1)
	elif [[ $# -eq 2 ]]; then
		$git_exec ${=params} $1 "$2"
	fi
}

config_username() {
	local user_name=$(git_config user.name)

	if [[ -z $user_name ]]; then
		while [[ -z $user_name ]]; do 
			vared -p "Enter the user name: " -c user_name
		done

		git_config user.name $user_name
	fi
}

config_email() {
	local user_email=$(git_config user.email)
	
	if [[ -z $user_email ]]; then
		while [[ -z $user_email ]]; do 
			vared -p "Enter the user email: " -c user_email
		done

		git_config user.email $user_email
	fi
}


git_exec=$(git_command)

echo -e "Configuring private data for .gitconfig file for current user\n"
config_username
config_email