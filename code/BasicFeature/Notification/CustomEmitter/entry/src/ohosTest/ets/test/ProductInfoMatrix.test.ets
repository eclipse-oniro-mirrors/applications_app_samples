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
const TAG: string = '[Sample_CustomEmitter_ProductInfo]';

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

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

export default function productInfoMatrixTest() {
  describe('productInfoMatrixTest', () => {
    beforeEach(async () => {
      await delay(10);
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PRODUCTINFO_0100
     * @tc.name testProduct0HasInfo0001
     * @tc.desc Verify product 0 keeps an info resource
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testProduct0HasInfo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0HasInfo0001 begin');
      expect(PRODUCT_DATA[0].id).assertEqual(0);
      expect(PRODUCT_DATA[0].info !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0HasInfo0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PRODUCTINFO_0200
     * @tc.name testProduct1HasNoInfo0002
     * @tc.desc Verify product 1 keeps an undefined info
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testProduct1HasNoInfo0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct1HasNoInfo0002 begin');
      expect(PRODUCT_DATA[1].id).assertEqual(1);
      expect(PRODUCT_DATA[1].info === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct1HasNoInfo0002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PRODUCTINFO_0300
     * @tc.name testProduct2HasInfo0003
     * @tc.desc Verify product 2 keeps an info resource
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testProduct2HasInfo0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct2HasInfo0003 begin');
      expect(PRODUCT_DATA[2].id).assertEqual(2);
      expect(PRODUCT_DATA[2].info !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct2HasInfo0003 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PRODUCTINFO_0400
     * @tc.name testProduct3HasNoInfo0004
     * @tc.desc Verify product 3 keeps an undefined info
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testProduct3HasNoInfo0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct3HasNoInfo0004 begin');
      expect(PRODUCT_DATA[3].id).assertEqual(3);
      expect(PRODUCT_DATA[3].info === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct3HasNoInfo0004 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PRODUCTINFO_0500
     * @tc.name testProduct4HasNoInfo0005
     * @tc.desc Verify product 4 keeps an undefined info
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testProduct4HasNoInfo0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct4HasNoInfo0005 begin');
      expect(PRODUCT_DATA[4].id).assertEqual(4);
      expect(PRODUCT_DATA[4].info === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct4HasNoInfo0005 end');
    });
  })
}
