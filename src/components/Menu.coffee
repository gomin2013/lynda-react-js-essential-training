import {createElement as ele} from 'react'
import {nav} from 'react-dom-factories'
import {NavLink} from 'react-router-dom'
import {FaHome, FaCalendarPlus, FaTable} from 'react-icons/fa'

export Menu = ->
  nav { className: 'menu' },
    ele NavLink, { to: '/', activeClassName: 'selected' },
      FaHome null
    ele NavLink, { to: '/add-day', activeClassName: 'selected' },
      FaCalendarPlus null
    ele NavLink, { to: '/list-days', activeClassName: 'selected' },
      FaTable null
