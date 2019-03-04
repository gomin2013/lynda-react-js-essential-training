import {Component, createElement as ele} from 'react'
import PropTypes from 'prop-types'
import {div, form, label, input, button, datalist, option} from 'react-dom-factories'

tahoeResorts = [
  "Alpine Meadows"
  "Boreal"
  "Diamond Peak"
  "Donner Ski Ranch"
  "Heavenly"
  "Homewood"
  "Kirkwood"
  "Mt. Rose"
  "Northstar"
  "Squaw Valley"
  "Sugar Bowl"
]

export class Autocomplete extends Component
  get: ->
    this.refs.inputResort.value

  set: (inputValue) ->
    this.refs.inputResort.value = inputValue

  render: ->
    div null,
      input { id: 'resort', type: 'text', list: 'tahoe-resorts', defaultValue: this.refs.inputResort, required: true }
      datalist { id: 'tahoe-resorts' },
        this.props.options.map((opt, i) -> option { key: i }, opt)

export AddDayForm = ({resort, date, powder, backcountry, onNewDay}) ->

  submit = (e) ->
    {resort, date, powder, backcountry} = e.target.elements

    onNewDay({
      resort: resort.value
      date: date.value
      powder: powder.checked
      backcountry: backcountry.checked
    })

    resort.value = ''
    date.value = ''
    powder.checked = false
    backcountry.checked = false

  form { onSubmit: submit, className: 'add-day-form' },
    label { htmlFor: 'resort' }, 'Resort Name'
    ele Autocomplete, { options: tahoeResorts }

    label { htmlFor: 'date' }, 'Date'
    input { id: 'date', type: 'date', defaultValue: date, required: true }

    div null,
      input { id: 'powder', type: 'checkbox', defaultChecked: powder }
      label { htmlFor: 'powder' }, 'Powder Day'

    div null,
      input { id: 'backcountry', type: 'checkbox', defaultChecked: backcountry }
      label { htmlFor: 'backcountry' }, 'Backcountry Day'

    button null, 'Add Day'

AddDayForm.defaultProps =
  resort: 'Kirkwood'
  date: '2017-02-12'
  powder: true
  backcountry: false

AddDayForm.propTypes =
  resort: PropTypes.string.isRequired
  date: PropTypes.string.isRequired
  powder: PropTypes.bool.isRequired
  backcountry: PropTypes.bool.isRequired
