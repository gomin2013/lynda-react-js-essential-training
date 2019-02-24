import {createElement as ele} from 'react'
import {div, h1} from 'react-dom-factories'
import {MainMenu} from './MainMenu.coffee'

export Home = ->
  div { className: 'home' },
    ele MainMenu, { className: 'main-menu' }
    div { id: 'homebox' },
      h1 null, 'Rock Appreciation Society'
