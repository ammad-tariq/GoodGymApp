import React, { useState, useEffect } from 'react';
import axios from 'axios';
import SessionCard from './SessionCard';

const SessionsList = () => {
  const [sessions, setSessions] = useState([]);

  useEffect(() => {
    axios.get('/sessions')
      .then(response => {
        setSessions(response.data);
      })
      .catch(error => {
        console.error("There was an error fetching the sessions!", error);
      });
  }, []);

  const handleSignUp = (sessionId) => {
    axios.post('/registrations', { goodgymer_id: 1, session_id: sessionId })
      .then(response => {
        console.log("Signed up successfully!", response.data);
      })
      .catch(error => {
        console.error("There was an error signing up!", error);
      });
  };

  return (
    <div className="sessions-list">
      {sessions.map(session => (
        <SessionCard key={session.id} session={session} handleSignUp={handleSignUp} />
      ))}
    </div>
  );
};

export default SessionsList;
