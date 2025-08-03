import React from 'react';
import Counter from './components/Counter';
import Welcome from './components/Welcome';
import ClickMe from './components/ClickMe';
import CurrencyConverter from './components/CurrencyConverter';

function App() {
  return (
    <div style={{ marginLeft: '30px', marginTop: '20px' }}>
      <Counter />
      <Welcome />
      <ClickMe />
      <CurrencyConverter />
    </div>
  );
}

export default App;