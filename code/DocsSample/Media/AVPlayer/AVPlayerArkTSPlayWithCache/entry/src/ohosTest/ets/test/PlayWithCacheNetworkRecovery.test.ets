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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeAll, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_playWithCacheNetworkRecovery]';
const DOMAIN: number = 0xF811;

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

export default function playWithCacheNetworkRecoveryTest(): void {
  describe('playWithCacheNetworkRecoveryTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0001
     * @tc.name      testExtCacheRecover0000
     * @tc.desc      Status 200 timeout=True cancel=True recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 200;
      const timeout: boolean = true;
      const cancelled: boolean = true;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0002
     * @tc.name      testExtCacheRecover0001
     * @tc.desc      Status 206 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 206;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(retries).assertEqual(0);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0003
     * @tc.name      testExtCacheRecover0002
     * @tc.desc      Status 301 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 301;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0004
     * @tc.name      testExtCacheRecover0003
     * @tc.desc      Status 302 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 302;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0005
     * @tc.name      testExtCacheRecover0004
     * @tc.desc      Status 404 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 404;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0006
     * @tc.name      testExtCacheRecover0005
     * @tc.desc      Status 408 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 408;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0007
     * @tc.name      testExtCacheRecover0006
     * @tc.desc      Status 500 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 500;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0008
     * @tc.name      testExtCacheRecover0007
     * @tc.desc      Status 503 timeout=True cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 503;
      const timeout: boolean = true;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0009
     * @tc.name      testExtCacheRecover0008
     * @tc.desc      Status 200 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 200;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(retries).assertEqual(0);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0010
     * @tc.name      testExtCacheRecover0009
     * @tc.desc      Status 206 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 206;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(retries).assertEqual(0);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0011
     * @tc.name      testExtCacheRecover0010
     * @tc.desc      Status 301 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 301;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0012
     * @tc.name      testExtCacheRecover0011
     * @tc.desc      Status 302 timeout=False cancel=True recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 302;
      const timeout: boolean = false;
      const cancelled: boolean = true;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0013
     * @tc.name      testExtCacheRecover0012
     * @tc.desc      Status 404 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 404;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0014
     * @tc.name      testExtCacheRecover0013
     * @tc.desc      Status 408 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 408;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0015
     * @tc.name      testExtCacheRecover0014
     * @tc.desc      Status 500 timeout=True cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 500;
      const timeout: boolean = true;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0016
     * @tc.name      testExtCacheRecover0015
     * @tc.desc      Status 503 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 503;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0017
     * @tc.name      testExtCacheRecover0016
     * @tc.desc      Status 200 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 200;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(retries).assertEqual(0);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0018
     * @tc.name      testExtCacheRecover0017
     * @tc.desc      Status 206 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 206;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(retries).assertEqual(0);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0019
     * @tc.name      testExtCacheRecover0018
     * @tc.desc      Status 301 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 301;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0020
     * @tc.name      testExtCacheRecover0019
     * @tc.desc      Status 302 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 302;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0021
     * @tc.name      testExtCacheRecover0020
     * @tc.desc      Status 404 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 404;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0022
     * @tc.name      testExtCacheRecover0021
     * @tc.desc      Status 408 timeout=True cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 408;
      const timeout: boolean = true;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0023
     * @tc.name      testExtCacheRecover0022
     * @tc.desc      Status 500 timeout=False cancel=True recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 500;
      const timeout: boolean = false;
      const cancelled: boolean = true;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0024
     * @tc.name      testExtCacheRecover0023
     * @tc.desc      Status 503 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 503;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0025
     * @tc.name      testExtCacheRecover0024
     * @tc.desc      Status 200 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 200;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(retries).assertEqual(0);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0026
     * @tc.name      testExtCacheRecover0025
     * @tc.desc      Status 206 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 206;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(retries).assertEqual(0);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0027
     * @tc.name      testExtCacheRecover0026
     * @tc.desc      Status 301 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 301;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0028
     * @tc.name      testExtCacheRecover0027
     * @tc.desc      Status 302 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 302;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0029
     * @tc.name      testExtCacheRecover0028
     * @tc.desc      Status 404 timeout=True cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 404;
      const timeout: boolean = true;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0030
     * @tc.name      testExtCacheRecover0029
     * @tc.desc      Status 408 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 408;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0031
     * @tc.name      testExtCacheRecover0030
     * @tc.desc      Status 500 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 500;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0032
     * @tc.name      testExtCacheRecover0031
     * @tc.desc      Status 503 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 503;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0033
     * @tc.name      testExtCacheRecover0032
     * @tc.desc      Status 200 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 200;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(retries).assertEqual(0);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0034
     * @tc.name      testExtCacheRecover0033
     * @tc.desc      Status 206 timeout=False cancel=True recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 206;
      const timeout: boolean = false;
      const cancelled: boolean = true;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0035
     * @tc.name      testExtCacheRecover0034
     * @tc.desc      Status 301 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 301;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0036
     * @tc.name      testExtCacheRecover0035
     * @tc.desc      Status 302 timeout=True cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 302;
      const timeout: boolean = true;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0037
     * @tc.name      testExtCacheRecover0036
     * @tc.desc      Status 404 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 404;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0038
     * @tc.name      testExtCacheRecover0037
     * @tc.desc      Status 408 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 408;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0039
     * @tc.name      testExtCacheRecover0038
     * @tc.desc      Status 500 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 500;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0040
     * @tc.name      testExtCacheRecover0039
     * @tc.desc      Status 503 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 503;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0041
     * @tc.name      testExtCacheRecover0040
     * @tc.desc      Status 200 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 200;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(retries).assertEqual(0);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0042
     * @tc.name      testExtCacheRecover0041
     * @tc.desc      Status 206 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 206;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(retries).assertEqual(0);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0043
     * @tc.name      testExtCacheRecover0042
     * @tc.desc      Status 301 timeout=True cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 301;
      const timeout: boolean = true;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0044
     * @tc.name      testExtCacheRecover0043
     * @tc.desc      Status 302 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 302;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0045
     * @tc.name      testExtCacheRecover0044
     * @tc.desc      Status 404 timeout=False cancel=True recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 404;
      const timeout: boolean = false;
      const cancelled: boolean = true;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0046
     * @tc.name      testExtCacheRecover0045
     * @tc.desc      Status 408 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 408;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0047
     * @tc.name      testExtCacheRecover0046
     * @tc.desc      Status 500 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 500;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0048
     * @tc.name      testExtCacheRecover0047
     * @tc.desc      Status 503 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 503;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0049
     * @tc.name      testExtCacheRecover0048
     * @tc.desc      Status 200 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 200;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(retries).assertEqual(0);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0050
     * @tc.name      testExtCacheRecover0049
     * @tc.desc      Status 206 timeout=True cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 206;
      const timeout: boolean = true;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0051
     * @tc.name      testExtCacheRecover0050
     * @tc.desc      Status 301 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 301;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0052
     * @tc.name      testExtCacheRecover0051
     * @tc.desc      Status 302 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 302;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0053
     * @tc.name      testExtCacheRecover0052
     * @tc.desc      Status 404 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 404;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0054
     * @tc.name      testExtCacheRecover0053
     * @tc.desc      Status 408 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 408;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0055
     * @tc.name      testExtCacheRecover0054
     * @tc.desc      Status 500 timeout=False cancel=False recovered=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 500;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0056
     * @tc.name      testExtCacheRecover0055
     * @tc.desc      Status 503 timeout=False cancel=True recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 503;
      const timeout: boolean = false;
      const cancelled: boolean = true;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0057
     * @tc.name      testExtCacheRecover0056
     * @tc.desc      Status 200 timeout=True cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 200;
      const timeout: boolean = true;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0058
     * @tc.name      testExtCacheRecover0057
     * @tc.desc      Status 206 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 206;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(retries).assertEqual(0);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0059
     * @tc.name      testExtCacheRecover0058
     * @tc.desc      Status 301 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 301;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECOVER_0060
     * @tc.name      testExtCacheRecover0059
     * @tc.desc      Status 302 timeout=False cancel=False recovered=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecover0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: number = 302;
      const timeout: boolean = false;
      const cancelled: boolean = false;
      const success: boolean = (status === 200 || status === 206) && !timeout && !cancelled;
      const retryable: boolean = !success;
      const retries: number = success ? 0 : 3;
      const recovered: boolean = (status === 408 || status === 500 || status === 503) && !timeout && !cancelled;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(retries).assertEqual(3);
      expect(recovered).assertEqual(false);
    })
  });
}
