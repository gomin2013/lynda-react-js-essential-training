import React from 'react'
import { render } from 'react-dom'
import { SkiDayCount } from './components/SkiDayCount.coffee'

window.React = React;

render(
  <SkiDayCount />,
  document.getElementById('react-container')
);
