#!/usr/bin/env bash
#
# @FILENAME@
#
# Created by @NAME@ on @DATE@.
# Copyright (c) @YEAR@ @EMAIL@.
#
VERSION=0.1.0
SUBJECT=some-unique-id
USAGE="Usage: command -hv args"

if [ $# == 0 ] ; then
    echo $USAGE
    exit 1;
fi
