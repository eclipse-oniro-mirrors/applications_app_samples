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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function dlpApiReadOnlyTestPart02() {
  describe('DlpApiReadOnlyPart02', () => {
    /**
     * @tc.name   testDlpReadOnly0114
     * @tc.number SUB_DLP_C_API_READONLY_0114
     * @tc.desc   Verify IsInSandbox single read 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0114 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0114 end');
    })
    /**
     * @tc.name   testDlpReadOnly0115
     * @tc.number SUB_DLP_C_API_READONLY_0115
     * @tc.desc   Verify IsInSandbox single read 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0115 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0115 end');
    })
    /**
     * @tc.name   testDlpReadOnly0116
     * @tc.number SUB_DLP_C_API_READONLY_0116
     * @tc.desc   Verify IsInSandbox single read 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0116 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0116 end');
    })
    /**
     * @tc.name   testDlpReadOnly0117
     * @tc.number SUB_DLP_C_API_READONLY_0117
     * @tc.desc   Verify IsInSandbox single read 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0117 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0117 end');
    })
    /**
     * @tc.name   testDlpReadOnly0118
     * @tc.number SUB_DLP_C_API_READONLY_0118
     * @tc.desc   Verify IsInSandbox single read 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0118 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0118 end');
    })
    /**
     * @tc.name   testDlpReadOnly0119
     * @tc.number SUB_DLP_C_API_READONLY_0119
     * @tc.desc   Verify IsInSandbox single read 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0119 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0119 end');
    })
    /**
     * @tc.name   testDlpReadOnly0120
     * @tc.number SUB_DLP_C_API_READONLY_0120
     * @tc.desc   Verify IsInSandbox single read 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0120 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0120 end');
    })
  })
}
