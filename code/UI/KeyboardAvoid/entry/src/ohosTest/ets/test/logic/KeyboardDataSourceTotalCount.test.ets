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
import { KeyboardDataSource } from '../../../../main/ets/bridge/KeyboardAvoidBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for KeyboardDataSource.totalCount (1 cases). */
export default function keyboardDataSourceTotalCountTest(): void {
  describe('KeyboardDataSourceTotalCountTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_TOTAL_COUNT_0001
     * @tc.name      KeyboardAvoid_KeyboardDataSourceTotalCount_0001
     * @tc.desc      KeyboardDataSource.totalCount() yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardDataSourceTotalCount_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceTotalCount_0001 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const actual: number = subject.totalCount();
      logInfo(`totalCount(): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardDataSourceTotalCount_0001 end`);
    });
  });
}
