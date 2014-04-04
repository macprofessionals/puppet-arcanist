class arcanist::install_deps {
    ## PHP modules required by Arcanist
    package { [
        'php5-cli',
        'php5-curl',
        'php5-json',
    ]:
        ensure => 'installed',
    }
}
