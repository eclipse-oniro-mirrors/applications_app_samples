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
import { CommonConstants } from '../../../../main/ets/bridge/CustomAnimationTabBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomAnimationTab]';
const BUNDLE: string = 'CustomAnimationTab_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CommonConstants (27 cases). */
export default function commonConstantsValuesTest(): void {
  describe('CommonConstantsValuesTest', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0001
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0001
     * @tc.desc      CommonConstants.DEFAULT_INDICATOR_EXPAND keeps value 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CustomAnimationTab_CommonConstantsValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0001 begin`);
      const actual: number = CommonConstants.DEFAULT_INDICATOR_EXPAND;
      logInfo(`CommonConstants.DEFAULT_INDICATOR_EXPAND: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}CommonConstantsValues_0001 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0002
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0002
     * @tc.desc      CommonConstants.DEFAULT_ANIMATION_DURATION keeps value 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CustomAnimationTab_CommonConstantsValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0002 begin`);
      const actual: number = CommonConstants.DEFAULT_ANIMATION_DURATION;
      logInfo(`CommonConstants.DEFAULT_ANIMATION_DURATION: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}CommonConstantsValues_0002 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0003
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0003
     * @tc.desc      CommonConstants.DEFAULT_LIST_ITEM_WIDTH keeps value 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0003 begin`);
      const actual: number = CommonConstants.DEFAULT_LIST_ITEM_WIDTH;
      logInfo(`CommonConstants.DEFAULT_LIST_ITEM_WIDTH: actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CommonConstantsValues_0003 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0004
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0004
     * @tc.desc      CommonConstants.DEFAULT_LIST_RELATIVE_RATIO keeps value 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0004 begin`);
      const actual: number = CommonConstants.DEFAULT_LIST_RELATIVE_RATIO;
      logInfo(`CommonConstants.DEFAULT_LIST_RELATIVE_RATIO: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}CommonConstantsValues_0004 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0005
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0005
     * @tc.desc      CommonConstants.DEFAULT_TAB_SPRING_DURATION keeps value 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0005 begin`);
      const actual: number = CommonConstants.DEFAULT_TAB_SPRING_DURATION;
      logInfo(`CommonConstants.DEFAULT_TAB_SPRING_DURATION: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}CommonConstantsValues_0005 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0006
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0006
     * @tc.desc      CommonConstants.DEFAULT_BAR_HEIGHT keeps value 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0006 begin`);
      const actual: number = CommonConstants.DEFAULT_BAR_HEIGHT;
      logInfo(`CommonConstants.DEFAULT_BAR_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}CommonConstantsValues_0006 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0007
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0007
     * @tc.desc      CommonConstants.FULL_PERCENT keeps value "100%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0007 begin`);
      const actual: string = CommonConstants.FULL_PERCENT;
      logInfo(`CommonConstants.FULL_PERCENT: actual=${actual}`);
      expect(actual).assertEqual('100%');
      logInfo(`${BUNDLE}CommonConstantsValues_0007 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0008
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0008
     * @tc.desc      CommonConstants.FORTY_PERCENT keeps value "40%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0008 begin`);
      const actual: string = CommonConstants.FORTY_PERCENT;
      logInfo(`CommonConstants.FORTY_PERCENT: actual=${actual}`);
      expect(actual).assertEqual('40%');
      logInfo(`${BUNDLE}CommonConstantsValues_0008 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0009
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0009
     * @tc.desc      CommonConstants.DEFAULT_TAB_BAR_SELECT_FONT_SIZE keeps value 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0009 begin`);
      const actual: number = CommonConstants.DEFAULT_TAB_BAR_SELECT_FONT_SIZE;
      logInfo(`CommonConstants.DEFAULT_TAB_BAR_SELECT_FO...: actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}CommonConstantsValues_0009 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0010
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0010
     * @tc.desc      CommonConstants.DEFAULT_TAB_BAR_UNSELECT_FONT_SIZE keeps value 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0010 begin`);
      const actual: number = CommonConstants.DEFAULT_TAB_BAR_UNSELECT_FONT_SIZE;
      logInfo(`CommonConstants.DEFAULT_TAB_BAR_UNSELECT_...: actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}CommonConstantsValues_0010 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0011
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0011
     * @tc.desc      CommonConstants.DEFAULT_TAB_BAR_FONT_COLOR keeps value "0x000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0011 begin`);
      const actual: string = CommonConstants.DEFAULT_TAB_BAR_FONT_COLOR;
      logInfo(`CommonConstants.DEFAULT_TAB_BAR_FONT_COLOR: actual=${actual}`);
      expect(actual).assertEqual('0x000000');
      logInfo(`${BUNDLE}CommonConstantsValues_0011 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0012
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0012
     * @tc.desc      CommonConstants.BACKGROUND_INDICATOR_COLOR keeps value 12632256
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0012 begin`);
      const actual: number = CommonConstants.BACKGROUND_INDICATOR_COLOR;
      logInfo(`CommonConstants.BACKGROUND_INDICATOR_COLOR: actual=${actual}`);
      expect(actual).assertEqual(12632256);
      logInfo(`${BUNDLE}CommonConstantsValues_0012 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0013
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0013
     * @tc.desc      CommonConstants.BACKGROUND_INDICATOR_HEIGHT keeps value "80%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0013 begin`);
      const actual: string = CommonConstants.BACKGROUND_INDICATOR_HEIGHT;
      logInfo(`CommonConstants.BACKGROUND_INDICATOR_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual('80%');
      logInfo(`${BUNDLE}CommonConstantsValues_0013 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0014
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0014
     * @tc.desc      CommonConstants.BACKGROUND_INDICATOR_ALIGN keeps value VerticalAlign.Center
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0014 begin`);
      const actual = CommonConstants.BACKGROUND_INDICATOR_ALIGN;
      logInfo(`CommonConstants.BACKGROUND_INDICATOR_ALIGN: actual=${actual}`);
      expect(actual).assertEqual(VerticalAlign.Center);
      logInfo(`${BUNDLE}CommonConstantsValues_0014 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0015
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0015
     * @tc.desc      CommonConstants.THINSTRIP_INDICATOR_COLOR keeps value 16729344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0015 begin`);
      const actual: number = CommonConstants.THINSTRIP_INDICATOR_COLOR;
      logInfo(`CommonConstants.THINSTRIP_INDICATOR_COLOR: actual=${actual}`);
      expect(actual).assertEqual(16729344);
      logInfo(`${BUNDLE}CommonConstantsValues_0015 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0016
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0016
     * @tc.desc      CommonConstants.THINSTRIP_INDICATOR_HEIGHT keeps value 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0016 begin`);
      const actual: number = CommonConstants.THINSTRIP_INDICATOR_HEIGHT;
      logInfo(`CommonConstants.THINSTRIP_INDICATOR_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CommonConstantsValues_0016 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0017
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0017
     * @tc.desc      CommonConstants.THINSTRIP_INDICATOR_ALIGN keeps value VerticalAlign.Bottom
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0017 begin`);
      const actual = CommonConstants.THINSTRIP_INDICATOR_ALIGN;
      logInfo(`CommonConstants.THINSTRIP_INDICATOR_ALIGN: actual=${actual}`);
      expect(actual).assertEqual(VerticalAlign.Bottom);
      logInfo(`${BUNDLE}CommonConstantsValues_0017 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0018
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0018
     * @tc.desc      CommonConstants.DEFAULT_TITLE1_TAB keeps value "??1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0018 begin`);
      const actual: string = CommonConstants.DEFAULT_TITLE1_TAB;
      logInfo(`CommonConstants.DEFAULT_TITLE1_TAB: actual=${actual}`);
      expect(actual).assertEqual('\u6807\u98981');
      logInfo(`${BUNDLE}CommonConstantsValues_0018 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0019
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0019
     * @tc.desc      CommonConstants.DEFAULT_TITLE2_TAB keeps value "??2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0019 begin`);
      const actual: string = CommonConstants.DEFAULT_TITLE2_TAB;
      logInfo(`CommonConstants.DEFAULT_TITLE2_TAB: actual=${actual}`);
      expect(actual).assertEqual('\u6807\u98982');
      logInfo(`${BUNDLE}CommonConstantsValues_0019 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0020
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0020
     * @tc.desc      CommonConstants.DEFAULT_TITLE3_TAB keeps value "??3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0020 begin`);
      const actual: string = CommonConstants.DEFAULT_TITLE3_TAB;
      logInfo(`CommonConstants.DEFAULT_TITLE3_TAB: actual=${actual}`);
      expect(actual).assertEqual('\u6807\u98983');
      logInfo(`${BUNDLE}CommonConstantsValues_0020 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0021
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0021
     * @tc.desc      CommonConstants.DEFAULT_TITLE4_TAB keeps value "??4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0021 begin`);
      const actual: string = CommonConstants.DEFAULT_TITLE4_TAB;
      logInfo(`CommonConstants.DEFAULT_TITLE4_TAB: actual=${actual}`);
      expect(actual).assertEqual('\u6807\u98984');
      logInfo(`${BUNDLE}CommonConstantsValues_0021 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0022
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0022
     * @tc.desc      CommonConstants.DEFAULT_TAB_CONTENT_FONT_SIZE keeps value 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0022 begin`);
      const actual: number = CommonConstants.DEFAULT_TAB_CONTENT_FONT_SIZE;
      logInfo(`CommonConstants.DEFAULT_TAB_CONTENT_FONT_...: actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}CommonConstantsValues_0022 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0023
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0023
     * @tc.desc      CommonConstants.DEFAULT_INDICATOR_BORDER_RADIUS keeps value 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0023 begin`);
      const actual: number = CommonConstants.DEFAULT_INDICATOR_BORDER_RADIUS;
      logInfo(`CommonConstants.DEFAULT_INDICATOR_BORDER_...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}CommonConstantsValues_0023 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0024
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0024
     * @tc.desc      CommonConstants.BACKGROUND_INDICATOR_BORDER_RADIUS keeps value "40%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0024 begin`);
      const actual: string = CommonConstants.BACKGROUND_INDICATOR_BORDER_RADIUS;
      logInfo(`CommonConstants.BACKGROUND_INDICATOR_BORD...: actual=${actual}`);
      expect(actual).assertEqual('40%');
      logInfo(`${BUNDLE}CommonConstantsValues_0024 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0025
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0025
     * @tc.desc      CommonConstants.THINSTRIP_INDICATOR_BORDER_RADIUS keeps value "40%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0025 begin`);
      const actual: string = CommonConstants.THINSTRIP_INDICATOR_BORDER_RADIUS;
      logInfo(`CommonConstants.THINSTRIP_INDICATOR_BORDE...: actual=${actual}`);
      expect(actual).assertEqual('40%');
      logInfo(`${BUNDLE}CommonConstantsValues_0025 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0026
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0026
     * @tc.desc      CommonConstants.DEFAULT_INDICATOR_WIDTH keeps value 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0026 begin`);
      const actual: number = CommonConstants.DEFAULT_INDICATOR_WIDTH;
      logInfo(`CommonConstants.DEFAULT_INDICATOR_WIDTH: actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CommonConstantsValues_0026 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMMON_CONSTANTS_VALUES_0027
     * @tc.name      CustomAnimationTab_CommonConstantsValues_0027
     * @tc.desc      CommonConstants.DEFAULT_INDICATOR_HEIGHT keeps value 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CommonConstantsValues_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonConstantsValues_0027 begin`);
      const actual: number = CommonConstants.DEFAULT_INDICATOR_HEIGHT;
      logInfo(`CommonConstants.DEFAULT_INDICATOR_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}CommonConstantsValues_0027 end`);
    });
  });
}
