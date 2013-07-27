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
    to_find = if options['find']? options['find'] else null
    ary = str.split(splitSymbol)
    
    return (to_find in ary) if to_find is not null
    return ary if id is null
    return ary[id]


  ApplyswitchEffect = (key, effectName = 'blind', hideTime = 500, showTime = 500)->
    outBlock = $(key)
    lis = outBlock.find('ul').filter(".sw-ul").children('li')
    swDivs = outBlock.find('div').filter('.sw-div')
    lis.click( ->
      if not $(@).hasClass('active')
        lis.filter('.active').removeClass('active')
        $(@).addClass('active')        

      name = parseDash $(@).attr('id'), {id:0}
      swDivs.each(->
        divName = parseDash @.id, {id:0}
        if divName == name
          if @.style.display == 'none'
            that = @
            setTimeout(->
              $(that).show('blind', {}, showTime) 
            , hideTime)
          
        else if @.style.display != 'none'
          $(@).hide('blind', {}, hideTime)
        
      )
    )

  ApplyswitchEffect('.switchable', 'blind', 640, 800)
  
  

  undefined
)(jQuery)