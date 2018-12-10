import PropTypes from 'prop-types';
import React from 'react';

export default class TempHumidityList extends React.Component {
  constructor(props) {
    super(props)

    // 初期設定
    this.state = {
      tempHumidityList: [
        {id:"2018/12/07 13:00", nickname:"21.4(C)", email:"72.5(%)"},
        {id:"2018/12/07 12:30", nickname:"21.1(C)", email:"71.8(%)"}
      ]
    };
  }

  // 温湿度一覧描画
  render() {
    var records = this.state.tempHumidityList;
    return (
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
              return <tr>
                <td> {record.id}</td><td>{record.nickname}</td><td>{record.email}</td>
              </tr>
            })
          }
          </tbody>
      </table>
    );
  }
}
