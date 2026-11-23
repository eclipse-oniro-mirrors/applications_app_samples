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

/** Logic checks for SideBarState flow (47 cases). */
export default function sideBarStateFlow2Test(): void {
  describe('SideBarStateFlow2Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0052
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0052
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleLike > toggleFavorite > toggleLike ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0052 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0053
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0053
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleLike > toggleFavorite keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0053 begin`);
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
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0054
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0054
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleLike > toggleLike > toggleFocus keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0054 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3235);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1235);
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0055
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0055
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleLike > toggleFocus > toggleFavorite k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0055 begin`);
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
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0056
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0056
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFocus > toggleFavorite keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0056 begin`);
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
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0057
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0057
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleLike > toggleFocus > toggleFocus keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0057 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1234);
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleFavorite>toggleLike>toggleLike>togg...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleLike>toggleLike>togg...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0058
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0058
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0058 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1234);
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleFocus final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0059
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0059
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleFocus > toggleLike > toggleFavorite keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0059 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0060
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0060
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFavorite > toggleFocus > toggleFavorite k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0060 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0061
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0061
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleLike > toggleFavorite > toggleLike keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0061 begin`);
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
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0062
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0062
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFocus > toggleFocus > toggleLike keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0062 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0063
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0063
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFavorite > toggleFocus keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0063 begin`);
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
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0064
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0064
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFavorite > toggleLike > toggleLike keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0064 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0065
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0065
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFocus > toggleFavorite > toggleFavorite k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0065 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1234);
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleLike>toggleLike>toggleFocus>toggleF...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0066
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0066
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFocus > toggleFocus > toggleFavorite ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0066 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0067
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0067
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFocus > toggleLike > toggleFavorite k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0067 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleFavorite>toggleLike>toggleFocus>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0068
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0068
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleFavorite keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0068 begin`);
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
      logInfo(`toggleLike>toggleFocus>toggleFavorite final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleFavorite final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleFavorite final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleFavorite final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleFavorite final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0069
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0069
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleLike > toggleFocus > toggleFavorite k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0069 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1234);
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleFavorite>toggleLike>toggleLike>togg...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0070
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0070
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleLike > toggleFavorite > toggleFavorit...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0070 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1234);
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleFavorite>toggleLike>toggleLike>togg...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleLike>toggleLike>togg...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0071
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0071
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleFavorite > toggleFavorite keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0071 begin`);
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
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0072
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0072
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleLike > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0072 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1234);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1235);
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFo...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFo...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFo...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0073
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0073
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0073 begin`);
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
      logInfo(`toggleFavorite>toggleFocus>toggleLike final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFocus>toggleLike final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleLike final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleFocus>toggleLike final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleFocus>toggleLike final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0074
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0074
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFavorite > toggleFavorite > toggleFavori...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0074 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0075
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0075
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFocus > toggleFocus > toggleFocus ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0075 begin`);
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
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleFavorite>toggleFocus>toggleFocus>to...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleFocus>to...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0076
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0076
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFavorite > toggleFavorite keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0076 begin`);
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
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      logInfo(`${BUNDLE}SideBarStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0077
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0077
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleFavorite keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0077 begin`);
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
      logInfo(`toggleFocus>toggleFavorite>toggleFavorite...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0078
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0078
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFavorite > toggleFocus keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0078 begin`);
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
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleFavorite>to...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFocus>toggleFavorite>to...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleFavorite>to...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0079
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0079
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFavorite > toggleFavorite keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0079 begin`);
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
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0080
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0080
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFocus > toggleFavorite keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0080 begin`);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0081
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0081
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleLike > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0081 begin`);
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
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0082
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0082
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleLike > toggleFavorite keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0082 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1234);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1235);
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFa...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFa...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFa...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFa...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0083
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0083
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleLike > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0083 begin`);
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
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}SideBarStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0084
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0084
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFocus > toggleLike > toggleLike keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0084 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0085
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0085
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleLike > toggleFocus > toggleFavorite keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0085 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1234);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1235);
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFo...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFo...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFo...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFo...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFo...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0086
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0086
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFavorite > toggleFavorite > toggleFocus...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0086 begin`);
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
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleFavorite>to...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0087
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0087
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleFavorite > toggleFocus keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0087 begin`);
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
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0088
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0088
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFavorite > toggleFocus > toggleFocus kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0088 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0089
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0089
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleFavorite > toggleFocus > toggleFocus kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0089 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0090
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0090
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleLike > toggleFavorite > toggleFavori...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0090 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleLike>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFocus>toggleLike>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleLike>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleFocus>toggleLike>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleFocus>toggleLike>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0091
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0091
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleFavorite > toggleFavorite > toggleFo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0091 begin`);
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
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleFocus>toggleFavorite>toggleFavorite...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleFavorite...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0092
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0092
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0092 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`toggleLike>toggleFocus final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFocus final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0093
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0093
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFocus > toggleLike > toggleFocus keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0093 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0094
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0094
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleLike > toggleLike keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0094 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3235);
      const step3: number = subject.toggleLike();
      logInfo(`step3 toggleLike(): step3=${step3}`);
      expect(step3).assertEqual(1235);
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0095
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0095
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleFavorite > toggleLike keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0095 begin`);
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
      logInfo(`toggleFocus>toggleFavorite>toggleFavorite...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFavorite>toggleFavorite...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleFavorite...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0096
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0096
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleLike > toggleFocus > toggleFocus keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0096 begin`);
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
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleLike>togg...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0097
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0097
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleLike > toggleFavorite > toggleFoc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0097 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0098
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0098
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleFavorite > toggleLike keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0098 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleFavorite>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0098 end`);
    });
  });
}
