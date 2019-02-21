#!/bin/bash
#
#----------------------------------------------------------------------- 
#
# If You Want to Recode For Your Famous Popularity Reasons
# Yes You Are the really an Idiot Script Kiddie
# Just Use It And Let The Code Do The Job
# 
# Cat-Nip
#
# Automated Basic Pentest Tool
# Version : 1.0
# Coded by : Bagus Wiratma Adi
#
# Tested on : Kali Linux 
# I highly recommend using this tool by using Kali Linux OS
#
# FUCK TO ALL SCRIPT KIDDIES AND UNDERGROUND HACKER SOCIETY
#
#-----------------------------------------------------------------------
#
clear
#-------------
#First Dialog
#-------------
echo "------------------------------------------------"
echo ""
echo "[ Cat-Nip 1.0 - Automated Basic Pentest Tool ]"
echo ""
echo "This Tool Designed For Kali Linux"
echo "So If You Use Another OS"
echo "Maybe This Tool Not Working"
echo ""
echo "Coded By : Bagus Wiratma Adi"
echo ""
echo "Instagram : @baguswiratmaadi"
echo "Email : baguswiratmaadi@gmail.com"
echo ""
echo "Do not scan government and private" 
echo "IT objects without legal permission."
echo ""
echo "-----------------------------------------------------------"
echo "Enter domain of your Target Below example --> site.com "
read  A
echo "Enter path of your output files example --> /root/Desktop"
read  B
echo "Starting Scanning Procedure..."
echo ""
sleep 1
echo "You Can Sleep or Do Another Activity"
echo "This Take Few Hours For Running Scanning Procedure."
sleep 2
echo "-----------------------------------------------------------"
echo ""
#----------------------
#Information Gathering
#----------------------
#whois
echo "starting whois scanning :"
whois $A > $B/whois.txt
sleep 2
echo "whois scanning done..."
sleep 2
#dnswalk
echo "starting dnswalk scanning..." 
dnswalk $A. > $B/dnswalk.txt
sleep 2
echo "dnswalk scanning done..."
sleep 2 
#nmap
echo "starting nmap scanning..." 
nmap -v -A $A > $B/nmap.txt
sleep 2
echo "nmap scanning done..."
sleep 2
#dmitry
echo "starting dmitry scanning..."
dmitry $A > $B/dmitry.txt
echo "dmitry scanning done..."
sleep 2
#theharvester
echo "starting theharvester scanning..."
theharvester -d $A -l 500 -b google > $B/theharvester.txt
echo "theharvesterscanning done..."
sleep 2
#-----------------------------
#AUDITING
#-----------------------------
#LBD
echo "starting lbd scanning..."
lbd $A > $B/lbd.txt
echo "lbd scanning done..."
sleep 2
#SSLyze
echo "starting sslyze scanning..."
sslyze --heartbleed --sslv2 --sslv3 --tlsv1 --tlsv1_1 --tlsv1_2 --http_get $A > $B/sslyze.txt
echo "sslyze scanning done..."
sleep 2
#whatweb
echo "starting whatweb scanning..."
whatweb $A > $B/whatweb.txt
echo "whatweb scanning done..."
sleep 2
#automater
echo "starting automater scanning..."
automater -V $A > $B/automater.txt
echo "automater scanning done..."
sleep 2
#ua-tester
echo "starting ua-tester scanning..."
ua-tester -u https://$A > $B/uatester.txt
echo "ua-tester scanning done..."
sleep 2
#gobuster
echo "preparing gobuster..."
apt install gobuster
echo "gobuster ready.."
sleep 1
echo "starting gobuster scanning..."
gobuster -e -u $A -w /usr/share/wordlists/dirb/common.txt > $B/gobuster.txt
echo "gobuster scanning done..."
sleep 2
#grabber
echo "starting grabber scanning..."
grabber --spider 1 --sql --xss --url https://$A > $B/grabber.txt
echo "grabber scanning done..."
sleep 2
#parsero
echo "preparting parsero..."
apt install parsero
echo "parsero ready..."
sleep 1
echo "starting parsero scanning..."
parsero -u $A -sb > $B/parsero.txt
echo "parsero scanning done..."
sleep 2
#uniscan
echo "starting uniscan scanning..."
uniscan -u https://$A -qwedsiogj > $B/uniscan.txt
echo "uniscan scanning done..."
sleep 2
#----------
#Reporting
#----------
echo "all scanning procedure finished generating pentest report"
echo PHRpdGxlPkNhdC1OaXAgMS4wIC0gUGVudGVzdCBSZXBvcnQ8L3RpdGxlPgo8IS0tCiMgQ2F0LU5pcCAxLjAKIyBCeSBCYWd1cyBXaXJhdG1hIEFkaQotLT4KPGxpbmsgcmVsPSJpY29uIiBocmVmPSJodHRwczovL2ltYWdlLmZsYXRpY29uLmNvbS9pY29ucy9zdmcvNzQvNzQ5NjYuc3ZnIiB0eXBlPSJpbWFnZS94LWljb24iLz4KPHN0eWxlPgoqIHsKICBib3gtc2l6aW5nOiBib3JkZXItYm94Owp9Cgpib2R5IHsKICBtYXJnaW46IDA7CiAgZm9udC1mYW1pbHk6IEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7Cn0KCi8qIFN0eWxlIHRoZSBzaWRlIG5hdmlnYXRpb24gKi8KLnNpZGVuYXYgewogIGhlaWdodDogMTAwJTsKICB3aWR0aDogMjAwcHg7CiAgcG9zaXRpb246IGZpeGVkOwogIHotaW5kZXg6IDE7CiAgdG9wOiAwOwogIGxlZnQ6IDA7CiAgY29sb3I6IHdoaXRlOwogIGJhY2tncm91bmQtY29sb3I6ICMxMTE7CiAgb3ZlcmZsb3cteDogaGlkZGVuOwp9CgoKLyogU2lkZSBuYXZpZ2F0aW9uIGxpbmtzICovCi5zaWRlbmF2IGEgewogIGNvbG9yOiB3aGl0ZTsKICBwYWRkaW5nOiAxNnB4OwogIHRleHQtZGVjb3JhdGlvbjogbm9uZTsKICBkaXNwbGF5OiBibG9jazsKfQoKLyogQ2hhbmdlIGNvbG9yIG9uIGhvdmVyICovCi5zaWRlbmF2IGE6aG92ZXIgewogIGJhY2tncm91bmQtY29sb3I6ICNkZGQ7CiAgY29sb3I6IGJsYWNrOwp9CgovKiBTdHlsZSB0aGUgY29udGVudCAqLwouY29udGVudCB7CiAgbWFyZ2luLWxlZnQ6IDIwMHB4OwogIHBhZGRpbmctbGVmdDogMjBweDsKfQo8L3N0eWxlPgo8Ym9keT4KPGRpdiBjbGFzcz0ic2lkZW5hdiI+CiAgPGltZyBzcmM9Imh0dHBzOi8vaS5kYWlseW1haWwuY28udWsvaS9waXgvMjAxNy8xMS8xNi8xMi80NjY3Q0E2RDAwMDAwNTc4LTUwODg5MTMtaW1hZ2UtYS00NF8xNTEwODM1MjczNTg5LmpwZyIgaGVpZ2h0PSIyNTAiIHdpZHRoPSIyNTAiPgogIDxicj48YnI+PGhyPgogIDxjZW50ZXI+CiAgQ2F0LU5pcCAxLjA8YnI+CiAgYnkgPGJyPkJhZ3VzIFdpcmF0bWEgQWRpCiAgPC9jZW50ZXI+PGhyPgo8YnI+PGhyPgogIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWd1c3dpcmF0bWFhZGkiPkdpdGh1YjwvYT4KICA8YSBocmVmPSJodHRwczovL2luc3RhZ3JhbS5jb20vYmFndXN3aXJhdG1hYWRpIj5JbnN0YWdyYW08L2E+CiAgPGEgaHJlZj0iYmFndXN3aXJhdG1hYWRpQGdtYWlsLmNvbSI+RW1haWw8L2E+PGhyPgo8L2Rpdj4KCjxjZW50ZXI+CjxkaXYgY2xhc3M9ImNvbnRlbnQiPgoJPGltZyBzcmM9Imh0dHBzOi8vaW1hZ2UuZmxhdGljb24uY29tL2ljb25zL3N2Zy83NC83NDk2Ni5zdmciIGhlaWdodD0iODAiIHdpZHRoPSI4MCI+Cgk8aDE+UEVOVEVTVCBSRVBPUlQ8L2gxPgoJQ2F0LU5pcCAxLjAKCTxicj4KCUNvZGVkIGJ5IDogQmFndXMgV2lyYXRtYSBBZGkKCTxicj4KCTxicj4KCVVzaW5nIHRoaXMgdG9vbCBtZWFucyB0aGF0IHlvdSBoYXZlIGFncmVlZCBvbiBnb3Zlcm5tZW50IHJlZ3VsYXRpb25zIHJlZ2FyZGluZyBpbmZvcm1hdGlvbiwgdGVjaG5vbG9neSwgYW5kIGNvbW11bmljYXRpb24uIAoJPGJyPkFueSB2aW9sYXRpb24gb2YgdGhlIGxhdyBhbmQgdGhlIHVzZSBvZiB0aGlzIHRvb2wgYXJlIGJvcm5lIGJ5IHlvdSBhbG9uZSBhbmQgYWxsIHJpc2tzIGFyZSBib3JuZSBieSB5b3Vyc2VsZi4gCgk8YnI+VGhlIHRvb2wgY29kZSB3cml0ZXIgaXMgbm90IHJlc3BvbnNpYmxlIGZvciBhbnl0aGluZyB0aGF0IGhhcHBlbnMuCgk8YnI+PGJyPjxiPkRvIG5vdCBzY2FuIGdvdmVybm1lbnQgYW5kIHByaXZhdGUgSVQgb2JqZWN0cyB3aXRob3V0IGxlZ2FsIHBlcm1pc3Npb24uPC9iPgoJPGJyPgoJPGJyPgoJPGhyPgoJPGltZyBzcmM9Imh0dHBzOi8vc3RhdGljLnRoZW5vdW5wcm9qZWN0LmNvbS9wbmcvNzU2MzYzLTIwMC5wbmciIGhlaWdodD0iNTAiIHdpZHRoPSI1MCI+PGJyPgoJV2hvaXMgU2Nhbm5pbmcgT3V0cHV0PGJyPjxicj4KCTxpZnJhbWUgc3JjPSJ3aG9pcy50eHQiIGhlaWdodD0iNTAwIiB3aWR0aD0iODAwIj48L2lmcmFtZT4gPGJyPjxicj4KCTxocj4KCTxpbWcgc3JjPSJodHRwczovL3N0YXRpYy50aGVub3VucHJvamVjdC5jb20vcG5nLzc1NjM2My0yMDAucG5nIiBoZWlnaHQ9IjUwIiB3aWR0aD0iNTAiPjxicj4KICAgIE5tYXAgU2Nhbm5pbmcgT3V0cHV0PGJyPjxicj4KCTxpZnJhbWUgc3JjPSJubWFwLnR4dCIgaGVpZ2h0PSI1MDAiIHdpZHRoPSI4MDAiPjwvaWZyYW1lPiA8YnI+PGJyPgoJPGhyPgoJPGltZyBzcmM9Imh0dHBzOi8vc3RhdGljLnRoZW5vdW5wcm9qZWN0LmNvbS9wbmcvNzU2MzYzLTIwMC5wbmciIGhlaWdodD0iNTAiIHdpZHRoPSI1MCI+PGJyPgogICAgIEROU1dhbGsgT3V0cHV0PGJyPjxicj4KCTxpZnJhbWUgc3JjPSJkbnN3YWxrLnR4dCIgaGVpZ2h0PSI1MDAiIHdpZHRoPSI4MDAiPjwvaWZyYW1lPiA8YnI+PGJyPgoJPGhyPgoJPGltZyBzcmM9Imh0dHBzOi8vc3RhdGljLnRoZW5vdW5wcm9qZWN0LmNvbS9wbmcvNzU2MzYzLTIwMC5wbmciIGhlaWdodD0iNTAiIHdpZHRoPSI1MCI+PGJyPgogICAgIERtaXRyeSBPdXRwdXQ8YnI+PGJyPgoJPGlmcmFtZSBzcmM9ImRtaXRyeS50eHQiIGhlaWdodD0iNTAwIiB3aWR0aD0iODAwIj48L2lmcmFtZT4gPGJyPjxicj4KCTxocj4KCTxpbWcgc3JjPSJodHRwczovL3N0YXRpYy50aGVub3VucHJvamVjdC5jb20vcG5nLzc1NjM2My0yMDAucG5nIiBoZWlnaHQ9IjUwIiB3aWR0aD0iNTAiPjxicj4KICAgICBUaGVoYXJ2ZXN0ZXIgT3V0cHV0PGJyPjxicj4KCTxpZnJhbWUgc3JjPSJ0aGVoYXJ2ZXN0ZXIudHh0IiBoZWlnaHQ9IjUwMCIgd2lkdGg9IjgwMCI+PC9pZnJhbWU+IDxicj48YnI+Cgk8aHI+Cgk8aW1nIHNyYz0iaHR0cHM6Ly9zdGF0aWMudGhlbm91bnByb2plY3QuY29tL3BuZy83NTYzNjMtMjAwLnBuZyIgaGVpZ2h0PSI1MCIgd2lkdGg9IjUwIj48YnI+CiAgICAgTEJEIE91dHB1dDxicj48YnI+Cgk8aWZyYW1lIHNyYz0ibGJkLnR4dCIgaGVpZ2h0PSI1MDAiIHdpZHRoPSI4MDAiPjwvaWZyYW1lPiA8YnI+PGJyPgoJPGhyPgoJPGltZyBzcmM9Imh0dHBzOi8vc3RhdGljLnRoZW5vdW5wcm9qZWN0LmNvbS9wbmcvNzU2MzYzLTIwMC5wbmciIGhlaWdodD0iNTAiIHdpZHRoPSI1MCI+PGJyPgogICAgIFNTTHl6ZSBPdXRwdXQ8YnI+PGJyPgoJPGlmcmFtZSBzcmM9InNzbHl6ZS50eHQiIGhlaWdodD0iNTAwIiB3aWR0aD0iODAwIj48L2lmcmFtZT4gPGJyPjxicj4KCTxocj4KCTxpbWcgc3JjPSJodHRwczovL3N0YXRpYy50aGVub3VucHJvamVjdC5jb20vcG5nLzc1NjM2My0yMDAucG5nIiBoZWlnaHQ9IjUwIiB3aWR0aD0iNTAiPjxicj4KICAgICBXaGF0d2ViIE91dHB1dDxicj48YnI+Cgk8aWZyYW1lIHNyYz0id2hhdHdlYi50eHQiIGhlaWdodD0iNTAwIiB3aWR0aD0iODAwIj48L2lmcmFtZT4gPGJyPjxicj4KCTxocj4KCTxpbWcgc3JjPSJodHRwczovL3N0YXRpYy50aGVub3VucHJvamVjdC5jb20vcG5nLzc1NjM2My0yMDAucG5nIiBoZWlnaHQ9IjUwIiB3aWR0aD0iNTAiPjxicj4KICAgICBBdXRvbWF0ZXIgT3V0cHV0PGJyPjxicj4KCTxpZnJhbWUgc3JjPSJhdXRvbWF0ZXIudHh0IiBoZWlnaHQ9IjUwMCIgd2lkdGg9IjgwMCI+PC9pZnJhbWU+IDxicj48YnI+Cgk8aHI+Cgk8aW1nIHNyYz0iaHR0cHM6Ly9zdGF0aWMudGhlbm91bnByb2plY3QuY29tL3BuZy83NTYzNjMtMjAwLnBuZyIgaGVpZ2h0PSI1MCIgd2lkdGg9IjUwIj48YnI+CiAgICAgVUEtVGVzdGVyIE91dHB1dDxicj48YnI+Cgk8aWZyYW1lIHNyYz0idWF0ZXN0ZXIudHh0IiBoZWlnaHQ9IjUwMCIgd2lkdGg9IjgwMCI+PC9pZnJhbWU+IDxicj48YnI+Cgk8aHI+Cgk8aW1nIHNyYz0iaHR0cHM6Ly9zdGF0aWMudGhlbm91bnByb2plY3QuY29tL3BuZy83NTYzNjMtMjAwLnBuZyIgaGVpZ2h0PSI1MCIgd2lkdGg9IjUwIj48YnI+CiAgICAgR29idXN0ZXIgT3V0cHV0PGJyPjxicj4KCTxpZnJhbWUgc3JjPSJnb2J1c3Rlci50eHQiIGhlaWdodD0iNTAwIiB3aWR0aD0iODAwIj48L2lmcmFtZT4gPGJyPjxicj4KCTxocj4KCTxpbWcgc3JjPSJodHRwczovL3N0YXRpYy50aGVub3VucHJvamVjdC5jb20vcG5nLzc1NjM2My0yMDAucG5nIiBoZWlnaHQ9IjUwIiB3aWR0aD0iNTAiPjxicj4KICAgICBHcmFiYmVyIE91dHB1dDxicj48YnI+Cgk8aWZyYW1lIHNyYz0iZ3JhYmJlci50eHQiIGhlaWdodD0iNTAwIiB3aWR0aD0iODAwIj48L2lmcmFtZT4gPGJyPjxicj4KCTxocj4JCgk8aW1nIHNyYz0iaHR0cHM6Ly9zdGF0aWMudGhlbm91bnByb2plY3QuY29tL3BuZy83NTYzNjMtMjAwLnBuZyIgaGVpZ2h0PSI1MCIgd2lkdGg9IjUwIj48YnI+CiAgICAgUGFyc2VybyBPdXRwdXQ8YnI+PGJyPgoJPGlmcmFtZSBzcmM9InBhcnNlcm8udHh0IiBoZWlnaHQ9IjUwMCIgd2lkdGg9IjgwMCI+PC9pZnJhbWU+IDxicj48YnI+Cgk8aHI+CQoJPGltZyBzcmM9Imh0dHBzOi8vc3RhdGljLnRoZW5vdW5wcm9qZWN0LmNvbS9wbmcvNzU2MzYzLTIwMC5wbmciIGhlaWdodD0iNTAiIHdpZHRoPSI1MCI+PGJyPgogICAgIFVuaXNjYW4gT3V0cHV0PGJyPjxicj4KCTxpZnJhbWUgc3JjPSJ1bmlzY2FuLnR4dCIgaGVpZ2h0PSI1MDAiIHdpZHRoPSI4MDAiPjwvaWZyYW1lPiA8YnI+PGJyPgoJPGhyPgoJPC9jZW50ZXI+Cgk8YnI+Cgk8YnI+Cgk8aHI+Cgk8YnI+PGJyPgoJPGNlbnRlcj5DYXQtTmlwIDEuMCA8YnI+Q29weXJpZ2h0IDogQmFndXMgV2lyYXRtYSBBZGkgPGJyPlJlY29kZSBJcyBPbmx5IEZvciBTdHVwaWQgUGVvcGxlIEFuZCBSZWNvZGUgRG9lc24ndCBNYWtlIFlvdSBBIFJlYWwgQ29kZXI8YnI+PGJyPjwvY2VudGVyPgoJPGhyPgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg== | base64 --decode  > $B/report.html
sleep 1
echo "report generated"
sleep 2
echo "pentest finished good job."
echo "-----------------------------------"
echo "| Cat-Nip 1.0 x Bagus Wiratma Adi |"
echo "-----------------------------------"
