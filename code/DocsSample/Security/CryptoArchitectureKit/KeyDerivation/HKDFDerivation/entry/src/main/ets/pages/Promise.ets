/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// [Start use_hkdf_for_key_derivation_promise]

import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { buffer } from '@kit.ArkTS';

function kdfPromise() {
  let keyData = new Uint8Array(buffer.from('012345678901234567890123456789', 'utf-8').buffer);
  let saltData = new Uint8Array(buffer.from('0123456789', 'utf-8').buffer);
  let infoData = new Uint8Array(buffer.from('infostring', 'utf-8').buffer);
  let spec: cryptoFramework.HKDFSpec = {
    algName: 'HKDF',
    key: keyData,
    salt: saltData,
    info: infoData,
    keySize: 32
  };
  let kdf = cryptoFramework.createKdf('HKDF|SHA256|EXTRACT_AND_EXPAND');
  let kdfPromise = kdf.generateSecret(spec);
  kdfPromise.then((secret) => {
    console.info('key derivation output is ' + secret.data);
  }).catch((error: BusinessError) => {
    console.error('key derivation error.');
  });
}

// [End use_hkdf_for_key_derivation_promise]
@Entry
@Component
struct Index {
  @State message: string = 'Promise';

  build() {
    Column({ space: 12 }) {
      Text(this.message).fontSize(20).fontWeight(FontWeight.Bold)
      Button($r('app.string.call_promise'))
        .width('70%')
        .onClick(() => {
          try {
            kdfPromise();
            this.message = 'Promise Success';
          } catch {
            this.message = 'Promise Fail';
          }
        })
    }
    .height('100%')
    .width('100%')
  }
}