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
import { PRODUCT_DATA, SHOP_CART_ITEM_DATA, PRODUCTS_Data } from '../../../main/ets/mock/ProductsData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomEmitter_MockBoundary]';

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

export default function mockDataBoundaryTest() {
  describe('mockDataBoundaryTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
          resolve();
        }, 10);
      });
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_MOCKBOUND_0100
     * @tc.name testProductOutOfRangeUndefined0001
     * @tc.desc Verify product access beyond the table returns undefined for positive and negative indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testProductOutOfRangeUndefined0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductOutOfRangeUndefined0001 begin');
      expect(PRODUCT_DATA[99] === undefined).assertTrue();
      expect(PRODUCT_DATA[-1] === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductOutOfRangeUndefined0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_MOCKBOUND_0200
     * @tc.name testShopCartOutOfRangeUndefined0002
     * @tc.desc Verify shop cart access beyond the table returns undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testShopCartOutOfRangeUndefined0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShopCartOutOfRangeUndefined0002 begin');
      expect(SHOP_CART_ITEM_DATA[10] === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShopCartOutOfRangeUndefined0002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_MOCKBOUND_0300
     * @tc.name testResponseRecordBoundary0003
     * @tc.desc Verify the sentinel response exposes exactly one record and no second record
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testResponseRecordBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResponseRecordBoundary0003 begin');
      expect(PRODUCTS_Data.data.records.length).assertEqual(1);
      expect(PRODUCTS_Data.data.records[1] === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResponseRecordBoundary0003 end');
    });
  })
}
