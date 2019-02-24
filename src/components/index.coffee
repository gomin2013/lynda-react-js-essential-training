import {createElement as ele} from 'react'
import {div, h1, p} from 'react-dom-factories'
import {Switch, Route} from 'react-router-dom'
import {MainMenu} from './ui/MainMenu.coffee'
import {About} from './ui/About.coffee'
import {MemberList} from './ui/MemberList.coffee'

export Index = ->
  div { className: 'page' },
    ele MainMenu, { className: 'main-menu' }
    ele Switch, null,
      ele Route, { path: '/about', component: About }
      ele Route, { path: '/members', component: MemberList }

export Whoops404 = ({location}) ->
  div null,
    h1 null, 'Whoops, resource not found'
    p null, "Could not find #{location.pathname}"
