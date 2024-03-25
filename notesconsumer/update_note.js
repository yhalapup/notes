const axios = require('axios');

const notes_base_url = 'http://web:3000';

const url = `${notes_base_url}/api/v1/notes/1`

const headers = {
  'Content-Type': 'application/json'
};

const data = {
  note: {
    title: "updated title",
    content: "updated content"
  }
};

axios.patch(url, data, { headers })
  .then(response => {
    console.log('Response:', response.data);
  })
  .catch(error => {
    console.error('Error:', error.message);
  });
