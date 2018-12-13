import PropTypes from 'prop-types';
import React from 'react';
import ReactDOM from 'react-dom'

export default class User extends React.Component {
  constructor(props, _railsContext) {
    super(props)
    // this.props.users = props.users
    console.debug('==in User jsx==');
    console.log(this.props);


    // 初期設定
    this.state = {
      process: "list"
    };
  }

  componentDidMount(){
    console.log("コンポーネントのマウント後")
  }
  componentWillReceiveProps(){
    console.log("コンポーネントが受け取るpropsが変化")
  }

  // ユーザ確認
  dispUser() {

  }
  // ユーザ新規作成
  newUser(target) {
    this.setState({ process: "users_new"});
    console.log(this.state.process);
    console.log(target);
    ReactDOM.render(
      <UserForm user_context={this} />,
      document.getElementById('user_form')    // 出力先のelementを指定(jQueryを併用できる)
    );

  }
  // ユーザ新規作成データ送信
  createNewUser(target){
    this.setState({ process: "users_new"});
    console.log(this.state.process);
    console.log(target);
    // document.user_info.submit();
    fetch('/api/v1/user/create', {
      method: 'POST',
      mode: 'cors',
      credentials: 'include',
      body: JSON.stringify({
        nickname: document.getElementById("nickname").value,
        email: document.getElementById("email").value,
      })
    }).then(function(response) {
      return response.json()
    }).then(function(data) {
      this.setState({
         process: data
      });
    });
    var elem = (
      <div>
        <div className="alert alert-success">登録しました！</div>
        <button type="button" id="new_user" type="button" className="btn btn-primary" onClick={(e) => this.newUser(e)}>new User</button>
      </div>
    );
    ReactDOM.render(
      elem,
      document.getElementById('user_form')
    );
  }

  // ユーザ一覧描画
  render() {
    var users = this.props.users;
    // console.debug("==render in User==");
    console.log(this.props);
    console.log(users)
    return (
      <div>
        <div id="user_form">
          <button type="button" id="new_user" type="button" className="btn btn-primary" onClick={(e) => this.newUser(e)}>new User</button>
        </div>
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
            users.map((record) => {
              return <tr>
                <td> {record.id}</td><td>{record.nickname}</td><td>{record.email}</td>
              </tr>
            })
          }
          </tbody>
      </table>
      </div>
    );
  }
}


class UserForm extends React.Component {
  constructor(props, _railsContext) {
    super(props)
  }
  render() {
    // var users = this.props.users;
    console.log("==UserForm==")
    console.log(this.props)
    return (
      <div className="panel panel-success">
        <form id="user_info" name="user_info" method="post" action="/user/new">
          <div className="panel-heading bg-success">昆活仲間編集</div>
          <div className="panel-body">
            <div className="container-fluid">
              <div className="row">
                <label for="nickname">ニックネーム</label><input type="text" id="nickname" praceholder="bob" name="nickname" />
              </div>
              <div className="row">
                <label for="email">メールアドレス</label><input type="text" id="email" praceholder="example@a.xxx" name="email" />
              </div>
              <div className="row">
                <label for="birthday">生年月日</label><input type="text" id="birthday" praceholder="2010/01/01" name="birthday" />
              </div>
              <div className="row">
                <label for="password">パスワード</label><input type="password" id="password" praceholder="2010/01/01" name="password" />
              </div>
              <div className="row">
                <label for="password_confirm">パスワード(確認)</label><input type="password_confirm" id="password_confirm" praceholder="2010/01/01" name="password_confirm" />
              </div>
            </div>
          </div>
          <div className="panel-footer">
            <button type="button" id="commit_user" type="button" className="btn btn-success" onClick={(e) => this.props.user_context.createNewUser(e)}>create User</button>
            <button type="button" id="cancel" type="button" className="btn btn-danger" onClick={(e) => this.props.user_context.newUser(e)}>cancel(未実装)</button>
          </div>
        </form>
      </div>
    );
  }
}
