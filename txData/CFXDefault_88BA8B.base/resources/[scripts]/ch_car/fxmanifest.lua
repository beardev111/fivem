fx_version  'cerulean'
game        'gta5'
lua54       'yes'

client_scripts {
    'client/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
}