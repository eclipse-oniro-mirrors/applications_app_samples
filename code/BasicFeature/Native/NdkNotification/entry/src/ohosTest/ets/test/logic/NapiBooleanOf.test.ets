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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { napiBooleanOf } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for napiBooleanOf (2 cases). */
export default function napiBooleanOfTest(): void {
  describe('NapiBooleanOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPI_BOOLEAN_OF_0001
     * @tc.name      NdkNotification_NapiBooleanOf_0001
     * @tc.desc      napiBooleanOf(nativeEnabled=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_NapiBooleanOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NapiBooleanOf_0001 begin`);
      const actual: boolean = napiBooleanOf(true);
      logInfo(`napiBooleanOf(nativeEnabled=true): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}NapiBooleanOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NAPI_BOOLEAN_OF_0002
     * @tc.name      NdkNotification_NapiBooleanOf_0002
     * @tc.desc      napiBooleanOf(nativeEnabled=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_NapiBooleanOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NapiBooleanOf_0002 begin`);
      const actual: boolean = napiBooleanOf(false);
      logInfo(`napiBooleanOf(nativeEnabled=false): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NapiBooleanOf_0002 end`);
    });
  });
}
