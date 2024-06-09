export const getWallet = () => {
  return (
    prompt("which wallet to connect to? e.g. 'eternl', 'nami'", "eternl") ||
    (() => {
      throw "Failed to get wallet name";
    })()
  );
};
