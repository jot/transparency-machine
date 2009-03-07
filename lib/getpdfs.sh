#!/bin/bash

for ((i=1319;i<=2500;i+=1)); do
	URL="http://present.brighton-hove.gov.uk/mgConvert2PDF.aspx?ID="
	URL2="http://present.brighton-hove.gov.uk/mgConvert2PDF.aspx?ID="
	URL_ID=$URL$i
	URL_ID2=$URL2$i
	TAIL="&T=0"
	TAIL2="&T=10"
	FULL=$URL_ID$TAIL
	FULL2=$URL_ID2$TAIL2
	/sw/bin/wget -nc -O $i"_agenda.pdf" $FULL
	/sw/bin/wget -nc -O $i"_report.pdf" $FULL2
	/usr/local/bin/pdftotext $i"_agenda.pdf"
	/usr/local/bin/pdftotext $i"_report.pdf"
sleep 2
done
