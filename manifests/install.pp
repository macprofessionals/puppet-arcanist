class arcanist::install (
    $libphutil_path = '/usr/local/src/libphutil',
    $arcanist_path = '/usr/local/src/arcanist',
) {
    include 'git'

    vcsrepo { $libphutil_path:
        ensure => 'present',
        provider => 'git',
        source => 'git://github.com/facebook/libphutil.git',
    }

    vcsrepo { $arcanist_path:
        ensure => 'present',
        provider => 'git',
        source => 'git://github.com/facebook/arcanist.git',
    }

    file { '/usr/local/bin/arc':
        ensure => 'link',
        owner => 'root',
        group => 'root',
        mode => '0755',
        target => "${arcanist_path}/bin/arc",
    }
}
