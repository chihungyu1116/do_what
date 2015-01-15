 # Thing.coffee
 #
 # @description :: TODO: You might write a short summary of how this model works and what it represents here.
 # @docs        :: http://sailsjs.org/#!documentation/models

_ = require 'underscore'
moment = require 'moment'

attrs =
  keys:
    type: 'string', index: true
  desc:
    type: 'text'
  quote:
    type: 'string'
  video:
    type: 'string'
  author:
    type: 'string'

ThingModel =
  attributes: attrs
  random: (id, num, cb) ->
    where = if id then "where id != #{id}" else ""
    stmt = "select * from thing #{where} order by rand() limit #{num}"
    @query stmt, (err, things) -> cb err, things

  beforeValidate: (values, cb) ->
    _.extend values, {desc: 'nothing', likes: 0} if _.isEmpty values

    sails.log 'values: ', values
    salt = moment().format 'YYYY-MMM-Do-HH:mm:ss'
    values.desc = values.desc.trim().replace(/\s+/g, ' ')
    values.keys = values.desc.substr(0, 60).replace(/\s/g, '-') + '-' + salt
    cb()

module.exports = ThingModel
