import PropTypes from 'prop-types';
import React from 'react';
import ReactDOM from 'react-dom'
import axios from 'axios';

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
    this.findUserList()
  }
  componentWillReceiveProps(){
    console.log("コンポーネントが受け取るpropsが変化")
  }

  // ユーザ一覧
  findUserList() {

    fetch('/api/v1/user/index', {
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
      // this.props.users = findUserList()
      // this.setState({ users: data.users });
      console.debug('==this==')
      console.debug(this)
      const elem = (
        <table className="table table-striped table-bordered">
                <thead>
                    <tr className="success">
                        <th>ID</th>
                        <th>ニックネーム</th>
                        <th>更新</th>
                    </tr>
                </thead>
                <tbody>
                {
                  data.users.map((record) => {
                    // return  <ChangeButton id={record.id} nickname={record.nickname} />
                    return <tr key={record.id}>
                      <td> {record.id}</td><td>{record.nickname}</td>
                      <td><button type="button" id={"update_user_" + record.id} type="button" className="btn btn-primary" onClick={(e) => ReactDOM.render(
                        <UserUpdateForm user_context={this} user={record} />,
                        document.getElementById('user_form')    // 出力先のelementを指定(jQueryを併用できる)
                      )} >更新</button></td>
                    </tr>
                  })
                }
                </tbody>
        </table>
      )
      ReactDOM.render(
        elem,
        document.getElementById('list_area')
      );
    });
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
    fetch('/api/v1/user/create', {
      method: 'POST',
      mode: 'cors',
      credentials: 'include',
      headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        nickname: document.getElementById("nickname").value,
        password: document.getElementById("password").value,
        password_confirm: document.getElementById("password_confirm").value,
      })
    }).then(function(response) {
        var ret = response.json()
        console.debug(ret)
        console.debug(ret.body)
        return ret
    }).then(function(json) {
      console.debug(json)

      if (json.status == 'FAILURE' ) {
        var elem = (
            <div className="alert alert-info">登録に失敗しました。{json.message}</div>
        );
        ReactDOM.render(
          elem,
          document.getElementById('user_info_message')
        );
      }
      var elem = (
          <div className="alert alert-info">登録しました。登録結果はタブ切り替えでご確認ください。</div>
      );
      ReactDOM.render(
        elem,
        document.getElementById('user_info_message')
      );
      this.findUserList()
    }).catch(function(error) {
      console.log(error)
      return error
    });
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
          <button type="button" id="new_user" type="button" className="btn btn-primary" onClick={(e) => this.newUser(e)}>新規登録</button>
        </div>
        <div id="list_area">
      </div>
      </div>
    );
  }
}

//　ユーザフォーム
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
        <form id="user_info" name="user_info" method="post">
          <div className="panel-heading bg-success">昆活メイト登録</div>
          <div className="panel-body">
            <div id="user_info_message"></div>
            <div className="container-fluid">
              <div className="form-group row">
                <label for="nickname">ニックネーム</label><input className="form-control" type="text" id="nickname" placeholder="半角英数字 例: Bob" name="nickname" />
              </div>
              <div className="form-group row">
                <label for="password">パスワード</label><input className="form-control"  type="password" id="password" placeholder="半角英数字記号" name="password" />
              </div>
              <div className="form-group row">
                <label for="password_confirm">パスワード(確認)</label><input className="form-control"  type="password" id="password_confirm" placeholder="パスワードと同じ内容" name="password_confirm" />
              </div>
            </div>
          </div>
          <div className="panel-footer">
            <button type="button" id="commit_user" type="button" className="btn btn-success" onClick={(e) => this.props.user_context.createNewUser(e)}>この内容で登録</button>
            <button type="button" id="cancel" type="button" className="btn btn-danger" onClick={(e) => this.props.user_context.newUser(e)}>取消(未実装)</button>
          </div>
        </form>
      </div>
    );
  }
}
//　ユーザフォーム
class UserUpdateForm extends React.Component {
  constructor(props, _railsContext) {
    super(props)
  }
  render() {
    // var users = this.props.users;
    console.log("==UserUpdateForm==")
    console.log(this.props)
    var user = this.props.user
    return (
      <div className="panel panel-success">
        <form id="user_update" name="user_update" method="post">
          <div className="panel-heading bg-success">昆活メイト更新</div>
          <div className="panel-body">
            <div id="user_update_message"></div>
            <div className="container-fluid">
              <div className="form-group row">
                <label>ID: {user.id} </label>/>
              </div>
              <div className="form-group row">
                <label for="nickname">ニックネーム</label><input className="form-control" type="text" id="update_nickname" placeholder="半角英数字 例: Bob" name="nickname"  />
              </div>
              <div className="form-group row">
                <label for="password">パスワード</label><input className="form-control"  type="password" id="update_password" placeholder="半角英数字記号" name="password" />
              </div>
              <div className="form-group row">
                <label for="password_confirm">パスワード(確認)</label><input className="form-control"  type="password" id="update_password_confirm" placeholder="パスワードと同じ内容" name="password_confirm" />
              </div>
            </div>
          </div>
          <div className="panel-footer">
            <button type="button" id="update_commit_user" type="button" className="btn btn-success" onClick={(e) => this.updateUser(user)}>この内容で更新</button>
            <button type="button" id="update_cancel" type="button" className="btn btn-danger" onClick={(e) => this.updateUser(user)}>取消(未実装)</button>
          </div>
        </form>
      </div>
    );
  }

  // ユーザ更新
  updateUser(target) {
    this.setState({ process: "users_update"});
    console.log(target);
    fetch('/api/v1/user/update', {
      method: 'POST',
      mode: 'cors',
      credentials: 'include',
      headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
      },
      // body: JSON.stringify({
      //   nickname: document.getElementById("nickname").value,
      //   password: document.getElementById("password").value,
      //   password_confirm: document.getElementById("password_confirm").value,
      // })
    }).then(function(response) {
        var ret = response.json()
        console.debug(ret)
        console.debug(ret.body)
        return ret
    }).then(function(json) {
      console.debug(json)

      if (json.status == 'FAILURE' ) {
        var elem = (
            <div className="alert alert-info">更新に失敗しました。{json.message}</div>
        );
        ReactDOM.render(
          elem,
          document.getElementById('user_info_message')
        );
      }
      var elem = (
          <div className="alert alert-info">更新しました。更新結果はタブ切り替えでご確認ください。</div>
      );
      ReactDOM.render(
        elem,
        document.getElementById('user_info_message')
      );
      this.findUserList()
    }).catch(function(error) {
      console.log(error)
      return error
    });
  }

}
