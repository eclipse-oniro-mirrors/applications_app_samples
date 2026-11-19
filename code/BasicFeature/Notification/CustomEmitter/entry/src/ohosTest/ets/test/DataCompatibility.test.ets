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
import { PRODUCT_DATA, SHOP_CART_ITEM_DATA, TAB_TITLE_DATA } from '../../../main/ets/mock/ProductsData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomEmitter_Compatibility]';

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

export default function dataCompatibilityTest() {
  describe('dataCompatibilityTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
          resolve();
        }, 10);
      });
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_COMPAT_0100
     * @tc.name testShopCartIdsSubsetOfProducts0001
     * @tc.desc Verify every shop cart id refers to an existing product id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testShopCartIdsSubsetOfProducts0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShopCartIdsSubsetOfProducts0001 begin');
      for (let i: number = 0; i < SHOP_CART_ITEM_DATA.length; i++) {
        const cartId: number = SHOP_CART_ITEM_DATA[i].id;
        const matched: number = PRODUCT_DATA.filter((item) => item.id === cartId).length;
        expect(matched).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShopCartIdsSubsetOfProducts0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_COMPAT_0200
     * @tc.name testProductIdsUnique0002
     * @tc.desc Verify product ids are unique across the product table
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testProductIdsUnique0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductIdsUnique0002 begin');
      const ids: number[] = [];
      for (let i: number = 0; i < PRODUCT_DATA.length; i++) {
        expect(ids.indexOf(PRODUCT_DATA[i].id)).assertEqual(-1);
        ids.push(PRODUCT_DATA[i].id);
      }
      expect(ids.length).assertEqual(PRODUCT_DATA.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductIdsUnique0002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_COMPAT_0300
     * @tc.name testTabTitleCountMatchesDesign0003
     * @tc.desc Verify the tab title table exposes four design entries
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testTabTitleCountMatchesDesign0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabTitleCountMatchesDesign0003 begin');
      expect(TAB_TITLE_DATA.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabTitleCountMatchesDesign0003 end');
    });
  })
}
