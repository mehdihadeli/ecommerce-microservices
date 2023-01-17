#!/bin/bash

#https://stackoverflow.com/questions/72343466/while-using-github-actions-im-facing-permission-denied-error
#https://stackoverflow.com/questions/60566805/getting-next-tag-version-using-semantic-releases
#https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions
#https://unix.stackexchange.com/questions/31414/how-can-i-pass-a-command-line-argument-into-a-shell-script
#https://medium.com/@gpanga/automating-releases-of-net-sdks-using-semantic-release-e3df46013876
#https://github.com/Gabrielpanga/dotnet-nuget-example/blob/main/updateVersion.sh

echo "semantic-nextRelease-version=$1" >> $GITHUB_OUTPUT
echo "semantic-nextRelease-channel=$2" >> $GITHUB_OUTPUT
echo "semantic-nextRelease-gitHead=$3" >> $GITHUB_OUTPUT
echo "semantic-nextRelease-gitTag=$4" >> $GITHUB_OUTPUT
echo "semantic-lastRelease-version=$5" >> $GITHUB_OUTPUT
echo "semantic-lastRelease-channel=$6" >> $GITHUB_OUTPUT
echo "semantic-lastRelease-gitHead=$7" >> $GITHUB_OUTPUT
echo "semantic-lastRelease-gitTag=$8" >> $GITHUB_OUTPUT

# update package version and version for in the csproj file to new version and commit it again with using https://github.com/semantic-release/git plugin
# https://unix.stackexchange.com/questions/50313/how-do-i-perform-an-action-on-all-files-with-a-specific-extension-in-subfolders
find . -name '*.Packages.props' -exec sed -i "s#<PackageVersion>.*#<PackageVersion>$1</PackageVersion>#" {} \;  -exec cat {} \;
find . -name '*.Packages.props' -exec sed -i "s#<InformationalVersion>.*#<InformationalVersion>$1</InformationalVersion>#" {} \;  -exec cat {} \;
find . -name '*.Packages.props' -exec sed -i "s#<Version>.*#<Version>$1</Version>#" {} \;  -exec cat {} \;
