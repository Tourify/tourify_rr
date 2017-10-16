// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import {BrowserRouter, Route, Switch} from 'react-router-dom';
import Baselayout from '../components/Baselayout';
import TourStop from '../components/TourStop';
import TourHome from '../components/TourHome';
import Home from '../components/Home';


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <BrowserRouter>
      <Baselayout>
      <Switch>
        <Route exact path = "/" component={Home}/>
      </Switch>
    </Baselayout>
    </BrowserRouter>
    ,
    document.getElementById('mount')
  )
})
