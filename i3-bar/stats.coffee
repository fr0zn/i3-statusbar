command: "echo $(date '+%Y-%m-%d%n  %H:%M')@$(pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | awk -F'[ ;]' '{print $1 \" \" $3 \" \" $5}')"

refreshFrequency: 60000

render: (output) ->
  """
    <div>
       <ul id="battery">
          Battery
       </ul>
       <div class="brk">|</div>
       <ul id="date">
          date
       </ul>
    </div>
  """

style: """
  bottom: 3px;
  right: 10px;
  font: 12px "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, sans-serif
  font-weight: 700
  .brk
    display: inline-block
    color: #2f2f2f
  ul
    display: inline-block
    list-style: none
    margin: 0 0 0 2px
    padding: 0
    color: white
"""

update: (output, domEl) ->
    values = output.split('@')
    bat = values[1].split(' ')
    if bat[1] == "charging"
        bat_str = "CHR " + bat[0] + " " + bat[2] + " h"
    else
        bat_str = "BAT " + bat[0] + " " + bat[2] + " h"


    $(domEl).find('#date').html(values[0])
    $(domEl).find('#battery').html(bat_str)
