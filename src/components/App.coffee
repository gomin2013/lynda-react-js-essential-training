import React, {Component} from 'react'
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
      else if this.props.location.pathname == '/list-days'
        SkiDayList { days: this.state.allSkiDays }
      else
        AddDayForm null
