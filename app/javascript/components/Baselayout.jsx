import React from "react";

export default class Baselayout extends React.Component {
  render(){
    return(
      <div>
        <nav><img src = "https://durhamdill.files.wordpress.com/2017/10/tourify-logo-200px.png" alt = "tourify logo"/></nav>
          {this.props.children}
        <footer></footer>
      </div>
    )
  }
}
