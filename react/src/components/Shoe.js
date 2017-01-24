import React from 'react';

const Shoe = (props) => {
  return(
    <div>
      <h4><a href={'/shoes/new'}>Add New Shoe</a></h4>
      <h2><a href={'/shoes/' + props.id}>{props.brand} {props.model} {props.version}</a></h2>
      <img src={`${props.picture}`}/>
      <h4>{props.description} {props.year}</h4>
      <p>{props.price}</p>
    </div>
  )

}

export default Shoe;
