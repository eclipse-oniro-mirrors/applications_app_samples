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
import { proxyCountOf } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for proxyCountOf (2 cases). */
export default function proxyCountOfTest(): void {
  describe('ProxyCountOfTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_COUNT_OF_0001
     * @tc.name      RequestAddForm_ProxyCountOf_0001
     * @tc.desc      proxyCountOf(isArkTsCard=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_ProxyCountOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProxyCountOf_0001 begin`);
      const actual: number = proxyCountOf(true);
      logInfo(`proxyCountOf(isArkTsCard=true): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProxyCountOf_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_COUNT_OF_0002
     * @tc.name      RequestAddForm_ProxyCountOf_0002
     * @tc.desc      proxyCountOf(isArkTsCard=false) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_ProxyCountOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProxyCountOf_0002 begin`);
      const actual: number = proxyCountOf(false);
      logInfo(`proxyCountOf(isArkTsCard=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProxyCountOf_0002 end`);
    });
  });
}
