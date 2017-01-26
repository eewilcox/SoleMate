import React from 'react';

const Shoe = (props) => {
  return(
    <div>
      <div className="row">
        <div className="shoe">
        <h2><a href={'/shoes/' + props.id}>{props.brand} {props.model} {props.version}</a></h2>
        <img src={`${props.picture}`}/>
        </div>
      </div>
    </div>
  )

}

export default Shoe;
