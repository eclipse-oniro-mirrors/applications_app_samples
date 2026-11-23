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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../utils/YieldHook';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommodityDataModel, PRODUCTS_DATA } from '../../../main/ets/bridge/PageLoadingBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'MockDataIntegrityTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function mockDataIntegrityTest(): void {
  describe('MockDataIntegrityTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0301
     * @tc.name      testMockData0301
     * @tc.desc      Verify the mock catalogue holds exactly six products.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0301 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PRODUCTS_DATA.length=${PRODUCTS_DATA.length}, expected=6`);
      expect(PRODUCTS_DATA.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof PRODUCTS_DATA.length=${typeof PRODUCTS_DATA.length}`);
      expect(typeof PRODUCTS_DATA.length).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0301 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0302
     * @tc.name      testMockData0302
     * @tc.desc      Verify the first mock item carries id 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0302 begin');
      const item: CommodityDataModel = PRODUCTS_DATA[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.id=${item.id}, expected=0`);
      expect(item.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${item instanceof CommodityDataModel}`);
      expect(item instanceof CommodityDataModel).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0302 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0303
     * @tc.name      testMockData0303
     * @tc.desc      Verify the second mock item carries id 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0303 begin');
      const item: CommodityDataModel = PRODUCTS_DATA[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.id=${item.id}, expected=1`);
      expect(item.id).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${item instanceof CommodityDataModel}`);
      expect(item instanceof CommodityDataModel).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0303 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0304
     * @tc.name      testMockData0304
     * @tc.desc      Verify the third mock item carries id 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0304 begin');
      const item: CommodityDataModel = PRODUCTS_DATA[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.id=${item.id}, expected=2`);
      expect(item.id).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${item instanceof CommodityDataModel}`);
      expect(item instanceof CommodityDataModel).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0304 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0305
     * @tc.name      testMockData0305
     * @tc.desc      Verify the fourth mock item carries id 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0305 begin');
      const item: CommodityDataModel = PRODUCTS_DATA[3];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.id=${item.id}, expected=3`);
      expect(item.id).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${item instanceof CommodityDataModel}`);
      expect(item instanceof CommodityDataModel).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0305 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0306
     * @tc.name      testMockData0306
     * @tc.desc      Verify the fifth mock item carries id 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0306 begin');
      const item: CommodityDataModel = PRODUCTS_DATA[4];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.id=${item.id}, expected=4`);
      expect(item.id).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${item instanceof CommodityDataModel}`);
      expect(item instanceof CommodityDataModel).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0306 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0307
     * @tc.name      testMockData0307
     * @tc.desc      Verify the sixth mock item carries id 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0307 begin');
      const item: CommodityDataModel = PRODUCTS_DATA[5];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.id=${item.id}, expected=5`);
      expect(item.id).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${item instanceof CommodityDataModel}`);
      expect(item instanceof CommodityDataModel).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0307 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0308
     * @tc.name      testMockData0308
     * @tc.desc      Verify every catalogue entry is a CommodityDataModel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0308 begin');
      let modelCount: number = 0;
      for (let i: number = 0; i < PRODUCTS_DATA.length; i++) {
        if (PRODUCTS_DATA[i] instanceof CommodityDataModel) {
          modelCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modelCount=${modelCount}, expected=6`);
      expect(modelCount).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modelCount=${modelCount}, expected=PRODUCTS_DATA.length`);
      expect(modelCount).assertEqual(PRODUCTS_DATA.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0308 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0309
     * @tc.name      testMockData0309
     * @tc.desc      Verify all catalogue ids are unique.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0309 begin');
      const seen: Set<number> = new Set<number>();
      for (let i: number = 0; i < PRODUCTS_DATA.length; i++) {
        seen.add(PRODUCTS_DATA[i].id);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual seen.size=${seen.size}, expected=6`);
      expect(seen.size).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRODUCTS_DATA.length > 0=${PRODUCTS_DATA.length > 0}`);
      expect(PRODUCTS_DATA.length > 0).assertTrue();
      log('testMockData0309 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0310
     * @tc.name      testMockData0310
     * @tc.desc      Verify ids run ascending from zero to five.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0310 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PRODUCTS_DATA[0].id=${PRODUCTS_DATA[0].id}, expected=0`);
      expect(PRODUCTS_DATA[0].id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PRODUCTS_DATA[5].id=${PRODUCTS_DATA[5].id}, expected=5`);
      expect(PRODUCTS_DATA[5].id).assertEqual(5);
      let ascending: boolean = true;
      for (let i: number = 1; i < PRODUCTS_DATA.length; i++) {
        if (PRODUCTS_DATA[i].id <= PRODUCTS_DATA[i - 1].id) {
          ascending = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ascending=${ascending}`);
      expect(ascending).assertTrue();
      log('testMockData0310 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0311
     * @tc.name      testMockData0311
     * @tc.desc      Verify every uri resolves to a Resource object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0311 begin');
      let resourceCount: number = 0;
      for (let i: number = 0; i < PRODUCTS_DATA.length; i++) {
        if (typeof PRODUCTS_DATA[i].uri === 'object' && PRODUCTS_DATA[i].uri !== null) {
          resourceCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resourceCount=${resourceCount}, expected=6`);
      expect(resourceCount).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRODUCTS_DATA.length > 0=${PRODUCTS_DATA.length > 0}`);
      expect(PRODUCTS_DATA.length > 0).assertTrue();
      log('testMockData0311 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0312
     * @tc.name      testMockData0312
     * @tc.desc      Verify every title resolves to a Resource object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0312 begin');
      let resourceCount: number = 0;
      for (let i: number = 0; i < PRODUCTS_DATA.length; i++) {
        if (typeof PRODUCTS_DATA[i].title === 'object' && PRODUCTS_DATA[i].title !== null) {
          resourceCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resourceCount=${resourceCount}, expected=6`);
      expect(resourceCount).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRODUCTS_DATA.length > 0=${PRODUCTS_DATA.length > 0}`);
      expect(PRODUCTS_DATA.length > 0).assertTrue();
      log('testMockData0312 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0313
     * @tc.name      testMockData0313
     * @tc.desc      Verify every price resolves to a Resource object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0313 begin');
      let resourceCount: number = 0;
      for (let i: number = 0; i < PRODUCTS_DATA.length; i++) {
        if (typeof PRODUCTS_DATA[i].price === 'object' && PRODUCTS_DATA[i].price !== null) {
          resourceCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resourceCount=${resourceCount}, expected=6`);
      expect(resourceCount).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRODUCTS_DATA.length > 0=${PRODUCTS_DATA.length > 0}`);
      expect(PRODUCTS_DATA.length > 0).assertTrue();
      log('testMockData0313 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0314
     * @tc.name      testMockData0314
     * @tc.desc      Verify every views value resolves to a Resource object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0314 begin');
      let resourceCount: number = 0;
      for (let i: number = 0; i < PRODUCTS_DATA.length; i++) {
        if (typeof PRODUCTS_DATA[i].views === 'object' && PRODUCTS_DATA[i].views !== null) {
          resourceCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resourceCount=${resourceCount}, expected=6`);
      expect(resourceCount).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRODUCTS_DATA.length > 0=${PRODUCTS_DATA.length > 0}`);
      expect(PRODUCTS_DATA.length > 0).assertTrue();
      log('testMockData0314 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0315
     * @tc.name      testMockData0315
     * @tc.desc      Verify every insurance value resolves to a Resource object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0315 begin');
      let resourceCount: number = 0;
      for (let i: number = 0; i < PRODUCTS_DATA.length; i++) {
        if (typeof PRODUCTS_DATA[i].insurance === 'object' && PRODUCTS_DATA[i].insurance !== null) {
          resourceCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resourceCount=${resourceCount}, expected=6`);
      expect(resourceCount).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRODUCTS_DATA.length > 0=${PRODUCTS_DATA.length > 0}`);
      expect(PRODUCTS_DATA.length > 0).assertTrue();
      log('testMockData0315 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0316
     * @tc.name      testMockData0316
     * @tc.desc      Verify uris differ across the catalogue entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0316 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${PRODUCTS_DATA[0].uri === PRODUCTS_DATA[1].uri}`);
      expect(PRODUCTS_DATA[0].uri === PRODUCTS_DATA[1].uri).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${PRODUCTS_DATA[2].uri === PRODUCTS_DATA[3].uri}`);
      expect(PRODUCTS_DATA[2].uri === PRODUCTS_DATA[3].uri).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0316 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0317
     * @tc.name      testMockData0317
     * @tc.desc      Verify titles are distinct resource instances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0317 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${PRODUCTS_DATA[0].title === PRODUCTS_DATA[1].title}`);
      expect(PRODUCTS_DATA[0].title === PRODUCTS_DATA[1].title).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${PRODUCTS_DATA[4].title === PRODUCTS_DATA[5].title}`);
      expect(PRODUCTS_DATA[4].title === PRODUCTS_DATA[5].title).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0317 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0318
     * @tc.name      testMockData0318
     * @tc.desc      Verify prices are distinct resource instances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0318 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${PRODUCTS_DATA[0].price === PRODUCTS_DATA[2].price}`);
      expect(PRODUCTS_DATA[0].price === PRODUCTS_DATA[2].price).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${PRODUCTS_DATA[3].price === PRODUCTS_DATA[4].price}`);
      expect(PRODUCTS_DATA[3].price === PRODUCTS_DATA[4].price).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0318 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0319
     * @tc.name      testMockData0319
     * @tc.desc      Verify views are distinct resource instances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0319 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${PRODUCTS_DATA[1].views === PRODUCTS_DATA[2].views}`);
      expect(PRODUCTS_DATA[1].views === PRODUCTS_DATA[2].views).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${PRODUCTS_DATA[0].views === PRODUCTS_DATA[5].views}`);
      expect(PRODUCTS_DATA[0].views === PRODUCTS_DATA[5].views).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0319 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0320
     * @tc.name      testMockData0320
     * @tc.desc      Verify insurances are distinct resource instances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0320 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse PRODUCTS_DATA[0].insurance === PRODUCTS_DATA[1].insurance`);
      expect(PRODUCTS_DATA[0].insurance === PRODUCTS_DATA[1].insurance).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse PRODUCTS_DATA[4].insurance === PRODUCTS_DATA[5].insurance`);
      expect(PRODUCTS_DATA[4].insurance === PRODUCTS_DATA[5].insurance).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0320 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0321
     * @tc.name      testMockData0321
     * @tc.desc      Verify the first item renders as id plus the resource placeholder.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0321 begin');
      const rendered: string = PRODUCTS_DATA[0].toString();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rendered=${rendered}, expected='0  [object Object]'`);
      expect(rendered).assertEqual('0  [object Object]');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof rendered=${typeof rendered}, expected='string'`);
      expect(typeof rendered).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0321 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0322
     * @tc.name      testMockData0322
     * @tc.desc      Verify the second item keeps the id prefix in its rendering.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0322 begin');
      const rendered: string = PRODUCTS_DATA[1].toString();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue rendered.startsWith('1  ')=${rendered.startsWith('1  ')}`);
      expect(rendered.startsWith('1  ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${rendered.endsWith('[object Object]')}`);
      expect(rendered.endsWith('[object Object]')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0322 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0323
     * @tc.name      testMockData0323
     * @tc.desc      Verify the last item keeps the id prefix in its rendering.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0323 begin');
      const rendered: string = PRODUCTS_DATA[5].toString();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue rendered.startsWith('5  ')=${rendered.startsWith('5  ')}`);
      expect(rendered.startsWith('5  ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${rendered.endsWith('[object Object]')}`);
      expect(rendered.endsWith('[object Object]')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      log('testMockData0323 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0325
     * @tc.name      testMockData0325
     * @tc.desc      Verify every rendering returns a string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0325 begin');
      let stringCount: number = 0;
      for (let i: number = 0; i < PRODUCTS_DATA.length; i++) {
        if (typeof PRODUCTS_DATA[i].toString() === 'string') {
          stringCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual stringCount=${stringCount}, expected=6`);
      expect(stringCount).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRODUCTS_DATA.length > 0=${PRODUCTS_DATA.length > 0}`);
      expect(PRODUCTS_DATA.length > 0).assertTrue();
      log('testMockData0325 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0326
     * @tc.name      testMockData0326
     * @tc.desc      Verify the catalogue is a real array of the expected length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0326 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PRODUCTS_DATA.length=${PRODUCTS_DATA.length}, expected=6`);
      expect(PRODUCTS_DATA.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRODUCTS_DATA.length > 0=${PRODUCTS_DATA.length > 0}`);
      expect(PRODUCTS_DATA.length > 0).assertTrue();
      log('testMockData0326 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0327
     * @tc.name      testMockData0327
     * @tc.desc      Verify catalogue ids sum to the arithmetic series fifteen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0327 begin');
      let sum: number = 0;
      for (let i: number = 0; i < PRODUCTS_DATA.length; i++) {
        sum += PRODUCTS_DATA[i].id;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual sum=${sum}, expected=15`);
      expect(sum).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRODUCTS_DATA.length > 0=${PRODUCTS_DATA.length > 0}`);
      expect(PRODUCTS_DATA.length > 0).assertTrue();
      log('testMockData0327 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_MOCKDATA_0328
     * @tc.name      testMockData0328
     * @tc.desc      Verify every item renders with its own id prefix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0328 begin');
      let prefixedCount: number = 0;
      for (let i: number = 0; i < PRODUCTS_DATA.length; i++) {
        if (PRODUCTS_DATA[i].toString().startsWith(PRODUCTS_DATA[i].id.toString() + '  ')) {
          prefixedCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual prefixedCount=${prefixedCount}, expected=6`);
      expect(prefixedCount).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PRODUCTS_DATA)=${Array.isArray(PRODUCTS_DATA)}`);
      expect(Array.isArray(PRODUCTS_DATA)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRODUCTS_DATA.length > 0=${PRODUCTS_DATA.length > 0}`);
      expect(PRODUCTS_DATA.length > 0).assertTrue();
      log('testMockData0328 end');
    })
  })
}
