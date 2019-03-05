import {createElement as ele} from 'react'
import {div, h1} from 'react-dom-factories'
import {Member} from './Member.coffee'

members = [
  {
    name: "Joe Wilson",
    email: "joe.wilson@example.com",
    thumbnail: "https://randomuser.me/api/portraits/men/53.jpg"
  }
  {
    name: "Stacy Gardner",
    email: "stacy.gardner@example.com",
    thumbnail: "https://randomuser.me/api/portraits/women/74.jpg"
  }
  {
    name: "Billy Young",
    email: "billy.young@example.com",
    thumbnail: "https://randomuser.me/api/portraits/men/34.jpg"
  }
]

export MemberList = ->
  div { className: 'member-list' },
    h1 null,
      'Society Members'
    members.map((data, i) ->
      ele Member, { key: i, data..., makeAdmin: (email) -> console.log(email) })
