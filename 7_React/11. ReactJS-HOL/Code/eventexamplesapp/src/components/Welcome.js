import React from 'react';

function Welcome() {
  const sayMessage = (msg) => {
    alert(msg);
  };

  return (
    <div>
      <br />
      <button onClick={() => sayMessage('welcome')}>Say welcome</button>
    </div>
  );
}

export default Welcome;