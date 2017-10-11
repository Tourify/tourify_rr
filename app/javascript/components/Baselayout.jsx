import React from "react";

export default class Baselayout extends React.Component {
  render(){
    return(
      <div>
        <nav>This the navigation that shows on every page</nav>
        {this.props.children}

        <footer>This is the footer</footer>
      </div>
    )
  }
}
