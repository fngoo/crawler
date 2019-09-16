#!/bin/bash

#创建目录
x=8 ; input=httprobe.txt ; export x=8 ; export input=httprobe.txt
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
echo "for a in "\`cat /root/script/3_httprobe/dir_${i}/${input}\`"; do python /root/script/3_httprobe/crawler.py -u \$a -l 20 -C 5 -w ; crawl=\`echo \$a | grep -o -P \"(?=\:\/\/).*\"\` ; s=\${crawl:3} ; crawl=\$s ; mv /root/script/3_httprobe/\${crawl}.crawler /root/script/3_httprobe/dir_${i}/\${crawl}.crawler ; grep  -B 10000 'Total\ directories:'  /root/script/3_httprobe/dir_${i}/\${crawl}.crawler > /root/script/3_httprobe/dir_${i}/2.txt ; grep  -A 10000 'Directories\ found' /root/script/3_httprobe/dir_${i}/2.txt > /root/script/3_httprobe/dir_${i}/3.txt ; rm /root/script/3_httprobe/dir_${i}/2.txt ; grep -oP 'http.*' /root/script/3_httprobe/dir_${i}/3.txt > /root/script/3_httprobe/dir_${i}/2.txt ; rm /root/script/3_httprobe/dir_${i}/3.txt ; mv /root/script/3_httprobe/dir_${i}/2.txt /root/script/3_httprobe/dir_${i}/1.txt ; echo '' ; echo \$a ; echo ' ' ; cat /root/script/3_httprobe/dir_${i}/1.txt >> /root/script/3_httprobe/dir_${i}/httprobe1.txt ; sed -e '/\\+/d' /root/script/3_httprobe/dir_${i}/httprobe1.txt >> /root/script/3_httprobe/httprobe2.txt ; sed -e '/crawler/d' /root/script/3_httprobe/httprobe2.txt >> /root/script/3_httprobe/httprobe.txt ; rm /root/script/3_httprobe/httprobe2.txt ; rm /root/script/3_httprobe/dir_${i}/httprobe1.txt ; rm /root/script/3_httprobe/dir_${i}/1.txt ; rm /root/script/3_httprobe/dir_${i}/\${crawl}.crawler; done" >> /root/script/3_httprobe/dir_${i}/${i}.sh
done


#执行并删除
echo '#!/bin/bash' >> exe.sh
for i in `seq 1 $x`
do
echo "bash /root/script/3_httprobe/dir_${i}/${i}.sh" >> exe.sh
done

cat exe.sh | parallel --jobs 0 --progress --delay 1

cd /root/script/3_httprobe
for i in `seq 1 $x`
do
rm -r dir_$i
done

sort -u /root/script/3_httprobe/httprobe.txt -o /root/script/3_httprobe/httprobe.txt ; rm exe.sh
