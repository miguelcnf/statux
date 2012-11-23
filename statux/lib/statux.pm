package statux;

use statux::Gamercard;
use Dancer ':syntax';

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

get '/gamercard/:gamertag' => sub {
    # access param('gamertag')
    my $gamercard = statux::Gamercard->new(
    	gamertag => param('gamertag'),
	);
    
    content_type 'application/json';
	return $gamercard->json();
};

true;
