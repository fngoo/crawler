#!/bin/bash

#创建目录
x=8 ; input=httprobe.txt ; export x=8 ; export input=httprobe.txt
length=`wc -l $input|grep -o -P ".*?(?=\ )"`
#dir_num=$((x*x))
if [ $length -lt $x ]
then
i=1
mkdir dir_$i
cp $input /root/script/3_httprobe/dir_${i}/${input}
echo '#!/bin/bash' >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo 'x=$x ; input=httprobe.txt' >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo "touch dir_${i}/1.txt ; touch dir_${i}/2.txt ; touch dir_${i}/3.txt" >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo "for a in "\`cat /root/script/3_httprobe/dir_${i}/${input}\`"; do python /root/script/3_httprobe/crawler.py -u \$a -l 20 -C 5 -w ; crawl=\`echo \$a | grep -o -P \"(?=\:\/\/).*\"\` ; s=\${crawl:3} ; crawl=\$s ; if [ -s /root/script/3_httprobe/\${crawl}.crawler ]; then mv /root/script/3_httprobe/\${crawl}.crawler /root/script/3_httprobe/dir_${i}/\${crawl}.crawler ; grep  -B 10000 'Total\ urls\ crawled:'  /root/script/3_httprobe/dir_${i}/\${crawl}.crawler > /root/script/3_httprobe/dir_${i}/2.txt ; grep  -A 10000 '\ Crawling' /root/script/3_httprobe/dir_${i}/2.txt > /root/script/3_httprobe/dir_${i}/3.txt ; rm /root/script/3_httprobe/dir_${i}/2.txt ; grep -oP 'http.*' /root/script/3_httprobe/dir_${i}/3.txt > /root/script/3_httprobe/dir_${i}/2.txt ; rm /root/script/3_httprobe/dir_${i}/3.txt ; mv /root/script/3_httprobe/dir_${i}/2.txt /root/script/3_httprobe/dir_${i}/1.txt ; echo '' ; echo \$a ; echo ' ' ; cat /root/script/3_httprobe/dir_${i}/1.txt >> /root/script/3_httprobe/dir_${i}/httprobe1.txt ; sed -e '/\\+/d' /root/script/3_httprobe/dir_${i}/httprobe1.txt >> /root/script/3_httprobe/httprobe2.txt ; sed -e '/crawler/d' /root/script/3_httprobe/httprobe2.txt >> /root/script/3_httprobe/httprobe.txt ; rm /root/script/3_httprobe/httprobe2.txt ; rm /root/script/3_httprobe/dir_${i}/httprobe1.txt ; rm /root/script/3_httprobe/dir_${i}/1.txt ; rm /root/script/3_httprobe/dir_${i}/\${crawl}.crawler;fi ;done" >> /root/script/3_httprobe/dir_${i}/${i}.sh
bash /root/script/3_httprobe/dir_${i}/${i}.sh
cd /root/script/3_httprobe
rm -r /root/script/3_httprobe/dir_${i}
#wayback
for a in `cat $var`; do > 1.txt ; echo "$a" > 1.txt ; a=`cat 1.txt` ; cat 1.txt | waybackurls > 2.txt ; grep = 2.txt > 3.txt ; sed -e '/%/d' 3.txt | sed -e '/(/d' | sed -e '/)/d' | sed -e '/\/\:\/\//d' | sed -e '/\/\&/d' > 2.txt ; grep "\:\/\/$a" 2.txt > 3.txt ; rm 2.txt ; rm 1.txt ; grep -oP "$a............" 3.txt > w.txt ; sort -u w.txt -o w.txt ; for i in `cat w.txt`; do num=1 ; e=`grep "$i" 3.txt|wc -l` ; if [ $e -gt 5 ]; then grep "$i" 3.txt > r.txt ; grepv=`head -$num w.txt` ; grep -v "$grepv" 3.txt > 33.txt ; mv 33.txt 3.txt ; head -1 r.txt >> 3.txt ; rm r.txt ; fi; num=$((num+1)) ; done; rm w.txt ; wc -l httprobe.txt ; cat 3.txt >> /root/script/3_httprobe/httprobe.txt ; rm 3.txt ; done


else

for i in `seq 1 $x`
do
mkdir dir_$i
done

#切割文本
a=`wc -l $input|grep -o -P ".*?(?=\ )"`
#y=$((x-1))
each=$(($a/$x))
split -l $each  $input -d -a 3 split_

#可能多出一份文件
maybe=`ls|grep split|wc -l|grep -o -P ".*?(?=\ )"`
if [ '$maybe' != '$x' ]
then
cat split_000 >> split_00$x ; rm split_000
fi

#移动文件至对应数字目录
for i in `seq 1 $x`
do
#创建bash
mv split_00$i dir_$i/$input
echo '#!/bin/bash' >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo 'x=$x ; input=httprobe.txt' >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo "touch dir_${i}/1.txt ; touch dir_${i}/2.txt ; touch dir_${i}/3.txt" >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo "for a in "\`cat /root/script/3_httprobe/dir_${i}/${input}\`"; do python /root/script/3_httprobe/crawler.py -u \$a -l 20 -C 5 -w ; crawl=\`echo \$a | grep -o -P \"(?=\:\/\/).*\"\` ; s=\${crawl:3} ; crawl=\$s ;if [ -s /root/script/3_httprobe/\${crawl}.crawler ]; then mv /root/script/3_httprobe/\${crawl}.crawler /root/script/3_httprobe/dir_${i}/\${crawl}.crawler ; grep  -B 10000 'Total\ urls\ crawled:'  /root/script/3_httprobe/dir_${i}/\${crawl}.crawler > /root/script/3_httprobe/dir_${i}/2.txt ; grep  -A 10000 '\ Crawling' /root/script/3_httprobe/dir_${i}/2.txt > /root/script/3_httprobe/dir_${i}/3.txt ; rm /root/script/3_httprobe/dir_${i}/2.txt ; grep -oP 'http.*' /root/script/3_httprobe/dir_${i}/3.txt > /root/script/3_httprobe/dir_${i}/2.txt ; rm /root/script/3_httprobe/dir_${i}/3.txt ; mv /root/script/3_httprobe/dir_${i}/2.txt /root/script/3_httprobe/dir_${i}/1.txt ; echo '' ; echo \$a ; echo ' ' ; cat /root/script/3_httprobe/dir_${i}/1.txt >> /root/script/3_httprobe/dir_${i}/httprobe1.txt ; sed -e '/\\+/d' /root/script/3_httprobe/dir_${i}/httprobe1.txt >> /root/script/3_httprobe/httprobe2.txt ; sed -e '/crawler/d' /root/script/3_httprobe/httprobe2.txt >> /root/script/3_httprobe/httprobe.txt ; rm /root/script/3_httprobe/httprobe2.txt ; rm /root/script/3_httprobe/dir_${i}/httprobe1.txt ; rm /root/script/3_httprobe/dir_${i}/1.txt ; rm /root/script/3_httprobe/dir_${i}/\${crawl}.crawler;fi ;done" >> /root/script/3_httprobe/dir_${i}/${i}.sh
done


#执行并删除
echo '#!/bin/bash' >> exe.sh
for i in `seq 1 $x`
do
echo "bash /root/script/3_httprobe/dir_${i}/${i}.sh" >> exe.sh
done

cat exe.sh | parallel --jobs 0 --progress --delay 1

rm exe.sh

cd /root/script/3_httprobe
for i in `seq 1 $x`
do
rm -r dir_$i
done
fi

#wayback
for a in `cat $var`; do > 1.txt ; echo "$a" > 1.txt ; a=`cat 1.txt` ; cat 1.txt | waybackurls > 2.txt ; grep = 2.txt > 3.txt ; sed -e '/%/d' 3.txt | sed -e '/(/d' | sed -e '/)/d' | sed -e '/\/\:\/\//d' | sed -e '/\/\&/d' > 2.txt ; grep "\:\/\/$a" 2.txt > 3.txt ; rm 2.txt ; rm 1.txt ; grep -oP "$a............" 3.txt > w.txt ; sort -u w.txt -o w.txt ; for i in `cat w.txt`; do num=1 ; e=`grep "$i" 3.txt|wc -l` ; if [ $e -gt 5 ]; then grep "$i" 3.txt > r.txt ; grepv=`head -$num w.txt` ; grep -v "$grepv" 3.txt > 33.txt ; mv 33.txt 3.txt ; head -1 r.txt >> 3.txt ; rm r.txt ; fi; num=$((num+1)) ; done; rm w.txt ; wc -l httprobe.txt ; cat 3.txt >> /root/script/3_httprobe/httprobe.txt ; rm 3.txt ; done


sort -u /root/script/3_httprobe/httprobe.txt -o /root/script/3_httprobe/httprobe.txt
