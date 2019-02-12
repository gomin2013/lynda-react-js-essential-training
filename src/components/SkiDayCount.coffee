import {Component} from 'react'
import {div, span} from 'react-dom-factories'
import '../stylesheets/ui.scss'

export class SkiDayCount extends Component

  percentToDecimal: (decimal) -> ((decimal * 100) + '%')

  calcGoalProgress: (total, goal) -> this.percentToDecimal(total / goal)

  render: ->
    div { className: 'ski-day-count' },
      div { className: 'total-days' },
        span null, this.props.total
        span null, 'days'
      div { className: 'powder-days' },
        span null, this.props.powder
        span null, 'days'
      div { className: 'backcountry-days' },
        span null, this.props.backcountry
        span null, 'days'
      div null,
        span null, this.calcGoalProgress(this.props.total, this.props.goal)
