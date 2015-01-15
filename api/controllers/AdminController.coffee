 # AdminController
 #
 # @description :: Server-side logic for managing admins
 # @help        :: See http://links.sailsjs.org/docs/controllers

AdminController =
  index: (req, res) ->
    res.view {
      _layoutFile: '/admin.ejs'
    }

module.exports = AdminController
