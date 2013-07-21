package BlogStatDataAPI::Plugin;

use strict;

use MT::DataAPI::Endpoint::Common;

sub blogstat {
    my ( $app, $endpoint ) = @_;

    # load blog
    my ($blog) = context_objects(@_)
        or return;

    # count entries of blog
    my $entry_count = MT->model('entry')->count({
        blog_id => $blog->id,
        status => MT::Entry::RELEASE,
    });

    # return info
    return {
        id => $blog->id,
        name => $blog->name,
        description => $blog->description,
        url => $blog->site_url,
        entry_count => $entry_count,
    };
}

1;
