import {div, span} from 'react-dom-factories'
import CreateReactClass from 'create-react-class'
import '../stylesheets/ui.scss'

export SkiDayCount = CreateReactClass
  displayName: 'SkiDayCount'
  render: ->
    div {className: 'ski-day-count'},
      div {className: 'total-days'},
        span null, this.props.total
        span null, 'days'
      div {className: 'powder-days'},
        span null, this.props.powder
        span null, 'days'
      div {className: 'backcountry-days'},
        span null, this.props.backcountry
        span null, 'days'
      div null,
        span null, this.props.goal
