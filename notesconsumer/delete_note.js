const axios = require('axios');

const notes_base_url = 'http://web:3000';

const url = `${notes_base_url}/api/v1/notes/1`

const headers = {
  'Content-Type': 'application/json'
};

axios.delete(url, { headers })
  .then(response => {
    console.log('Response:', response.data);
    console.log('Response status:', response.status)
  })
  .catch(error => {
    console.error('Error:', error.message);
  });
