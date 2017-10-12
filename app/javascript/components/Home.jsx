import React from "react";

export default class Home extends React.Component {
  render(){
    return(
      <div>
      <div className = "tour-main-photo">
        <div className = "tour-main-text">
          <div><h1>DURHAM, NC</h1></div>
          <div><h2>City intro sentence will go here.</h2></div>
        </div>
          <p>Content provided by Durham Convention & Visitors Bureau</p>
      </div>
      <div className = "select-a-tour">
        <h3>SELECT A TOUR</h3>
      </div>
      <div className = "tours-wrapper">
        <div className = "tour-item">
          <div className = "tour-item-photo">
          </div>
          <div className = "tour-item-text">
          <p>Downtown History Walk</p>
        </div>
        </div>
        <div className = "tour-item">
          <div className = "tour-item-photo">
          </div>
          <div className = "tour-item-text">

          <p>African-American Heritage</p>
        </div>
      </div>
        <div className = "tour-item">
          <div className = "tour-item-photo">
          </div>
          <div className = "tour-item-text">

          <p>Bull City Breweries</p>
        </div>
        </div>
        <div className = "tour-item">
          <div className = "tour-item-photo">
          </div>
          <div className = "tour-item-text">

          <p>Public Art Walk</p>
        </div>
        </div>
      </div>
    </div>
    )
  }
}
