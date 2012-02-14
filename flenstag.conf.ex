# Howto search for photos to be tagged? The user_id can be retrieved
# using the Flickr API explorer:
# http://www.flickr.com/services/api/explore/flickr.people.findByUsername
$flickr_search_req = 'flickr.photos.search';
$flickr_search_arg = {
    user_id => '61323542@N05',
    per_page => 500
};

# Add (min|max)_upload_date field to $flickr_search_arg?
#  undef: just try to tag any we get (but not more than 500 pics)
#  min  : update new uploads only (related to last flenstag call)
#  max  : update old uploads only (related to last flenstag call)
$flickr_search_upload_date = 'min';


# Which EXIF fields should become tags?
@exif_tags = qw(Model LensModel Lens ISO FocalLength ExposureTime FNumber);

# Regex pattern converting lens strings.
my $lens = {
	# Canon EF-S Lenses
	'^(EF\D+)(\d.+)' => 'Canon $1 $2'
};

# Regex patterns, used to transform EXIF fields into tag string.
%format_tags = (
    Lens => $lens,
    LensModel => $lens,
    ISO => {'(\d+)' => 'ISO $1'},
    FocalLength => {'(\d+)(\.\d+)? mm' => '$1 mm'},
    ExposureTime => {'([\d\/.]+)' => '$1 s'},
    FNumber => {'([\d.]+)' => 'f\/$1'},
);
