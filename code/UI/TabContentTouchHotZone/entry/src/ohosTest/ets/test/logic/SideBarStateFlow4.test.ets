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
import { SideBarState } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SideBarState flow (46 cases). */
export default function sideBarStateFlow4Test(): void {
  describe('SideBarStateFlow4Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0146
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0146
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleLike > toggleLike > toggleLike keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0146 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1234);
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleFocus>toggleLike>toggleLike>toggleL...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0147
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0147
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFocus > toggleFavorite > toggleLike kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0147 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0148
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0148
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFavorite > toggleFocus > toggleFavor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0148 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3234);
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0149
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0149
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleLike > toggleFocus > toggleLike k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0149 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3234);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1235);
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0150
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0150
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleFavorite > toggleLike keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0150 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3234);
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3235);
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0151
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0151
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFavorite > toggleFocus > toggleLike ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0151 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3234);
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0152
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0152
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFavorite > toggleLike keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0152 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3235);
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      logInfo(`toggleFocus>toggleFocus>toggleFavorite>to...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFocus>toggleFavorite>to...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFocus>toggleFavorite>to...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleFavorite>to...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0153
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0153
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleLike > toggleLike > toggleLike keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0153 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3235);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1234);
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0154
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0154
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleLike > toggleFocus > toggleFocus keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0154 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1234);
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0155
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0155
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleLike > toggleLike > toggleFavorite keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0155 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1235);
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0156
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0156
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleFavorite > toggleFocus > toggleFavorite ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0156 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3235);
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0157
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0157
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleFavorite > toggleFavorite > toggleFocus ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0157 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3235);
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0158
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0158
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFocus > toggleLike keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0158 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      logInfo(`toggleFavorite>toggleLike>toggleFocus>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleLike>toggleFocus>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleLike>toggleFocus>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0159
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0159
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0159 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1235);
      logInfo(`toggleFocus>toggleFocus>toggleLike final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFocus>toggleLike final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0160
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0160
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleLike > toggleFocus > toggleLike keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0160 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1234);
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0161
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0161
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleFocus > toggleFocus > toggleFavorite kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0161 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0162
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0162
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFocus > toggleLike > toggleFavorite kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0162 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0163
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0163
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFocus > toggleFocus > toggleFocus kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0163 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3235);
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0164
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0164
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFavorite > toggleFavorite > toggleFav...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0164 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3234);
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0165
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0165
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleLike > toggleLike > toggleFocus keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0165 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3235);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1234);
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0166
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0166
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFavorite > toggleLike keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0166 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3235);
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0167
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0167
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleLike > toggleFavorite > toggleLike keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0167 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1234);
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleLike>toggleF...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleLike>toggleF...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleLike>toggleF...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleLike>toggleF...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleLike>toggleF...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0168
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0168
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0168 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`toggleFavorite>toggleFocus>toggleFocus final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleFocus final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0169
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0169
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleLike > toggleFavorite > toggleFocus ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0169 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1235);
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleFavorite>toggleFocus>toggleLike>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFocus>toggleLike>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0170
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0170
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleLike > toggleFavorite keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0170 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3234);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1235);
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0171
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0171
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFocus > toggleFavorite > toggleFavorite ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0171 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0172
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0172
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFocus > toggleFocus > toggleFocus keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0172 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0173
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0173
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleLike > toggleLike > toggleFavorit...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0173 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3234);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1235);
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0174
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0174
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleLike > toggleFavorite > toggleFavorit...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0174 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3235);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1234);
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0175
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0175
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFavorite > toggleFocus > toggleLike keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0175 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1234);
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3235);
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0176
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0176
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFavorite > toggleFocus keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0176 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3235);
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3234);
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleFavorite>...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFavorite>toggleFavorite>...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleFavorite>...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0177
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0177
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFavorite > toggleLike > toggleLike k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0177 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3234);
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0178
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0178
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleLike > toggleFavorite > toggleFocus keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0178 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1234);
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0179
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0179
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleFavorite > toggleLike > toggleFocus ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0179 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3235);
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3234);
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleFocus>toggleFavorite>toggleFavorite...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFavorite>toggleFavorite...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0180
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0180
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleFocus > toggleFocus keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0180 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3235);
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0181
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0181
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFavorite > toggleFavorite keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0181 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3235);
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0182
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0182
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFocus > toggleFavorite keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0182 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      logInfo(`toggleFavorite>toggleLike>toggleFocus>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleLike>toggleFocus>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleLike>toggleFocus>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0183
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0183
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFavorite > toggleFocus > toggleFavorite ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0183 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3235);
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0184
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0184
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFocus > toggleFavorite > toggleFavor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0184 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleFocus>to...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleFocus>to...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0185
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0185
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleFocus > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0185 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      logInfo(`${BUNDLE}SideBarStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0186
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0186
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleLike > toggleFavorite keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0186 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3235);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1234);
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      logInfo(`${BUNDLE}SideBarStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0187
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0187
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleFavorite > toggleFavorite > toggl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0187 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3234);
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3235);
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0188
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0188
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFocus > toggleFavorite > toggleFocus ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0188 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3235);
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0189
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0189
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFavorite > toggleLike > toggleFocus keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0189 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1234);
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3235);
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0190
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0190
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFavorite > toggleFavorite > toggleFavorit...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0190 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1234);
      const step3: number = subject.toggleFavorite();
      logInfo(`step3 toggleFavorite(): step3=${step3}`);
      expect(step3).assertEqual(3235);
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0191
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0191
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFocus > toggleFocus > toggleFocus keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0191 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0191 end`);
    });
  });
}
