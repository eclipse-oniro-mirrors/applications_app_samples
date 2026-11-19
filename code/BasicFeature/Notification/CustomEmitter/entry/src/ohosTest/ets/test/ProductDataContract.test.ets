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

import { describe, beforeEach, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { PRODUCT_DATA } from '../../../main/ets/mock/ProductsData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomEmitter_ProductData]';

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    await func();
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function productDataContractTest() {
  describe('productDataContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
          resolve();
        }, 10);
      });
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PRODUCT_0100
     * @tc.name testProductIdsSequential0001
     * @tc.desc Verify PRODUCT_DATA has five items whose ids match their indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testProductIdsSequential0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductIdsSequential0001 begin');
      expect(PRODUCT_DATA.length).assertEqual(5);
      for (let i: number = 0; i < PRODUCT_DATA.length; i++) {
        expect(PRODUCT_DATA[i].id).assertEqual(i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductIdsSequential0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PRODUCT_0200
     * @tc.name testProductInfoPresence0002
     * @tc.desc Verify info is defined only for product ids 0 and 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testProductInfoPresence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductInfoPresence0002 begin');
      expect(PRODUCT_DATA[0].info !== undefined).assertTrue();
      expect(PRODUCT_DATA[1].info === undefined).assertTrue();
      expect(PRODUCT_DATA[2].info !== undefined).assertTrue();
      expect(PRODUCT_DATA[3].info === undefined).assertTrue();
      expect(PRODUCT_DATA[4].info === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductInfoPresence0002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PRODUCT_0300
     * @tc.name testProductStaticFieldsDefined0003
     * @tc.desc Verify every product has uri, title, label and price resources defined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testProductStaticFieldsDefined0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductStaticFieldsDefined0003 begin');
      for (let i: number = 0; i < PRODUCT_DATA.length; i++) {
        expect(PRODUCT_DATA[i].uri !== undefined).assertTrue();
        expect(PRODUCT_DATA[i].title !== undefined).assertTrue();
        expect(PRODUCT_DATA[i].label !== undefined).assertTrue();
        expect(PRODUCT_DATA[i].price !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductStaticFieldsDefined0003 end');
    });
  })
}
