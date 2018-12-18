import PropTypes from 'prop-types';
import React from 'react';

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

  // 温湿度一覧描画
  render() {
    var records = this.props.tempHumidityList;
    console.debug("==tempHumidityList==")
    console.log(records)
    console.log(this.props)
    return (
      <div id="list_area">
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
            records.map((record) => {
              return <tr key={record.id}>
                <td> {record.inspected_at}</td><td>{record.temp}</td><td>{record.humidity}</td>
              </tr>
            })
          }
          </tbody>
      </table>
    </div>
    );
  }
}
