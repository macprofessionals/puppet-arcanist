class arcanist::install_deps {
    # PHP modules have a virtual dependency on some kind of PHP implementation.
    # php5-cli must be installed before any php modules so that some other PHP
    # implementation (fpm, mod_php, ...) isn't installed instead.
    package { 'php5-cli':
        ensure => installed,
    } ->
    ## PHP modules required by Arcanist
    package { [
        'php5-curl',
        'php5-json',
    ]:
        ensure => 'installed',
    }
}
