#!/bin/bash

exercise_dir_name="exercise"
inline_file_name="Inline.tsx"
stack_file_name="Stack.tsx"
quickstart_file_name="QuickStart.tsx"
tabview_file_name="TabView.tsx"

rm -rf $exercise_dir_name/
git init $exercise_dir_name
cd $exercise_dir_name || true

touch .gitignore
echo ".idea/*" > .gitignore
git add .gitignore

echo "export const Inline = () => {" > $inline_file_name
echo "  // legacy implementation" >> $inline_file_name
echo "}" >> $inline_file_name
git add $inline_file_name

echo "export const Stack = () => {" > $stack_file_name
echo "  // legacy implementation" >> $stack_file_name
echo "}" >> $stack_file_name
git add $stack_file_name

echo "export const QuickStart = () => {" > $quickstart_file_name
echo "  // custom implementation" >> $quickstart_file_name
echo "}" >> $quickstart_file_name
git add $quickstart_file_name
git commit -m "Initial commit"

git checkout -b tabview

git commit --allow-empty -m "[Temp] Fix imports of CSS properties typings" --author "Someone Else <someone@else.com>"

echo "export const TabView = () => {" > $tabview_file_name
echo "  // custom implementation" >> $tabview_file_name
echo "};" >> $tabview_file_name
git add $tabview_file_name
git commit -m "[Tabview] Create TabView component"

sed -i.orig -E "s/\/\/\ legacy\ implementation/\/\/\ implementation\ with\ flex\ gap/" $inline_file_name
sed -i.orig -E "s/\/\/\ custom\ implementation/return (\n    <Inline {\/* propsy props *\/} \/>\n  );/" $tabview_file_name
rm *orig
git add $inline_file_name $tabview_file_name
git commit -m "Rewrite spacing in Inline with flex gap"
git commit --allow-empty -m "[Squash] Fix typo in TabView"

sed -i.orig -E "s/\/\/\ legacy\ implementation/\/\/\ implementation\ with\ flex\ gap/" $stack_file_name
rm *orig
git add $stack_file_name
git commit -m "[Refactoring] Rewrite spacing in Stack with flex gap"

sed -i.orig -E "s/\/\/\ custom\ implementation/return (\n    <tabview>\n  );/" $quickstart_file_name
rm *orig
git add $quickstart_file_name
git commit -m "[Quickstart] Rewrite QuickStart with new TabView component"

git commit --allow-empty -m "[Temp] Get rid of deprecated CLI flag" --author "Someone Else <someone@else.com>"

# https://stackoverflow.com/questions/25631989/sed-insert-line-command-osx
sed -i.orig -e '2i\
  // Fix some bug' $tabview_file_name
rm *orig
git add $tabview_file_name
git commit -m "[Bugfix] Fix minor bug in TabView component"

sed -i.orig -e '3i\
  // Add hover styles' $tabview_file_name
rm *orig
git add $tabview_file_name
git commit -m "[Bugfix] Add missing hover styles to TabView"

git checkout master
git commit --allow-empty -m "Some other commit" --author "Someone Else <someone@else.com>"
git commit --allow-empty -m "Fix imports of CSS properties typings" --author "Someone Else <someone@else.com>"
git commit --allow-empty -m "Get rid of deprecated CLI flag" --author "Someone Else <someone@else.com>"
git checkout -
