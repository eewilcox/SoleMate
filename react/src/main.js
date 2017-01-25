import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import VoteButton from './components/VoteButton';

$(function() {
  if (document.getElementById('app')) {
    ReactDOM.render(
      <App />,
      document.getElementById('app')
    );
  }
  let buttons = document.getElementsByClassName('vote');
  for(let button of buttons){
    ReactDOM.render(
      <VoteButton
        review = {parseInt(button.dataset.id)}
      />,
      button
    );
  }

});
