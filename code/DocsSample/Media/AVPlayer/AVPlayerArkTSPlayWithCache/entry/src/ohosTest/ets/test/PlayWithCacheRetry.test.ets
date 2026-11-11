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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_playWithCacheRetry]';
const DOMAIN: number = 0xF813;

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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function playWithCacheRetryTest(): void {
  describe('playWithCacheRetryTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0001
     * @tc.name      testExtCacheRetry0000
     * @tc.desc      Retry 0 backoff 200ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0002
     * @tc.name      testExtCacheRetry0001
     * @tc.desc      Retry 1 backoff 400ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0003
     * @tc.name      testExtCacheRetry0002
     * @tc.desc      Retry 2 backoff 800ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0004
     * @tc.name      testExtCacheRetry0003
     * @tc.desc      Retry 3 backoff 1600ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0005
     * @tc.name      testExtCacheRetry0004
     * @tc.desc      Retry 4 backoff 3200ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0006
     * @tc.name      testExtCacheRetry0005
     * @tc.desc      Retry 5 backoff 4000ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0007
     * @tc.name      testExtCacheRetry0006
     * @tc.desc      Retry 6 backoff 4000ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0008
     * @tc.name      testExtCacheRetry0007
     * @tc.desc      Retry 7 backoff 4000ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0009
     * @tc.name      testExtCacheRetry0008
     * @tc.desc      Retry 0 backoff 200ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0010
     * @tc.name      testExtCacheRetry0009
     * @tc.desc      Retry 1 backoff 400ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0011
     * @tc.name      testExtCacheRetry0010
     * @tc.desc      Retry 2 backoff 800ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0012
     * @tc.name      testExtCacheRetry0011
     * @tc.desc      Retry 3 backoff 1600ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0013
     * @tc.name      testExtCacheRetry0012
     * @tc.desc      Retry 4 backoff 3200ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0014
     * @tc.name      testExtCacheRetry0013
     * @tc.desc      Retry 5 backoff 4000ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0015
     * @tc.name      testExtCacheRetry0014
     * @tc.desc      Retry 6 backoff 4000ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0016
     * @tc.name      testExtCacheRetry0015
     * @tc.desc      Retry 7 backoff 4000ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0017
     * @tc.name      testExtCacheRetry0016
     * @tc.desc      Retry 0 backoff 200ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0018
     * @tc.name      testExtCacheRetry0017
     * @tc.desc      Retry 1 backoff 400ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0019
     * @tc.name      testExtCacheRetry0018
     * @tc.desc      Retry 2 backoff 800ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0020
     * @tc.name      testExtCacheRetry0019
     * @tc.desc      Retry 3 backoff 1600ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0021
     * @tc.name      testExtCacheRetry0020
     * @tc.desc      Retry 4 backoff 3200ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0022
     * @tc.name      testExtCacheRetry0021
     * @tc.desc      Retry 5 backoff 4000ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0023
     * @tc.name      testExtCacheRetry0022
     * @tc.desc      Retry 6 backoff 4000ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0024
     * @tc.name      testExtCacheRetry0023
     * @tc.desc      Retry 7 backoff 4000ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0025
     * @tc.name      testExtCacheRetry0024
     * @tc.desc      Retry 0 backoff 200ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0026
     * @tc.name      testExtCacheRetry0025
     * @tc.desc      Retry 1 backoff 400ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0027
     * @tc.name      testExtCacheRetry0026
     * @tc.desc      Retry 2 backoff 800ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0028
     * @tc.name      testExtCacheRetry0027
     * @tc.desc      Retry 3 backoff 1600ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0029
     * @tc.name      testExtCacheRetry0028
     * @tc.desc      Retry 4 backoff 3200ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0030
     * @tc.name      testExtCacheRetry0029
     * @tc.desc      Retry 5 backoff 4000ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0031
     * @tc.name      testExtCacheRetry0030
     * @tc.desc      Retry 6 backoff 4000ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0032
     * @tc.name      testExtCacheRetry0031
     * @tc.desc      Retry 7 backoff 4000ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0033
     * @tc.name      testExtCacheRetry0032
     * @tc.desc      Retry 0 backoff 200ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0034
     * @tc.name      testExtCacheRetry0033
     * @tc.desc      Retry 1 backoff 400ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0035
     * @tc.name      testExtCacheRetry0034
     * @tc.desc      Retry 2 backoff 800ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0036
     * @tc.name      testExtCacheRetry0035
     * @tc.desc      Retry 3 backoff 1600ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0037
     * @tc.name      testExtCacheRetry0036
     * @tc.desc      Retry 4 backoff 3200ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0038
     * @tc.name      testExtCacheRetry0037
     * @tc.desc      Retry 5 backoff 4000ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0039
     * @tc.name      testExtCacheRetry0038
     * @tc.desc      Retry 6 backoff 4000ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0040
     * @tc.name      testExtCacheRetry0039
     * @tc.desc      Retry 7 backoff 4000ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0041
     * @tc.name      testExtCacheRetry0040
     * @tc.desc      Retry 0 backoff 200ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0042
     * @tc.name      testExtCacheRetry0041
     * @tc.desc      Retry 1 backoff 400ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0043
     * @tc.name      testExtCacheRetry0042
     * @tc.desc      Retry 2 backoff 800ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0044
     * @tc.name      testExtCacheRetry0043
     * @tc.desc      Retry 3 backoff 1600ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0045
     * @tc.name      testExtCacheRetry0044
     * @tc.desc      Retry 4 backoff 3200ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0046
     * @tc.name      testExtCacheRetry0045
     * @tc.desc      Retry 5 backoff 4000ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0047
     * @tc.name      testExtCacheRetry0046
     * @tc.desc      Retry 6 backoff 4000ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0048
     * @tc.name      testExtCacheRetry0047
     * @tc.desc      Retry 7 backoff 4000ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0049
     * @tc.name      testExtCacheRetry0048
     * @tc.desc      Retry 0 backoff 200ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0050
     * @tc.name      testExtCacheRetry0049
     * @tc.desc      Retry 1 backoff 400ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0051
     * @tc.name      testExtCacheRetry0050
     * @tc.desc      Retry 2 backoff 800ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0052
     * @tc.name      testExtCacheRetry0051
     * @tc.desc      Retry 3 backoff 1600ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0053
     * @tc.name      testExtCacheRetry0052
     * @tc.desc      Retry 4 backoff 3200ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0054
     * @tc.name      testExtCacheRetry0053
     * @tc.desc      Retry 5 backoff 4000ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0055
     * @tc.name      testExtCacheRetry0054
     * @tc.desc      Retry 6 backoff 4000ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0056
     * @tc.name      testExtCacheRetry0055
     * @tc.desc      Retry 7 backoff 4000ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0057
     * @tc.name      testExtCacheRetry0056
     * @tc.desc      Retry 0 backoff 200ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0058
     * @tc.name      testExtCacheRetry0057
     * @tc.desc      Retry 1 backoff 400ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0059
     * @tc.name      testExtCacheRetry0058
     * @tc.desc      Retry 2 backoff 800ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0060
     * @tc.name      testExtCacheRetry0059
     * @tc.desc      Retry 3 backoff 1600ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0061
     * @tc.name      testExtCacheRetry0060
     * @tc.desc      Retry 4 backoff 3200ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0062
     * @tc.name      testExtCacheRetry0061
     * @tc.desc      Retry 5 backoff 4000ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0063
     * @tc.name      testExtCacheRetry0062
     * @tc.desc      Retry 6 backoff 4000ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0064
     * @tc.name      testExtCacheRetry0063
     * @tc.desc      Retry 7 backoff 4000ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0065
     * @tc.name      testExtCacheRetry0064
     * @tc.desc      Retry 0 backoff 200ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0066
     * @tc.name      testExtCacheRetry0065
     * @tc.desc      Retry 1 backoff 400ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0067
     * @tc.name      testExtCacheRetry0066
     * @tc.desc      Retry 2 backoff 800ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0068
     * @tc.name      testExtCacheRetry0067
     * @tc.desc      Retry 3 backoff 1600ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0069
     * @tc.name      testExtCacheRetry0068
     * @tc.desc      Retry 4 backoff 3200ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0070
     * @tc.name      testExtCacheRetry0069
     * @tc.desc      Retry 5 backoff 4000ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0071
     * @tc.name      testExtCacheRetry0070
     * @tc.desc      Retry 6 backoff 4000ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0072
     * @tc.name      testExtCacheRetry0071
     * @tc.desc      Retry 7 backoff 4000ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0073
     * @tc.name      testExtCacheRetry0072
     * @tc.desc      Retry 0 backoff 200ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 0;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(200);
      expect(attempts).assertEqual(1);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0074
     * @tc.name      testExtCacheRetry0073
     * @tc.desc      Retry 1 backoff 400ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 1;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(400);
      expect(attempts).assertEqual(2);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0075
     * @tc.name      testExtCacheRetry0074
     * @tc.desc      Retry 2 backoff 800ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 2;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(800);
      expect(attempts).assertEqual(3);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0076
     * @tc.name      testExtCacheRetry0075
     * @tc.desc      Retry 3 backoff 1600ms response 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 3;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(1600);
      expect(attempts).assertEqual(4);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0077
     * @tc.name      testExtCacheRetry0076
     * @tc.desc      Retry 4 backoff 3200ms response 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 4;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(3200);
      expect(attempts).assertEqual(5);
      expect(accepted).assertEqual(true);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0078
     * @tc.name      testExtCacheRetry0077
     * @tc.desc      Retry 5 backoff 4000ms response 404.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 5;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(6);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0079
     * @tc.name      testExtCacheRetry0078
     * @tc.desc      Retry 6 backoff 4000ms response 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 6;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 500;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(7);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RETRY_0080
     * @tc.name      testExtCacheRetry0079
     * @tc.desc      Retry 7 backoff 4000ms response 416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRetry0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const retryIndex: number = 7;
      const delay: number = Math.min(200 * Math.pow(2, retryIndex), 4000);
      const attempts: number = retryIndex + 1;
      const responseCode: number = 416;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(delay).assertEqual(4000);
      expect(attempts).assertEqual(8);
      expect(accepted).assertEqual(false);
      expect(delay).assertLarger(0);
    })
  });
}
