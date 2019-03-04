import React, {createElement as ele} from 'react'
import {render} from 'react-dom'
import {HashRouter, Route, Switch} from 'react-router-dom'
import {App} from './components/App.coffee'
import {Whoops404} from './components/Whoops404.coffee'
import './stylesheets/ui.scss'
import './stylesheets/index.scss'

routes =
  ele HashRouter, null,
    ele Switch, null,
      ele Route, { path: '/', exact: true, component: App }
      ele Route, { path: '/list-days', exact: true, component: App }
      ele Route, { path: '/list-days/:filter(powder|backcountry)', component: App }
      ele Route, { path: '/add-day', exact: true, component: App }
      ele Route, { component: Whoops404 }

render routes, document.getElementById('react-container')
