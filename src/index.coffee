import React from 'react'
import {render} from 'react-dom'
import {App} from './components/App.coffee'
import './stylesheets/ui.scss'

render React.createElement(App),
  document.getElementById('react-container')
