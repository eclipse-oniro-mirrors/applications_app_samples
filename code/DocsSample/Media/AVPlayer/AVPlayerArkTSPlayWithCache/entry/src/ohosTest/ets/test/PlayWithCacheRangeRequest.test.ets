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

const TAG: string = '[Sample_playWithCacheRangeRequest]';
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

export default function playWithCacheRangeRequestTest(): void {
  describe('playWithCacheRangeRequestTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0001
     * @tc.name      testExtCacheRange0000
     * @tc.desc      Cache range 0+1 -> bytes=0-0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-0');
      expect(end).assertEqual(0);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0002
     * @tc.name      testExtCacheRange0001
     * @tc.desc      Cache range 1+1 -> bytes=1-1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-1');
      expect(end).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0003
     * @tc.name      testExtCacheRange0002
     * @tc.desc      Cache range 1023+512 -> bytes=1023-1534.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1023;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1023-1534');
      expect(end).assertEqual(1534);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0004
     * @tc.name      testExtCacheRange0003
     * @tc.desc      Cache range 4096+512 -> bytes=4096-4607.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=4096-4607');
      expect(end).assertEqual(4607);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0005
     * @tc.name      testExtCacheRange0004
     * @tc.desc      Cache range 65535+1024 -> bytes=65535-66558.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65535;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=65535-66558');
      expect(end).assertEqual(66558);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0006
     * @tc.name      testExtCacheRange0005
     * @tc.desc      Cache range 1048576+1024 -> bytes=1048576-1049599.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1048576;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1048576-1049599');
      expect(end).assertEqual(1049599);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0007
     * @tc.name      testExtCacheRange0006
     * @tc.desc      Cache range 0+4096 -> bytes=0-4095.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-4095');
      expect(end).assertEqual(4095);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0008
     * @tc.name      testExtCacheRange0007
     * @tc.desc      Cache range 1+4096 -> bytes=1-4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-4096');
      expect(end).assertEqual(4096);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0009
     * @tc.name      testExtCacheRange0008
     * @tc.desc      Cache range 1023+8192 -> bytes=1023-9214.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1023;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1023-9214');
      expect(end).assertEqual(9214);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0010
     * @tc.name      testExtCacheRange0009
     * @tc.desc      Cache range 4096+8192 -> bytes=4096-12287.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=4096-12287');
      expect(end).assertEqual(12287);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0011
     * @tc.name      testExtCacheRange0010
     * @tc.desc      Cache range 65535+16384 -> bytes=65535-81918.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65535;
      const length: number = 16384;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=65535-81918');
      expect(end).assertEqual(81918);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0012
     * @tc.name      testExtCacheRange0011
     * @tc.desc      Cache range 1048576+16384 -> bytes=1048576-1064959.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1048576;
      const length: number = 16384;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1048576-1064959');
      expect(end).assertEqual(1064959);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0013
     * @tc.name      testExtCacheRange0012
     * @tc.desc      Cache range 0+1 -> bytes=0-0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-0');
      expect(end).assertEqual(0);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0014
     * @tc.name      testExtCacheRange0013
     * @tc.desc      Cache range 1+1 -> bytes=1-1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-1');
      expect(end).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0015
     * @tc.name      testExtCacheRange0014
     * @tc.desc      Cache range 1023+512 -> bytes=1023-1534.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1023;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1023-1534');
      expect(end).assertEqual(1534);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0016
     * @tc.name      testExtCacheRange0015
     * @tc.desc      Cache range 4096+512 -> bytes=4096-4607.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=4096-4607');
      expect(end).assertEqual(4607);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0017
     * @tc.name      testExtCacheRange0016
     * @tc.desc      Cache range 65535+1024 -> bytes=65535-66558.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65535;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=65535-66558');
      expect(end).assertEqual(66558);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0018
     * @tc.name      testExtCacheRange0017
     * @tc.desc      Cache range 1048576+1024 -> bytes=1048576-1049599.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1048576;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1048576-1049599');
      expect(end).assertEqual(1049599);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0019
     * @tc.name      testExtCacheRange0018
     * @tc.desc      Cache range 0+4096 -> bytes=0-4095.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-4095');
      expect(end).assertEqual(4095);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0020
     * @tc.name      testExtCacheRange0019
     * @tc.desc      Cache range 1+4096 -> bytes=1-4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-4096');
      expect(end).assertEqual(4096);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0021
     * @tc.name      testExtCacheRange0020
     * @tc.desc      Cache range 1023+8192 -> bytes=1023-9214.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1023;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1023-9214');
      expect(end).assertEqual(9214);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0022
     * @tc.name      testExtCacheRange0021
     * @tc.desc      Cache range 4096+8192 -> bytes=4096-12287.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=4096-12287');
      expect(end).assertEqual(12287);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0023
     * @tc.name      testExtCacheRange0022
     * @tc.desc      Cache range 65535+16384 -> bytes=65535-81918.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65535;
      const length: number = 16384;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=65535-81918');
      expect(end).assertEqual(81918);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0024
     * @tc.name      testExtCacheRange0023
     * @tc.desc      Cache range 1048576+16384 -> bytes=1048576-1064959.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1048576;
      const length: number = 16384;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1048576-1064959');
      expect(end).assertEqual(1064959);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0025
     * @tc.name      testExtCacheRange0024
     * @tc.desc      Cache range 0+1 -> bytes=0-0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-0');
      expect(end).assertEqual(0);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0026
     * @tc.name      testExtCacheRange0025
     * @tc.desc      Cache range 1+1 -> bytes=1-1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-1');
      expect(end).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0027
     * @tc.name      testExtCacheRange0026
     * @tc.desc      Cache range 1023+512 -> bytes=1023-1534.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1023;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1023-1534');
      expect(end).assertEqual(1534);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0028
     * @tc.name      testExtCacheRange0027
     * @tc.desc      Cache range 4096+512 -> bytes=4096-4607.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=4096-4607');
      expect(end).assertEqual(4607);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0029
     * @tc.name      testExtCacheRange0028
     * @tc.desc      Cache range 65535+1024 -> bytes=65535-66558.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65535;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=65535-66558');
      expect(end).assertEqual(66558);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0030
     * @tc.name      testExtCacheRange0029
     * @tc.desc      Cache range 1048576+1024 -> bytes=1048576-1049599.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1048576;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1048576-1049599');
      expect(end).assertEqual(1049599);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0031
     * @tc.name      testExtCacheRange0030
     * @tc.desc      Cache range 0+4096 -> bytes=0-4095.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-4095');
      expect(end).assertEqual(4095);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0032
     * @tc.name      testExtCacheRange0031
     * @tc.desc      Cache range 1+4096 -> bytes=1-4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-4096');
      expect(end).assertEqual(4096);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0033
     * @tc.name      testExtCacheRange0032
     * @tc.desc      Cache range 1023+8192 -> bytes=1023-9214.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1023;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1023-9214');
      expect(end).assertEqual(9214);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0034
     * @tc.name      testExtCacheRange0033
     * @tc.desc      Cache range 4096+8192 -> bytes=4096-12287.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=4096-12287');
      expect(end).assertEqual(12287);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0035
     * @tc.name      testExtCacheRange0034
     * @tc.desc      Cache range 65535+16384 -> bytes=65535-81918.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65535;
      const length: number = 16384;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=65535-81918');
      expect(end).assertEqual(81918);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0036
     * @tc.name      testExtCacheRange0035
     * @tc.desc      Cache range 1048576+16384 -> bytes=1048576-1064959.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1048576;
      const length: number = 16384;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1048576-1064959');
      expect(end).assertEqual(1064959);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0037
     * @tc.name      testExtCacheRange0036
     * @tc.desc      Cache range 0+1 -> bytes=0-0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-0');
      expect(end).assertEqual(0);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0038
     * @tc.name      testExtCacheRange0037
     * @tc.desc      Cache range 1+1 -> bytes=1-1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-1');
      expect(end).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0039
     * @tc.name      testExtCacheRange0038
     * @tc.desc      Cache range 1023+512 -> bytes=1023-1534.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1023;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1023-1534');
      expect(end).assertEqual(1534);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0040
     * @tc.name      testExtCacheRange0039
     * @tc.desc      Cache range 4096+512 -> bytes=4096-4607.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=4096-4607');
      expect(end).assertEqual(4607);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0041
     * @tc.name      testExtCacheRange0040
     * @tc.desc      Cache range 65535+1024 -> bytes=65535-66558.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65535;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=65535-66558');
      expect(end).assertEqual(66558);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0042
     * @tc.name      testExtCacheRange0041
     * @tc.desc      Cache range 1048576+1024 -> bytes=1048576-1049599.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1048576;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1048576-1049599');
      expect(end).assertEqual(1049599);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0043
     * @tc.name      testExtCacheRange0042
     * @tc.desc      Cache range 0+4096 -> bytes=0-4095.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-4095');
      expect(end).assertEqual(4095);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0044
     * @tc.name      testExtCacheRange0043
     * @tc.desc      Cache range 1+4096 -> bytes=1-4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-4096');
      expect(end).assertEqual(4096);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0045
     * @tc.name      testExtCacheRange0044
     * @tc.desc      Cache range 1023+8192 -> bytes=1023-9214.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1023;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1023-9214');
      expect(end).assertEqual(9214);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0046
     * @tc.name      testExtCacheRange0045
     * @tc.desc      Cache range 4096+8192 -> bytes=4096-12287.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=4096-12287');
      expect(end).assertEqual(12287);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0047
     * @tc.name      testExtCacheRange0046
     * @tc.desc      Cache range 65535+16384 -> bytes=65535-81918.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65535;
      const length: number = 16384;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=65535-81918');
      expect(end).assertEqual(81918);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0048
     * @tc.name      testExtCacheRange0047
     * @tc.desc      Cache range 1048576+16384 -> bytes=1048576-1064959.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1048576;
      const length: number = 16384;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1048576-1064959');
      expect(end).assertEqual(1064959);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0049
     * @tc.name      testExtCacheRange0048
     * @tc.desc      Cache range 0+1 -> bytes=0-0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-0');
      expect(end).assertEqual(0);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0050
     * @tc.name      testExtCacheRange0049
     * @tc.desc      Cache range 1+1 -> bytes=1-1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-1');
      expect(end).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0051
     * @tc.name      testExtCacheRange0050
     * @tc.desc      Cache range 1023+512 -> bytes=1023-1534.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1023;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1023-1534');
      expect(end).assertEqual(1534);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0052
     * @tc.name      testExtCacheRange0051
     * @tc.desc      Cache range 4096+512 -> bytes=4096-4607.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=4096-4607');
      expect(end).assertEqual(4607);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0053
     * @tc.name      testExtCacheRange0052
     * @tc.desc      Cache range 65535+1024 -> bytes=65535-66558.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65535;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=65535-66558');
      expect(end).assertEqual(66558);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0054
     * @tc.name      testExtCacheRange0053
     * @tc.desc      Cache range 1048576+1024 -> bytes=1048576-1049599.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1048576;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1048576-1049599');
      expect(end).assertEqual(1049599);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0055
     * @tc.name      testExtCacheRange0054
     * @tc.desc      Cache range 0+4096 -> bytes=0-4095.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-4095');
      expect(end).assertEqual(4095);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0056
     * @tc.name      testExtCacheRange0055
     * @tc.desc      Cache range 1+4096 -> bytes=1-4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-4096');
      expect(end).assertEqual(4096);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0057
     * @tc.name      testExtCacheRange0056
     * @tc.desc      Cache range 1023+8192 -> bytes=1023-9214.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1023;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1023-9214');
      expect(end).assertEqual(9214);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0058
     * @tc.name      testExtCacheRange0057
     * @tc.desc      Cache range 4096+8192 -> bytes=4096-12287.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=4096-12287');
      expect(end).assertEqual(12287);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0059
     * @tc.name      testExtCacheRange0058
     * @tc.desc      Cache range 65535+16384 -> bytes=65535-81918.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65535;
      const length: number = 16384;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=65535-81918');
      expect(end).assertEqual(81918);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0060
     * @tc.name      testExtCacheRange0059
     * @tc.desc      Cache range 1048576+16384 -> bytes=1048576-1064959.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1048576;
      const length: number = 16384;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1048576-1064959');
      expect(end).assertEqual(1064959);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0061
     * @tc.name      testExtCacheRange0060
     * @tc.desc      Cache range 0+1 -> bytes=0-0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-0');
      expect(end).assertEqual(0);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0062
     * @tc.name      testExtCacheRange0061
     * @tc.desc      Cache range 1+1 -> bytes=1-1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-1');
      expect(end).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0063
     * @tc.name      testExtCacheRange0062
     * @tc.desc      Cache range 1023+512 -> bytes=1023-1534.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1023;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1023-1534');
      expect(end).assertEqual(1534);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0064
     * @tc.name      testExtCacheRange0063
     * @tc.desc      Cache range 4096+512 -> bytes=4096-4607.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=4096-4607');
      expect(end).assertEqual(4607);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0065
     * @tc.name      testExtCacheRange0064
     * @tc.desc      Cache range 65535+1024 -> bytes=65535-66558.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65535;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=65535-66558');
      expect(end).assertEqual(66558);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0066
     * @tc.name      testExtCacheRange0065
     * @tc.desc      Cache range 1048576+1024 -> bytes=1048576-1049599.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1048576;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1048576-1049599');
      expect(end).assertEqual(1049599);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0067
     * @tc.name      testExtCacheRange0066
     * @tc.desc      Cache range 0+4096 -> bytes=0-4095.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-4095');
      expect(end).assertEqual(4095);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0068
     * @tc.name      testExtCacheRange0067
     * @tc.desc      Cache range 1+4096 -> bytes=1-4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-4096');
      expect(end).assertEqual(4096);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0069
     * @tc.name      testExtCacheRange0068
     * @tc.desc      Cache range 1023+8192 -> bytes=1023-9214.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1023;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1023-9214');
      expect(end).assertEqual(9214);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0070
     * @tc.name      testExtCacheRange0069
     * @tc.desc      Cache range 4096+8192 -> bytes=4096-12287.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 8192;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=4096-12287');
      expect(end).assertEqual(12287);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0071
     * @tc.name      testExtCacheRange0070
     * @tc.desc      Cache range 65535+16384 -> bytes=65535-81918.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65535;
      const length: number = 16384;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=65535-81918');
      expect(end).assertEqual(81918);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0072
     * @tc.name      testExtCacheRange0071
     * @tc.desc      Cache range 1048576+16384 -> bytes=1048576-1064959.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1048576;
      const length: number = 16384;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1048576-1064959');
      expect(end).assertEqual(1064959);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0073
     * @tc.name      testExtCacheRange0072
     * @tc.desc      Cache range 0+1 -> bytes=0-0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-0');
      expect(end).assertEqual(0);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0074
     * @tc.name      testExtCacheRange0073
     * @tc.desc      Cache range 1+1 -> bytes=1-1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 1;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-1');
      expect(end).assertEqual(1);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0075
     * @tc.name      testExtCacheRange0074
     * @tc.desc      Cache range 1023+512 -> bytes=1023-1534.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1023;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1023-1534');
      expect(end).assertEqual(1534);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0076
     * @tc.name      testExtCacheRange0075
     * @tc.desc      Cache range 4096+512 -> bytes=4096-4607.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=4096-4607');
      expect(end).assertEqual(4607);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0077
     * @tc.name      testExtCacheRange0076
     * @tc.desc      Cache range 65535+1024 -> bytes=65535-66558.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65535;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=65535-66558');
      expect(end).assertEqual(66558);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0078
     * @tc.name      testExtCacheRange0077
     * @tc.desc      Cache range 1048576+1024 -> bytes=1048576-1049599.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1048576;
      const length: number = 1024;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 206;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1048576-1049599');
      expect(end).assertEqual(1049599);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0079
     * @tc.name      testExtCacheRange0078
     * @tc.desc      Cache range 0+4096 -> bytes=0-4095.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 200;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=0-4095');
      expect(end).assertEqual(4095);
      expect(accepted).assertEqual(true);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RANGE_0080
     * @tc.name      testExtCacheRange0079
     * @tc.desc      Cache range 1+4096 -> bytes=1-4096.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRange0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1;
      const length: number = 4096;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      const responseCode: number = 404;
      const accepted: boolean = responseCode === 200 || responseCode === 206;
      expect(header).assertEqual('bytes=1-4096');
      expect(end).assertEqual(4096);
      expect(accepted).assertEqual(false);
      expect(length).assertLarger(0);
    })
  });
}
