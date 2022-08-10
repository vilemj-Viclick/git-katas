#!/bin/bash

exercise_dir_name="exercise"
inline_file_name="Inline.tsx"
quickstart_file_name="QuickStart.tsx"
tabview_file_name="TabView.tsx"

rm -rf $exercise_dir_name/
git init $exercise_dir_name
cd $exercise_dir_name || true

echo "export const Inline = () => {" > $inline_file_name
echo "  // legacy implementation" >> $inline_file_name
echo "}" >> $inline_file_name
git add $inline_file_name

echo "export const QuickStart = () => {" > $quickstart_file_name
echo "  // custom implementation" >> $quickstart_file_name
echo "}" >> $quickstart_file_name
git add $quickstart_file_name
git commit -m "Initial commit"

git checkout -b tabview

git commit --allow-empty -m "Fix imports of CSS properties typings"

first_commit=$(git rev-parse --short HEAD)

echo "export const TabView = () => {" > $tabview_file_name
echo "};" >> $tabview_file_name
git add $tabview_file_name
git commit -m "Create TabView component"

echo "export const Inline = () => {" > $inline_file_name
echo "  // implementation with flex gap" >> $inline_file_name
echo "}" >> $inline_file_name
git add $inline_file_name
echo "export const TabView = () => {" > $tabview_file_name
echo "  return (" >> $tabview_file_name
echo "    <Inline {/* propsy props */} />" >> $tabview_file_name
echo "  );" >> $tabview_file_name
echo "};" >> $tabview_file_name
git add $tabview_file_name
git commit -m "Rewrite spacing in Inline with flex gap"
git commit --allow-empty -m "Fix typo in TabView"
git commit --allow-empty -m "Rewrite spacing in Stack with flex gap"

echo "export const QuickStart = () => {" > $quickstart_file_name
echo "  return (" >> $quickstart_file_name
echo "      <tabview>" >> $quickstart_file_name
echo "  );" >> $quickstart_file_name
echo "}" >> $quickstart_file_name
git add $quickstart_file_name
git commit -m "Rewrite QuickStart with new TabView component"

git commit --allow-empty -m "Get rid of deprecated CLI flag"
second_commit=$(git rev-parse --short HEAD)

echo "export const TabView = () => {" > $tabview_file_name
echo "  // Fix some bug" >> $tabview_file_name
echo "  return (" >> $tabview_file_name
echo "    <Inline {/* propsy props */} />" >> $tabview_file_name
echo "  );" >> $tabview_file_name
echo "};" >> $tabview_file_name
git add $tabview_file_name
git commit -m "Fix minor bug in TabView component"

echo "export const TabView = () => {" > $tabview_file_name
echo "  // Fix some bug" >> $tabview_file_name
echo "  // Add hover styles" >> $tabview_file_name
echo "  return (" >> $tabview_file_name
echo "    <Inline {/* propsy props */} />" >> $tabview_file_name
echo "  );" >> $tabview_file_name
echo "};" >> $tabview_file_name
git add $tabview_file_name
git commit -m "Add missing hover styles to TabView"

git checkout master
git commit --allow-empty -m "Some other commit"
git cherry-pick $first_commit
git commit --allow-empty --no-edit
git cherry-pick $second_commit
git commit --allow-empty --no-edit
git checkout -
