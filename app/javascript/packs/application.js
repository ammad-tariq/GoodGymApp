// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import React from 'react';
import ReactDOM from 'react-dom';
import SessionsList from '../components/SessionsList';

// Import the CSS files
import '../components/sessions.css';
import '../components/session_card.css';

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('sessions-list');
  if (node) {
    ReactDOM.render(<SessionsList />, node);
  }
});
