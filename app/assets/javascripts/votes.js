// // first, create a single fetch call to one of your Rails API endpoints
// fetch('/reviews/1/votes',
//       { method: "POST",
//         body: JSON.stringify({poll: true})})
//   .then(response => {
//     if (response.ok) {
//
//       return response;
//     }
//   })
//   .then(response => response.json())
//   .then(body => {
//     let data = body;
//   });

// put a pry in the top of the path/controller action that you expect to hit

// render json: whatever data you want to show
// resolving and receiving data from fetch call is otherwise the same as in your sinatra app
