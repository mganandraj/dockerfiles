#!/usr/bin/env bash

# git clone https://github.com/microsoft/react-native.git react-native
git clone https://github.com/mganandraj/react-native.git mgan-react-native
cd mgan-react-native
git checkout TestPR-NDKr21

node ./android-patches/bundle/bundle.js patch . BuildAndThirdPartyFixes DialogModule UIEditText UIScroll UITextFont Accessibility OfficeRNHost SecurityFixes V8Integration AnnotationProcessing --patch-store ./android-patches/patches-droid-office-grouped --log-folder ./android-patches/logs --confirm true

npm install

mono /usr/local/bin/nuget.exe restore ReactAndroid/packages.config -PackagesDirectory ReactAndroid/packages/ -Verbosity Detailed -NonInteractive

chmod +x .ado/setup_droid_deps.sh && .ado/setup_droid_deps.sh
export REACT_NATIVE_DEPENDENCIES=$PWD/build_deps

# https://unix.stackexchange.com/questions/56444/how-do-i-set-an-environment-variable-on-the-command-line-and-have-it-appear-in-c
REACT_NATIVE_DEPENDENCIES=$PWD/build_deps; ./gradlew installArchives -Pparam="excludeLibs"