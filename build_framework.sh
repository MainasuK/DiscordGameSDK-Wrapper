#!/bin/zsh

set -ev

SRCROOT=`pwd`

echo ${SRCROOT}

rm -rf $SRCROOT/.sdk
mkdir .sdk
cd $SRCROOT/.sdk

GameSDK_ZIP="https://dl-game-sdk.discordapp.net/3.2.1/discord_game_sdk.zip"

curl $GameSDK_ZIP --output game_sdk.zip
unzip game_sdk.zip

lipo -create ./lib/x86_64/discord_game_sdk.dylib ./lib/aarch64/discord_game_sdk.dylib -output ./discord_game_sdk.dylib

cp $SRCROOT/module.modulemap ./c

xcrun xcodebuild -create-xcframework \
  -library ./discord_game_sdk.dylib -headers ./c \
  -output DiscordGameSDK.xcframework