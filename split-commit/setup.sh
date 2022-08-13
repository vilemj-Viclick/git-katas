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

git commit --allow-empty -m "Some other commit" --author "Someone Else <someone@else.com>"
git commit --allow-empty -m "Fix imports of CSS properties typings" --author "Someone Else <someone@else.com>"
git commit --allow-empty -m "Get rid of deprecated CLI flag" --author "Someone Else <someone@else.com>"

git checkout -b tabview

git commit --allow-empty -m "Rewrite spacing in Stack with flex gap"

echo "export const TabView = () => {" > $tabview_file_name
echo "  // Fix some bug" >> $tabview_file_name
echo "  // Add hover styles" >> $tabview_file_name
echo "  // custom implementation" >> $tabview_file_name
echo "};" >> $tabview_file_name
git add $tabview_file_name
git commit -m "Create TabView component"

sed -i.orig -E "s/\/\/\ legacy\ implementation/\/\/\ implementation\ with\ flex\ gap/" $inline_file_name
sed -i.orig -E "s/\/\/\ custom\ implementation/return (\n    <Inline {\/* propsy props *\/} \/>\n  );/" $tabview_file_name
rm *orig
git add $inline_file_name $tabview_file_name

git commit -m "Rewrite spacing in Inline with flex gap"

echo "export const QuickStart = () => {" > $quickstart_file_name
echo "  return (" >> $quickstart_file_name
echo "      <TabView />" >> $quickstart_file_name
echo "  );" >> $quickstart_file_name
echo "}" >> $quickstart_file_name
git add $quickstart_file_name
git commit -m "Rewrite QuickStart with new TabView component"
