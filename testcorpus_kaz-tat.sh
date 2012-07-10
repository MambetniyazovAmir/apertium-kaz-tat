# Do not run this!

#!/bin/bash

# See http://wiki.apertium.org/wiki/Corpus_test
#
# To make 'original' translation, type this
#make && cat corpa/kaz.crp.txt | apertium -d . kaz-tat > origina_traduko.txt &&

cat corpa/kaz.crp.txt | apertium -d . kaz-tat > nova_traduko.txt &&

diff -w origina_traduko.txt nova_traduko.txt | grep '^[<>]' > /tmp/crpdiff.txt && 
  for i in `cut -c3-8 /tmp/crpdiff.txt | sort -un`; do 
    echo  --- $i ---; grep "^ *$i\." corpa/kaz.crp.txt; grep "^. *$i\." /tmp/crpdiff.txt; 
  done | less

#diff -U1 origina_traduko.txt nova_traduko.txt | dwdiff -c --diff-input