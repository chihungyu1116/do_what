# todo

a [Sails](http://sailsjs.org) application

# list of plugins used
1. node-inspector, a[Node-Inspector](https://github.com/node-inspector/node-inspector)
2. forever
3. coffee-script, a[Coffee-Script](https://www.npmjs.com/package/coffee-script)
4. underscore, a[Underscore](http://underscorejs.org/)

# development

to start server
$ forever -w start app.js

to log server
$ forever logs app.js -f

to stop server
$ forever stop app.js

to check a list of server running
$ forever list

# debug
$ sails debug
