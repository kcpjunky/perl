#!/usr/bin/perl

if ( ! open PASSWD, "ëtc/passwd") {
	die "How did you get logged in ?> ($!)";
}

while (<PASSWD>) {
	chomp;
}
