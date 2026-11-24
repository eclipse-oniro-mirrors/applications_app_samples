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

/** Logic checks for SideBarState flow (14 cases). */
export default function sideBarStateFlow5Test(): void {
  describe('SideBarStateFlow5Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0192
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0192
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFavorite > toggleFavorite > toggleLike k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0192 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1234);
      logInfo(`toggleFocus>toggleLike>toggleFavorite>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0193
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0193
     * @tc.desc      SideBarState call flow toggleFocus > toggleFocus > toggleFocus > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0193 begin`);
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
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleFocus>toggleFocus>toggleFocus>toggl...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0194
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0194
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleFavorite > toggleLike keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0194 begin`);
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
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`toggleLike>toggleLike>toggleFavorite>togg...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0195
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0195
     * @tc.desc      SideBarState call flow toggleLike > toggleFocus > toggleLike > toggleFocus keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0195 begin`);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0196
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0196
     * @tc.desc      SideBarState call flow toggleFocus > toggleLike > toggleFocus > toggleLike > toggleFocus keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0196 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`toggleFocus>toggleLike>toggleFocus>toggle...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0197
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0197
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFavorite > toggleFavorite > toggleFocus > toggleFa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0197 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleFavorite>toggleFavorite>toggleFavor...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0198
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0198
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleFocus > toggleFocus > toggleLike kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0198 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0199
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0199
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleLike > toggleFavorite > toggleFavorite ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0199 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3234);
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFa...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleLike>toggleLike>toggleLike>toggleFa...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0200
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0200
     * @tc.desc      SideBarState call flow toggleFavorite > toggleLike > toggleFavorite > toggleLike > toggleLike ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0200 begin`);
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
      const step5: number = subject.toggleLike();
      logInfo(`step5 toggleLike(): step5=${step5}`);
      expect(step5).assertEqual(1235);
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1235);
      logInfo(`toggleFavorite>toggleLike>toggleFavorite>...: subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0201
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0201
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleFocus > toggleFavorite > toggleFavor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0201 begin`);
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
      const step4: number = subject.toggleFavorite();
      logInfo(`step4 toggleFavorite(): step4=${step4}`);
      expect(step4).assertEqual(3234);
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFocus>toggleFavorite>toggleFocus>to...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0202
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0202
     * @tc.desc      SideBarState call flow toggleFavorite > toggleFocus > toggleLike > toggleLike > toggleFocus keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0202 begin`);
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
      const step4: number = subject.toggleLike();
      logInfo(`step4 toggleLike(): step4=${step4}`);
      expect(step4).assertEqual(1234);
      const step5: boolean = subject.toggleFocus();
      logInfo(`step5 toggleFocus(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`toggleFavorite>toggleFocus>toggleLike>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleFavorite>toggleFocus>toggleLike>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0203
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0203
     * @tc.desc      SideBarState call flow toggleLike > toggleLike > toggleLike > toggleLike > toggleFavorite keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0203 begin`);
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
      const step5: number = subject.toggleFavorite();
      logInfo(`step5 toggleFavorite(): step5=${step5}`);
      expect(step5).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleLike>toggleLi...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleLike>toggleLike>toggleLi...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0204
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0204
     * @tc.desc      SideBarState call flow toggleFocus > toggleFavorite > toggleFavorite > toggleFocus keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0204 begin`);
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
      logInfo(`${BUNDLE}SideBarStateFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_FLOW_0205
     * @tc.name      TabContentTouchHotZone_SideBarStateFlow_0205
     * @tc.desc      SideBarState call flow toggleLike > toggleFavorite > toggleFocus > toggleLike keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SideBarStateFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SideBarStateFlow_0205 begin`);
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
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3235);
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertTrue();
      logInfo(`toggleLike>toggleFavorite>toggleFocus>tog...: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateFlow_0205 end`);
    });
  });
}
