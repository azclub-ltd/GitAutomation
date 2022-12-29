#!/bin/sh

# Define color code here
RED='\033[0;31m'
LIGHTRED='\033[1;31m'
GREEN='\033[0;32m'
LIGHTGREEN='\033[1;32m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LIGHTBLUE='\033[1;34m'
NC='\033[0m' # No Color
# Check if ssh key-pair already exist or not

# Dependency installation
echo "${LIGHTGREEN}[+] Installing dependencies..${NC}"
pkg install openssh
echo "${LIGHTGREEN}[/] Starting Main process..${NC}"
echo "${YELLOW}Enter Your E-mail: ${NC}"
read GIT_MAIL
# Define all function
funGenSsh() {
	# Check which argument is passed
	if [ $1 -eq 1 ]; then
		#set type to ed25519
		TYPE="ed25519"
		FILENAME="id_ed25519"
	elif [ $1 -eq 2 ]; then
		#set type to rsa -b 4096
		TYPE="rsa -b 4096"
		FILENAME="id_rsa"
	elif [ $1 -eq 3 ]; then
		#set type to ed25519-sk
		TYPE="ed25519-sk"
		FILENAME="id_ed25519_sk"
	elif [ $1 -eq 4 ]; then
		#set type to ecdsa-sk
		TYPE="ecdsa-sk"
		FILENAME="id_ecdsa_sk"
	fi
	echo $TYPE
	echo $FILENAME
	if [ -n $TYPE ]; then
		# Generate key-pair value
		ssh-keygen -t $TYPE -C "$GIT_MAIL"
		# Start ssh agent
		eval "$(ssh-agent -s)"
		# Add ssh file to ssh agent
		ssh-add ~/.ssh/$FILENAME
	fi
}
# Now It's time to check type
echo "${YELLOW}Choose key type: ${NC}"
echo "[1] ed25519 (default)"
echo "[2] rsa 4096 (legacy - android 10+)"
echo "[3] ed25519-sk (Hardware SK)"
echo "[4] ecdsa-sk (Hardware SK)"
# Check type
checkType() {
	read KEY_TYPE
	if [ $KEY_TYPE -eq 1 ]; then
	# Call function for value ed25519
	funGenSsh 1
	elif [ $KEY_TYPE -eq 2 ]; then
		# Call function for value ed25519
	funGenSsh 2
	elif [ $KEY_TYPE -eq 3 ]; then
		# Call function for value ed25519
	funGenSsh 3
	elif [ $KEY_TYPE -eq 4 ]; then
		# Call function for value ed25519
	funGenSsh 4
	else
		# Return Invalid and ask again for input
	echo "${RED}Invalid Option${NC}"
	checkType
	fi
}
checkType
copyClip() {
  echo "${LIGHTGREEN}[+] Installing Termux Api..${NC}"
  pkg install termux-api
  # Copy public ssh code to clipboard
  cat ~/.ssh/$FILENAME.pub | termux-clipboard-set
  echo "${LIGHTGREEN}[=] Copied to clipboard ${NC}"
}
copyClip