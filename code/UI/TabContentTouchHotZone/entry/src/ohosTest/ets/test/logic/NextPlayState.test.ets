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
import { nextPlayState } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for nextPlayState (2 cases). */
export default function nextPlayStateTest(): void {
  describe('NextPlayStateTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_PLAY_STATE_0001
     * @tc.name      TabContentTouchHotZone_NextPlayState_0001
     * @tc.desc      nextPlayState(isPlay=true) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_NextPlayState_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}NextPlayState_0001 begin`);
      const actual: boolean = nextPlayState(true);
      logInfo(`nextPlayState(isPlay=true): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NextPlayState_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_PLAY_STATE_0002
     * @tc.name      TabContentTouchHotZone_NextPlayState_0002
     * @tc.desc      nextPlayState(isPlay=false) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_NextPlayState_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}NextPlayState_0002 begin`);
      const actual: boolean = nextPlayState(false);
      logInfo(`nextPlayState(isPlay=false): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}NextPlayState_0002 end`);
    });
  });
}
