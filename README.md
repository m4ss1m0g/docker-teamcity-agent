# Teamcity Agent with NodeJs

Contains the image for TeamCity Agent with

- NVM 0.37.2
- NodeJS 12.13.0
- Yarn (latest) 1.22.5

The official [jetbrains/teamcity-agent image](https://hub.docker.com/r/jetbrains/teamcity-agent) contains the .NET Core SDK and other stuff.
This image add nodejs via nvm and yarn.

If you change the node version via nvm command you must also launch the /root/.nvm/update-link.sh to generate the symlink for node and npm on /usr/bin, otherwise on agent startup log you find the error

| node not found.

Install the plugin TeamCity.Node in the TeamCity server for interact with Node and Yarn
