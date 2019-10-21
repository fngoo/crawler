#!/bin/bash

#创建目录
input=httprobe.txt ; export input=httprobe.txt

i=1
echo '#!/bin/bash' >> /root/script/3_httprobe/exe.sh
for line in `cat $input`
do

mkdir /root/script/3_httprobe/dir_$i

echo '#!/bin/bash' >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo 'input=httprobe.txt' >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo "touch dir_${i}/1.txt ; touch dir_${i}/2.txt ; touch dir_${i}/3.txt" >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo "echo '$line' >> /root/script/3_httprobe/dir_${i}/${input}" >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo "for a in "\`cat /root/script/3_httprobe/dir_${i}/${input}\`"; do python /root/script/3_httprobe/crawler.py -u \$a -l 50 -C 8 -w ; crawl=\`echo \$a | grep -o -P \"(?=\:\/\/).*\"\` ; s=\${crawl:3} ; crawl=\$s ;if [ -s /root/script/3_httprobe/\${crawl}.crawler ]; then mv /root/script/3_httprobe/\${crawl}.crawler /root/script/3_httprobe/dir_${i}/\${crawl}.crawler ; grep  -B 10000 'Total\ urls\ crawled:'  /root/script/3_httprobe/dir_${i}/\${crawl}.crawler > /root/script/3_httprobe/dir_${i}/2.txt ; grep  -A 10000 '\ Crawling' /root/script/3_httprobe/dir_${i}/2.txt > /root/script/3_httprobe/dir_${i}/3.txt ; rm /root/script/3_httprobe/dir_${i}/2.txt ; grep -oP 'http.*' /root/script/3_httprobe/dir_${i}/3.txt > /root/script/3_httprobe/dir_${i}/2.txt ; rm /root/script/3_httprobe/dir_${i}/3.txt ; mv /root/script/3_httprobe/dir_${i}/2.txt /root/script/3_httprobe/dir_${i}/1.txt ; echo '' ; echo \$a ; echo ' ' ; cat /root/script/3_httprobe/dir_${i}/1.txt >> /root/script/3_httprobe/dir_${i}/httprobe1.txt ; sed -e '/\\+/d' /root/script/3_httprobe/dir_${i}/httprobe1.txt >> /root/script/3_httprobe/httprobe.txt ; rm /root/script/3_httprobe/dir_${i}/httprobe1.txt ; rm /root/script/3_httprobe/dir_${i}/1.txt ; rm /root/script/3_httprobe/dir_${i}/\${crawl}.crawler;fi ;done" >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo "cd /root/script/3_httprobe ; wc -l httprobe.txt ; rm -r /root/script/3_httprobe/dir_${i}" >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo "bash /root/script/3_httprobe/dir_$i/${i}.sh" >> /root/script/3_httprobe/exe.sh
i=$((i+1))

done
cat /root/script/3_httprobe/exe.sh | parallel --jobs 0 --delay 0.5
rm /root/script/3_httprobe/exe.sh

rm dir_* -r

#wayback
for a in `cat $var`; do > 1.txt ; echo "$a" > 1.txt ; a=`cat 1.txt` ; cat 1.txt | waybackurls > 2.txt ; grep = 2.txt > 3.txt ; sed -e '/%/d' 3.txt | sed -e '/(/d' | sed -e '/)/d' | sed -e '/\/\:\/\//d' | sed -e '/\/\&/d' > 2.txt ; grep "\:\/\/$a" 2.txt > 3.txt ; rm 2.txt ; rm 1.txt ; grep -oP "$a............" 3.txt > w.txt ; sort -u w.txt -o w.txt ; for i in `cat w.txt`; do e=`grep "$i" 3.txt|wc -l` ; if [ $e -gt 5 ]; then grep "$i" 3.txt > r.txt ; grepv=$i ; grep -v "$grepv" 3.txt > 33.txt ; mv 33.txt 3.txt ; head -1 r.txt >> 3.txt ; rm r.txt ; fi; done; rm w.txt ; wc -l httprobe.txt ; cat 3.txt >> /root/script/3_httprobe/httprobe.txt ; rm 3.txt ; done


sort -u /root/script/3_httprobe/httprobe.txt -o /root/script/3_httprobe/httprobe.txt
ls ; wc -l $input
date "+%Y-%m-%d_%H:%M:%S" >> /root/date.txt ; echo 'crawler' >> /root/date.txt
