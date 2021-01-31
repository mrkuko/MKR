fx_version 'bodacious'
game 'gta5'

author 'mr__Kuko'
description 'custom race events'
version 'v0.8 beta'
dependencies{
    'es_extended'
}

client_scripts{
    '@es_extended/locale.lua',
    'client/*.lua',
    'locales/*.lua',
    'config.lua'
}
server_scripts{
    '@es_extended/locale.lua',
    'server/*.lua',
    'locales/*.lua',
    'config.lua'
}