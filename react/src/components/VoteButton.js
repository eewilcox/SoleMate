import React, { Component } from 'react';

class VoteButton extends Component {
  constructor(props) {
    super(props);
    this.state = {
      tally: this.props.review.tally
    };
    this.handleUpvote = this.handleUpvote.bind(this);
    this.handleDownvote = this.handleDownvote.bind(this);
  }

  componentDidMount() {
    fetch(`/api/v1/reviews/${this.props.review}/votes.json`)
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} ($response.statusText)`,
            error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({tally: body});
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleUpvote(event) {
    let data = {
        poll: true
    };
    let jsonStringData = JSON.stringify(data);

    fetch(`/api/v1/reviews/${this.props.review}/votes.json`,
      { method: 'post',
        body: jsonStringData,
        credentials: 'include'
      })
      .then(response => {
        if (response.ok) {
          return response.json();
        } else {
          let errorMessage = `${response.status} ($response.statusText)`,
            error = new Error(errorMessage);
            throw(error);
        }
      })
      .then(data => {
         this.setState({ tally: data });
      })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
}

  handleDownvote(event) {
    let data = {
        poll: false
    };
    let jsonStringData = JSON.stringify(data);

    fetch(`/api/v1/reviews/${this.props.review}/votes.json`,
      { method: 'post',
        body: jsonStringData,
        credentials: 'include'
      })
      .then(response => {
        if (response.ok) {
          return response.json();
        } else {
          let errorMessage = `${response.status} ($response.statusText)`,
            error = new Error(errorMessage);
            throw(error);
        }
      })
      .then(data => {
         this.setState({ tally: data });
      })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <div>
        <div onClick={this.handleUpvote}>
          <button>+</button>
        </div>
        <div> {this.state.tally} </div>
        <div onClick={this.handleDownvote}>
          <button>-</button>
        </div>
      </div>
    );
  }
}

export default VoteButton;
