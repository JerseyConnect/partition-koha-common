#!/bin/sh
#
# Partition Koha instances
#

if [ -d /usr/share/koha ]; then

    # Prompt to move any existing instances?

	# Patch koha-common scripts
    find sbin/ -name "*.patch" -print | while read file
    do
        for i in $file;
        do
            # echo "echo \"$i\" | sed 's/\(patches\/\)\(.*\)\(\.patch\)/\2/'"
            filename=`echo "$i" | sed 's/\(patches\/\)\(.*\)\(\.patch\)/\2/'`
            echo "Found patch for: $filename - patching"
            cp /usr/sbin/$filename ./$filename-backup
            patch /usr/sbin/$filename $i
            echo "done."
        done
    done


else
    echo "Could not find koha-common install -- aborting"
fi