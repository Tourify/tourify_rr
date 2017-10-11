import React from "react";

export default class Baselayout extends React.Component {
  render(){
    return(
      <div>
        <nav></nav>
          {this.props.children}
        <footer></footer>
      </div>
    )
  }
}
