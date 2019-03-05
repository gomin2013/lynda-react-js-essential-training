import {div, h1, p, a, img} from 'react-dom-factories'
import {FaShieldAlt} from 'react-icons/fa'

export Member = ({name, thumbnail, email, admin, makeAdmin}) ->
  div { className: 'member' },
    h1 null,
      name
      if admin then FaShieldAlt null else null
    a { onClick: makeAdmin.bind(this, email) },
      'Make Admin'
    img { src: thumbnail, alt: 'profile picture' }
    p null,
      a { href: "mailto:#{email}" }, email
