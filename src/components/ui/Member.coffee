import {Component} from 'react'
import {div, h1, p, a, img} from 'react-dom-factories'
import {FaShieldAlt} from 'react-icons/fa'

export class Member extends Component

  componentWillUpdate: (nextProps) ->
    this.style = { backgroundColor: if nextProps.admin then 'deepskyblue' else null }

  render: ->
    {name, thumbnail, email, admin, makeAdmin, removeAdmin} = this.props

    div { className: 'member', style: this.style },
      h1 null,
        name
        if admin then FaShieldAlt null else null

      if admin
        a { onClick: () -> removeAdmin(email) }, 'Remove Admin'
      else
        a { onClick: () -> makeAdmin(email) }, 'Make Admin'

      img { src: thumbnail, alt: 'profile picture' }
      p null,
        a { href: "mailto:#{email}" }, email
