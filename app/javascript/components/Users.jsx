import PropTypes from 'prop-types';
import React from 'react';

export default class User extends React.Component {
  constructor(props) {
    super(props)

    // 初期設定
    this.state = {
      users: [
        {id:"2018/12/07 13:00", nickname:"21.4(C)", email:"72.5(%)"},
        {id:"2018/12/07 12:30", nickname:"21.1(C)", email:"71.8(%)"}
      ]
    };
  }

  // 温湿度一覧描画
  render() {
    var records = this.state.users;
    return (
      <table className="table table-striped table-bordered">
          <thead>
              <tr className="success">
                  <th>ID</th>
                  <th>ニックネーム</th>
                  <th>E-MAIL</th>
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
