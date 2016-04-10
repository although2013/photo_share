#= require jquery
#= require jquery_ujs
#= require bootstrap

#= require turbolinks
#= require_tree .
#= require_self

photo_center = ->
  $('.img-detail img').on "load", ->
    width = $('.img-detail img').width() + $('.img-right').width()
    $('.img-detail').width(width)


$(document).on 'page:change', ->
  photo_center()
