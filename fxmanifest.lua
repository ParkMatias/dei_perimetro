fx_version 'cerulean'
games { 'gta5' }

author 'Dei'
description 'Script de marcado de perímetro'

lua54 'yes'

shared_scripts {
    'config.lua'
}

client_script 'client/*.lua'
server_script 'server/*.lua'

escrow_ignore {
    'config.lua'
}