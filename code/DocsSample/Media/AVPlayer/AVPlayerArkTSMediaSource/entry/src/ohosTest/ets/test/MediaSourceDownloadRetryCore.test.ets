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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_mediaSourceDownloadRetryCore]';
const DOMAIN: number = 0xF812;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceDownloadRetryCoreTest(): void {
  describe('mediaSourceDownloadRetryCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0001
     * @tc.name      testExtRetry0000
     * @tc.desc      Retry 0 waits 100ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(100);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0002
     * @tc.name      testExtRetry0001
     * @tc.desc      Retry 1 waits 200ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0003
     * @tc.name      testExtRetry0002
     * @tc.desc      Retry 2 waits 400ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0004
     * @tc.name      testExtRetry0003
     * @tc.desc      Retry 3 waits 800ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0005
     * @tc.name      testExtRetry0004
     * @tc.desc      Retry 4 waits 1600ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0006
     * @tc.name      testExtRetry0005
     * @tc.desc      Retry 5 waits 3200ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0007
     * @tc.name      testExtRetry0006
     * @tc.desc      Retry 6 waits 5000ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0008
     * @tc.name      testExtRetry0007
     * @tc.desc      Retry 7 waits 5000ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0009
     * @tc.name      testExtRetry0008
     * @tc.desc      Retry 8 waits 5000ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 8;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(9);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0010
     * @tc.name      testExtRetry0009
     * @tc.desc      Retry 9 waits 5000ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 9;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(10);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0011
     * @tc.name      testExtRetry0010
     * @tc.desc      Retry 0 waits 100ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(100);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0012
     * @tc.name      testExtRetry0011
     * @tc.desc      Retry 1 waits 200ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0013
     * @tc.name      testExtRetry0012
     * @tc.desc      Retry 2 waits 400ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0014
     * @tc.name      testExtRetry0013
     * @tc.desc      Retry 3 waits 800ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0015
     * @tc.name      testExtRetry0014
     * @tc.desc      Retry 4 waits 1600ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0016
     * @tc.name      testExtRetry0015
     * @tc.desc      Retry 5 waits 3200ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0017
     * @tc.name      testExtRetry0016
     * @tc.desc      Retry 6 waits 5000ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0018
     * @tc.name      testExtRetry0017
     * @tc.desc      Retry 7 waits 5000ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0019
     * @tc.name      testExtRetry0018
     * @tc.desc      Retry 8 waits 5000ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 8;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(9);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0020
     * @tc.name      testExtRetry0019
     * @tc.desc      Retry 9 waits 5000ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 9;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(10);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0021
     * @tc.name      testExtRetry0020
     * @tc.desc      Retry 0 waits 100ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(100);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0022
     * @tc.name      testExtRetry0021
     * @tc.desc      Retry 1 waits 200ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0023
     * @tc.name      testExtRetry0022
     * @tc.desc      Retry 2 waits 400ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0024
     * @tc.name      testExtRetry0023
     * @tc.desc      Retry 3 waits 800ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0025
     * @tc.name      testExtRetry0024
     * @tc.desc      Retry 4 waits 1600ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0026
     * @tc.name      testExtRetry0025
     * @tc.desc      Retry 5 waits 3200ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0027
     * @tc.name      testExtRetry0026
     * @tc.desc      Retry 6 waits 5000ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0028
     * @tc.name      testExtRetry0027
     * @tc.desc      Retry 7 waits 5000ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0029
     * @tc.name      testExtRetry0028
     * @tc.desc      Retry 8 waits 5000ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 8;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(9);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0030
     * @tc.name      testExtRetry0029
     * @tc.desc      Retry 9 waits 5000ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 9;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(10);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0031
     * @tc.name      testExtRetry0030
     * @tc.desc      Retry 0 waits 100ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(100);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0032
     * @tc.name      testExtRetry0031
     * @tc.desc      Retry 1 waits 200ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0033
     * @tc.name      testExtRetry0032
     * @tc.desc      Retry 2 waits 400ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0034
     * @tc.name      testExtRetry0033
     * @tc.desc      Retry 3 waits 800ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0035
     * @tc.name      testExtRetry0034
     * @tc.desc      Retry 4 waits 1600ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0036
     * @tc.name      testExtRetry0035
     * @tc.desc      Retry 5 waits 3200ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0037
     * @tc.name      testExtRetry0036
     * @tc.desc      Retry 6 waits 5000ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0038
     * @tc.name      testExtRetry0037
     * @tc.desc      Retry 7 waits 5000ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0039
     * @tc.name      testExtRetry0038
     * @tc.desc      Retry 8 waits 5000ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 8;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(9);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0040
     * @tc.name      testExtRetry0039
     * @tc.desc      Retry 9 waits 5000ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 9;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(10);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0041
     * @tc.name      testExtRetry0040
     * @tc.desc      Retry 0 waits 100ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(100);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0042
     * @tc.name      testExtRetry0041
     * @tc.desc      Retry 1 waits 200ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0043
     * @tc.name      testExtRetry0042
     * @tc.desc      Retry 2 waits 400ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0044
     * @tc.name      testExtRetry0043
     * @tc.desc      Retry 3 waits 800ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0045
     * @tc.name      testExtRetry0044
     * @tc.desc      Retry 4 waits 1600ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0046
     * @tc.name      testExtRetry0045
     * @tc.desc      Retry 5 waits 3200ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0047
     * @tc.name      testExtRetry0046
     * @tc.desc      Retry 6 waits 5000ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0048
     * @tc.name      testExtRetry0047
     * @tc.desc      Retry 7 waits 5000ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0049
     * @tc.name      testExtRetry0048
     * @tc.desc      Retry 8 waits 5000ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 8;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(9);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0050
     * @tc.name      testExtRetry0049
     * @tc.desc      Retry 9 waits 5000ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 9;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(10);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0051
     * @tc.name      testExtRetry0050
     * @tc.desc      Retry 0 waits 100ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(100);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0052
     * @tc.name      testExtRetry0051
     * @tc.desc      Retry 1 waits 200ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0053
     * @tc.name      testExtRetry0052
     * @tc.desc      Retry 2 waits 400ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0054
     * @tc.name      testExtRetry0053
     * @tc.desc      Retry 3 waits 800ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0055
     * @tc.name      testExtRetry0054
     * @tc.desc      Retry 4 waits 1600ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0056
     * @tc.name      testExtRetry0055
     * @tc.desc      Retry 5 waits 3200ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0057
     * @tc.name      testExtRetry0056
     * @tc.desc      Retry 6 waits 5000ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0058
     * @tc.name      testExtRetry0057
     * @tc.desc      Retry 7 waits 5000ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0059
     * @tc.name      testExtRetry0058
     * @tc.desc      Retry 8 waits 5000ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 8;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(9);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0060
     * @tc.name      testExtRetry0059
     * @tc.desc      Retry 9 waits 5000ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 9;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(10);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0061
     * @tc.name      testExtRetry0060
     * @tc.desc      Retry 0 waits 100ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(100);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0062
     * @tc.name      testExtRetry0061
     * @tc.desc      Retry 1 waits 200ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0063
     * @tc.name      testExtRetry0062
     * @tc.desc      Retry 2 waits 400ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0064
     * @tc.name      testExtRetry0063
     * @tc.desc      Retry 3 waits 800ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0065
     * @tc.name      testExtRetry0064
     * @tc.desc      Retry 4 waits 1600ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0066
     * @tc.name      testExtRetry0065
     * @tc.desc      Retry 5 waits 3200ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0067
     * @tc.name      testExtRetry0066
     * @tc.desc      Retry 6 waits 5000ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0068
     * @tc.name      testExtRetry0067
     * @tc.desc      Retry 7 waits 5000ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0069
     * @tc.name      testExtRetry0068
     * @tc.desc      Retry 8 waits 5000ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 8;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(9);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0070
     * @tc.name      testExtRetry0069
     * @tc.desc      Retry 9 waits 5000ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 9;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(10);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0071
     * @tc.name      testExtRetry0070
     * @tc.desc      Retry 0 waits 100ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(100);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0072
     * @tc.name      testExtRetry0071
     * @tc.desc      Retry 1 waits 200ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0073
     * @tc.name      testExtRetry0072
     * @tc.desc      Retry 2 waits 400ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0074
     * @tc.name      testExtRetry0073
     * @tc.desc      Retry 3 waits 800ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0075
     * @tc.name      testExtRetry0074
     * @tc.desc      Retry 4 waits 1600ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0076
     * @tc.name      testExtRetry0075
     * @tc.desc      Retry 5 waits 3200ms, response 200 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0077
     * @tc.name      testExtRetry0076
     * @tc.desc      Retry 6 waits 5000ms, response 206 accepted=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0078
     * @tc.name      testExtRetry0077
     * @tc.desc      Retry 7 waits 5000ms, response 404 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0079
     * @tc.name      testExtRetry0078
     * @tc.desc      Retry 8 waits 5000ms, response 500 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 8;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(9);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RETRY_0080
     * @tc.name      testExtRetry0079
     * @tc.desc      Retry 9 waits 5000ms, response 416 accepted=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRetry0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 9;
      const delay: number = Math.min(100 * Math.pow(2, retryIndex), 5000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(5000);
      expect(attempts).assertEqual(10);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
      expect(attempts).assertLarger(0);
    })
  });
}
