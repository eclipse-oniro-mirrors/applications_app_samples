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

/** Logic checks for new SideBarState (1 cases). */
export default function sideBarStateCtorTest(): void {
  describe('SideBarStateCtorTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_CTOR_0001
     * @tc.name      TabContentTouchHotZone_SideBarStateCtor_0001
     * @tc.desc      new SideBarState() initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_SideBarStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SideBarStateCtor_0001 begin`);
      const subject: SideBarState = new SideBarState();
      logInfo(`new SideBarState(): subject.likeCount=${subject.likeCount}`);
      expect(subject.likeCount).assertEqual(1234);
      logInfo(`new SideBarState(): subject.favoriteCount=${subject.favoriteCount}`);
      expect(subject.favoriteCount).assertEqual(3234);
      logInfo(`new SideBarState(): subject.isLike=${subject.isLike}`);
      expect(subject.isLike).assertFalse();
      logInfo(`new SideBarState(): subject.isFavorite=${subject.isFavorite}`);
      expect(subject.isFavorite).assertFalse();
      logInfo(`new SideBarState(): subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertFalse();
      logInfo(`${BUNDLE}SideBarStateCtor_0001 end`);
    });
  });
}
