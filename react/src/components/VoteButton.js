import React, { Component } from 'react';

class VoteButton extends Component {
  constructor(props) {
    super(props);
    this.state = {
      tally: 0
    };
    this.handleClick = this.handleClick.bind(this);
  }

  componentDidMount() {
    fetch(`http://localhost:3000/api/v1/reviews/${this.props.review}/votes`)
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

  handleClick(event) {
    let data = {
        poll: this.props.poll
    };
    let jsonStringData = JSON.stringify(data);

    fetch(`http://localhost:3000/api/v1/reviews/${this.props.review}/votes.json`,
      { method: 'post',
        body: jsonStringData,
        credentials: 'include'
      })
      .then(response => {
        if (response.ok) {
          return response.json();
        } else {
          console.log("Oops");
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
      <div onClick={this.handleClick}>
        <h1>{this.props.label} {this.state.tally}</h1>
      </div>
    );
  }
}

export default VoteButton;
