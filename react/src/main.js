import 'babel-polyfill';
import 'whatwg-fetch';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';


var minutes = 0.1, the_interval = minutes * 60 * 1000;


$(function() {
  ReactDOM.render(
    <App />,
    document.getElementById('app')
  );
});
