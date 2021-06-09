#!/bin/bash

for DIRECTORY in *
do
	(cd "$DIRECTORY" && fastqc -o ../fastqcres/ *gz)
done
