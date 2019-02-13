import React from 'react'
import {render} from 'react-dom'
import {SkiDayCount} from './components/SkiDayCount.coffee'

render React.createElement(SkiDayCount),
  document.getElementById('react-container')
