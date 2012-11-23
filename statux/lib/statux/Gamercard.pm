package statux::Gamercard;

use strict;
use LWP::UserAgent;

sub new {
    my($class, %args) = @_;
	my $self = bless({}, $class);

	my $gamertag = $args{gamertag}; if(!$gamertag){die "You must provide a gamertag argument on $class!\n";}
    
    # make request
	my $http = LWP::UserAgent->new;
	my $api_url = "http://www.xboxleaders.com/api/profile.json?gamertag=$gamertag";

	# create a user agent object
	$http->agent("LWP-Client/0.1 ");

	# Create a request
	my $http_req = HTTP::Request->new(GET => $api_url);
	$http_req->content_type("application/x-www-form-urlencoded");
    
	# Pass request to the user agent and get a response back
	my $http_res = $http->request($http_req);

	# Check the outcome of the response
	if ($http_res->is_success) {
		$self->{gamertag} = $http_res->content;
	}
	else {
		# something
	}

	return $self;
}

sub json {
    my $self = shift;
    return $self->{gamertag};
}

1;