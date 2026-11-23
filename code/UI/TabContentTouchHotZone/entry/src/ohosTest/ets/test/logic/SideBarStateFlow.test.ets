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

/** Logic checks for SideBarState flow (51 cases). */
export default function sideBarStateFlowTest(): void {
  describe('SideBarStateFlowTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0001
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0001
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0001 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleLike final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0002
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0002
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0002 begin`);
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
      logInfo(`toggleLike>toggleFocus>toggleFocus final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleFocus final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0003
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0003
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleFavorite > toggleFavorite keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0003 begin`);
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
      logInfo(`toggleFocus>toggleFavorite>toggleFavorite...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleFavorite...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleFavorite...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0004
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0004
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFocus > toggleFavorite > toggleFavori...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0004 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0005
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0005
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0005 begin`);
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
      logInfo(`toggleFavorite>toggleLike>toggleLike final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleLike>toggleLike final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0006
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0006
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFavorite > toggleFavorite keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0006 begin`);
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
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0007
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0007
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFocus > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0007 begin`);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0008
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0008
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0008 begin`);
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
      logInfo(`toggleLike>toggleFocus>toggleLike final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0009
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0009
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFavorite > toggleFavorite > toggleFoc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0009 begin`);
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
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleFavorite>...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFavorite>toggleFavorite>...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleFavorite>...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleFavorite>...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleFavorite>...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0010
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0010
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0010 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1235);
      logInfo(`toggleFavorite>toggleLike final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleLike final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleLike final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleLike final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0011
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0011
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0011 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleFavorite final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0012
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0012
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFavorite keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0012 begin`);
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
      logInfo(`toggleFocus>toggleLike>toggleFavorite final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleFavorite final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFavorite final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFavorite final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0013
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0013
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0013 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: boolean = subject.toggleFocus();
      logInfo(`step1 toggleFocus(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`${BUNDLE}SideBarStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0014
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0014
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleFocus > toggleLike > toggleFocus keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0014 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0015
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0015
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFocus > toggleFavorite > toggleLike keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0015 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0016
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0016
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleLike > toggleFavorite keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0016 begin`);
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
      logInfo(`toggleFocus>toggleLike>toggleLike>toggleF...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleLike>toggleF...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleLike>toggleF...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0017
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0017
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFavorite > toggleFavorite > toggleLik...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0017 begin`);
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
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3235);
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleLike>toggleFavorite>toggleFavorite>...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleFavorite>...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0018
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0018
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFocus > toggleFavorite > toggleFocus keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0018 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleLike>toggleLike>toggleFocus>toggleF...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleFocus>toggleF...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0019
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0019
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleLike > toggleFocus keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0019 begin`);
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
      const step4: boolean = subject.toggleFocus();
      logInfo(`step4 toggleFocus(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleLike>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0020
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0020
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0020 begin`);
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
      logInfo(`toggleLike>toggleFavorite>toggleFocus final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFavorite>toggleFocus final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleFocus final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleFocus final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleFocus final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0021
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0021
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0021 begin`);
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
      logInfo(`toggleFocus>toggleLike>toggleFocus final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleFocus final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0022
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0022
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleLike > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0022 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      logInfo(`${BUNDLE}SideBarStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0023
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0023
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0023 begin`);
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
      logInfo(`toggleFavorite>toggleFavorite>toggleFocus...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0024
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0024
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0024 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: boolean = subject.toggleFocus();
      logInfo(`step2 toggleFocus(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`toggleFavorite>toggleFocus final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleFocus final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0025
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0025
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFocus > toggleFavorite keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0025 begin`);
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
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0026
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0026
     * @tc.desc      SideBarState call flow toggleLike > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0026 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleLike();
      logInfo(`step2 toggleLike(): step2=${step2}`);
      expect(step2).assertEqual(1234);
      logInfo(`${BUNDLE}SideBarStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0027
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0027
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFavorite > toggleFocus keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0027 begin`);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0028
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0028
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleLike > toggleFavorite keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0028 begin`);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0029
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0029
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleFocus > toggleFavorite keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0029 begin`);
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
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFocus>toggleFocus>toggle...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0030
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0030
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0030 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleLike();
      logInfo(`step1 toggleLike(): step1=${step1}`);
      expect(step1).assertEqual(1235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFavorite final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleFavorite final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0031
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0031
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFocus > toggleLike > toggleFocus kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0031 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1235);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFavorite>toggleFocus>toggleFocus>to...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFocus>toggleFocus>to...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleFocus>to...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleFocus>toggleFocus>to...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleFocus>toggleFocus>to...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0032
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0032
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0032 begin`);
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
      logInfo(`toggleLike>toggleLike>toggleLike final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleLike>toggleLike final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0033
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0033
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0033 begin`);
      const subject: SideBarState = new SideBarState();
      const step1: number = subject.toggleFavorite();
      logInfo(`step1 toggleFavorite(): step1=${step1}`);
      expect(step1).assertEqual(3235);
      const step2: number = subject.toggleFavorite();
      logInfo(`step2 toggleFavorite(): step2=${step2}`);
      expect(step2).assertEqual(3234);
      logInfo(`${BUNDLE}SideBarStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0034
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0034
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0034 begin`);
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
      logInfo(`toggleFocus>toggleFocus>toggleFocus final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0035
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0035
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFavorite keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0035 begin`);
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
      logInfo(`toggleFavorite>toggleLike>toggleFavorite ...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleLike>toggleFavorite ...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0036
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0036
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFocus > toggleLike > toggleLike keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0036 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0037
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0037
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFavorite keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0037 begin`);
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
      logInfo(`toggleLike>toggleLike>toggleFavorite final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleFavorite final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0038
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0038
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFavorite > toggleLike > toggleFavori...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0038 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0039
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0039
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFavorite keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0039 begin`);
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
      logInfo(`toggleLike>toggleFavorite>toggleFavorite ...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleFavorite>toggleFavorite ...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0040
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0040
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFocus > toggleFocus > toggleFavorite kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0040 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0041
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0041
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleFavorite > toggleLike > toggleLik...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0041 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0042
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0042
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFavorite keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0042 begin`);
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
      logInfo(`toggleFavorite>toggleFocus>toggleFavorite...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0043
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0043
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0043 begin`);
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
      logInfo(`toggleFavorite>toggleFavorite>toggleLike ...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFavorite>toggleLike ...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0044
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0044
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleFavorite > toggleLike > toggleFoc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0044 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0045
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0045
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleLike > toggleFocus > toggleFavorite keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0045 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFocus>toggleLike>toggleF...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0046
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0046
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFavorite keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0046 begin`);
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
      logInfo(`toggleFocus>toggleFocus>toggleFavorite final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFocus>toggleFavorite final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0047
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0047
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0047 begin`);
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
      logInfo(`toggleFocus>toggleFavorite>toggleLike final: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFavorite>toggleLike final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleLike final: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleLike final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleFocus>toggleFavorite>toggleLike final: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0048
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0048
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0048 begin`);
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
      logInfo(`toggleLike>toggleFavorite>toggleLike final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleLike final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0049
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0049
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFocus > toggleFavorite > toggleLike k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0049 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleFavorite>toggleLike>toggleFocus>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0050
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0050
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFocus > toggleLike > toggleFocus keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0050 begin`);
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
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleLike>toggleLike>toggleFocus>toggleL...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleLike>toggleFocus>toggleL...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0051
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0051
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0051 begin`);
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
      logInfo(`toggleFocus>toggleFavorite>toggleFocus final: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleFocus final: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0051 end`);
    });
  });
}
