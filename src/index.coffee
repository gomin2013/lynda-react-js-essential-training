import React from 'react'
import {render} from 'react-dom'
import {SkiDayCount} from './components/SkiDayCount.coffee'

SkiDayCountProps = { total: 50, powder: 20, backcountry: 10, goal: 100 }

render React.createElement(SkiDayCount, SkiDayCountProps),
  document.getElementById('react-container')
