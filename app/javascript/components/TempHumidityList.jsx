import PropTypes from 'prop-types';
import React from 'react';
import ReactDOM from 'react-dom';

function formatDate(date) {
    const yyyy = new String(date.getFullYear());
    const mm = new String(date.getMonth() + 1).padStart(2, "0");
    const dd = new String(date.getDate()).padStart(2, "0");
    const hh = new String(date.getHours()).padStart(2, "0");
    const mi = new String(date.getMinutes()).padStart(2, "0");
    return `${yyyy}/${mm}/${dd} ${hh}:${mi}`;
}

export default class TempHumidityList extends React.Component {
  constructor(props, _railsContext) {
    console.log(props)
    super(props)
    // 初期設定
    console.log(props)
    console.log(this.props)
    this.state = {
      proccess: "TempHumidityList_init"
    };
  }

  // コンポーネントマウント後
  componentDidMount(){
    console.log("コンポーネントのマウント後")
    this.findTempHumidityList()
  }

  // 温湿度一覧
  findTempHumidityList() {

    fetch('/api/v1/temp_humidity/index', {
      method: 'GET',
      headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
      },
      mode: 'cors',
      credentials: 'include'
    }).then(function(response) {
      var ret = response.json()
      console.log(ret)
      return ret

    }).then(function(data) {
      console.debug('==findTempHumidityList_data==')
      console.debug(data)
      var elem = (
        <table className="table table-striped table-bordered">
                <thead>
                    <tr className="success">
                      <th>時間</th>
                      <th>温度</th>
                      <th>湿度</th>
                    </tr>
                </thead>
                <tbody>
                {
                  data.tempHumidities.map((record) => {
                    return <tr key={record.id}>
                      <td> {formatDate(new Date(record.inspected_at))}</td>
                      <td>{record.temp}</td>
                      <td>{record.humidity}</td>
                    </tr>
                  })
                }
                </tbody>
        </table>
      );
      ReactDOM.render(
        elem,
        document.getElementById('th_list_area')
      );
    });
  }
  // 温湿度一覧描画
  render() {
    var records = this.props.tempHumidityList;
    console.debug("==tempHumidityList==")
    console.log(records)
    console.log(this.props)
    return (
      <div id="th_list_area">
      </div>
    );
  }
}
