#!/bin/bash
echo "Adventures In Minecraft"
echo "Minecraft Server Version is 1.12"
echo "  Note - make sure Minecraft is using 1.12"
echo "By continuing you are indicating your agreement to our EULA https://account.mojang.com/documents/minecraft_eula)."
echo "Press any key to continue"
read -n 1 -s
cd "$( dirname "$0" )"
cd Server

#check java version
JAVA_VER_MAJOR=""
JAVA_VER_MINOR=""
JAVA_VER_BUILD=""

for token in $(java -version 2>&1 | grep -i version)
do
    if [[ $token =~ \"([[:digit:]]+)\.([[:digit:]]+)\.(.*)\" ]]
    then
        JAVA_VER_MAJOR=${BASH_REMATCH[1]}
        JAVA_VER_MINOR=${BASH_REMATCH[2]}
        JAVA_VER_BUILD=${BASH_REMATCH[3]}
        break
    fi
done

if [ "$JAVA_VER_MAJOR" -gt "1" ]; then
    ./start.command

elif [ "$JAVA_VER_MINOR" -gt "7" ]; then 
    ./start.command

else
    echo ERROR - Java needs to be updated.
    echo Currently installed version is $JAVA_VER_MAJOR.$JAVA_VER_MINOR - 1.8 is required
    echo Visit adventuresinminecraft.github.io if you need help.
fi
