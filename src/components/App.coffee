import {div} from 'react-dom-factories'
import CreateReactClass from 'create-react-class'

export App = CreateReactClass
  displayName: 'App'

  getInitialState: ->
    allSkiDays: [
      {
        resort: 'Squaw Valley'
        date: new Date('1/2/2016')
        powder: true
        backcountry: false
      }
      {
        resort: 'Kirkwood'
        date: new Date('3/28/2016')
        powder: false
        backcountry: false
      }
      {
        resort: 'Mt. Tallac'
        date: new Date('4/2/2016')
        powder: false
        backcountry: true
      }
    ]

  render: ->
    div { className: 'app' },
      this.state.allSkiDays[0]['resort']
