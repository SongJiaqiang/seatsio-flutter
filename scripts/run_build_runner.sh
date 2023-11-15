#!/bin/sh

cd .. || exit

dart run build_runner watch --delete-conflicting-outputs
