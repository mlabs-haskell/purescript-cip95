"use strict";

export const _getWalletApi = walletName => () =>
  window.cardano[walletName].enable({ extensions: [{ cip: 95 }] });

export const _getPubDrepKey = api => () => api.cip95.getPubDRepKey();

export const _getRegisteredPubStakeKeys = api => () => api.cip95.getRegisteredPubStakeKeys();

export const _getUnregisteredPubStakeKeys = api => () =>
  api.cip95.getUnregisteredPubStakeKeys();

export const _signData = api => addrOrDrepId => payload => () =>
  api.cip95.signData(addrOrDrepId, payload);

// NOTE: signTx() is not namespaced under cip95, because it extends
// the CIP-30 functionality in a backwards compatible way.
export const _signTx = api => tx => partialSign => () => api.signTx(tx, partialSign);
