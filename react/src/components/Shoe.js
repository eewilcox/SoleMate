import React from 'react';

const Shoe = (props) => {
  return(
    <div>
      <div>
        <div id="react-shoes" className="columns small-6">
        <h2><a href={'/shoes/' + props.id}>{props.brand} {props.model} {props.version}</a></h2>
        <img src={`${props.picture}`}/>
        </div>
      </div>
    </div>
  )

}

export default Shoe;
