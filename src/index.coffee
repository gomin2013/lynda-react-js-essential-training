import {createElement as ele} from 'react'
import {render} from 'react-dom'
import {MemberList} from './components/ui/MemberList.coffee'
import './stylesheets/style.scss'

member =
  ele MemberList, null

render member, document.getElementById('react-container')
