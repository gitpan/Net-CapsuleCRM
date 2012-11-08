
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Connect to the Capsule API (www.capsulecrm.com)",
  "AUTHOR" => "Simon Elliott <cpan\@papercreatures.com>",
  "BUILD_REQUIRES" => {
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Net-CapsuleCRM",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Net::CapsuleCRM",
  "PREREQ_PM" => {
    "HTTP::Request::Common" => 0,
    "JSON::XS" => 0,
    "LWP::UserAgent" => 0,
    "Method::Signatures" => 0,
    "Moo" => 0,
    "Sub::Quote" => 0,
    "XML::Simple" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.123130",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



