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

import { sleep } from './common';
// [Start import]
import { privacyComputation } from '@kit.DataProtectionKit';
// [End import]
import { BusinessError } from '@kit.BasicServicesKit';

export async function pirFlow(): Promise<string> {
  let resultText: string = '';
  try {
    // [Start genPrivacyTarget]
    const targetElement: privacyComputation.TargetElement = {
      elemData: new Uint8Array([0x01, 0x02, 0x03]),
      hashAlg: privacyComputation.HashAlg.SHA256
    };
    const privacyProtocol: privacyComputation.PrivacyProtocol = {
      dataSetSize: privacyComputation.DataSetSize.SIZE_256,
      protocolType: privacyComputation.ProtocolType.PIR_PROTOCOL
    };
    const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, privacyProtocol);
    // [End genPrivacyTarget]

    // [Start privacySearch]
    const elements: privacyComputation.Element[] = [
      {
        elemKey: new Uint8Array([0x01, 0x02, 0x03]),
        hashAlg: privacyComputation.HashAlg.SHA256,
        elemValue: new Uint8Array([0xA1, 0xA2])
      },
      {
        elemKey: new Uint8Array([0x07, 0x08, 0x09]),
        hashAlg: privacyComputation.HashAlg.SHA256,
        elemValue: new Uint8Array([0xB1, 0xB2])
      }
    ];
    const searchResult: privacyComputation.PrivacySearchResult =
      await privacyComputation.privacySearch(privacyTarget, elements, privacyProtocol);
    // [End privacySearch]

    // [Start getSearchResult]
    const result: privacyComputation.SearchResult =
      await privacyComputation.getSearchResult(searchResult, privacyProtocol);
    console.info('matched: ' + result.matchedResult);
    if (result.matchedResult && result.attachedValues) {
      console.info('attachedValues count: ' + result.attachedValues.length);
    }
    // [End getSearchResult]

    // [StartExclude getSearchResult]
    let attachedInfo: string = '';
    if (result.matchedResult && result.attachedValues) {
      attachedInfo = ', attachedValues count: ' + result.attachedValues.length;
    }
    resultText = 'PIR matched: ' + result.matchedResult + attachedInfo;
    // [EndExclude getSearchResult]
  } catch (err) {
    let error = err as BusinessError;
    console.error(`PIR flow failed. Code is ${error.code}, message is ${error.message}`);
    // [StartExclude getSearchResult]
    resultText = 'PIR error: ' + error.message;
    // [EndExclude getSearchResult]
  }
  await sleep(500);
  return resultText;
}
