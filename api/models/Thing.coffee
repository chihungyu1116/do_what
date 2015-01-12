 # Thing.coffee
 #
 # @description :: TODO: You might write a short summary of how this model works and what it represents here.
 # @docs        :: http://sailsjs.org/#!documentation/models

_ = require 'underscore'
randomstring = require("randomstring");

attrs =
  id:
    type: 'integer'
    unique: true
    primaryKey: true
  kind:
    type: 'string',
    required: true
  content:
    type: 'text'
    required: true
  username:
    type: 'string'
    required: true
  title:
    type: 'string'
    required: true
    unique: true
    index: true


ThingModel =
  attributes: attrs
  random: (cb) ->
    query = 'select title from thing order by rand() limit 1'
    @query query, (err, thing) ->
      cb err, thing[0]

  beforeValidate: (values, cb) ->
    _.extend values, {content: 'nothing'} if _.isEmpty values
    _.defaults values, {username: 'anonymous', kind: 'text'}

    salt = randomstring.generate 4
    values.content = values.content.trim().replace(/\s+/g, ' ')
    values.title = values.content.substr(0, 140).replace(/\s/g, '-') + '-' + salt
    cb()

module.exports = ThingModel
