import {Component} from 'react'
import PropTypes from 'prop-types'
import {div, span} from 'react-dom-factories'
import {FaRegCalendarAlt} from 'react-icons/fa'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'
import '../stylesheets/ui.scss'

export class SkiDayCount extends Component

  percentToDecimal: (decimal) -> ((decimal * 100) + '%')

  calcGoalProgress: (total, goal) -> this.percentToDecimal(total / goal)

  render: ->
    div { className: 'ski-day-count' },
      div { className: 'total-days' },
        span null, this.props.total
        FaRegCalendarAlt null
        span null, 'days'
      div { className: 'powder-days' },
        span null, this.props.powder
        TiWeatherSnow null
        span null, 'days'
      div { className: 'backcountry-days' },
        span null, this.props.backcountry
        MdTerrain null
        span null, 'days'
      div null,
        span null, this.calcGoalProgress(this.props.total, this.props.goal)

SkiDayCount.defaultProps = { total: 'text', powder: 10, backcountry: 15, goal: 75 }

SkiDayCount.propTypes =
  total: PropTypes.number
  powder: PropTypes.number
  backcountry: PropTypes.number
