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
import { Configure } from '../../../main/ets/pages/Configure';

const DOMAIN: number = 0xF814;
const TAG: string = 'ExpansionConfigureCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function expansionConfigureCoreTest(): void {
  describe('ExpansionConfigureCoreTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0201
     * @tc.name      testExpansionConfigure0201
     * @tc.desc      Verify Configure NORMAL_TITLE_HEIGHT equals 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0201 begin');
      const actual: number = Configure.NORMAL_TITLE_HEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=80`);
      expect(actual).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConfigure0201 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0202
     * @tc.name      testExpansionConfigure0202
     * @tc.desc      Verify Configure EXPAND_TITLE_HEIGHT equals 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0202 begin');
      const actual: number = Configure.EXPAND_TITLE_HEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=100`);
      expect(actual).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConfigure0202 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0203
     * @tc.name      testExpansionConfigure0203
     * @tc.desc      Verify Configure CONTINUE_PULL_THRESHOLD equals 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0203 begin');
      const actual: number = Configure.CONTINUE_PULL_THRESHOLD;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=90`);
      expect(actual).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConfigure0203 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0204
     * @tc.name      testExpansionConfigure0204
     * @tc.desc      Verify Configure ANIMATION_DURATION equals 120.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0204 begin');
      const actual: number = Configure.ANIMATION_DURATION;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=120`);
      expect(actual).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConfigure0204 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0205
     * @tc.name      testExpansionConfigure0205
     * @tc.desc      Verify Configure TITLE_SCALE_MAX_VALUE equals 1.2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0205 begin');
      const actual: number = Configure.TITLE_SCALE_MAX_VALUE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1.2`);
      expect(actual).assertEqual(1.2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testExpansionConfigure0205 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0206
     * @tc.name      testExpansionConfigure0206
     * @tc.desc      Verify Configure NORMAL_TITLE_HEIGHT matches Constants NORMAL_TITLE_HEIGHT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0206 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Configure.NORMAL_TITLE_HEIGHT}`);
      expect(Configure.NORMAL_TITLE_HEIGHT).assertEqual(Constants.NORMAL_TITLE_HEIGHT);
      log('testExpansionConfigure0206 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0207
     * @tc.name      testExpansionConfigure0207
     * @tc.desc      Verify Configure EXPAND_TITLE_HEIGHT matches Constants EXPAND_TITLE_HEIGHT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0207 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Configure.EXPAND_TITLE_HEIGHT}`);
      expect(Configure.EXPAND_TITLE_HEIGHT).assertEqual(Constants.EXPAND_TITLE_HEIGHT);
      log('testExpansionConfigure0207 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0208
     * @tc.name      testExpansionConfigure0208
     * @tc.desc      Verify Configure CONTINUE_PULL_THRESHOLD matches Constants CONTINUE_PULL_THRESHOLD.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0208 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Configure.CONTINUE_PULL_THRESHOLD}`);
      expect(Configure.CONTINUE_PULL_THRESHOLD).assertEqual(Constants.CONTINUE_PULL_THRESHOLD);
      log('testExpansionConfigure0208 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0209
     * @tc.name      testExpansionConfigure0209
     * @tc.desc      Verify Configure ANIMATION_DURATION matches Constants ANIMATION_DURATION.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0209 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Configure.ANIMATION_DURATION=${Configure.ANIMATION_DURATION}`);
      expect(Configure.ANIMATION_DURATION).assertEqual(Constants.ANIMATION_DURATION);
      log('testExpansionConfigure0209 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0210
     * @tc.name      testExpansionConfigure0210
     * @tc.desc      Verify Configure TITLE_SCALE_MAX_VALUE matches Constants TITLE_SCALE_MAX_VALUE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0210 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Configure.TITLE_SCALE_MAX_VALUE}`);
      expect(Configure.TITLE_SCALE_MAX_VALUE).assertEqual(Constants.TITLE_SCALE_MAX_VALUE);
      log('testExpansionConfigure0210 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0211
     * @tc.name      testExpansionConfigure0211
     * @tc.desc      Verify expanded title height is larger than normal title height.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0211 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Configure.EXPAND_TITLE_HEIGHT > Configure.NORMAL_TITLE_HEIGHT`);
      expect(Configure.EXPAND_TITLE_HEIGHT > Configure.NORMAL_TITLE_HEIGHT).assertTrue();
      log('testExpansionConfigure0211 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0212
     * @tc.name      testExpansionConfigure0212
     * @tc.desc      Verify continue pull threshold is below expand title height.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0212 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Configure.CONTINUE_PULL_THRESHOLD < Configure.EXPAND_TITLE...`);
      expect(Configure.CONTINUE_PULL_THRESHOLD < Configure.EXPAND_TITLE_HEIGHT).assertTrue();
      log('testExpansionConfigure0212 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0213
     * @tc.name      testExpansionConfigure0213
     * @tc.desc      Verify continue pull threshold is above zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0213 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Configure.CONTINUE_PULL_THRESHOLD > 0}`);
      expect(Configure.CONTINUE_PULL_THRESHOLD > 0).assertTrue();
      log('testExpansionConfigure0213 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0214
     * @tc.name      testExpansionConfigure0214
     * @tc.desc      Verify title scale max value is not smaller than default scale.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0214 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Configure.TITLE_SCALE_MAX_VALUE >= Constants.TITLE_SCALE_D...`);
      expect(Configure.TITLE_SCALE_MAX_VALUE >= Constants.TITLE_SCALE_DEFAULT_VALUE).assertTrue();
      log('testExpansionConfigure0214 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0215
     * @tc.name      testExpansionConfigure0215
     * @tc.desc      Verify title scale max value enlarges the title when expanded.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0215 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Configure.TITLE_SCALE_MAX_VALUE > 1}`);
      expect(Configure.TITLE_SCALE_MAX_VALUE > 1).assertTrue();
      log('testExpansionConfigure0215 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0216
     * @tc.name      testExpansionConfigure0216
     * @tc.desc      Verify title scale max value is a finite number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0216 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Number.isFinite(Configure.TITLE_SCALE_MAX_VALUE)}`);
      expect(Number.isFinite(Configure.TITLE_SCALE_MAX_VALUE)).assertTrue();
      log('testExpansionConfigure0216 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0217
     * @tc.name      testExpansionConfigure0217
     * @tc.desc      Verify animation duration is a positive value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0217 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Configure.ANIMATION_DURATION > 0}`);
      expect(Configure.ANIMATION_DURATION > 0).assertTrue();
      log('testExpansionConfigure0217 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0218
     * @tc.name      testExpansionConfigure0218
     * @tc.desc      Verify normal title height is a non-negative integer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0218 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Configure.NORMAL_TITLE_HEIGHT >= 0}`);
      expect(Configure.NORMAL_TITLE_HEIGHT >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Number.isInteger(Configure.NORMAL_TITLE_HEIGHT)}`);
      expect(Number.isInteger(Configure.NORMAL_TITLE_HEIGHT)).assertTrue();
      log('testExpansionConfigure0218 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0219
     * @tc.name      testExpansionConfigure0219
     * @tc.desc      Verify expand title height is a positive integer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0219 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Configure.EXPAND_TITLE_HEIGHT > 0}`);
      expect(Configure.EXPAND_TITLE_HEIGHT > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Number.isInteger(Configure.EXPAND_TITLE_HEIGHT)}`);
      expect(Number.isInteger(Configure.EXPAND_TITLE_HEIGHT)).assertTrue();
      log('testExpansionConfigure0219 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0220
     * @tc.name      testExpansionConfigure0220
     * @tc.desc      Verify expand height is 1.25 times of normal height.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0220 begin');
      const ratio: number = Configure.EXPAND_TITLE_HEIGHT / Configure.NORMAL_TITLE_HEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ratio=${ratio}, expected=1.25`);
      expect(ratio).assertEqual(1.25);
      log('testExpansionConfigure0220 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0221
     * @tc.name      testExpansionConfigure0221
     * @tc.desc      Verify back animation duration is larger than drag duration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0221 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Constants.ANIMATE_DURATION_BACK > Constants.ANIMATE_DURATI...`);
      expect(Constants.ANIMATE_DURATION_BACK > Constants.ANIMATE_DURATION_DRAG).assertTrue();
      log('testExpansionConfigure0221 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0222
     * @tc.name      testExpansionConfigure0222
     * @tc.desc      Verify title down max distance is larger than menu down max distance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0222 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Constants.TITLE_DOWN_Y_MAX_VALUE > Constants.MENU_DOWN_Y_M...`);
      expect(Constants.TITLE_DOWN_Y_MAX_VALUE > Constants.MENU_DOWN_Y_MAX_VALUE).assertTrue();
      log('testExpansionConfigure0222 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0223
     * @tc.name      testExpansionConfigure0223
     * @tc.desc      Verify title translate y is a negative offset for upward motion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0223 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Constants.TRANSLATE_Y < 0=${Constants.TRANSLATE_Y < 0}`);
      expect(Constants.TRANSLATE_Y < 0).assertTrue();
      log('testExpansionConfigure0223 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0224
     * @tc.name      testExpansionConfigure0224
     * @tc.desc      Verify search and memo list spacing is positive.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0224 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.SEARCH_MEMO_SPACE > 0}`);
      expect(Constants.SEARCH_MEMO_SPACE > 0).assertTrue();
      log('testExpansionConfigure0224 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0225
     * @tc.name      testExpansionConfigure0225
     * @tc.desc      Verify memo column spacing is positive.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0225 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Constants.MEMO_COL_SPACE > 0=${Constants.MEMO_COL_SPACE > 0}`);
      expect(Constants.MEMO_COL_SPACE > 0).assertTrue();
      log('testExpansionConfigure0225 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0226
     * @tc.name      testExpansionConfigure0226
     * @tc.desc      Verify background color follows the 0x string format.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0226 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.BACKGROUND_COLOR.startsWith('0x')}`);
      expect(Constants.BACKGROUND_COLOR.startsWith('0x')).assertTrue();
      log('testExpansionConfigure0226 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0227
     * @tc.name      testExpansionConfigure0227
     * @tc.desc      Verify full height percent string ends with the percent sign.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0227 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.ONE_HUNDRED_PERCENT.endsWith('%')}`);
      expect(Constants.ONE_HUNDRED_PERCENT.endsWith('%')).assertTrue();
      log('testExpansionConfigure0227 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0228
     * @tc.name      testExpansionConfigure0228
     * @tc.desc      Verify drag animation duration equals default animation duration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0228 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.ANIMATION_DURATION=${Constants.ANIMATION_DURATION}`);
      expect(Constants.ANIMATION_DURATION).assertEqual(Constants.ANIMATE_DURATION_DRAG);
      log('testExpansionConfigure0228 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_0229
     * @tc.name      testExpansionConfigure0229
     * @tc.desc      Verify title font size is larger than sub title font size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpansionConfigure0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExpansionConfigure0229 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Constants.TITLE_FONT_SIZE > Constants.SUB_TITLE_FONT_SIZE`);
      expect(Constants.TITLE_FONT_SIZE > Constants.SUB_TITLE_FONT_SIZE).assertTrue();
      log('testExpansionConfigure0229 end');
    })
  })
}
