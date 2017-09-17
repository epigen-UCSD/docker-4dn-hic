#!/bin/bash
outprefix=$1
shift

if [ $# -eq 1 ]
then

    cp $1 $outprefix.pairs.gz
    pairix -f $outprefix.pairs.gz

else

    # unzipping to named pipes
    arg=''
    k=1
    for f in $@
    do
    mkfifo pp.$k
    arg="$arg pp.$k"
    gunzip -c $f | grep -v '^#' > pp.$k &
    let "k++"
    done
    
    # header
    gunzip -c $1 | grep "^#" | grep -v '^#command:'  > $outprefix.pairs
    for f in $@
    do
      gunzip -c $f | grep '^#command:' >> $outprefix.pairs
    done
    
    # merging 
    sort -m -k2,2 -k4,4 -k3,3g -k5,5g $arg >> $outprefix.pairs
    
    # compressing
    bgzip -f $outprefix.pairs
    
    # indexing
    pairix -f $outprefix.pairs.gz
    
    # clean up
    k=1
    for f in $@
    do
    rm pp.$k
    let "k++"
    done

fi

