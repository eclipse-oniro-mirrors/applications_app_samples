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
// [Start secure_random_number_generation]

import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { BusinessError } from '@kit.BasicServicesKit';

function doRandBySync() {
  let rand = cryptoFramework.createRandom();
  let len = 24; // Generate a 24-byte random number.
  try {
    let randData = rand.generateRandomSync(len);
    if (randData != null) {
      console.info('[Sync]: rand result: ' + randData.data);
    } else {
      console.error('[Sync]: get rand result fail!');
    }
  } catch (error) {
    let e: BusinessError = error as BusinessError;
    console.error(`do rand failed, ${e.code}, ${e.message}`);
  }
}

async function doRand() {
  let rand = cryptoFramework.createRandom();
  let seed = new Uint8Array([1, 2, 3]);
  rand.setSeed({ data: seed });
  let len = 12;
  let randOutput = await rand.generateRandom(len);
  console.info('rand output:' + randOutput.data);
}

// [End secure_random_number_generation]

@Entry
@Component
struct Index {
  @State message: string = 'SecureRandomNumberGeneration';

  build() {
    Column({ space: 5 }) {
      Text(this.message)
        .fontSize(25)
        .fontWeight(FontWeight.Bold)
      Button($r('app.string.call_async'))
        .width('70%')
        .onClick(async () => {
          try {
            await doRand();
            this.message = 'AsyncSuccess';
          } catch {
            this.message = 'AsyncFail';
          }
        })
      Button($r('app.string.call_sync'))
        .width('70%')
        .onClick(() => {
          try {
            doRandBySync();
            this.message = 'SyncSuccess';
          } catch {
            this.message = 'SyncFail';
          }
        })
    }
    .height('100%')
    .width('100%')
  }
}