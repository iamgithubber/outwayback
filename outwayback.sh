#!/bin/bash


mkdir -p ./outwayback
echo filename		domain 		size	length > ./outwayback/index.txt
while read a ; do
	filename=$(echo $a| sha256sum|awk '{print $1}')	
	filename=outwayback/$filename
	waybackurls $a | tee -a $filename
	siz=$(wc -c $filename | awk '{print $1}' )
	len=$(wc -l $filename | awk '{print $1}' )
	echo -e $filename $a $siz $len | tee -a outwayback/index.txt 				
	echo 
done 	
