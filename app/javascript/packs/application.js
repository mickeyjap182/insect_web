/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// console.log('Hello World from Webpacker')
import ReactOnRails from 'react-on-rails';
import PropTypes from 'prop-types';
import React from 'react';
import ReactDOM from 'react-dom'
import TempHumidityList from '../components/TempHumidityList';
import Users from '../components/Users';
import Facilities from '../components/Facilities';

function ChangeLink(props) {
  return (
    <div id={props.link} href={props.link} className={props.cls} onClick={(e) => props.onClick(e.href)}>
      {props.value}
    </div>
  );
}
export default class Menu extends React.Component {
  constructor(props, _railsContext) {
    super(props)
    console.log(props)
    console.debug("==in Menu==");

    // 初期設定
    this.state = {
      process: "temphumdity"
    };
  }
  showTempHumidity(target) {
    this.setState({ process: "temphumdity"});
    // .bg-info

    console.log(target);
    console.log(this.state.process);
    document.getElementById('panel_heading').innerHTML = "温湿度状況";
    document.getElementById('panel_body').innerHTML = "昆虫の生育環境をモニタします。";
    ReactDOM.render(
      <TempHumidityList tempHumidityList={this.props.tempHumidityList} />,           // 出力するコンポーネントを指定
      document.getElementById('app')    // 出力先のelementを指定(jQueryを併用できる)
    );
  }

  showFacility(target) {
    this.setState({ process: "facilities"});
    console.log(this.state.process);
    document.getElementById('panel_heading').innerHTML = "設備確認";
    document.getElementById('panel_body').innerHTML = "昆虫の生育設備を管理します。";
    ReactDOM.render(
      <Facilities  facilities={this.props.facilities}/>,           // 出力するコンポーネントを指定
      document.getElementById('app')    // 出力先のelementを指定(jQueryを併用できる)
    );
  }

  showUser(target) {
    this.setState({ process: "users"});
    console.log(this.state.process);
    document.getElementById('panel_heading').innerHTML = "昆活メイト";
    document.getElementById('panel_body').innerHTML = "昆活仲間の招待や確認をします。";
    ReactDOM.render(
      <Users  users={this.props.users}/>,           // 出力するコンポーネントを指定
      document.getElementById('app')    // 出力先のelementを指定(jQueryを併用できる)
    );
  }

  // リンク情報の描画
  render() {
    return (
      <div className="nav">
        <ul className="list-group">
          <li className="list-group-item list-group-item-action view overlay ">
            <ChangeLink cls="nav-link bg-primary text-white clickable" link="#temphumdity" onClick={(e) => this.showTempHumidity(e)}  value="温湿度状況"/>
          </li>
          <li className="list-group-item list-group-item-action bg-info">
            <ChangeLink cls="nav-link bg-primary text-white clickable" link="#facilities" onClick={(e) => this.showFacility(e)}  value="設備一覧" />
          </li>
          <li className="list-group-item list-group-item-action">
            <ChangeLink cls="nav-link bg-primary text-white clickable" link="#users"  onClick={(e) => this.showUser(e)} value="昆活メイト" />
          </li>
        </ul>
      </div>
    );
  }
}

ReactOnRails.register({
  TempHumidityList,
  Menu,
  Users,
  Facilities,
});
