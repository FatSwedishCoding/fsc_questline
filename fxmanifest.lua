fx_version 'adamant'
game 'gta5'


description 'Makkie Questline'

version '1.5.2'

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'server.lua'
}

client_scripts {
  'config.lua',
  'client.lua'
}
