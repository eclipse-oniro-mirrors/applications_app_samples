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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommonConstants } from '../../../main/ets/CitySearchTestBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'CitySearchConstantsCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function citySearchConstantsCoreTest(): void {
  describe('CitySearchConstantsCoreTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0201
     * @tc.name      testCitySearchConstants0201
     * @tc.desc      Verify LIST_SPACE constant equals 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0201 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonConstants.LIST_SPACE=${CommonConstants.LIST_SPACE}`);
      expect(CommonConstants.LIST_SPACE).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.LIST_SPACE}`);
      expect(typeof CommonConstants.LIST_SPACE).assertEqual('number');
      log('testCitySearchConstants0201 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0202
     * @tc.name      testCitySearchConstants0202
     * @tc.desc      Verify INITIAL_INDEX constant equals 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0202 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.INITIAL_INDEX}, expected=0`);
      expect(CommonConstants.INITIAL_INDEX).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.INITIAL_INDEX}`);
      expect(typeof CommonConstants.INITIAL_INDEX).assertEqual('number');
      log('testCitySearchConstants0202 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0203
     * @tc.name      testCitySearchConstants0203
     * @tc.desc      Verify OPACITY constant equals 0.6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0203 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonConstants.OPACITY=${CommonConstants.OPACITY}`);
      expect(CommonConstants.OPACITY).assertEqual(0.6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.OPACITY}, expected='number'`);
      expect(typeof CommonConstants.OPACITY).assertEqual('number');
      log('testCitySearchConstants0203 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0204
     * @tc.name      testCitySearchConstants0204
     * @tc.desc      Verify LAYOUT_WEIGHT constant equals 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0204 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.LAYOUT_WEIGHT}, expected=1`);
      expect(CommonConstants.LAYOUT_WEIGHT).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.LAYOUT_WEIGHT}`);
      expect(typeof CommonConstants.LAYOUT_WEIGHT).assertEqual('number');
      log('testCitySearchConstants0204 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0205
     * @tc.name      testCitySearchConstants0205
     * @tc.desc      Verify ALPHABET_SIZE constant equals 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0205 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.ALPHABET_SIZE}, expected=20`);
      expect(CommonConstants.ALPHABET_SIZE).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.ALPHABET_SIZE}`);
      expect(typeof CommonConstants.ALPHABET_SIZE).assertEqual('number');
      log('testCitySearchConstants0205 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0206
     * @tc.name      testCitySearchConstants0206
     * @tc.desc      Verify ALPHABET_MARGIN_RIGHT_SIZE constant equals -8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0206 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.ALPHABET_MARGIN_RIGHT_SIZE}`);
      expect(CommonConstants.ALPHABET_MARGIN_RIGHT_SIZE).assertEqual(-8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.ALPHABET_MARGIN_RIGHT_SIZE}`);
      expect(typeof CommonConstants.ALPHABET_MARGIN_RIGHT_SIZE).assertEqual('number');
      log('testCitySearchConstants0206 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0207
     * @tc.name      testCitySearchConstants0207
     * @tc.desc      Verify VIEW_FULL constant equals 100%.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0207 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonConstants.VIEW_FULL=${CommonConstants.VIEW_FULL}`);
      expect(CommonConstants.VIEW_FULL).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.VIEW_FULL}`);
      expect(typeof CommonConstants.VIEW_FULL).assertEqual('string');
      log('testCitySearchConstants0207 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0208
     * @tc.name      testCitySearchConstants0208
     * @tc.desc      Verify MAX_LINES constant equals 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0208 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonConstants.MAX_LINES=${CommonConstants.MAX_LINES}`);
      expect(CommonConstants.MAX_LINES).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.MAX_LINES}`);
      expect(typeof CommonConstants.MAX_LINES).assertEqual('number');
      log('testCitySearchConstants0208 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0209
     * @tc.name      testCitySearchConstants0209
     * @tc.desc      Verify WEIGHT constant equals 400.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0209 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonConstants.WEIGHT=${CommonConstants.WEIGHT}`);
      expect(CommonConstants.WEIGHT).assertEqual(400);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.WEIGHT}, expected='number'`);
      expect(typeof CommonConstants.WEIGHT).assertEqual('number');
      log('testCitySearchConstants0209 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0210
     * @tc.name      testCitySearchConstants0210
     * @tc.desc      Verify PLACE_HOLDER_TEXT constant equals 长沙.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0210 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.PLACE_HOLDER_TEXT}, expected='长沙'`);
      expect(CommonConstants.PLACE_HOLDER_TEXT).assertEqual('长沙');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.PLACE_HOLDER_TEXT}`);
      expect(typeof CommonConstants.PLACE_HOLDER_TEXT).assertEqual('string');
      log('testCitySearchConstants0210 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0211
     * @tc.name      testCitySearchConstants0211
     * @tc.desc      Verify HOT_CITY_TEXT_WIDTH constant equals 22%.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0211 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.HOT_CITY_TEXT_WIDTH}`);
      expect(CommonConstants.HOT_CITY_TEXT_WIDTH).assertEqual('22%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.HOT_CITY_TEXT_WIDTH}`);
      expect(typeof CommonConstants.HOT_CITY_TEXT_WIDTH).assertEqual('string');
      log('testCitySearchConstants0211 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0212
     * @tc.name      testCitySearchConstants0212
     * @tc.desc      Verify INIT_VALUE constant equals 洛阳.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0212 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonConstants.INIT_VALUE=${CommonConstants.INIT_VALUE}`);
      expect(CommonConstants.INIT_VALUE).assertEqual('洛阳');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.INIT_VALUE}`);
      expect(typeof CommonConstants.INIT_VALUE).assertEqual('string');
      log('testCitySearchConstants0212 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0213
     * @tc.name      testCitySearchConstants0213
     * @tc.desc      Verify all numeric constants keep number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0213 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.LIST_SPACE}`);
      expect(typeof CommonConstants.LIST_SPACE).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.INITIAL_INDEX}`);
      expect(typeof CommonConstants.INITIAL_INDEX).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.OPACITY}, expected='number'`);
      expect(typeof CommonConstants.OPACITY).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.LAYOUT_WEIGHT}`);
      expect(typeof CommonConstants.LAYOUT_WEIGHT).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.ALPHABET_SIZE}`);
      expect(typeof CommonConstants.ALPHABET_SIZE).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.ALPHABET_MARGIN_RIGHT_SIZE}`);
      expect(typeof CommonConstants.ALPHABET_MARGIN_RIGHT_SIZE).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.MAX_LINES}`);
      expect(typeof CommonConstants.MAX_LINES).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.WEIGHT}, expected='number'`);
      expect(typeof CommonConstants.WEIGHT).assertEqual('number');
      log('testCitySearchConstants0213 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0214
     * @tc.name      testCitySearchConstants0214
     * @tc.desc      Verify all string constants keep string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0214 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.VIEW_FULL}`);
      expect(typeof CommonConstants.VIEW_FULL).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.PLACE_HOLDER_TEXT}`);
      expect(typeof CommonConstants.PLACE_HOLDER_TEXT).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.HOT_CITY_TEXT_WIDTH}`);
      expect(typeof CommonConstants.HOT_CITY_TEXT_WIDTH).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.INIT_VALUE}`);
      expect(typeof CommonConstants.INIT_VALUE).assertEqual('string');
      log('testCitySearchConstants0214 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0215
     * @tc.name      testCitySearchConstants0215
     * @tc.desc      Verify placeholder and initial city values are non-empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0215 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${CommonConstants.PLACE_HOLDER_TEXT.length > 0}`);
      expect(CommonConstants.PLACE_HOLDER_TEXT.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${CommonConstants.INIT_VALUE.length > 0}`);
      expect(CommonConstants.INIT_VALUE.length > 0).assertTrue();
      log('testCitySearchConstants0215 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CONSTANTS_0216
     * @tc.name      testCitySearchConstants0216
     * @tc.desc      Verify size string constants use the percent suffix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchConstants0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCitySearchConstants0216 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${CommonConstants.VIEW_FULL.endsWith('%')}`);
      expect(CommonConstants.VIEW_FULL.endsWith('%')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${CommonConstants.HOT_CITY_TEXT_WIDTH.endsWith('%')}`);
      expect(CommonConstants.HOT_CITY_TEXT_WIDTH.endsWith('%')).assertTrue();
      log('testCitySearchConstants0216 end');
    })
  })
}
