import {div, span} from 'react-dom-factories'
import {FaRegCalendarAlt} from 'react-icons/fa'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'
import '../stylesheets/ui.scss'

percentToDecimal = (decimal) -> ((decimal * 100) + '%')
calcGoalProgress = (total, goal) -> percentToDecimal(total / goal)

export SkiDayCount = ({total=70, powder=20, backcountry=10, goal=100}) ->
  div { className: 'ski-day-count' },
    div { className: 'total-days' },
      span null, total
      FaRegCalendarAlt null
      span null, 'days'
    div { className: 'powder-days' },
      span null, powder
      TiWeatherSnow null
      span null, 'days'
    div { className: 'backcountry-days' },
      span null, backcountry
      MdTerrain null
      span null, 'days'
    div null,
      span null, calcGoalProgress(total, goal)
