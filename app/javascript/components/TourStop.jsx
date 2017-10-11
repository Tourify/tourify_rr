import React from "react";

export default class TourStop extends React.Component {
  render(){
    return(
      <div>
        <div className = 'tourstop-main-photo'>
          <img src = ""/>
        </div>
        <div className = "tourstop-header-text">
          <h1>Location Title</h1>
          <p>Current Tour:</p>
        </div>
          <div className = "tourstop-header-links">
            <img src = "https://durhamdill.files.wordpress.com/2017/10/tourify-pin-100px.png" alt = "icon"/>
            <p>Street Name</p>
            <p>|</p>
            <p><a href = "">        Website</a></p>
          </div>
          <div className = "tourstop-body">
          <div className = "tourstop-body-text">
            <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.</p>
          </div>
          <div className = "tourstop-travel-tip">
            <p>Tip for this location</p>
          </div>
          <div className = "tourstop-footer-links">
            <img src = "https://durhamdill.files.wordpress.com/2017/10/tourify-arrow.png"/>
            <a href = "">TOUR HOME</a>
            <img src = "https://durhamdill.files.wordpress.com/2017/10/tourify-arrow-right.png"/>
          </div>
        </div>
        </div>
    )
  }
}
