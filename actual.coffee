command: "echo $(/usr/local/bin/chunkc tiling::query -d id)"

refreshFrequency: 1000

render: (output) ->
  """
    <div>
      <ul>
        <li id="d1">1</li>
        <li id="d2">2</li>
        <li id="d3">3</li>
        <li id="d4">4</li>
        <li id="d5">5</li>
        <li id="d6">6</li>
      <ul>
    </div>
  """

style: """
  bottom: 1px;
  font: 12px "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif
  font-weight: 700
  ul
    list-style: none
    margin: 0 0 0 2px
    padding: 0
  li
    display: inline-block
    border: #2f2f2f
    color: #6f6f6f
    background: #222222
    padding: 1px
    padding-left: 5px
    padding-right: 5px
  li.active
    color: white
    background: #710399
    border: #cb3dff
"""

update: (output, domEl) ->
  if ($(domEl).find('li.active').id isnt output)
    $(domEl).find('li.active').removeClass('active')
    $(domEl).find('li#d' + output).addClass('active')
