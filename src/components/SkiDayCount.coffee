import {div, span} from 'react-dom-factories'
import '../stylesheets/ui.scss'

percentToDecimal = (decimal) -> ((decimal * 100) + '%')
calcGoalProgress = (total, goal) -> percentToDecimal(total / goal)

export SkiDayCount = ({total, powder, backcountry, goal}) ->
  div { className: 'ski-day-count' },
    div { className: 'total-days' },
      span null, total
      span null, 'days'
    div { className: 'powder-days' },
      span null, powder
      span null, 'days'
    div { className: 'backcountry-days' },
      span null, backcountry
      span null, 'days'
    div null,
      span null, calcGoalProgress(total, goal)
