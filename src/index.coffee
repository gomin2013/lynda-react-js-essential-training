import {createElement as ele} from 'react'
import {render} from 'react-dom'
import {Member} from './components/ui/Member.coffee'
import './stylesheets/style.scss'

member =
  ele Member, {
    admin: true,
    name: 'Edna Welch',
    email: 'edna.welch88@example.com',
    thumbnail: 'https://randomuser.me/api/portraits/women/90.jpg',
    makeAdmin: (email) -> console.log(email)
  }

render member, document.getElementById('react-container')
