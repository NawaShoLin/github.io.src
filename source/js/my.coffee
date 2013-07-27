(($)->
  
  loadFeeds = (feedObjects)->  
    google.load("feeds", "1")
    
    initialize = ->
      loadFeed = (container, url, num)->
        feed = new google.feeds.Feed(url)
        feed.setNumEntries(num) if num?
        
        feed.load((result)->
          for entry in result.feed.entries
            a  = $('<a></a>').attr({href: entry.link, target: '_blank'}).html(entry.title)
            li = $('<li></li>').append(a)        
            container.append(li)
        )
      for fo in feedObjects
        loadFeed(fo.container, fo.url, fo.num)      
            
    google.setOnLoadCallback(initialize)
  
  # Load right RSS bar datas  
  (-> 
    owo = 
      container:$('#rss-nav-ul')
      url:"http://qmono2.blogspot.com/feeds/posts/default"
      num:5
    loadFeeds [owo]
  )()

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