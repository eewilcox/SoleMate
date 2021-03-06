import React, { Component } from 'react';
import Shoe from "./Shoe";


class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      shoeData: [],
    };
    this.fetching = this.fetching.bind(this);
  }

  fetching () {
    fetch('/api/v1/shoes.json')
      .then(response => {
        if (response.ok) {
          return response;
        }
      })
      .then(response => response.json())
      .then(body => {
        let data = body;

        this.setState({ shoeData: data });
      });
  }

  componentDidMount() {
    this.fetching();
    setInterval(
      this.fetching, 10000);
  }

  render(){

    let shoes;
    if (this.state.shoeData) {
      shoes = this.state.shoeData.map(shoe => {
        return(
          <div>
            <Shoe
              key={shoe.id}
              id={shoe.id}
              model={shoe.model}
              version={shoe.version}
              brand={shoe.brand}
              picture={shoe.picture}
              year={shoe.year}
              price={shoe.price}
              description={shoe.description}
            />
          </div>
        )
      })
    }

    return (
      <div>
      <h3 id="new-shoe-react"><a href={'/shoes/new'}>Add New Shoe</a></h3>
        {shoes}
      </div>
    )
  }
}

export default App;
