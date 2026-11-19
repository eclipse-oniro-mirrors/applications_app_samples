/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import Constants from '../../../main/ets/constants/Constants';

const DOMAIN: number = 0xF814;
const TAG: string = 'ExpansionConstantsCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function expansionConstantsCoreTest(): void {
  describe('ExpansionConstantsCoreTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0101
     * @tc.name      testExpansionConstants0101
     * @tc.desc      Verify CONTINUE_PULL_THRESHOLD constant equals 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0101 begin');
      const actual: number = Constants.CONTINUE_PULL_THRESHOLD;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=90`);
      expect(actual).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0101 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0102
     * @tc.name      testExpansionConstants0102
     * @tc.desc      Verify MENU_DOWN_Y_MAX_VALUE constant equals 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0102 begin');
      const actual: number = Constants.MENU_DOWN_Y_MAX_VALUE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=20`);
      expect(actual).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0102 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0103
     * @tc.name      testExpansionConstants0103
     * @tc.desc      Verify TITLE_DOWN_Y_MAX_VALUE constant equals 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0103 begin');
      const actual: number = Constants.TITLE_DOWN_Y_MAX_VALUE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=30`);
      expect(actual).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0103 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0104
     * @tc.name      testExpansionConstants0104
     * @tc.desc      Verify TITLE_SCALE_MAX_VALUE constant equals 1.2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0104 begin');
      const actual: number = Constants.TITLE_SCALE_MAX_VALUE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1.2`);
      expect(actual).assertEqual(1.2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0104 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0105
     * @tc.name      testExpansionConstants0105
     * @tc.desc      Verify TITLE_SCALE_DEFAULT_VALUE constant equals 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0105 begin');
      const actual: number = Constants.TITLE_SCALE_DEFAULT_VALUE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1`);
      expect(actual).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0105 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0106
     * @tc.name      testExpansionConstants0106
     * @tc.desc      Verify ANIMATE_DURATION_DRAG constant equals 120.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0106 begin');
      const actual: number = Constants.ANIMATE_DURATION_DRAG;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=120`);
      expect(actual).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0106 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0107
     * @tc.name      testExpansionConstants0107
     * @tc.desc      Verify ANIMATE_DURATION_BACK constant equals 300.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0107 begin');
      const actual: number = Constants.ANIMATE_DURATION_BACK;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=300`);
      expect(actual).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0107 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0108
     * @tc.name      testExpansionConstants0108
     * @tc.desc      Verify SEARCH_MEMO_SPACE constant equals 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0108 begin');
      const actual: number = Constants.SEARCH_MEMO_SPACE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=12`);
      expect(actual).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0108 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0109
     * @tc.name      testExpansionConstants0109
     * @tc.desc      Verify INIT_COORDINATE constant equals 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0109 begin');
      const actual: number = Constants.INIT_COORDINATE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0109 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0110
     * @tc.name      testExpansionConstants0110
     * @tc.desc      Verify TRANSLATE_Y constant equals -50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0110 begin');
      const actual: number = Constants.TRANSLATE_Y;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=-50`);
      expect(actual).assertEqual(-50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0110 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0111
     * @tc.name      testExpansionConstants0111
     * @tc.desc      Verify MAX_TEXT_LINES constant equals 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0111 begin');
      const actual: number = Constants.MAX_TEXT_LINES;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1`);
      expect(actual).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0111 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0112
     * @tc.name      testExpansionConstants0112
     * @tc.desc      Verify MEMO_COL_SPACE constant equals 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0112 begin');
      const actual: number = Constants.MEMO_COL_SPACE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=5`);
      expect(actual).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0112 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0113
     * @tc.name      testExpansionConstants0113
     * @tc.desc      Verify MEMO_IMAGE_ASPECT_RATIO constant equals 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0113 begin');
      const actual: number = Constants.MEMO_IMAGE_ASPECT_RATIO;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1`);
      expect(actual).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0113 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0114
     * @tc.name      testExpansionConstants0114
     * @tc.desc      Verify NORMAL_TITLE_HEIGHT constant equals 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0114 begin');
      const actual: number = Constants.NORMAL_TITLE_HEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=80`);
      expect(actual).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0114 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0115
     * @tc.name      testExpansionConstants0115
     * @tc.desc      Verify EXPAND_TITLE_HEIGHT constant equals 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0115 begin');
      const actual: number = Constants.EXPAND_TITLE_HEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=100`);
      expect(actual).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0115 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0116
     * @tc.name      testExpansionConstants0116
     * @tc.desc      Verify ONE_HUNDRED_PERCENT constant equals '100%'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0116 begin');
      const actual: string = Constants.ONE_HUNDRED_PERCENT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='100%'`);
      expect(actual).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testExpansionConstants0116 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0117
     * @tc.name      testExpansionConstants0117
     * @tc.desc      Verify TITLE_LAYOUT_PADDING constant equals 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0117 begin');
      const actual: number = Constants.TITLE_LAYOUT_PADDING;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=25`);
      expect(actual).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0117 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0118
     * @tc.name      testExpansionConstants0118
     * @tc.desc      Verify MEMO_TITLE constant equals 'All notes'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0118 begin');
      const actual: string = Constants.MEMO_TITLE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='All notes'`);
      expect(actual).assertEqual('All notes');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testExpansionConstants0118 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0119
     * @tc.name      testExpansionConstants0119
     * @tc.desc      Verify MEMO_SUB_TITLE constant equals '8 notes'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0119 begin');
      const actual: string = Constants.MEMO_SUB_TITLE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='8 notes'`);
      expect(actual).assertEqual('8 notes');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testExpansionConstants0119 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0120
     * @tc.name      testExpansionConstants0120
     * @tc.desc      Verify TITLE_FONT_SIZE constant equals 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0120 begin');
      const actual: number = Constants.TITLE_FONT_SIZE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=25`);
      expect(actual).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0120 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0121
     * @tc.name      testExpansionConstants0121
     * @tc.desc      Verify SUB_TITLE_FONT_SIZE constant equals 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0121 begin');
      const actual: number = Constants.SUB_TITLE_FONT_SIZE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=16`);
      expect(actual).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0121 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0122
     * @tc.name      testExpansionConstants0122
     * @tc.desc      Verify BACKGROUND_COLOR constant equals '0xeaf0ef'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0122 begin');
      const actual: string = Constants.BACKGROUND_COLOR;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='0xeaf0ef'`);
      expect(actual).assertEqual('0xeaf0ef');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testExpansionConstants0122 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONSTANTS_0123
     * @tc.name      testExpansionConstants0123
     * @tc.desc      Verify ANIMATION_DURATION constant equals 120.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConstants0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConstants0123 begin');
      const actual: number = Constants.ANIMATION_DURATION;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=120`);
      expect(actual).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConstants0123 end');
    })
  })
}
