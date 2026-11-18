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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommonConstants } from '../../../../main/ets/CitySearchTestBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CommonConstants (12 cases). */
export default function commonConstantsValuesTest(): void {
  describe('CommonConstantsValuesTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_COMMON_CONSTANTS_VALUES_0001
     * @tc.name      CitySearch_CommonConstantsValues_0001
     * @tc.desc      CommonConstants.LIST_SPACE keeps value 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CommonConstantsValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0001 begin`);
      const actual: number = CommonConstants.LIST_SPACE;
      logInfo(`CommonConstants.LIST_SPACE: actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}CommonConstantsValues_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_COMMON_CONSTANTS_VALUES_0002
     * @tc.name      CitySearch_CommonConstantsValues_0002
     * @tc.desc      CommonConstants.INITIAL_INDEX keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CommonConstantsValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0002 begin`);
      const actual: number = CommonConstants.INITIAL_INDEX;
      logInfo(`CommonConstants.INITIAL_INDEX: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CommonConstantsValues_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_COMMON_CONSTANTS_VALUES_0003
     * @tc.name      CitySearch_CommonConstantsValues_0003
     * @tc.desc      CommonConstants.OPACITY keeps value 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CommonConstantsValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0003 begin`);
      const actual: number = CommonConstants.OPACITY;
      logInfo(`CommonConstants.OPACITY: actual=${actual}`);
      expect(actual).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}CommonConstantsValues_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_COMMON_CONSTANTS_VALUES_0004
     * @tc.name      CitySearch_CommonConstantsValues_0004
     * @tc.desc      CommonConstants.LAYOUT_WEIGHT keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CommonConstantsValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0004 begin`);
      const actual: number = CommonConstants.LAYOUT_WEIGHT;
      logInfo(`CommonConstants.LAYOUT_WEIGHT: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CommonConstantsValues_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_COMMON_CONSTANTS_VALUES_0005
     * @tc.name      CitySearch_CommonConstantsValues_0005
     * @tc.desc      CommonConstants.ALPHABET_SIZE keeps value 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CommonConstantsValues_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0005 begin`);
      const actual: number = CommonConstants.ALPHABET_SIZE;
      logInfo(`CommonConstants.ALPHABET_SIZE: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}CommonConstantsValues_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_COMMON_CONSTANTS_VALUES_0006
     * @tc.name      CitySearch_CommonConstantsValues_0006
     * @tc.desc      CommonConstants.ALPHABET_MARGIN_RIGHT_SIZE keeps value -8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CommonConstantsValues_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0006 begin`);
      const actual: number = CommonConstants.ALPHABET_MARGIN_RIGHT_SIZE;
      logInfo(`CommonConstants.ALPHABET_MARGIN_RIGHT_SIZE: actual=${actual}`);
      expect(actual).assertEqual(-8);
      logInfo(`${BUNDLE}CommonConstantsValues_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_COMMON_CONSTANTS_VALUES_0007
     * @tc.name      CitySearch_CommonConstantsValues_0007
     * @tc.desc      CommonConstants.VIEW_FULL keeps value "100%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CommonConstantsValues_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0007 begin`);
      const actual: string = CommonConstants.VIEW_FULL;
      logInfo(`CommonConstants.VIEW_FULL: actual=${actual}`);
      expect(actual).assertEqual('100%');
      logInfo(`${BUNDLE}CommonConstantsValues_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_COMMON_CONSTANTS_VALUES_0008
     * @tc.name      CitySearch_CommonConstantsValues_0008
     * @tc.desc      CommonConstants.MAX_LINES keeps value 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CommonConstantsValues_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0008 begin`);
      const actual: number = CommonConstants.MAX_LINES;
      logInfo(`CommonConstants.MAX_LINES: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CommonConstantsValues_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_COMMON_CONSTANTS_VALUES_0009
     * @tc.name      CitySearch_CommonConstantsValues_0009
     * @tc.desc      CommonConstants.WEIGHT keeps value 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CommonConstantsValues_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0009 begin`);
      const actual: number = CommonConstants.WEIGHT;
      logInfo(`CommonConstants.WEIGHT: actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}CommonConstantsValues_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_COMMON_CONSTANTS_VALUES_0010
     * @tc.name      CitySearch_CommonConstantsValues_0010
     * @tc.desc      CommonConstants.PLACE_HOLDER_TEXT keeps value "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CommonConstantsValues_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0010 begin`);
      const actual: string = CommonConstants.PLACE_HOLDER_TEXT;
      logInfo(`CommonConstants.PLACE_HOLDER_TEXT: actual=${actual}`);
      expect(actual).assertEqual('\u957f\u6c99');
      logInfo(`${BUNDLE}CommonConstantsValues_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_COMMON_CONSTANTS_VALUES_0011
     * @tc.name      CitySearch_CommonConstantsValues_0011
     * @tc.desc      CommonConstants.HOT_CITY_TEXT_WIDTH keeps value "22%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CommonConstantsValues_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0011 begin`);
      const actual: string = CommonConstants.HOT_CITY_TEXT_WIDTH;
      logInfo(`CommonConstants.HOT_CITY_TEXT_WIDTH: actual=${actual}`);
      expect(actual).assertEqual('22%');
      logInfo(`${BUNDLE}CommonConstantsValues_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_COMMON_CONSTANTS_VALUES_0012
     * @tc.name      CitySearch_CommonConstantsValues_0012
     * @tc.desc      CommonConstants.INIT_VALUE keeps value "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CommonConstantsValues_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0012 begin`);
      const actual: string = CommonConstants.INIT_VALUE;
      logInfo(`CommonConstants.INIT_VALUE: actual=${actual}`);
      expect(actual).assertEqual('\u6d1b\u9633');
      logInfo(`${BUNDLE}CommonConstantsValues_0012 end`);
    });
  });
}
