import {div, span} from 'react-dom-factories'
import CreateReactClass from 'create-react-class'
import '../stylesheets/ui.scss'

export SkiDayCount = CreateReactClass
  displayName: 'SkiDayCount'
  render: ->
    div {className: 'ski-day-count'},
      div {className: 'total-days'},
        span null, '5 days'
      div {className: 'powder-days'},
        span null, '2 days'
      div {className: 'backcountry-days'},
        span null, '1 hiking day'
