#!/bin/bash

cd ../../languages/apertium-kaz
make &&
cd ../apertium-tat
make &&
cd ../../trunk/apertium-kaz-tat
make &&
./wiki-tests.sh Regression kaz tat update &&
./qa.sh kaz-tat-corp &&
./qa.sh tat-kaz-corp &&

echo '[*@#] errors kaz-tat before:'
grep -c '[*@#]' corpa/kaz-tat-origina.txt
echo '[*@#] errors kaz-tat after:'
grep -c '[*@#]' corpa/kaz-tat-nova.txt

echo '[*@#] errors tat-kaz before:'
grep -c '[*@#]' corpa/tat-kaz-origina.txt
echo '[*@#] errors tat-kaz after:'
grep -c '[*@#]' corpa/tat-kaz-nova.txt

echo 'WER tat-kaz before:'
perl ../apertium-eval-translator/apertium-eval-translator.pl -test corpa/tat-kaz-origina.txt -ref corpa/corpus.kaz.txt > /tmp/tat-kaz-wer-origina.txt
grep '(WER)' /tmp/tat-kaz-wer-origina.txt
echo 'WER tat-kaz after:'
perl ../apertium-eval-translator/apertium-eval-translator.pl -test corpa/tat-kaz-nova.txt -ref corpa/corpus.kaz.txt > /tmp/tat-kaz-wer-nova.txt
grep '(WER)' /tmp/tat-kaz-wer-nova.txt

