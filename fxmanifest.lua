fx_version 'cerulean'
games { 'gta5' }

author 'Dei'
description 'Script de marcado de perímetro'
version '1.1'
lua54 'yes'

shared_scripts {
    'config.lua'
}

client_script 'client/client.lua'
server_script 'server/server.lua'

escrow_ignore {
    'config.lua'
}