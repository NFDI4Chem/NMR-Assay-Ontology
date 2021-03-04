#!/bin/bash

while IFS=" " read -r prefix uri 
do
    # echo "prefix:" $prefix "uri:" $uri $prefix.owl
    wget --quiet $uri -c # download the used ontologies olw files

    #### extract terms from ontologies
    if test -f "terms_$prefix.txt"; then
        echo "extracting terms from $prefix terms_$prefix.txt"
        robot extract \
        --method BOT \
        --input $prefix.owl \
        --term-file terms_$prefix.txt \
        --intermediates minimal \
        --output extracted_$prefix.owl

        # convert owl to ttl and remove owl
        robot convert --input extracted_$prefix.owl \
        --output extracted_$prefix.ttl
    fi
done < "ontologies.txt"

# Merge extracted_*.owl on to merged.owl
robot merge --inputs "extracted_*.owl" --output merged.owl
robot convert --input merged.owl --output merged.ttl 
rm extracted_*.owl  # remove owl files



# for o in `cat ontologies.txt`
# do
#     o_l=($o)
#     o_line=${o_l[0]}
#     echo 'line' $o_line

#     o_array=($o_line)
#     echo "one" ${o_array[0]}
#     # o_prefix=${o_array[0]}
#     # o_uri=${o_array[1]}
#     # echo $o_prefix
#     # echo uri $o_uri
#     # wget $o_uri -c 
# done
