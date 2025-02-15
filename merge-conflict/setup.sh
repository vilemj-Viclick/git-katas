#!/bin/bash

#Include utils
source ../utils/utils.sh

kata="merge-conflict"
make-exercise-repo

touch greeting.txt
git add greeting.txt
git commit -m "Add file greeting.txt" --author "Someone Else <someone@else.com>"
echo "hello" >greeting.txt
git add greeting.txt
git commit -m "Add content to greeting.txt" --author "Someone Else <someone@else.com>"
cat ../colors.js >colors.js
git add colors.js
git commit -m "Add colors." --author "Someone Else <someone@else.com>"

# Make modification on branch 1
git checkout -b $kata-branch1

sed -i.orig -E "s/2E0900/2E0900',\n    KenticoOrangeOriginal: '#F05A22/" colors.js
rm *orig
git add colors.js
git commit -m "Add KenticoOrangeOriginal Color"

sed -i.orig -E "s/001822/001822',\n    SymbioBlue: '#0093ff/" colors.js
rm *orig
git add colors.js
git commit -m "Add SymbioBlue Color"

# Make modifications on master
git checkout master

sed -i.orig -E "s/2E0900/2E0900',\n    KenticoOrange55: '#DB3C00/" colors.js
rm *orig
git add colors.js
git commit -m "Add KenticoOrange55 Color" --author "Someone Else <someone@else.com>"

sed -i.orig -E "s/001822/001822',\n    Transparent: 'transparent/" colors.js
rm *orig
git add colors.js
git commit -m "Add Transparent Color" --author "Someone Else <someone@else.com>"
