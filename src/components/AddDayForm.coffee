import PropTypes from 'prop-types'
import {div, form, label, input, button} from 'react-dom-factories'

export AddDayForm = ({resort, date, powder, backcountry}) ->

  submit = (e) ->
    {resort, date, powder, backcountry} = e.target.elements

    console.log('resort', resort.value)
    console.log('date', date.value)
    console.log('powder', powder.checked)
    console.log('backcountry', backcountry.checked)

  form { onSubmit: submit, className: 'add-day-form' },
    label { htmlFor: 'resort' }, 'Resort Name'
    input { id: 'resort', type: 'text', defaultValue: resort, required: true}

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
