#!/bin/bash

project=$1/..
tmp="pylint.log"

cd $project
pylint $1 > $tmp

# [R]efactor for a “good practice” metric violation
# [C]onvention for coding standard violation
# [W]arning for stylistic problems, or minor programming issues
# [E]rror for important programming issues (i.e. most probably bug)
# [F]atal for errors which prevented further processing

convention=$(grep -c '^C:' $tmp)
refactor=$(grep -c '^R:' $tmp)
warning=$(grep -c '^W:' $tmp)
error=$(grep -c '^E:' $tmp)
fatal=$(grep -c '^F:' $tmp)
score=$(cat $tmp | tail -n 2 | cut -f 7 -d ' ')
val=$(echo $score | cut -f 1 -d '/')

echo "Report:"
echo "    $convention convention issues"
echo "    $refactor refactor suggestions"
echo "    $warning warnings"
echo "    $fatal potential errors"
echo "Score: $score"


# Update badge in case a Readme.md is found
# [![Pylint](https://img.shields.io/badge/p-v0.6.1-orange.svg)]...
# brightgreen green yellowgreen yellow orange red

if [ -e $project/README.md ]
then
  if [[ $val > 9.5 ]]; then color="brightgreen"
  elif [[ $val > 8.5 ]]; then color="green"
  elif [[ $val > 7.5 ]]; then color="yellowgreen"
  elif [[ $val > 6.5 ]]; then color="yellow"
  elif [[ $val > 5.0 ]]; then color="orange"
  else color="red"
  fi
  sed -i '.bak' "s/badge\/pylint-.*\.svg/badge\/pylint-$val%2F10-$color.svg/" $project/README.md
fi
