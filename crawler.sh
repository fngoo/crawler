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
echo "for a in "\`cat /root/script/3_httprobe/dir_${i}/${input}\`"; do python /root/script/3_httprobe/crawler.py -u \$a -l 120 -C 12 -w ; crawl=\`echo \$a | grep -o -P \"(?=\:\/\/).*\"\` ; s=\${crawl:3} ; crawl=\$s ;if [ -s /root/script/3_httprobe/\${crawl}.crawler ]; then mv /root/script/3_httprobe/\${crawl}.crawler /root/script/3_httprobe/dir_${i}/\${crawl}.crawler ; grep  -B 10000 'Total\ urls\ crawled:'  /root/script/3_httprobe/dir_${i}/\${crawl}.crawler > /root/script/3_httprobe/dir_${i}/2.txt ; grep  -A 10000 '\ Crawling' /root/script/3_httprobe/dir_${i}/2.txt > /root/script/3_httprobe/dir_${i}/3.txt ; rm /root/script/3_httprobe/dir_${i}/2.txt ; grep -oP 'http.*' /root/script/3_httprobe/dir_${i}/3.txt > /root/script/3_httprobe/dir_${i}/2.txt ; rm /root/script/3_httprobe/dir_${i}/3.txt ; mv /root/script/3_httprobe/dir_${i}/2.txt /root/script/3_httprobe/dir_${i}/1.txt ; echo '' ; echo \$a ; echo ' ' ; cat /root/script/3_httprobe/dir_${i}/1.txt >> /root/script/3_httprobe/dir_${i}/httprobe1.txt ; sed -e '/\\+/d' /root/script/3_httprobe/dir_${i}/httprobe1.txt >> /root/script/3_httprobe/httprobe.txt ; rm /root/script/3_httprobe/dir_${i}/httprobe1.txt ; rm /root/script/3_httprobe/dir_${i}/1.txt ; rm /root/script/3_httprobe/dir_${i}/\${crawl}.crawler;fi ;done" >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo "cd /root/script/3_httprobe ; wc -l httprobe.txt ; rm -r /root/script/3_httprobe/dir_${i}" >> /root/script/3_httprobe/dir_${i}/${i}.sh
echo "bash /root/script/3_httprobe/dir_$i/${i}.sh" >> /root/script/3_httprobe/exe.sh
i=$((i+1))

done
cat /root/script/3_httprobe/exe.sh | parallel --jobs 0 --delay 0.5 --timeout 360
rm /root/script/3_httprobe/exe.sh

rm dir_* -r
rm *.crawler

#wayback
#for a in `cat $var`; do > 1.txt ; echo "$a" > 1.txt ; a=`cat 1.txt` ; cat 1.txt | waybackurls -no-subs > 2.txt ; grep = 2.txt > 3.txt ; sed -e '/%/d' 3.txt | sed -e '/(/d' | sed -e '/)/d' | sed -e '/\/\:\/\//d' | sed -e '/\/\&/d' > 2.txt ; grep "\:\/\/$a" 2.txt > 3.txt ; rm 2.txt ; rm 1.txt ; grep -oP "$a............" 3.txt > w.txt ; sort -u w.txt -o w.txt ; for i in `cat w.txt`; do e=`grep "$i" 3.txt|wc -l` ; if [ $e -gt 5 ]; then grep "$i" 3.txt > r.txt ; grepv=$i ; grep -v "$grepv" 3.txt > 33.txt ; mv 33.txt 3.txt ; head -1 r.txt >> 3.txt ; rm r.txt ; fi; done; rm w.txt ; wc -l httprobe.txt ; cat 3.txt >> /root/script/3_httprobe/httprobe.txt ; rm 3.txt ; done
for line in `cat $var`
do
echo $line | waybackurls -no-subs | sort -u >> 1.txt
sleep 6
grep "=http" 1.txt >> 2.txt
grep "=aHR0" 1.txt >> 2.txt
grep -P "\w+\.Administration(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.AppleDB(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.AppleDesktop(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.AppleDouble(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.BAK(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.CSV(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.CVS(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ControllerServlet(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.DS_Store(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.DefaultErrorReporter(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.FBCIndex(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.FormServlet(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.InvokerServlet(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.LOCAL(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.json(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.LOG(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.LSOverride(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.MF(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.NewsServlet(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.PHP(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.SimpleFileServlet(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.SyncID(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.SyncIgnore(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.Trash(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.Trashes(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.UncaughtServletException(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.WebAppErrorReport(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.XSQLServlet(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.access(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.action(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.actionScriptProperties(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.additional(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.addressbook(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.adjunct(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.adm(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.admin(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.apdisk(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.asa(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.asax(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ascx(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.asmx(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.asp(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.aspx(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.axd(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.axd::$DATA(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.axd?d=LER8t9aS(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.babelrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.backup(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bak(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bak1(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bakup(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bas(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bash_history(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bash_logout(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bash_profile(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bashrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bat(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bower-cache(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bower-registry(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bower-tmp(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.build(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.buildpath(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.html(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htm(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.builds(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bundle(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bz2(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.bzr(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.c9(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.c9revisions(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cache(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.capistrano(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cfg(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cfm(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cg(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cgi(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.checkstyle(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.chm(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.class(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.classpath(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cobalt(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.codeintel(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.codekit(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.codekit-cache(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.codio(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.coffee(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.com(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.compile(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.composer(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.conf(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.config(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.config::$DATA(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.contracts(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.core(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.coverage(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cpan(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cpanel(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cpp(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cproject(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.crt(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cs(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cshrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.csproj(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.csv(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ctp(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cvs(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.cvsignore(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.dat(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.data(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.db(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.default(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.deployignore(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.desktop(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.dev(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.directory(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.dist(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.dll(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.dll?1234=X(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.dll?http(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.do(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.domain(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.dump(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.eclipse(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.editorconfig(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.egg-info(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.elasticbeanstalk(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.elb(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.elc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.empty-folder(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.en(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.env(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.environment(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.epc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.err(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.error_log(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.eslintignore(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.eslintrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.espressostorage(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.esproj(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.event(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.events(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ex(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.example(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.exe(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.exe?(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.exe?2,2(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.exe?_vti_rpc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.external(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.externalToolBuilders(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.fcgi(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.fhp(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.filemgr-tmp(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.filezilla(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.flac(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.flag(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.flag2(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.flexLibProperties(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.flexProperties(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.flowconfig(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.fontconfig(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.forward(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ftp-access(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ftppass(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ftpquota(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gbent(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gem(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gfclient(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.git(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.git-rewrite(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.git2(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.git_release(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gitattributes(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gitconfig(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gitignore(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gitignore_global(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gitignore~(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gitk(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gitkeep(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gitmodules(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gitreview(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.global(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.grc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.grunt(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gui(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.gz(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.hash(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.hg(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.hgignore(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.hgrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.history(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.hta(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htaccess(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htaccess-dev(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htaccess-local(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htaccess-marco(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htaccessBAK(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htaccessOLD(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htaccessOLD2(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htaccess_extra(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htaccess_orig(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htaccess_sc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htaccess~(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htgroup(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htpasswd(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htpasswd-old(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htpasswd_test(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htpasswds(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htpasswrd(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htr(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htusers(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.htw(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.idea(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.idea0(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.idea_modules(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ignore(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ignored(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.inc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.inc~(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.info(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ini(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ini_(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ini~(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.inst(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.install(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.java(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.joe_state(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.jpilot(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.jscsrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.jshintignore(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.jshintrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.jsp(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.keep(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.key(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.komodotools(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ksh_history(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.lesshst(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.letter(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.listing(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.listings(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.live(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.lnk(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.loadpath(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.local(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.localRemote(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.localcache(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.localeapp(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.lock(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.lock-wscript(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.log(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.login(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.login_conf(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.logs(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.lynx_cookies(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.magentointel-cache(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.mail_aliases(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.mailrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.maintenance(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.maintenance2(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.manifest(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.mc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.md(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.md5(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.mdb(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.me(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.members(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.memdump(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.meta(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.metadata(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.mf(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.modgit(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.modman(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.modules(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.msi(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.mvc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.mweval_history(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.mwsql_history(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.mysql(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.mysql_history(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.nano_history(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.nbproject(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.net(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.netrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.netrwhist(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.nodelete(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.npmignore(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.npmrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.nsconfig(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.nsf(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.nuget(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.old(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.oldsnippets(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.oldstatic(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.org-id-locations(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.orig(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ost(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.out(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.pac(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.page(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.pass(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.passes(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.passwd(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.password(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.passwords(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.passwrd(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.patches(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.perf(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.pgp(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.pgsql(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.pgsql_history(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.phar(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.php#xxe(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.php(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.php-bak(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.php-eb(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.php-ini(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.php-version(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.php2(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.php3(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.php4(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.php5(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.php?(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.php_history(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.phpintel(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.phptidy-cache(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.phpunit(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.phpversion(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.php~(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.phtml(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.pki(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.pl(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.placeholder(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.policy(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.portal(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ppk(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.printer(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.procmailrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.profile(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.project(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.projectOptions(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.prop(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.properties(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.psql_history(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.psqlrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.pst(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.pub(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.pwd(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.py(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.pyc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.pydevproject(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.python-eggs(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.qqestore(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.rar(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.raw(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.rb(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.rbtp(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.rdb(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.rdf(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.rdsTempFiles(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.readme(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.reg(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.require(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.revision(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.rhosts(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.rm(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.rsync-filter(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.rsync_cache(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ru(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ruby-gemset(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ruby-version(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.rvmrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.s3backupstatus(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sample(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sass-cache(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.save(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.selected_editor(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ser(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.server-info(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.server-status(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sessions(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.settings(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sh(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sh_history(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.shrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.shtm(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.shtml(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.skr(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sln(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.smileys(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.smushit-status(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sock(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.spamassassin(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sql(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sqlite(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sqlite3(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sqlite_history(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.srf(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.ssh(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.st_cache(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.stats(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sublime-project(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sublime-workspace(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.subversion(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sucuriquarantine(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sunw(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.svn(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.svnignore(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.sw(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.swf(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.swo(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.swp(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.synthquota(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.system(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.system:type=ServerInfo(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.tags(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.tags_sorted_by_file(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.tar(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.tconn(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.temp(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.template(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.tgitconfig(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.tgz(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.thumbs(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.tmp(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.tmpl(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.tmproj(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.tox(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.tpl(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.traceout(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.tsv(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.tx(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.txt~(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.vagrant(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.valout(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.vb(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.version(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.vgextensions(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.viminfo(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.vimrc(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.vmachine(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.wadl(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.wci(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.web(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.well-known(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.woa(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.workspace(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.www_acl(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.wwwacl(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.x(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.xls(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.xml(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.xsl(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.yml(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.yml_original(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.yml~(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.zfs(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.zip(\?|$)" 1.txt >> 2.txt
grep -P "\w+\.zsh_history(\?|$)" 1.txt >> 2.txt
rm 1.txt
vl -t 15 -s 50 2.txt | grep -v "\[50" | grep -oP "http.*" >> /root/script/3_httprobe/httprobe.txt
vl=`ps -A | grep vl | awk '{print $1}' | sed 's/[[:space:]]//g'`
for line in $vl
do
kill -9 $line
done
rm 2.txt
done






sort -u /root/script/3_httprobe/httprobe.txt -o /root/script/3_httprobe/httprobe.txt
shuf /root/script/3_httprobe/httprobe.txt -o /root/script/3_httprobe/httprobe1.txt ; mv /root/script/3_httprobe/httprobe1.txt /root/script/3_httprobe/httprobe.txt
ls ; wc -l $input
date "+%Y-%m-%d_%H:%M:%S" >> /root/date.txt ; echo 'crawler' >> /root/date.txt
exit
