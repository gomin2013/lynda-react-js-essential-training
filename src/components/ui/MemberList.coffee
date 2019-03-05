import {Component, createElement as ele} from 'react'
import {div, h1, span} from 'react-dom-factories'
import {Member} from './Member.coffee'

export class MemberList extends Component

  constructor: (props) ->
    super(props)
    this.state = {
      members: []
      loading: false
    }

  componentDidMount: ->
    self = this

    self.setState {
      loading: true
    }

    fetch 'https://api.randomuser.me/?nat=US&results=12'
      .then (response) -> response.json()
      .then (json) -> json.results
      .then (members) ->
        self.setState {
          members,
          loading: false
        }

  render: ->
    {members, loading} = this.state
    div { className: 'member-list' },
      h1 null,
        'Society Members'

      if loading
        span null, 'loading...'
      else
        span null, "#{members.length} members"

      if members.length
        members.map((member, i) ->
          ele Member, {
            key: i
            name: "#{member.name.first} #{member.name.last}"
            email: member.email
            thumbnail: member.picture.thumbnail
            makeAdmin: (email) -> console.log(email)
          })
      else
        span null, 'Currently 0 Members'
