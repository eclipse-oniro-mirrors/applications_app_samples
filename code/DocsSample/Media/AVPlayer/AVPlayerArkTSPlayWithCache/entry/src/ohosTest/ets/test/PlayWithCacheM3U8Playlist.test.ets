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

const TAG: string = '[Sample_playWithCacheM3U8Playlist]';
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

export default function playWithCacheM3U8PlaylistTest(): void {
  describe('playWithCacheM3U8PlaylistTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0001
     * @tc.name      testExtCacheHls0000
     * @tc.desc      Playlist segment 0 duration 10, window 0-10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 0;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(10);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0002
     * @tc.name      testExtCacheHls0001
     * @tc.desc      Playlist segment 1 duration 10, window 10-20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 10;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(20);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0003
     * @tc.name      testExtCacheHls0002
     * @tc.desc      Playlist segment 2 duration 10, window 20-30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 20;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(30);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0004
     * @tc.name      testExtCacheHls0003
     * @tc.desc      Playlist segment 3 duration 10, window 30-40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 30;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(40);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0005
     * @tc.name      testExtCacheHls0004
     * @tc.desc      Playlist segment 4 duration 10, window 40-50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 40;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(50);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0006
     * @tc.name      testExtCacheHls0005
     * @tc.desc      Playlist segment 5 duration 10, window 50-60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 50;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(60);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0007
     * @tc.name      testExtCacheHls0006
     * @tc.desc      Playlist segment 6 duration 10, window 60-70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 60;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(70);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0008
     * @tc.name      testExtCacheHls0007
     * @tc.desc      Playlist segment 7 duration 10, window 70-80.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 70;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(80);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0009
     * @tc.name      testExtCacheHls0008
     * @tc.desc      Playlist segment 8 duration 10, window 80-90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 80;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(90);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0010
     * @tc.name      testExtCacheHls0009
     * @tc.desc      Playlist segment 9 duration 10, window 90-100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 90;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(100);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0011
     * @tc.name      testExtCacheHls0010
     * @tc.desc      Playlist segment 10 duration 10, window 100-110.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 100;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(110);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0012
     * @tc.name      testExtCacheHls0011
     * @tc.desc      Playlist segment 11 duration 10, window 110-120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 110;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(120);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0013
     * @tc.name      testExtCacheHls0012
     * @tc.desc      Playlist segment 12 duration 10, window 120-130.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 120;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(130);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0014
     * @tc.name      testExtCacheHls0013
     * @tc.desc      Playlist segment 13 duration 10, window 130-140.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 130;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(140);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0015
     * @tc.name      testExtCacheHls0014
     * @tc.desc      Playlist segment 14 duration 10, window 140-150.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 140;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(150);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0016
     * @tc.name      testExtCacheHls0015
     * @tc.desc      Playlist segment 15 duration 10, window 150-160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 150;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(160);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0017
     * @tc.name      testExtCacheHls0016
     * @tc.desc      Playlist segment 16 duration 10, window 160-170.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 160;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(170);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0018
     * @tc.name      testExtCacheHls0017
     * @tc.desc      Playlist segment 17 duration 10, window 170-180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 170;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(180);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0019
     * @tc.name      testExtCacheHls0018
     * @tc.desc      Playlist segment 18 duration 10, window 180-190.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 180;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(190);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0020
     * @tc.name      testExtCacheHls0019
     * @tc.desc      Playlist segment 19 duration 10, window 190-200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 190;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(200);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0021
     * @tc.name      testExtCacheHls0020
     * @tc.desc      Playlist segment 20 duration 10, window 200-210.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 200;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(210);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0022
     * @tc.name      testExtCacheHls0021
     * @tc.desc      Playlist segment 21 duration 10, window 210-220.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 210;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(220);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0023
     * @tc.name      testExtCacheHls0022
     * @tc.desc      Playlist segment 22 duration 10, window 220-230.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 220;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(230);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0024
     * @tc.name      testExtCacheHls0023
     * @tc.desc      Playlist segment 23 duration 10, window 230-240.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 230;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(240);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0025
     * @tc.name      testExtCacheHls0024
     * @tc.desc      Playlist segment 24 duration 10, window 240-250.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 240;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(250);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0026
     * @tc.name      testExtCacheHls0025
     * @tc.desc      Playlist segment 25 duration 10, window 250-260.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 250;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(260);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0027
     * @tc.name      testExtCacheHls0026
     * @tc.desc      Playlist segment 26 duration 10, window 260-270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 260;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(270);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0028
     * @tc.name      testExtCacheHls0027
     * @tc.desc      Playlist segment 27 duration 10, window 270-280.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 270;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(280);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0029
     * @tc.name      testExtCacheHls0028
     * @tc.desc      Playlist segment 28 duration 10, window 280-290.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 280;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(290);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0030
     * @tc.name      testExtCacheHls0029
     * @tc.desc      Playlist segment 29 duration 10, window 290-300.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 290;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(300);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0031
     * @tc.name      testExtCacheHls0030
     * @tc.desc      Playlist segment 30 duration 10, window 300-310.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 300;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(310);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0032
     * @tc.name      testExtCacheHls0031
     * @tc.desc      Playlist segment 31 duration 10, window 310-320.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 310;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(320);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0033
     * @tc.name      testExtCacheHls0032
     * @tc.desc      Playlist segment 32 duration 10, window 320-330.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 320;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(330);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0034
     * @tc.name      testExtCacheHls0033
     * @tc.desc      Playlist segment 33 duration 10, window 330-340.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 330;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(340);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0035
     * @tc.name      testExtCacheHls0034
     * @tc.desc      Playlist segment 34 duration 10, window 340-350.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 340;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(350);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0036
     * @tc.name      testExtCacheHls0035
     * @tc.desc      Playlist segment 35 duration 10, window 350-360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 350;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(360);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0037
     * @tc.name      testExtCacheHls0036
     * @tc.desc      Playlist segment 36 duration 10, window 360-370.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 360;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(370);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0038
     * @tc.name      testExtCacheHls0037
     * @tc.desc      Playlist segment 37 duration 10, window 370-380.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 370;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(380);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0039
     * @tc.name      testExtCacheHls0038
     * @tc.desc      Playlist segment 38 duration 10, window 380-390.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 380;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(390);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0040
     * @tc.name      testExtCacheHls0039
     * @tc.desc      Playlist segment 39 duration 10, window 390-400.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 390;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(400);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0041
     * @tc.name      testExtCacheHls0040
     * @tc.desc      Playlist segment 40 duration 10, window 400-410.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 400;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(410);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0042
     * @tc.name      testExtCacheHls0041
     * @tc.desc      Playlist segment 41 duration 10, window 410-420.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 410;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(420);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0043
     * @tc.name      testExtCacheHls0042
     * @tc.desc      Playlist segment 42 duration 10, window 420-430.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 420;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(430);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0044
     * @tc.name      testExtCacheHls0043
     * @tc.desc      Playlist segment 43 duration 10, window 430-440.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 430;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(440);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0045
     * @tc.name      testExtCacheHls0044
     * @tc.desc      Playlist segment 44 duration 10, window 440-450.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 440;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(450);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0046
     * @tc.name      testExtCacheHls0045
     * @tc.desc      Playlist segment 45 duration 10, window 450-460.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 450;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(460);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0047
     * @tc.name      testExtCacheHls0046
     * @tc.desc      Playlist segment 46 duration 10, window 460-470.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 460;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(470);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0048
     * @tc.name      testExtCacheHls0047
     * @tc.desc      Playlist segment 47 duration 10, window 470-480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 470;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(480);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0049
     * @tc.name      testExtCacheHls0048
     * @tc.desc      Playlist segment 48 duration 10, window 480-490.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 480;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(490);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0050
     * @tc.name      testExtCacheHls0049
     * @tc.desc      Playlist segment 49 duration 10, window 490-500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 490;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(500);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0051
     * @tc.name      testExtCacheHls0050
     * @tc.desc      Playlist segment 50 duration 10, window 500-510.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 500;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(510);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0052
     * @tc.name      testExtCacheHls0051
     * @tc.desc      Playlist segment 51 duration 10, window 510-520.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 510;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(520);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0053
     * @tc.name      testExtCacheHls0052
     * @tc.desc      Playlist segment 52 duration 10, window 520-530.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 520;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(530);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0054
     * @tc.name      testExtCacheHls0053
     * @tc.desc      Playlist segment 53 duration 10, window 530-540.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 530;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(540);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0055
     * @tc.name      testExtCacheHls0054
     * @tc.desc      Playlist segment 54 duration 10, window 540-550.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 540;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(550);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0056
     * @tc.name      testExtCacheHls0055
     * @tc.desc      Playlist segment 55 duration 10, window 550-560.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 550;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(560);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0057
     * @tc.name      testExtCacheHls0056
     * @tc.desc      Playlist segment 56 duration 10, window 560-570.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 560;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(570);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0058
     * @tc.name      testExtCacheHls0057
     * @tc.desc      Playlist segment 57 duration 10, window 570-580.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 570;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(580);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0059
     * @tc.name      testExtCacheHls0058
     * @tc.desc      Playlist segment 58 duration 10, window 580-590.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 580;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(590);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0060
     * @tc.name      testExtCacheHls0059
     * @tc.desc      Playlist segment 59 duration 10, window 590-600.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 590;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(600);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0061
     * @tc.name      testExtCacheHls0060
     * @tc.desc      Playlist segment 60 duration 10, window 600-610.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 600;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(610);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0062
     * @tc.name      testExtCacheHls0061
     * @tc.desc      Playlist segment 61 duration 10, window 610-620.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 610;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(620);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0063
     * @tc.name      testExtCacheHls0062
     * @tc.desc      Playlist segment 62 duration 10, window 620-630.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 620;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(630);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0064
     * @tc.name      testExtCacheHls0063
     * @tc.desc      Playlist segment 63 duration 10, window 630-640.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 630;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(640);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0065
     * @tc.name      testExtCacheHls0064
     * @tc.desc      Playlist segment 64 duration 10, window 640-650.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 640;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(650);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0066
     * @tc.name      testExtCacheHls0065
     * @tc.desc      Playlist segment 65 duration 10, window 650-660.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 650;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(660);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0067
     * @tc.name      testExtCacheHls0066
     * @tc.desc      Playlist segment 66 duration 10, window 660-670.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 660;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(670);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0068
     * @tc.name      testExtCacheHls0067
     * @tc.desc      Playlist segment 67 duration 10, window 670-680.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 670;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(680);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0069
     * @tc.name      testExtCacheHls0068
     * @tc.desc      Playlist segment 68 duration 10, window 680-690.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 680;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(690);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0070
     * @tc.name      testExtCacheHls0069
     * @tc.desc      Playlist segment 69 duration 10, window 690-700.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 690;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(700);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0071
     * @tc.name      testExtCacheHls0070
     * @tc.desc      Playlist segment 70 duration 10, window 700-710.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 700;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(710);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0072
     * @tc.name      testExtCacheHls0071
     * @tc.desc      Playlist segment 71 duration 10, window 710-720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 710;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(720);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0073
     * @tc.name      testExtCacheHls0072
     * @tc.desc      Playlist segment 72 duration 10, window 720-730.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 720;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(730);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0074
     * @tc.name      testExtCacheHls0073
     * @tc.desc      Playlist segment 73 duration 10, window 730-740.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 730;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(740);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0075
     * @tc.name      testExtCacheHls0074
     * @tc.desc      Playlist segment 74 duration 10, window 740-750.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 740;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(750);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0076
     * @tc.name      testExtCacheHls0075
     * @tc.desc      Playlist segment 75 duration 10, window 750-760.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 750;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(760);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0077
     * @tc.name      testExtCacheHls0076
     * @tc.desc      Playlist segment 76 duration 10, window 760-770.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 760;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(770);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0078
     * @tc.name      testExtCacheHls0077
     * @tc.desc      Playlist segment 77 duration 10, window 770-780.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 770;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(780);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0079
     * @tc.name      testExtCacheHls0078
     * @tc.desc      Playlist segment 78 duration 10, window 780-790.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 780;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(790);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_HLS_0080
     * @tc.name      testExtCacheHls0079
     * @tc.desc      Playlist segment 79 duration 10, window 790-800.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheHls0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDuration: number = 10;
      const duration: number = 10;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 790;
      const endTime: number = startTime + duration;
      expect(line.startsWith('#EXTINF:')).assertTrue();
      expect(parsed).assertEqual(duration);
      expect(endTime).assertEqual(800);
      expect(targetDuration).assertLargerOrEqual(duration);
      expect(endTime).assertLarger(startTime);
    })
  });
}
