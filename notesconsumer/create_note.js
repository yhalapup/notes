const axios = require('axios');

const notes_base_url = 'http://web:3000';

const url = `${notes_base_url}/api/v1/notes`

const headers = {
  'Content-Type': 'application/json'
};

// POST request with data
const postData = {
  note: {
    title: "title created from script",
    content: "content created from script"
  }
};

axios.post(url, postData, { headers })
  .then(response => {
    console.log('Response:', response.data);
  })
  .catch(error => {
    console.error('Error:', error.message);
  });
