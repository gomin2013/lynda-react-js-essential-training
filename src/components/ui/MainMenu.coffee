import {createElement as ele} from 'react'
import {nav} from 'react-dom-factories'
import {NavLink} from 'react-router-dom'
import {FaHome} from 'react-icons/fa'

export MainMenu = ->
  nav null,
    ele NavLink, { to: '/' },
      FaHome null
    ele NavLink, { to: '/about', activeStyle: {
      backgroundColor: "white",
      color: "slategray"
    } }, 'About'
    ele NavLink, { to: '/members', activeStyle: {
      backgroundColor: "white",
      color: "slategray"
    } }, 'Members'
