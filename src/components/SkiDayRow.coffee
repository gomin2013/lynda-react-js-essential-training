import PropTypes from 'prop-types'
import {tr, td} from 'react-dom-factories'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'

export SkiDayRow = ({resort, date, powder, backcountry}) ->
  tr null,
    td null,
      date
    td null,
      resort
    td null,
      if powder then TiWeatherSnow null else null
    td null,
      if backcountry then MdTerrain null else null

SkiDayRow.propTypes =
  resort: PropTypes.string.isRequired
  date: PropTypes.string.isRequired
  powder: PropTypes.bool
  backcountry: PropTypes.bool
