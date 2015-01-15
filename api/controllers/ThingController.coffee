 # ThingController
 #
 # @description :: Server-side logic for managing things
 # @help        :: See http://links.sailsjs.org/docs/controllers

_ = require 'underscore'

ThingController =
  random: (req, res) ->
    id = req.param 'id'

    Thing.random id, 1, (err, things) ->
      return res.serverError err if err

      if _.isEmpty things
        Thing.create null, (err, thing) -> res.redirect "/thing/#{thing[0].keys}"
      else
        res.redirect "/thing/#{things[0].keys}"

  todo: (req, res) ->
    keys = req.param 'keys'
    Thing.findOne {keys: keys}, (err, thing) ->
      id = thing.id

      Thing.random id, 5, (err, things) ->
        data =
          title: 'WTH should I do today?'
          thing: thing
          things: things.map (thing) ->
            keys: thing.keys
            title: thing.keys.replace(/(-\d{4}-\w+-.*)?$/, '').replace(/-/g, ' ') + ' ...'

        res.view 'thing/todo', data

  create: (req, res) ->
    thing = req.param('data')
    Thing.create thing, (err, thing) ->
      return res.serverError err if err

      res.status 201
      res.json thing

module.exports = ThingController
