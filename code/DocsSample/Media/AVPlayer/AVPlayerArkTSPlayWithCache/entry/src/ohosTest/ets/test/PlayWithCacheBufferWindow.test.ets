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

const TAG: string = '[Sample_playWithCacheBufferWindow]';
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

export default function playWithCacheBufferWindowTest(): void {
  describe('playWithCacheBufferWindowTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0001
     * @tc.name      testExtCacheBuffer0000
     * @tc.desc      Buffer 0-20 contains 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 0;
      const end: number = start + preferredBufferDuration;
      const time: number = 0;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0002
     * @tc.name      testExtCacheBuffer0001
     * @tc.desc      Buffer 7-27 contains 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 7;
      const end: number = start + preferredBufferDuration;
      const time: number = 10;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0003
     * @tc.name      testExtCacheBuffer0002
     * @tc.desc      Buffer 14-34 contains 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 14;
      const end: number = start + preferredBufferDuration;
      const time: number = 20;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0004
     * @tc.name      testExtCacheBuffer0003
     * @tc.desc      Buffer 21-41 contains 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 21;
      const end: number = start + preferredBufferDuration;
      const time: number = 30;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0005
     * @tc.name      testExtCacheBuffer0004
     * @tc.desc      Buffer 28-48 contains 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 28;
      const end: number = start + preferredBufferDuration;
      const time: number = 40;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0006
     * @tc.name      testExtCacheBuffer0005
     * @tc.desc      Buffer 35-55 contains 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 35;
      const end: number = start + preferredBufferDuration;
      const time: number = 50;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0007
     * @tc.name      testExtCacheBuffer0006
     * @tc.desc      Buffer 42-62 contains 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 42;
      const end: number = start + preferredBufferDuration;
      const time: number = 60;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0008
     * @tc.name      testExtCacheBuffer0007
     * @tc.desc      Buffer 49-69 contains 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 49;
      const end: number = start + preferredBufferDuration;
      const time: number = 49;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0009
     * @tc.name      testExtCacheBuffer0008
     * @tc.desc      Buffer 56-76 contains 59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 56;
      const end: number = start + preferredBufferDuration;
      const time: number = 59;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0010
     * @tc.name      testExtCacheBuffer0009
     * @tc.desc      Buffer 63-83 contains 69.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 63;
      const end: number = start + preferredBufferDuration;
      const time: number = 69;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0011
     * @tc.name      testExtCacheBuffer0010
     * @tc.desc      Buffer 70-90 contains 79.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 70;
      const end: number = start + preferredBufferDuration;
      const time: number = 79;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0012
     * @tc.name      testExtCacheBuffer0011
     * @tc.desc      Buffer 77-97 contains 89.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 77;
      const end: number = start + preferredBufferDuration;
      const time: number = 89;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0013
     * @tc.name      testExtCacheBuffer0012
     * @tc.desc      Buffer 84-104 contains 99.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 84;
      const end: number = start + preferredBufferDuration;
      const time: number = 99;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0014
     * @tc.name      testExtCacheBuffer0013
     * @tc.desc      Buffer 91-111 contains 109.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 91;
      const end: number = start + preferredBufferDuration;
      const time: number = 109;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0015
     * @tc.name      testExtCacheBuffer0014
     * @tc.desc      Buffer 98-118 contains 98.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 98;
      const end: number = start + preferredBufferDuration;
      const time: number = 98;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0016
     * @tc.name      testExtCacheBuffer0015
     * @tc.desc      Buffer 105-125 contains 108.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 105;
      const end: number = start + preferredBufferDuration;
      const time: number = 108;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0017
     * @tc.name      testExtCacheBuffer0016
     * @tc.desc      Buffer 112-132 contains 118.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 112;
      const end: number = start + preferredBufferDuration;
      const time: number = 118;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0018
     * @tc.name      testExtCacheBuffer0017
     * @tc.desc      Buffer 119-139 contains 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 119;
      const end: number = start + preferredBufferDuration;
      const time: number = 128;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0019
     * @tc.name      testExtCacheBuffer0018
     * @tc.desc      Buffer 126-146 contains 138.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 126;
      const end: number = start + preferredBufferDuration;
      const time: number = 138;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0020
     * @tc.name      testExtCacheBuffer0019
     * @tc.desc      Buffer 133-153 contains 148.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 133;
      const end: number = start + preferredBufferDuration;
      const time: number = 148;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0021
     * @tc.name      testExtCacheBuffer0020
     * @tc.desc      Buffer 140-160 contains 158.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 140;
      const end: number = start + preferredBufferDuration;
      const time: number = 158;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0022
     * @tc.name      testExtCacheBuffer0021
     * @tc.desc      Buffer 147-167 contains 147.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 147;
      const end: number = start + preferredBufferDuration;
      const time: number = 147;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0023
     * @tc.name      testExtCacheBuffer0022
     * @tc.desc      Buffer 154-174 contains 157.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 154;
      const end: number = start + preferredBufferDuration;
      const time: number = 157;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0024
     * @tc.name      testExtCacheBuffer0023
     * @tc.desc      Buffer 161-181 contains 167.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 161;
      const end: number = start + preferredBufferDuration;
      const time: number = 167;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0025
     * @tc.name      testExtCacheBuffer0024
     * @tc.desc      Buffer 168-188 contains 177.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 168;
      const end: number = start + preferredBufferDuration;
      const time: number = 177;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0026
     * @tc.name      testExtCacheBuffer0025
     * @tc.desc      Buffer 175-195 contains 187.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 175;
      const end: number = start + preferredBufferDuration;
      const time: number = 187;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0027
     * @tc.name      testExtCacheBuffer0026
     * @tc.desc      Buffer 182-202 contains 197.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 182;
      const end: number = start + preferredBufferDuration;
      const time: number = 197;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0028
     * @tc.name      testExtCacheBuffer0027
     * @tc.desc      Buffer 189-209 contains 207.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 189;
      const end: number = start + preferredBufferDuration;
      const time: number = 207;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0029
     * @tc.name      testExtCacheBuffer0028
     * @tc.desc      Buffer 196-216 contains 196.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 196;
      const end: number = start + preferredBufferDuration;
      const time: number = 196;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0030
     * @tc.name      testExtCacheBuffer0029
     * @tc.desc      Buffer 203-223 contains 206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 203;
      const end: number = start + preferredBufferDuration;
      const time: number = 206;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0031
     * @tc.name      testExtCacheBuffer0030
     * @tc.desc      Buffer 210-230 contains 216.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 210;
      const end: number = start + preferredBufferDuration;
      const time: number = 216;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0032
     * @tc.name      testExtCacheBuffer0031
     * @tc.desc      Buffer 217-237 contains 226.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 217;
      const end: number = start + preferredBufferDuration;
      const time: number = 226;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0033
     * @tc.name      testExtCacheBuffer0032
     * @tc.desc      Buffer 224-244 contains 236.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 224;
      const end: number = start + preferredBufferDuration;
      const time: number = 236;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0034
     * @tc.name      testExtCacheBuffer0033
     * @tc.desc      Buffer 231-251 contains 246.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 231;
      const end: number = start + preferredBufferDuration;
      const time: number = 246;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0035
     * @tc.name      testExtCacheBuffer0034
     * @tc.desc      Buffer 238-258 contains 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 238;
      const end: number = start + preferredBufferDuration;
      const time: number = 256;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0036
     * @tc.name      testExtCacheBuffer0035
     * @tc.desc      Buffer 245-265 contains 245.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 245;
      const end: number = start + preferredBufferDuration;
      const time: number = 245;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0037
     * @tc.name      testExtCacheBuffer0036
     * @tc.desc      Buffer 252-272 contains 255.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 252;
      const end: number = start + preferredBufferDuration;
      const time: number = 255;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0038
     * @tc.name      testExtCacheBuffer0037
     * @tc.desc      Buffer 259-279 contains 265.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 259;
      const end: number = start + preferredBufferDuration;
      const time: number = 265;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0039
     * @tc.name      testExtCacheBuffer0038
     * @tc.desc      Buffer 266-286 contains 275.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 266;
      const end: number = start + preferredBufferDuration;
      const time: number = 275;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0040
     * @tc.name      testExtCacheBuffer0039
     * @tc.desc      Buffer 273-293 contains 285.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 273;
      const end: number = start + preferredBufferDuration;
      const time: number = 285;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0041
     * @tc.name      testExtCacheBuffer0040
     * @tc.desc      Buffer 280-300 contains 295.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 280;
      const end: number = start + preferredBufferDuration;
      const time: number = 295;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0042
     * @tc.name      testExtCacheBuffer0041
     * @tc.desc      Buffer 287-307 contains 305.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 287;
      const end: number = start + preferredBufferDuration;
      const time: number = 305;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0043
     * @tc.name      testExtCacheBuffer0042
     * @tc.desc      Buffer 294-314 contains 294.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 294;
      const end: number = start + preferredBufferDuration;
      const time: number = 294;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0044
     * @tc.name      testExtCacheBuffer0043
     * @tc.desc      Buffer 301-321 contains 304.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 301;
      const end: number = start + preferredBufferDuration;
      const time: number = 304;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0045
     * @tc.name      testExtCacheBuffer0044
     * @tc.desc      Buffer 308-328 contains 314.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 308;
      const end: number = start + preferredBufferDuration;
      const time: number = 314;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0046
     * @tc.name      testExtCacheBuffer0045
     * @tc.desc      Buffer 315-335 contains 324.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 315;
      const end: number = start + preferredBufferDuration;
      const time: number = 324;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0047
     * @tc.name      testExtCacheBuffer0046
     * @tc.desc      Buffer 322-342 contains 334.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 322;
      const end: number = start + preferredBufferDuration;
      const time: number = 334;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0048
     * @tc.name      testExtCacheBuffer0047
     * @tc.desc      Buffer 329-349 contains 344.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 329;
      const end: number = start + preferredBufferDuration;
      const time: number = 344;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0049
     * @tc.name      testExtCacheBuffer0048
     * @tc.desc      Buffer 336-356 contains 354.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 336;
      const end: number = start + preferredBufferDuration;
      const time: number = 354;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0050
     * @tc.name      testExtCacheBuffer0049
     * @tc.desc      Buffer 343-363 contains 343.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 343;
      const end: number = start + preferredBufferDuration;
      const time: number = 343;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0051
     * @tc.name      testExtCacheBuffer0050
     * @tc.desc      Buffer 350-370 contains 353.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 350;
      const end: number = start + preferredBufferDuration;
      const time: number = 353;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0052
     * @tc.name      testExtCacheBuffer0051
     * @tc.desc      Buffer 357-377 contains 363.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 357;
      const end: number = start + preferredBufferDuration;
      const time: number = 363;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0053
     * @tc.name      testExtCacheBuffer0052
     * @tc.desc      Buffer 364-384 contains 373.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 364;
      const end: number = start + preferredBufferDuration;
      const time: number = 373;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0054
     * @tc.name      testExtCacheBuffer0053
     * @tc.desc      Buffer 371-391 contains 383.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 371;
      const end: number = start + preferredBufferDuration;
      const time: number = 383;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0055
     * @tc.name      testExtCacheBuffer0054
     * @tc.desc      Buffer 378-398 contains 393.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 378;
      const end: number = start + preferredBufferDuration;
      const time: number = 393;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0056
     * @tc.name      testExtCacheBuffer0055
     * @tc.desc      Buffer 385-405 contains 403.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 385;
      const end: number = start + preferredBufferDuration;
      const time: number = 403;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0057
     * @tc.name      testExtCacheBuffer0056
     * @tc.desc      Buffer 392-412 contains 392.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 392;
      const end: number = start + preferredBufferDuration;
      const time: number = 392;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0058
     * @tc.name      testExtCacheBuffer0057
     * @tc.desc      Buffer 399-419 contains 402.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 399;
      const end: number = start + preferredBufferDuration;
      const time: number = 402;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0059
     * @tc.name      testExtCacheBuffer0058
     * @tc.desc      Buffer 406-426 contains 412.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 406;
      const end: number = start + preferredBufferDuration;
      const time: number = 412;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0060
     * @tc.name      testExtCacheBuffer0059
     * @tc.desc      Buffer 413-433 contains 422.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 413;
      const end: number = start + preferredBufferDuration;
      const time: number = 422;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0061
     * @tc.name      testExtCacheBuffer0060
     * @tc.desc      Buffer 420-440 contains 432.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 420;
      const end: number = start + preferredBufferDuration;
      const time: number = 432;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0062
     * @tc.name      testExtCacheBuffer0061
     * @tc.desc      Buffer 427-447 contains 442.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 427;
      const end: number = start + preferredBufferDuration;
      const time: number = 442;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0063
     * @tc.name      testExtCacheBuffer0062
     * @tc.desc      Buffer 434-454 contains 452.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 434;
      const end: number = start + preferredBufferDuration;
      const time: number = 452;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0064
     * @tc.name      testExtCacheBuffer0063
     * @tc.desc      Buffer 441-461 contains 441.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 441;
      const end: number = start + preferredBufferDuration;
      const time: number = 441;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0065
     * @tc.name      testExtCacheBuffer0064
     * @tc.desc      Buffer 448-468 contains 451.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 448;
      const end: number = start + preferredBufferDuration;
      const time: number = 451;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0066
     * @tc.name      testExtCacheBuffer0065
     * @tc.desc      Buffer 455-475 contains 461.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 455;
      const end: number = start + preferredBufferDuration;
      const time: number = 461;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0067
     * @tc.name      testExtCacheBuffer0066
     * @tc.desc      Buffer 462-482 contains 471.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 462;
      const end: number = start + preferredBufferDuration;
      const time: number = 471;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0068
     * @tc.name      testExtCacheBuffer0067
     * @tc.desc      Buffer 469-489 contains 481.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 469;
      const end: number = start + preferredBufferDuration;
      const time: number = 481;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0069
     * @tc.name      testExtCacheBuffer0068
     * @tc.desc      Buffer 476-496 contains 491.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 476;
      const end: number = start + preferredBufferDuration;
      const time: number = 491;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0070
     * @tc.name      testExtCacheBuffer0069
     * @tc.desc      Buffer 483-503 contains 501.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 483;
      const end: number = start + preferredBufferDuration;
      const time: number = 501;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0071
     * @tc.name      testExtCacheBuffer0070
     * @tc.desc      Buffer 490-510 contains 490.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 490;
      const end: number = start + preferredBufferDuration;
      const time: number = 490;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0072
     * @tc.name      testExtCacheBuffer0071
     * @tc.desc      Buffer 497-517 contains 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 497;
      const end: number = start + preferredBufferDuration;
      const time: number = 500;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0073
     * @tc.name      testExtCacheBuffer0072
     * @tc.desc      Buffer 504-524 contains 510.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 504;
      const end: number = start + preferredBufferDuration;
      const time: number = 510;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0074
     * @tc.name      testExtCacheBuffer0073
     * @tc.desc      Buffer 511-531 contains 520.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 511;
      const end: number = start + preferredBufferDuration;
      const time: number = 520;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0075
     * @tc.name      testExtCacheBuffer0074
     * @tc.desc      Buffer 518-538 contains 530.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 518;
      const end: number = start + preferredBufferDuration;
      const time: number = 530;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0076
     * @tc.name      testExtCacheBuffer0075
     * @tc.desc      Buffer 525-545 contains 540.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 525;
      const end: number = start + preferredBufferDuration;
      const time: number = 540;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0077
     * @tc.name      testExtCacheBuffer0076
     * @tc.desc      Buffer 532-552 contains 550.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 532;
      const end: number = start + preferredBufferDuration;
      const time: number = 550;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0078
     * @tc.name      testExtCacheBuffer0077
     * @tc.desc      Buffer 539-559 contains 539.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 539;
      const end: number = start + preferredBufferDuration;
      const time: number = 539;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0079
     * @tc.name      testExtCacheBuffer0078
     * @tc.desc      Buffer 546-566 contains 549.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 546;
      const end: number = start + preferredBufferDuration;
      const time: number = 549;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_BUFFER_0080
     * @tc.name      testExtCacheBuffer0079
     * @tc.desc      Buffer 553-573 contains 559.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheBuffer0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const preferredBufferDuration: number = 20;
      const start: number = 553;
      const end: number = start + preferredBufferDuration;
      const time: number = 559;
      const contains: boolean = time >= start && time <= end;
      expect(preferredBufferDuration).assertEqual(20);
      expect(end - start).assertEqual(20);
      expect(contains).assertEqual(true);
      expect(end).assertLarger(start);
    })
  });
}
