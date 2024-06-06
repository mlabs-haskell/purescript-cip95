"use strict";

export const _getWalletApi = walletName => () =>
  window.cardano[walletName]
    .enable({ extensions: [{ cip: 95 }] })
    .then(wallet => wallet.cip95);

export const _getPubDrepKey = api => () => api.getPubDRepKey();
export const _getRegisteredPubStakeKeys = api => () => api.getRegisteredPubStakeKeys();
export const _getUnregisteredPubStakeKeys = api => () => api.getRegisteredPubStakeKeys();
export const _signData = api => addrOrDrepId => payload => () =>
  api.signData(addrOrDrepId, payload);
