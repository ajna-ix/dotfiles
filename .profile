# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
# go

export PATH=$PATH:/usr/local/go/bin

#beenthere//donethat
#https://ane.iki.fi/2022/06/21/beenthere-donethat.html

bt() {
	    if [[ -z "$1" ]]; then
		            CMD=$(history 10 | fzf --header="Choose a command to save" --no-sort --tac | cut -d' ' -f 5-)
			        else
					        CMD=$1
						    fi

						        [[ -z "$CMD" ]] && echo "Aborted" && return 2
							    echo "Saving \"${CMD}\"..."
							        read -p "Name of command: " NAME
								    [[ -z "$NAME" ]] && echo "No name given, aborting" && return 1
								        LONG=$(read -p "Longer description (optional): ")

									    if [[ ! -d "${HOME}/.config/btdt" ]]; then
										            mkdir -p "${HOME}/.config/btdt"
											        fi

												    DATA="${BTDT_DATA:-${HOME}/.config/btdt/data}"

												        if [[ ! -f $DATA ]]; then
														        touch $DATA
															    fi
															        
															        result="${CMD}\t${NAME}\t${LONG}\n"
																    printf "$result" >> $DATA
															    }

														    dt() {
															        local data="${BTDT_DATA:-${HOME}/.config/btdt/data}"
																    local cmd=$(cat $data | fzf -d'\t' --with-nth 2 --preview='echo -e "\033[1m"{1}"\033[0m""\n\n"{3}' | cut -f1)
																        echo "${cmd}"
																	    eval "${cmd}"
																    }
