 # ThingController
 #
 # @description :: Server-side logic for managing things
 # @help        :: See http://links.sailsjs.org/docs/controllers

_ = require 'underscore'

ThingController =
  none: (req, res) ->
    Thing.random (err, thing) =>
      return res.serverError err if err

      if _.isEmpty thing
        Thing.create null, (err, thing) -> res.redirect "/thing/#{thing.title}"
      else
        res.redirect "/thing/#{thing.title}"

  todo: (req, res) ->
    title = req.param 'title'
    Thing.findOne {title: title}, (err, thing) ->
      data = thing: thing
      res.view 'thing/todo', data

  create: (req, res) ->
    thing = req.param('thing')
    Thing.create thing, (err, thing) ->
      return res.serverError err if err

      res.status 201
      res.json thing

module.exports = ThingController
