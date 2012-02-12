# Flickr API authentication stuff
$flickr_key = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$flickr_sec = 'XXXXXXXXXXXXXXXX';
$flickr_auth_token = '';

# Howto search for photos to be tagged?
$flickr_search_req = 'flickr.photos.search';
$flickr_search_arg = {user_id => '61323542@N05'};

# Which EXIF fields should become tags?
@exif_tags = qw(Model LensModel Lens);

# Regex pattern converting lens strings.
my $lens = {
	# Canon EF-S Lenses
	'^(EF\D+)(\d.+)' => 'Canon $1 $2'
};

# Regex patterns, used to transform EXIF fields into tag string.
%format_tags = (
    Lens => $lens,
    LensModel => $lens
);
