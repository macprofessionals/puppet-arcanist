class arcanist (
    $libphutil_path = '/usr/local/src/libphutil',
    $arcanist_path = '/usr/local/src/arcanist',
) {
    anchor { 'arcanist::begin': } ->
    class { 'arcanist::install_deps': } ->
    class { 'arcanist::install': } ->
    anchor { 'arcanist::end': }
}
