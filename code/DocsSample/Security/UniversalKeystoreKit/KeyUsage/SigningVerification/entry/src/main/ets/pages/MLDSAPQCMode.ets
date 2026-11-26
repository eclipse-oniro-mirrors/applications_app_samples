/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start key_algorithm_MLDSAPQCMode]
/*
 * 密钥算法为ML-DSA，签名模式为预哈希模式（preHash），摘要算法为SHA256
 */
import { huks } from '@kit.UniversalKeystoreKit';
import { cryptoFramework } from '@kit.CryptoArchitectureKit';

let keyAlias = 'test_mlDsaKeyAlias';
let handle: number;
let plaintext = '123456';

function stringToUint8Array(str: string): Uint8Array {
  let arr: number[] = [];
  for (let i = 0; i < str.length; i++) {
    arr.push(str.charCodeAt(i));
  }
  return new Uint8Array(arr);
}

async function generateMlDsaKey(): Promise<void> {
  let properties: huks.HuksParam[] = [{
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_ML_DSA
  }, {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_ML_DSA_KEY_PARAM_SET_44
  }, {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN |
    huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY
  }];
  await huks.generateKeyItem(keyAlias, { properties: properties });
}

async function sha256Digest(message: string): Promise<Uint8Array> {
  let md = cryptoFramework.createMd('SHA256');
  await md.update({ data: stringToUint8Array(message) });
  let digest = await md.digest();
  return digest.data;
}

function getMlDsaSignProperties(): huks.HuksParam[] {
  let properties: huks.HuksParam[] = [{
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_ML_DSA
  }, {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_ML_DSA_KEY_PARAM_SET_44
  }, {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN
  }, {
    tag: huks.HuksTag.HUKS_TAG_PQC_SIG_MODE,
    value: huks.HuksPQCSigMode.HUKS_PQC_SIG_MODE_PREHASH
  }, {
    tag: huks.HuksTag.HUKS_TAG_DIGEST,
    value: huks.HuksKeyDigest.HUKS_DIGEST_SHA256
  }, {
    tag: huks.HuksTag.HUKS_TAG_CONTEXT,
    value: stringToUint8Array('ml-dsa')
  }];
  return properties;
}

function getMlDsaVerifyProperties(): huks.HuksParam[] {
  let properties: huks.HuksParam[] = [{
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_ML_DSA
  }, {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_ML_DSA_KEY_PARAM_SET_44
  }, {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY
  }, {
    tag: huks.HuksTag.HUKS_TAG_PQC_SIG_MODE,
    value: huks.HuksPQCSigMode.HUKS_PQC_SIG_MODE_PREHASH
  }, {
    tag: huks.HuksTag.HUKS_TAG_DIGEST,
    value: huks.HuksKeyDigest.HUKS_DIGEST_SHA256
  }, {
    tag: huks.HuksTag.HUKS_TAG_CONTEXT,
    value: stringToUint8Array('ml-dsa')
  }];
  return properties;
}

async function sign(digest: Uint8Array): Promise<Uint8Array> {
  let options: huks.HuksOptions = {
    properties: getMlDsaSignProperties(),
    inData: digest
  };
  let session: huks.HuksSessionHandle = await huks.initSession(keyAlias, options);
  handle = session.handle;
  let result: huks.HuksReturnResult = await huks.finishSession(handle, options);
  return result.outData as Uint8Array;
}

async function verify(digest: Uint8Array, sig: Uint8Array): Promise<void> {
  let options: huks.HuksOptions = {
    properties: getMlDsaVerifyProperties(),
    inData: digest
  };
  let session: huks.HuksSessionHandle = await huks.initSession(keyAlias, options);
  handle = session.handle;
  await huks.updateSession(handle, options);
  let verifyOptions: huks.HuksOptions = {
    properties: getMlDsaVerifyProperties(),
    inData: sig
  };
  await huks.finishSession(handle, verifyOptions);
}

async function deleteMlDsaKey(): Promise<void> {
  await huks.deleteKeyItem(keyAlias, { properties: [] });
}

async function testSignVerify(): Promise<void> {
  await generateMlDsaKey();
  let digest: Uint8Array = await sha256Digest(plaintext);
  let signature: Uint8Array = await sign(digest);
  await verify(digest, signature);
  await deleteMlDsaKey();
}
// [End key_algorithm_MLDSAPQCMode]

@Entry
@Component
struct Index {
  @State message: string = 'ML-DSA/PQC Mode';

  build() {
    Column({ space: 12 }) {
      Text(this.message)
        .fontWeight(FontWeight.Regular)
        .fontSize($r('sys.float.ohos_id_text_size_body1'))
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .maxLines(Infinity)
        .textAlign(TextAlign.Start)
      Button($r('app.string.mldsa_pqc_mode'))
        .padding('12vp')
        .height('40vp')
        .borderRadius($r('sys.float.ohos_id_corner_radius_button'))
        .backgroundColor($r('sys.color.ohos_id_color_emphasize'))
        .fontSize('14sp')
        .fontColor('#ffffff')
        .onClick(async () => {
          try {
            await testSignVerify();
            this.message = 'ML-DSA/PQC Mode Result: Success';
          } catch (error) {
            this.message = 'ML-DSA/PQC Mode Result: Failed';
          }
        })
    }
    .height('100%')
    .width('100%')
  }
}
