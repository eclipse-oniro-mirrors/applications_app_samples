/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [ukey_sign_verify_arkts]
import { huks, huksExternalCrypto } from '@kit.UniversalKeystoreKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { util } from '@kit.ArkTS';

let handle: number;
let plaintext = '123456';
let signature: Uint8Array;

function stringToUint8Array(str: string): Uint8Array {
  return new util.TextEncoder().encodeInto(str);
}

interface HuksProperty {
    tag: huks.HuksTag;
    value: number;
}

function getRsaSignProperties(): HuksProperty[] {
  return [
    { tag: huks.HuksTag.HUKS_TAG_ALGORITHM, value: huks.HuksKeyAlg.HUKS_ALG_RSA },
    { tag: huks.HuksTag.HUKS_TAG_KEY_SIZE, value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_2048 },
    { tag: huks.HuksTag.HUKS_TAG_PADDING, value: huks.HuksKeyPadding.HUKS_PADDING_PSS },
    { tag: huks.HuksTag.HUKS_TAG_DIGEST, value: huks.HuksKeyDigest.HUKS_DIGEST_SHA256 },
    { tag: huks.HuksTag.HUKS_TAG_PURPOSE, value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN },
    { tag: huks.HuksTag.HUKS_TAG_KEY_CLASS, value: huks.HuksKeyClassType.HUKS_KEY_CLASS_EXTENSION }
  ];
}

function getRsaVerifyProperties(): HuksProperty[] {
  return [
    { tag: huks.HuksTag.HUKS_TAG_ALGORITHM, value: huks.HuksKeyAlg.HUKS_ALG_RSA },
    { tag: huks.HuksTag.HUKS_TAG_KEY_SIZE, value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_2048 },
    { tag: huks.HuksTag.HUKS_TAG_PADDING, value: huks.HuksKeyPadding.HUKS_PADDING_PSS },
    { tag: huks.HuksTag.HUKS_TAG_DIGEST, value: huks.HuksKeyDigest.HUKS_DIGEST_SHA256 },
    { tag: huks.HuksTag.HUKS_TAG_PURPOSE, value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY },
    { tag: huks.HuksTag.HUKS_TAG_KEY_CLASS, value: huks.HuksKeyClassType.HUKS_KEY_CLASS_EXTENSION }
  ];
}

async function initSession(keyAlias: string, options: huks.HuksOptions) {
  await huks.initSession(keyAlias, options)
    .then((data) => { handle = data.handle; })
    .catch((error: BusinessError) => console.error(`initSession failed: ${error.code}`));
}

async function finishSession(options: huks.HuksOptions) {
  await huks.finishSession(handle, options)
    .then((data) => { signature = data.outData as Uint8Array; });
}

async function sign(keyAlias: string) {
  const options: huks.HuksOptions = { properties: getRsaSignProperties() };
  await initSession(keyAlias, options);
  if (handle !== undefined) {
    options.inData = stringToUint8Array(plaintext);
    await finishSession(options);
  }
}

async function verify(keyAlias: string) {
  const options: huks.HuksOptions = { properties: getRsaVerifyProperties() };
  await initSession(keyAlias, options);
  if (handle !== undefined) {
    options.inData = stringToUint8Array(plaintext);
    await huks.updateSession(handle, options);
    options.inData = signature;
    await huks.finishSession(handle, options);
  }
}

async function signAndVerify() {
  const keyAlias = JSON.stringify({
    providerName: "testProviderName",
    bundleName: "com.example.cryptoapplication",
    abilityName: "CryptoExtension",
    index: { key: "testKey" } as ESObject
  });
  try {
    // 签名流程
    await huksExternalCrypto.openResource(keyAlias);
    // 进行PIN认证
    await sign(keyAlias);
    await huksExternalCrypto.closeResource(keyAlias);

    // 验签流程（不需要PIN认证）
    await huksExternalCrypto.openResource(keyAlias);
    await verify(keyAlias);
    await huksExternalCrypto.closeResource(keyAlias);
  } catch (error) {
    console.error('signAndVerify input arg invalid.');
  }
}
// [ukey_sign_verify_arkts]
