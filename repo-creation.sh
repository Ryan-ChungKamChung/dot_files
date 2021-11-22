#!/bin/bash

# chmod +x repo-creation.sh

# Makes the directory
mkdir $1
cd $1

# Creates the local and remote branches
git init                                                               
gh repo create $1 --public --gitignore $2 --confirm
git pull origin main

# Creates README.md
touch README.md
echo "# $1" >> README.md

# Add github linters
mkdir -p .github/workflows
cd .github/workflows

# Chooses whether the Java or Swift linter is added
if [ $2 = "Java" ]
then
    # Adds the linter yml file to ./github/workflows and then adds the linter
    # badges to the README
    cp ~/scripts/java.yml ./main.yml
    cd ../..
    echo "[![GitHub's Super Linter](https://github.com/Ryan-ChungKamChung/$1/workflows/GitHub's%20Super%20Linter/badge.svg)](https://github.com/Ryan-ChungKamChung/$1/actions)" >> ./README.md
else
    # Adds the linter yml file to ./github/workflows and then adds the linter
    # badges to the README
    cp ~/scripts/swift.yml ./main.yml
    cd ../..
    echo "[![SwiftLint](https://github.com/Ryan-ChungKamChung/$1/workflows/SwiftLint/badge.svg)](https://github.com/Ryan-ChungKamChung/$1/actions)" >> ./README.md
fi
