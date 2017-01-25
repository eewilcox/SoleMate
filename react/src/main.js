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
  let upvoteButtons = document.getElementsByClassName('upvote');
  for (let button of upvoteButtons) {
    ReactDOM.render(
      <VoteButton
        label = "Upvote"
        review = {parseInt(button.dataset.id)}
        poll = {true}
      />,
      button
    );
  }
  let downvoteButtons = document.getElementsByClassName('downvote');
  for (let button of downvoteButtons) {
    ReactDOM.render(
      <VoteButton
        label = "Downvote"
        review = {parseInt(button.dataset.id)}
        poll = {false}
      />,
      button
    );
  }
});
