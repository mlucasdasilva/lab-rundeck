

# Docker RUNDECK


refs.:

https://github.com/rundeck/rundeck

https://computingforgeeks.com/install-and-configure-rundeck-on-ubuntu-18-04-lts/



Configurar winrm no servidor windows

Ativar serviço winrm

Desativar firewall


https://docs.microsoft.com/en-us/windows/desktop/winrm/installation-and-configuration-for-windows-remote-management

Winrm quickconfig

winrm quickconfig -transport:http


https://github.com/rundeck-plugins/rundeck-winrm-plugin/issues/18


This could be a permissions issue, e.g. make sure to add the user to the Administrators group on the windows server.

make sure you do this winrm set winrm/config/service/Auth @{Basic="true"} on the windows node

make sure you do this winrm set winrm/config/service @{AllowUnencrypted="true"} on the windows node


To help verify your winrm config, paste the output from this command winrm g winrm/config







No rundeck - Node configuration:


vmwin1:
  description: 'Servidor de Aplicacao de Desenvolvimento'
  hostname: '192.168.56.102:5985'
  nodename: 'vmwin1 - DSV'
  osArch: 'x86_64'
  osFamily: 'windows'
  osName: 'Microsoft Windows Server 2008'
  osVersion: 'Microsoft Windows Server 2008'
  username: 'Administrator'
  connectionType: 'WINRM_NATIVE'
  tags: 'dsv'
  node-executor: 'overthere-winrm'
  winrm-protocol: 'http'
  winrm-auth-type: 'basic'
  winrm-cmd: 'cmd'


