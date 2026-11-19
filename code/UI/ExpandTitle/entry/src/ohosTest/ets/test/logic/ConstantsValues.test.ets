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
import Constants from '../../../../main/ets/constants/Constants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for Constants (23 cases). */
export default function constantsValuesTest(): void {
  describe('ConstantsValuesTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0001
     * @tc.name      ExpandTitle_ConstantsValues_0001
     * @tc.desc      Constants.CONTINUE_PULL_THRESHOLD keeps value 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_ConstantsValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConstantsValues_0001 begin`);
      const actual: number = Constants.CONTINUE_PULL_THRESHOLD;
      logInfo(`Constants.CONTINUE_PULL_THRESHOLD: actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}ConstantsValues_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0002
     * @tc.name      ExpandTitle_ConstantsValues_0002
     * @tc.desc      Constants.MENU_DOWN_Y_MAX_VALUE keeps value 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_ConstantsValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConstantsValues_0002 begin`);
      const actual: number = Constants.MENU_DOWN_Y_MAX_VALUE;
      logInfo(`Constants.MENU_DOWN_Y_MAX_VALUE: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ConstantsValues_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0003
     * @tc.name      ExpandTitle_ConstantsValues_0003
     * @tc.desc      Constants.TITLE_DOWN_Y_MAX_VALUE keeps value 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0003 begin`);
      const actual: number = Constants.TITLE_DOWN_Y_MAX_VALUE;
      logInfo(`Constants.TITLE_DOWN_Y_MAX_VALUE: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}ConstantsValues_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0004
     * @tc.name      ExpandTitle_ConstantsValues_0004
     * @tc.desc      Constants.TITLE_SCALE_MAX_VALUE keeps value 1.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0004 begin`);
      const actual: number = Constants.TITLE_SCALE_MAX_VALUE;
      logInfo(`Constants.TITLE_SCALE_MAX_VALUE: actual=${actual}`);
      expect(actual).assertClose(1.2, PRECISION);
      logInfo(`${BUNDLE}ConstantsValues_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0005
     * @tc.name      ExpandTitle_ConstantsValues_0005
     * @tc.desc      Constants.TITLE_SCALE_DEFAULT_VALUE keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0005 begin`);
      const actual: number = Constants.TITLE_SCALE_DEFAULT_VALUE;
      logInfo(`Constants.TITLE_SCALE_DEFAULT_VALUE: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ConstantsValues_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0006
     * @tc.name      ExpandTitle_ConstantsValues_0006
     * @tc.desc      Constants.ANIMATE_DURATION_DRAG keeps value 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0006 begin`);
      const actual: number = Constants.ANIMATE_DURATION_DRAG;
      logInfo(`Constants.ANIMATE_DURATION_DRAG: actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}ConstantsValues_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0007
     * @tc.name      ExpandTitle_ConstantsValues_0007
     * @tc.desc      Constants.ANIMATE_DURATION_BACK keeps value 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0007 begin`);
      const actual: number = Constants.ANIMATE_DURATION_BACK;
      logInfo(`Constants.ANIMATE_DURATION_BACK: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}ConstantsValues_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0008
     * @tc.name      ExpandTitle_ConstantsValues_0008
     * @tc.desc      Constants.SEARCH_MEMO_SPACE keeps value 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0008 begin`);
      const actual: number = Constants.SEARCH_MEMO_SPACE;
      logInfo(`Constants.SEARCH_MEMO_SPACE: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}ConstantsValues_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0009
     * @tc.name      ExpandTitle_ConstantsValues_0009
     * @tc.desc      Constants.INIT_COORDINATE keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0009 begin`);
      const actual: number = Constants.INIT_COORDINATE;
      logInfo(`Constants.INIT_COORDINATE: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConstantsValues_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0010
     * @tc.name      ExpandTitle_ConstantsValues_0010
     * @tc.desc      Constants.TRANSLATE_Y keeps value -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0010 begin`);
      const actual: number = Constants.TRANSLATE_Y;
      logInfo(`Constants.TRANSLATE_Y: actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}ConstantsValues_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0011
     * @tc.name      ExpandTitle_ConstantsValues_0011
     * @tc.desc      Constants.MEMO_COL_SPACE keeps value 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0011 begin`);
      const actual: number = Constants.MEMO_COL_SPACE;
      logInfo(`Constants.MEMO_COL_SPACE: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ConstantsValues_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0012
     * @tc.name      ExpandTitle_ConstantsValues_0012
     * @tc.desc      Constants.NORMAL_TITLE_HEIGHT keeps value 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0012 begin`);
      const actual: number = Constants.NORMAL_TITLE_HEIGHT;
      logInfo(`Constants.NORMAL_TITLE_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}ConstantsValues_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0013
     * @tc.name      ExpandTitle_ConstantsValues_0013
     * @tc.desc      Constants.EXPAND_TITLE_HEIGHT keeps value 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0013 begin`);
      const actual: number = Constants.EXPAND_TITLE_HEIGHT;
      logInfo(`Constants.EXPAND_TITLE_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ConstantsValues_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0014
     * @tc.name      ExpandTitle_ConstantsValues_0014
     * @tc.desc      Constants.ONE_HUNDRED_PERCENT keeps value "100%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0014 begin`);
      const actual: string = Constants.ONE_HUNDRED_PERCENT;
      logInfo(`Constants.ONE_HUNDRED_PERCENT: actual=${actual}`);
      expect(actual).assertEqual('100%');
      logInfo(`${BUNDLE}ConstantsValues_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0015
     * @tc.name      ExpandTitle_ConstantsValues_0015
     * @tc.desc      Constants.TITLE_LAYOUT_PADDING keeps value 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0015 begin`);
      const actual: number = Constants.TITLE_LAYOUT_PADDING;
      logInfo(`Constants.TITLE_LAYOUT_PADDING: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}ConstantsValues_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0016
     * @tc.name      ExpandTitle_ConstantsValues_0016
     * @tc.desc      Constants.MEMO_TITLE keeps value "All notes"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0016 begin`);
      const actual: string = Constants.MEMO_TITLE;
      logInfo(`Constants.MEMO_TITLE: actual=${actual}`);
      expect(actual).assertEqual('All notes');
      logInfo(`${BUNDLE}ConstantsValues_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0017
     * @tc.name      ExpandTitle_ConstantsValues_0017
     * @tc.desc      Constants.MEMO_SUB_TITLE keeps value "8 notes"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0017 begin`);
      const actual: string = Constants.MEMO_SUB_TITLE;
      logInfo(`Constants.MEMO_SUB_TITLE: actual=${actual}`);
      expect(actual).assertEqual('8 notes');
      logInfo(`${BUNDLE}ConstantsValues_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0018
     * @tc.name      ExpandTitle_ConstantsValues_0018
     * @tc.desc      Constants.SUB_TITLE_FONT_SIZE keeps value 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0018 begin`);
      const actual: number = Constants.SUB_TITLE_FONT_SIZE;
      logInfo(`Constants.SUB_TITLE_FONT_SIZE: actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}ConstantsValues_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0019
     * @tc.name      ExpandTitle_ConstantsValues_0019
     * @tc.desc      Constants.BACKGROUND_COLOR keeps value "0xeaf0ef"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0019 begin`);
      const actual: string = Constants.BACKGROUND_COLOR;
      logInfo(`Constants.BACKGROUND_COLOR: actual=${actual}`);
      expect(actual).assertEqual('0xeaf0ef');
      logInfo(`${BUNDLE}ConstantsValues_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0020
     * @tc.name      ExpandTitle_ConstantsValues_0020
     * @tc.desc      Constants.MAX_TEXT_LINES keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0020 begin`);
      const actual: number = Constants.MAX_TEXT_LINES;
      logInfo(`Constants.MAX_TEXT_LINES: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ConstantsValues_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0021
     * @tc.name      ExpandTitle_ConstantsValues_0021
     * @tc.desc      Constants.MEMO_IMAGE_ASPECT_RATIO keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0021 begin`);
      const actual: number = Constants.MEMO_IMAGE_ASPECT_RATIO;
      logInfo(`Constants.MEMO_IMAGE_ASPECT_RATIO: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ConstantsValues_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0022
     * @tc.name      ExpandTitle_ConstantsValues_0022
     * @tc.desc      Constants.TITLE_FONT_SIZE keeps value 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0022 begin`);
      const actual: number = Constants.TITLE_FONT_SIZE;
      logInfo(`Constants.TITLE_FONT_SIZE: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}ConstantsValues_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_VALUES_0023
     * @tc.name      ExpandTitle_ConstantsValues_0023
     * @tc.desc      Constants.ANIMATION_DURATION keeps value 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConstantsValues_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0023 begin`);
      const actual: number = Constants.ANIMATION_DURATION;
      logInfo(`Constants.ANIMATION_DURATION: actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}ConstantsValues_0023 end`);
    });
  });
}
