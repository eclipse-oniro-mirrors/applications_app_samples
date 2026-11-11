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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeAll, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_playWithCacheNetworkError]';
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

export default function playWithCacheNetworkErrorTest(): void {
  describe('playWithCacheNetworkErrorTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0001
     * @tc.name      testExtCacheNetwork0000
     * @tc.desc      HTTP 200 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 200;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0002
     * @tc.name      testExtCacheNetwork0001
     * @tc.desc      HTTP 206 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 206;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0003
     * @tc.name      testExtCacheNetwork0002
     * @tc.desc      HTTP 301 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 301;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0004
     * @tc.name      testExtCacheNetwork0003
     * @tc.desc      HTTP 404 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 404;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0005
     * @tc.name      testExtCacheNetwork0004
     * @tc.desc      HTTP 416 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 416;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0006
     * @tc.name      testExtCacheNetwork0005
     * @tc.desc      HTTP 500 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 500;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0007
     * @tc.name      testExtCacheNetwork0006
     * @tc.desc      HTTP 503 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 503;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0008
     * @tc.name      testExtCacheNetwork0007
     * @tc.desc      HTTP 200 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 200;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0009
     * @tc.name      testExtCacheNetwork0008
     * @tc.desc      HTTP 206 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 206;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0010
     * @tc.name      testExtCacheNetwork0009
     * @tc.desc      HTTP 301 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 301;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0011
     * @tc.name      testExtCacheNetwork0010
     * @tc.desc      HTTP 404 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 404;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0012
     * @tc.name      testExtCacheNetwork0011
     * @tc.desc      HTTP 416 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 416;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0013
     * @tc.name      testExtCacheNetwork0012
     * @tc.desc      HTTP 500 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 500;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0014
     * @tc.name      testExtCacheNetwork0013
     * @tc.desc      HTTP 503 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 503;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0015
     * @tc.name      testExtCacheNetwork0014
     * @tc.desc      HTTP 200 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 200;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0016
     * @tc.name      testExtCacheNetwork0015
     * @tc.desc      HTTP 206 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 206;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0017
     * @tc.name      testExtCacheNetwork0016
     * @tc.desc      HTTP 301 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 301;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0018
     * @tc.name      testExtCacheNetwork0017
     * @tc.desc      HTTP 404 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 404;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0019
     * @tc.name      testExtCacheNetwork0018
     * @tc.desc      HTTP 416 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 416;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0020
     * @tc.name      testExtCacheNetwork0019
     * @tc.desc      HTTP 500 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 500;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0021
     * @tc.name      testExtCacheNetwork0020
     * @tc.desc      HTTP 503 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 503;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0022
     * @tc.name      testExtCacheNetwork0021
     * @tc.desc      HTTP 200 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 200;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0023
     * @tc.name      testExtCacheNetwork0022
     * @tc.desc      HTTP 206 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 206;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0024
     * @tc.name      testExtCacheNetwork0023
     * @tc.desc      HTTP 301 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 301;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0025
     * @tc.name      testExtCacheNetwork0024
     * @tc.desc      HTTP 404 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 404;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0026
     * @tc.name      testExtCacheNetwork0025
     * @tc.desc      HTTP 416 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 416;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0027
     * @tc.name      testExtCacheNetwork0026
     * @tc.desc      HTTP 500 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 500;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0028
     * @tc.name      testExtCacheNetwork0027
     * @tc.desc      HTTP 503 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 503;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0029
     * @tc.name      testExtCacheNetwork0028
     * @tc.desc      HTTP 200 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 200;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0030
     * @tc.name      testExtCacheNetwork0029
     * @tc.desc      HTTP 206 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 206;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0031
     * @tc.name      testExtCacheNetwork0030
     * @tc.desc      HTTP 301 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 301;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0032
     * @tc.name      testExtCacheNetwork0031
     * @tc.desc      HTTP 404 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 404;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0033
     * @tc.name      testExtCacheNetwork0032
     * @tc.desc      HTTP 416 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 416;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0034
     * @tc.name      testExtCacheNetwork0033
     * @tc.desc      HTTP 500 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 500;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0035
     * @tc.name      testExtCacheNetwork0034
     * @tc.desc      HTTP 503 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 503;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0036
     * @tc.name      testExtCacheNetwork0035
     * @tc.desc      HTTP 200 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 200;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0037
     * @tc.name      testExtCacheNetwork0036
     * @tc.desc      HTTP 206 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 206;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0038
     * @tc.name      testExtCacheNetwork0037
     * @tc.desc      HTTP 301 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 301;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0039
     * @tc.name      testExtCacheNetwork0038
     * @tc.desc      HTTP 404 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 404;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0040
     * @tc.name      testExtCacheNetwork0039
     * @tc.desc      HTTP 416 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 416;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0041
     * @tc.name      testExtCacheNetwork0040
     * @tc.desc      HTTP 500 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 500;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0042
     * @tc.name      testExtCacheNetwork0041
     * @tc.desc      HTTP 503 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 503;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0043
     * @tc.name      testExtCacheNetwork0042
     * @tc.desc      HTTP 200 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 200;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0044
     * @tc.name      testExtCacheNetwork0043
     * @tc.desc      HTTP 206 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 206;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0045
     * @tc.name      testExtCacheNetwork0044
     * @tc.desc      HTTP 301 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 301;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0046
     * @tc.name      testExtCacheNetwork0045
     * @tc.desc      HTTP 404 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 404;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0047
     * @tc.name      testExtCacheNetwork0046
     * @tc.desc      HTTP 416 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 416;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0048
     * @tc.name      testExtCacheNetwork0047
     * @tc.desc      HTTP 500 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 500;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0049
     * @tc.name      testExtCacheNetwork0048
     * @tc.desc      HTTP 503 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 503;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0050
     * @tc.name      testExtCacheNetwork0049
     * @tc.desc      HTTP 200 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 200;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0051
     * @tc.name      testExtCacheNetwork0050
     * @tc.desc      HTTP 206 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 206;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0052
     * @tc.name      testExtCacheNetwork0051
     * @tc.desc      HTTP 301 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 301;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0053
     * @tc.name      testExtCacheNetwork0052
     * @tc.desc      HTTP 404 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 404;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0054
     * @tc.name      testExtCacheNetwork0053
     * @tc.desc      HTTP 416 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 416;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0055
     * @tc.name      testExtCacheNetwork0054
     * @tc.desc      HTTP 500 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 500;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0056
     * @tc.name      testExtCacheNetwork0055
     * @tc.desc      HTTP 503 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 503;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0057
     * @tc.name      testExtCacheNetwork0056
     * @tc.desc      HTTP 200 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 200;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0058
     * @tc.name      testExtCacheNetwork0057
     * @tc.desc      HTTP 206 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 206;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0059
     * @tc.name      testExtCacheNetwork0058
     * @tc.desc      HTTP 301 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 301;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0060
     * @tc.name      testExtCacheNetwork0059
     * @tc.desc      HTTP 404 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 404;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0061
     * @tc.name      testExtCacheNetwork0060
     * @tc.desc      HTTP 416 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 416;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0062
     * @tc.name      testExtCacheNetwork0061
     * @tc.desc      HTTP 500 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 500;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0063
     * @tc.name      testExtCacheNetwork0062
     * @tc.desc      HTTP 503 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 503;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0064
     * @tc.name      testExtCacheNetwork0063
     * @tc.desc      HTTP 200 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 200;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0065
     * @tc.name      testExtCacheNetwork0064
     * @tc.desc      HTTP 206 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 206;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0066
     * @tc.name      testExtCacheNetwork0065
     * @tc.desc      HTTP 301 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 301;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0067
     * @tc.name      testExtCacheNetwork0066
     * @tc.desc      HTTP 404 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 404;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0068
     * @tc.name      testExtCacheNetwork0067
     * @tc.desc      HTTP 416 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 416;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0069
     * @tc.name      testExtCacheNetwork0068
     * @tc.desc      HTTP 500 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 500;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0070
     * @tc.name      testExtCacheNetwork0069
     * @tc.desc      HTTP 503 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 503;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0071
     * @tc.name      testExtCacheNetwork0070
     * @tc.desc      HTTP 200 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 200;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0072
     * @tc.name      testExtCacheNetwork0071
     * @tc.desc      HTTP 206 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 206;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0073
     * @tc.name      testExtCacheNetwork0072
     * @tc.desc      HTTP 301 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 301;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0074
     * @tc.name      testExtCacheNetwork0073
     * @tc.desc      HTTP 404 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 404;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0075
     * @tc.name      testExtCacheNetwork0074
     * @tc.desc      HTTP 416 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 416;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0076
     * @tc.name      testExtCacheNetwork0075
     * @tc.desc      HTTP 500 timeout=True success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 500;
      const timeout: boolean = true;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0077
     * @tc.name      testExtCacheNetwork0076
     * @tc.desc      HTTP 503 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 503;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0078
     * @tc.name      testExtCacheNetwork0077
     * @tc.desc      HTTP 200 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 200;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 3;
      const delay: number = 800;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0079
     * @tc.name      testExtCacheNetwork0078
     * @tc.desc      HTTP 206 timeout=False success=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 206;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 1;
      const delay: number = 200;
      expect(success).assertEqual(true);
      expect(retryable).assertEqual(false);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_NET_0080
     * @tc.name      testExtCacheNetwork0079
     * @tc.desc      HTTP 301 timeout=False success=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheNetwork0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const responseCode: number = 301;
      const timeout: boolean = false;
      const success: boolean = (responseCode === 200 || responseCode === 206) && !timeout;
      const retryable: boolean = !success;
      const attempts: number = 2;
      const delay: number = 400;
      expect(success).assertEqual(false);
      expect(retryable).assertEqual(true);
      expect(attempts).assertLarger(0);
      expect(delay).assertLarger(0);
    })
  });
}
