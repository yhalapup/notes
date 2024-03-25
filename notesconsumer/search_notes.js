const axios = require('axios');

const notes_base_url = 'http://web:3000';

const url = `${notes_base_url}/api/v1/notes?page=1&query=title`

const headers = {
  'Content-Type': 'application/json'
};

axios.get(url, { headers })
  .then(response => {
    console.log('Response:', response.data);
  })
  .catch(error => {
    console.error('Error:', error.message);
  });
