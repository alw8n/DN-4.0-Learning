import React from 'react';

function ClickMe() {
  const handleClick = (e) => {
    e.preventDefault();
    alert("I was clicked");
  };

  return (
    <div>
      <br />
      <button onClick={handleClick}>Click on me</button>
    </div>
  );
}

export default ClickMe;