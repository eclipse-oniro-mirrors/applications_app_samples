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
export default function sideBarStateFlow3Test(): void {
  describe('SideBarStateFlow3Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0099
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0099
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleLike > toggleLike > toggleFavorite ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0099 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleFavorite>toggleLike>toggleLike>togg...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleLike>toggleLike>togg...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0100
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0100
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0100 begin`);
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
      logInfo(`toggleFocus>toggleLike>toggleLike final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0101
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0101
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFavorite > toggleFocus > toggleFocus...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0101 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0102
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0102
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFocus > toggleFocus keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0102 begin`);
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
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`toggleFavorite>toggleLike>toggleFocus>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleLike>toggleFocus>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleLike>toggleFocus>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleLike>toggleFocus>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0103
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0103
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFocus > toggleFocus keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0103 begin`);
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
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0104
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0104
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleLike > toggleFavorite > toggleLike keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0104 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0105
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0105
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleLike > toggleFocus keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0105 begin`);
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
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleLike>...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0106
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0106
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFavorite > toggleLike > toggleFocus k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0106 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0107
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0107
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFavorite > toggleFavorite > toggleFoc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0107 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0108
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0108
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFavorite > toggleFavorite keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0108 begin`);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0109
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0109
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleLike > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0109 begin`);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0110
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0110
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleFavorite keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0110 begin`);
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
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0111
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0111
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleLike > toggleFavorite keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0111 begin`);
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
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0112
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0112
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleLike > toggleFocus > toggleFavori...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0112 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0113
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0113
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFavorite > toggleLike keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0113 begin`);
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
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0114
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0114
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleLike > toggleFocus > toggleFocus keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0114 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0115
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0115
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFavorite > toggleFocus > toggleLike keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0115 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0116
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0116
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleFavorite > toggleFocus > toggleFocus...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0116 begin`);
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
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleFavorite...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0117
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0117
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleFavorite > toggleFavorite > toggl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0117 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0118
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0118
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFavorite > toggleFavorite > toggleFocus k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0118 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0119
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0119
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleFocus > toggleFavorite > toggleLike keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0119 begin`);
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
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0120
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0120
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleLike > toggleFocus > toggleFocus keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0120 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleLike>toggleF...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0121
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0121
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFavorite > toggleLike keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0121 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      logInfo(`${BUNDLE}SideBarStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0122
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0122
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFavorite > toggleFocus keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0122 begin`);
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
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0123
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0123
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleLike > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0123 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleL...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleL...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleL...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0124
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0124
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleFocus > toggleLike > toggleFocus kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0124 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0125
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0125
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleLike > toggleLike > toggleLike keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0125 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0126
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0126
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFavorite > toggleFavorite > toggleFa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0126 begin`);
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
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0127
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0127
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFavorite > toggleLike keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0127 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      logInfo(`${BUNDLE}SideBarStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0128
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0128
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleLike > toggleFocus > toggleLike keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0128 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleFocus>toggleFocus>toggleLike>toggle...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0129
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0129
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFocus > toggleLike > toggleLike keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0129 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleLike>toggleLike>toggleFocus>toggleL...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0130
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0130
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFavorite > toggleFavorite > toggleLike ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0130 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
      logInfo(`toggleFocus>toggleFocus>toggleFavorite>to...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFocus>toggleFavorite>to...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0131
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0131
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleFocus > toggleFocus > toggleLike kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0131 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0132
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0132
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleFocus > toggleLike keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0132 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0133
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0133
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleLike > toggleFocus keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0133 begin`);
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
      logInfo(`toggleFavorite>toggleLike>toggleLike>togg...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleLike>toggleLike>togg...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleLike>toggleLike>togg...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0134
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0134
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleLike > toggleLike keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0134 begin`);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0135
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0135
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleFocus > toggleLike keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0135 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3234);
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFocus...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFocus...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleFocus...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0136
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0136
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleLike > toggleFavorite > toggleLike keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0136 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFa...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFa...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0137
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0137
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0137 begin`);
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
      logInfo(`toggleFavorite>toggleLike>toggleFocus final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleLike>toggleFocus final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleLike>toggleFocus final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleLike>toggleFocus final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleLike>toggleFocus final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0138
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0138
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFavorite > toggleLike > toggleFocus ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0138 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0139
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0139
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleFavorite > toggleFavorite keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0139 begin`);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0140
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0140
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFavorite > toggleFocus keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0140 begin`);
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
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0141
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0141
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleLike > toggleFavorite > toggleFavorite k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0141 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0142
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0142
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleFocus > toggleLike > toggleFavori...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0142 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3234);
      const step3: boolean = subject.toggleFocus();
      logInfo(`step3 toggleFocus(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFocus...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFocus...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFocus...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleFocus...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleFocus...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0143
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0143
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFocus > toggleFavorite keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0143 begin`);
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
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0144
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0144
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFavorite > toggleLike > toggleLike keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0144 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0145
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0145
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFocus > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0145 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      logInfo(`toggleLike>toggleLike>toggleFocus>toggleL...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleLike>toggleFocus>toggleL...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleFocus>toggleL...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0145 end`);
    });
  });
}
