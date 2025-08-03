import React from 'react';
import sr from './office.jpg';
import './App.css'; 

function App() {
  const element = "Office Space";

  const jsxatt = (
    <img
      src={sr}
      width="25%"
      height="25%"
      alt="Office Space"
      style={{ borderRadius: '8px', marginTop: '10px' }}
    />
  );

  const ItemName = {
    Name: "DBS",
    Rent: 50000,
    Address: "Chennai"
  };

  const colorStyle = {
    color: ItemName.Rent <= 60000 ? 'red' : 'green',
    fontWeight: 'bold'
  };

  return (
    <div style={{ padding: '30px', fontFamily: 'Arial' }}>
      <h1 style={{ fontSize: '2em' }}>{element} , at Affordable Range</h1>
      {jsxatt}
      <h1>Name: {ItemName.Name}</h1>
      <h3 style={colorStyle}>Rent: Rs. {ItemName.Rent}</h3>
      <h3>Address: {ItemName.Address}</h3>
    </div>
  );
}

export default App;