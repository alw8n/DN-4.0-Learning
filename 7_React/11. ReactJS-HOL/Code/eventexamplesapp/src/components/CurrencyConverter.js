import React, { useState } from 'react';

function CurrencyConverter() {
  const [amount, setAmount] = useState('');
  const [currency, setCurrency] = useState('');

  const handleSubmit = () => {
    if (currency.toLowerCase() === 'euro') {
      const converted = amount * 80;
      alert(`Converting to Euro Amount is ₹${converted}`);
    } else if (currency.toLowerCase() === 'rupee' || currency.toLowerCase() === 'inr') {
      const converted = amount / 80;
      alert(`Converting to Rupee Amount is €${converted.toFixed(2)}`);
    } else {
      alert('Please enter valid currency: "Euro" or "Rupee"');
    }
  };

  return (
    <div>
      <h2 style={{ color: 'green' }}>Currency Convertor!!!</h2>
      <label>Amount: </label>
      <input
        type="number"
        value={amount}
        onChange={(e) => setAmount(e.target.value)}
      /><br />
      <label>Currency: </label>
      <input
        type="text"
        value={currency}
        onChange={(e) => setCurrency(e.target.value)}
      /><br />
      <br />
      <button onClick={handleSubmit}>Submit</button>
    </div>
  );
}

export default CurrencyConverter;