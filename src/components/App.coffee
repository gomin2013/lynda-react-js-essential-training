import {Component, createElement as ele} from 'react'
import {div} from 'react-dom-factories'
import {AddDayForm} from './AddDayForm.coffee'
import {Menu} from './Menu.coffee'
import {SkiDayList} from './SkiDayList.coffee'
import {SkiDayCount} from './SkiDayCount.coffee'

export class App extends Component

  constructor: (props) ->
    super(props)
    this.state =
      allSkiDays: [
        {
          resort: 'Squaw Valley'
          date: '2016-01-02'
          powder: true
          backcountry: false
        }
      ]
    this.addDay = this.addDay.bind(this)

  addDay: (newDay) ->
    this.state.allSkiDays.push newDay
    this.setState(this.state.allSkiDays)

  countDays: (filter) ->
    this.state.allSkiDays
      .filter((day) -> if filter then day[filter] else day).length

  render: ->
    div { className: 'app' },
      Menu null
      if this.props.location.pathname == '/'
        SkiDayCount {
          total: this.countDays()
          powder: this.countDays('powder')
          backcountry: this.countDays('backcountry')
        }
      else if this.props.location.pathname == '/add-day'
        ele AddDayForm, { onNewDay: this.addDay }
      else
        SkiDayList { days: this.state.allSkiDays, filter: this.props.match.params.filter }
