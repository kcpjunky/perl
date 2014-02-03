#!/usr/bin/perl

use strict;
use Socket;

my $host = 'www.cs.gunma-u.ac.jp';

my $port = getservbyname('http', 'tcp');

my $iaddr = inet_aton($host)
	or die "$hostは存在しないほすt　\n";

my $sock_addr = pack_sockaddr_in($port,$iaddr);

socket(SOCKET,PF_INET,SOCK_STREAM,0)
	or die "cannnot create socket \n";

connect(SOCKET,$sock_addr)
	or die "cannot connect to $host port $port";

select(SOCKET);  $|=1;select(STDOUT);


print SOCKET "GET /index.html HTTP/1.0\r\n";

print SOCKET "\r\n";


while(<SOCKET>) {
	m/ˆˆ\r\n$/ and last;
}

while(<SOCKET>){
	print $_;
}
