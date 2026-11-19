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
import { SHOP_CART_ITEM_DATA, PRODUCTS_Data } from '../../../main/ets/mock/ProductsData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomEmitter_ShopCartData]';

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

export default function shopCartDataContractTest() {
  describe('shopCartDataContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
          resolve();
        }, 10);
      });
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_SHOPCART_0100
     * @tc.name testShopCartIdsSequential0001
     * @tc.desc Verify SHOP_CART_ITEM_DATA has three items with sequential ids
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testShopCartIdsSequential0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShopCartIdsSequential0001 begin');
      expect(SHOP_CART_ITEM_DATA.length).assertEqual(3);
      for (let i: number = 0; i < SHOP_CART_ITEM_DATA.length; i++) {
        expect(SHOP_CART_ITEM_DATA[i].id).assertEqual(i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShopCartIdsSequential0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_SHOPCART_0200
     * @tc.name testShopCartFieldsDefined0002
     * @tc.desc Verify every shop cart item has uri, title, label and price resources
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testShopCartFieldsDefined0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShopCartFieldsDefined0002 begin');
      for (let i: number = 0; i < SHOP_CART_ITEM_DATA.length; i++) {
        expect(SHOP_CART_ITEM_DATA[i].uri !== undefined).assertTrue();
        expect(SHOP_CART_ITEM_DATA[i].title !== undefined).assertTrue();
        expect(SHOP_CART_ITEM_DATA[i].label !== undefined).assertTrue();
        expect(SHOP_CART_ITEM_DATA[i].price !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShopCartFieldsDefined0002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_SHOPCART_0300
     * @tc.name testEmptyResponseSentinel0003
     * @tc.desc Verify PRODUCTS_Data is the empty sentinel response with -1 placeholders
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testEmptyResponseSentinel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyResponseSentinel0003 begin');
      expect(PRODUCTS_Data.code).assertEqual(0);
      expect(PRODUCTS_Data.error).assertEqual('');
      expect(PRODUCTS_Data.data.totalCount).assertEqual(-1);
      expect(PRODUCTS_Data.data.records.length).assertEqual(1);
      expect(PRODUCTS_Data.data.records[0].id).assertEqual(-1);
      expect(PRODUCTS_Data.data.records[0].price).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyResponseSentinel0003 end');
    });
  })
}
