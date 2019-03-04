import React, {createElement as ele} from 'react'
import {div, table, thead, tbody, tr, th, td} from 'react-dom-factories'
import {Link} from 'react-router-dom'
import {SkiDayRow} from './SkiDayRow.coffee'

export SkiDayList = ({days, filter}) ->

  filteredDays = if !filter then days else days.filter (day) -> day[filter]

  div { className: 'ski-day-list' },
    table null,
      thead null,
        tr null,
          th null, 'Date'
          th null, 'Resort'
          th null, 'Powder'
          th null, 'Backcountry'
        tr null,
          td { colSpan: 4 },
            ele Link, { to: '/list-days' }, 'All Days'
            ele Link, { to: '/list-days/powder' }, 'Powder Days'
            ele Link, { to: '/list-days/backcountry' }, 'Backcountry Days'
      tbody null,
        filteredDays.map (day, i) ->
          day.key = i
          ele SkiDayRow, day

SkiDayList.propTypes =
  days: (props) ->
    if !Array.isArray(props.days)
      new Error('SkiDayList should be an array')
    else if !props.days.length
      new Error('SkiDayList must have at least one record')
    else
      null
