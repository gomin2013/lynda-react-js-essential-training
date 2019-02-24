import {createElement as ele} from 'react'
import {HashRouter, Switch, Route} from 'react-router-dom'
import {Home} from './components/ui/Home.coffee'
import {Index, Whoops404} from './components/index.coffee'
import './stylesheets/style.scss'

export Routes =
  ele HashRouter, null,
      ele Switch, null,
        ele Route, { path: '/', exact: true, component: Home }
        ele Route, { path: '/(about|members)', component: Index }
        ele Route, { component: Whoops404 }
