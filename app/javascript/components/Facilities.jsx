import PropTypes from 'prop-types';
import React from 'react';

export default class Facilities extends React.Component {
  constructor(props, _railsContext) {
    super(props)
    console.debug("==Facilities==")
    console.log(this.props)

    // 初期設定
    this.state = {
      proccess: "Facilities"
    };
  }

  // 温湿度一覧描画
  render() {
    var records = this.props.facilities;
    console.debug("==Facilities render==")
    console.log(records)
    console.log(this.props.facilities)
    return (
      <div id="list_area">
      <table className="table table-striped table-bordered">
          <thead>
            <tr className="success">
              <th>ID</th>
              <th>施設種類</th>
              <th>名称</th>
            </tr>
          </thead>
          <tbody>
          {
            records.map((record) => {
              return <tr  key={record.id}>
                <td> {record.id}</td><td>{record.name}</td><td>{record.explanation}</td>
              </tr>
            })
          }
          </tbody>
      </table>
    </div>
    );
  }
}
