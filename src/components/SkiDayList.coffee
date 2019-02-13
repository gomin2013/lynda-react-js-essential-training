import React from 'react'
import {table, thead, tbody, tr, th} from 'react-dom-factories'
import {SkiDayRow} from './SkiDayRow.coffee'

export SkiDayList = ({days}) ->
  table null,
    thead null,
      tr null,
        th null, 'Date'
        th null, 'Resort'
        th null, 'Powder'
        th null, 'Backcountry'
    tbody null,
      days.map (day, i) ->
        day.key = i
        React.createElement(SkiDayRow, day)
