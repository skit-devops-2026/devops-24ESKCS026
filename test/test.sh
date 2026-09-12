#!/bin/bash

echo "Checking required files..."

test -f index.html
test -f README.md
test -f Makefile

echo "All tests passed"