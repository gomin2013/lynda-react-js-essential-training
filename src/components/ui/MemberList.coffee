import {Component, createElement as ele} from 'react'
import {div, h1, span} from 'react-dom-factories'
import {Member} from './Member.coffee'

export class MemberList extends Component

  constructor: (props) ->
    super(props)
    this.state = {
      members: []
      loading: false
      administrators: []
    }

    this.makeAdmin = this.makeAdmin.bind(this)
    this.removeAdmin = this.removeAdmin.bind(this)

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

  makeAdmin: (email) ->
    unless this.state.administrators.includes(email)
      this.setState {
        administrators: [this.state.administrators..., email]
      }

  removeAdmin: (email) ->
    this.setState {
      administrators: this.state.administrators.filter((adminEmail) -> adminEmail != email)
    }

  render: ->
    {makeAdmin, removeAdmin} = this
    {administrators, members, loading} = this.state

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
            admin: administrators.some((adminEmail) -> adminEmail == member.email)
            name: "#{member.name.first} #{member.name.last}"
            email: member.email
            thumbnail: member.picture.thumbnail
            makeAdmin: makeAdmin
            removeAdmin: removeAdmin
          })
      else
        span null, 'Currently 0 Members'
