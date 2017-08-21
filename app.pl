#!/usr/bin/env perl
use Mojolicious::Lite;
use Sys::Hostname;

# I set up a global count. Probably not the most reccomended practices, but works for now.
# Also, we use the Sys:Hostname module so we can see the machine we are running on.
my $count = 0;
my $host = hostname;


get '/' => sub {
  shift->render('home/index', currentCount => $count);
};

get '/about' => sub {
  shift->render('home/about');
};

# Increments the count, and then returns it VIA JSON.
get '/increment' => sub {
  $count = ++$count;
  shift->render(json => {count => $count });
};

# We don't technically need a helper for this, but I thought it was cool and figured why not. 
app->helper(hostname => sub { 
  return $host;
}); 


app->start;