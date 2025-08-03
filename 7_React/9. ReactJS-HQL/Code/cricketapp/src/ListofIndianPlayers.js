export default function ListofIndianPlayers({ IndianPlayers }) {
  return (
    <>
      {IndianPlayers.map((player, index) => (
        <li key={index}>Mr. {player}</li>
      ))}
    </>
  );
}