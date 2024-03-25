const axios = require('axios');

const notes_base_url = 'http://web:3000';

const url = `${notes_base_url}/api/v1/notes`

const headers = {
  'Content-Type': 'application/json'
};

const data = {
  note: {
    title: "title",
    content: "text"
  }
};

axios.post(url, data, { headers })
  .then(response => {
    console.log('Response:', response.data);
  })
  .catch(error => {
    console.error('Error:', error.message);
  });
