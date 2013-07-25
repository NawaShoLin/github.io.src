loadFeeds = (container, url, num)->  
  google.load("feeds", "1")
  
  initialize = ->
    feed = new google.feeds.Feed(url)
    feed.setNumEntries(num) if num?
    

    ul = $('<ul></ul>').addClass('nav').addClass('nav-list')
    
    feed.load((result)->
      for entry in result.feed.entries
        a  = $('<a></a>').attr({href: entry.link, target: '_blank'}).html(entry.title)
        li = $('<li></li>').append(a)        
        ul.append(li)
    )
    container.append ul
      
  google.setOnLoadCallback(initialize)
 
window.loadFeeds = loadFeeds
