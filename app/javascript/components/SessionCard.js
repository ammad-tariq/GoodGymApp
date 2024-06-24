import React from 'react';
import './session_card.css';

// Function to get initials from the session name
const getInitials = (name) => {
  const initials = name.split(' ').map(word => word[0]).join('');
  return initials.toUpperCase();
};

const SessionCard = ({ session, onSignUpClick }) => {
  const initials = getInitials(session.name);

  return (
    <div className="session-card">
      <div className="session-card-header">
        <h3>{session.name}</h3>
        <div className="initials-circle">{initials}</div>
      </div>
      <div className="session-details">
        <p><strong>Time:</strong> Tomorrow 8:30am</p>
        <p><strong>Location:</strong> Bishops Park (Fulham Palace Parkrun finish line) SW6 6EA</p>
        <p>Helping to run a social 5km event for all to enjoy!</p>
      </div>
      <div className="registrations">
        <div className="goodgymer-images">
          <div className="goodgymer-initials">AB</div>
          <div className="goodgymer-initials">CD</div>
          <div className="goodgymer-initials">EF</div>
        </div>
        <p>{session.registrations.length} GoodGymers are going</p>
      </div>
      <button className="sign-up-btn" onClick={() => onSignUpClick(session.id)}>Sign Up</button>
    </div>
  );
};

export default SessionCard;
