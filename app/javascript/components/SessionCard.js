import React from 'react';

const SessionCard = ({ session, handleSignUp }) => (
  <div className="session-card">
    <h3>{session.name}</h3>
    <p>Location: {session.area_id}</p>
    <p>Type: {session.session_type}</p>
    <p>Registrations: {session.registrations.length}</p>
    <button onClick={() => handleSignUp(session.id)}>Sign Up</button>
  </div>
);

export default SessionCard;
