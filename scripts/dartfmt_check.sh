#!/usr/bin/env bash
set -e
set -x

output=$(dart format --set-exit-if-changed .)

if [[ $? != 0 ]]; then
    echo "----> Command failed."
  if [[ $output ]]; then
    echo "----> Some files are looking weird here 🤓:"
    echo "$output"
    exit 1
  fi
else
    echo "----> All format is good ✅"
    exit 0
fi

echo "The code style of files below are incorrect: "
echo "${output}"
echo "Make sure you follow the dart code style (https://github.com/dart-lang/dart_style), please correct it by using dartfmt (https://dart.dev/tools/dartfmt) or manually."
then exit 1