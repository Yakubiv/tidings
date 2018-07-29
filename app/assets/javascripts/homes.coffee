$('.dropdown-toggle').dropdown()

$ ->
  window.onscroll = ->
    freezeHeader()

  freezeHeader = ->
    if window.pageYOffset > 0
      header.classList.add 'header-freeze'
    else
      header.classList.remove 'header-freeze'
    return
