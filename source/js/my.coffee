(($)->
  
  # Load right RSS bar datas
  (->
    cont = $('#rss-nav-ul')
    loadFeeds cont, "http://qmono2.blogspot.com/feeds/posts/default", 5
    undefined
  )()

  # effects at #about
  ###
  (->
    $('#main-article').css('margin-top', '+=24px')

    runEffect = (ele)->
      selectedEffect = "slide"
      options = {}
      ele.hide( selectedEffect, options, 1000, callback )
      callback = ->

    $("#me").click(->
      runEffect($('#about-content'))
      false
    )
  )()
  ###

  # switchable class effect
  parseDash = (str, options={})->
    id = if options['id']? then options['id'] else null
    splitSymbol = options['spliter'] or '-'
    ary = str.split(splitSymbol)
    
    return ary if id is null
    return ary[id]


  (->
    swfun = ()->
    $('.switchable').find('ul').filter(".sw-ul").children('*').click( ->
      name = parseDash $(@).attr('id'), {id:0}
    )
  )()
  

  undefined
)(jQuery)