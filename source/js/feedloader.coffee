loadFeeds = (container, url, num)->  
  google.load("feeds", "1")
  
  initialize = ->
    feed = new google.feeds.Feed(url)
    feed.setNumEntries(num) if num?
    
    feed.load((result)->
      for entry in result.feed.entries
        a  = $('<a></a>').attr({href: entry.link, target: '_blank'}).html(entry.title)
        li = $('<li></li>').append(a)        
        container.append(li)
    )
      
  google.setOnLoadCallback(initialize)
 
window.loadFeeds = loadFeeds
