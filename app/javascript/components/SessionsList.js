import React, { useEffect, useState } from 'react';
import axios from 'axios';
import SessionCard from './SessionCard';
import './sessions.css';

const SessionsList = () => {
  const [sessions, setSessions] = useState([]);

  useEffect(() => {
    axios.get('/sessions.json')
      .then(response => {
        setSessions(response.data);
      })
      .catch(error => {
        console.error('Error fetching sessions:', error);
      });
  }, []);

  const handleSignUp = (sessionId) => {
    axios.post('/registrations', {
      registration: {
        goodgymer_id: 1, // Replace with dynamic goodgymer_id
        session_id: sessionId
      }
    })
    .then(response => {
      console.log('Signed up successfully:', response.data);
      // Update the session list with the new registration
      setSessions(prevSessions => prevSessions.map(session =>
        session.id === sessionId ? { ...session, registrations: [...session.registrations, response.data] } : session
      ));
    })
    .catch(error => {
      console.error('Error signing up:', error);
    });
  };

  return (
    <div className="sessions-list">
      {sessions.map(session => (
        <SessionCard key={session.id} session={session} onSignUpClick={handleSignUp} />
      ))}
    </div>
  );
};

export default SessionsList;
