package Todo::Model::Schema;

use strict;
use warnings;
use Teng::Schema::Declare;
use DateTime;
use DateTime::Format::MySQL;

table {
    name 'todos';
    pk 'id';
    columns qw / id text due_at done created_at updated_at /;
    inflate '^.+_at$' => sub {
	return (@_) ? DateTime::Format::MySQL->parse_datetime(shift) : undef;
    };
    deflate '^.+_at$' => sub {
	DateTime::Format::MySQL->format_datetime(shift);
    };
};

1;
