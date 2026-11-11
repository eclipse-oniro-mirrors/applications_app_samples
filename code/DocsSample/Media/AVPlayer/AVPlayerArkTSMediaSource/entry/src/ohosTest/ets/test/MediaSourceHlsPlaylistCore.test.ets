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

const TAG: string = '[Sample_mediaSourceHlsPlaylistCore]';
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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceHlsPlaylistCoreTest(): void {
  describe('mediaSourceHlsPlaylistCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0001
     * @tc.name      testExtHlsPlaylist0000
     * @tc.desc      Segment 0 has duration 4 and window 0-4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 0;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 0;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(0);
      expect(endTime).assertEqual(4);
      expect(segment).assertEqual('seg0.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0002
     * @tc.name      testExtHlsPlaylist0001
     * @tc.desc      Segment 1 has duration 6 and window 4-10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 1;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 4;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(4);
      expect(endTime).assertEqual(10);
      expect(segment).assertEqual('seg1.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0003
     * @tc.name      testExtHlsPlaylist0002
     * @tc.desc      Segment 2 has duration 4 and window 10-14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 2;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 10;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(10);
      expect(endTime).assertEqual(14);
      expect(segment).assertEqual('seg2.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0004
     * @tc.name      testExtHlsPlaylist0003
     * @tc.desc      Segment 3 has duration 6 and window 14-20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 3;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 14;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(14);
      expect(endTime).assertEqual(20);
      expect(segment).assertEqual('seg3.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0005
     * @tc.name      testExtHlsPlaylist0004
     * @tc.desc      Segment 4 has duration 4 and window 20-24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 4;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 20;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(20);
      expect(endTime).assertEqual(24);
      expect(segment).assertEqual('seg4.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0006
     * @tc.name      testExtHlsPlaylist0005
     * @tc.desc      Segment 5 has duration 6 and window 24-30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 5;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 24;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(24);
      expect(endTime).assertEqual(30);
      expect(segment).assertEqual('seg5.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0007
     * @tc.name      testExtHlsPlaylist0006
     * @tc.desc      Segment 6 has duration 4 and window 30-34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 6;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 30;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(30);
      expect(endTime).assertEqual(34);
      expect(segment).assertEqual('seg6.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0008
     * @tc.name      testExtHlsPlaylist0007
     * @tc.desc      Segment 7 has duration 6 and window 34-40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 7;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 34;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(34);
      expect(endTime).assertEqual(40);
      expect(segment).assertEqual('seg7.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0009
     * @tc.name      testExtHlsPlaylist0008
     * @tc.desc      Segment 8 has duration 4 and window 40-44.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 8;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 40;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(40);
      expect(endTime).assertEqual(44);
      expect(segment).assertEqual('seg8.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0010
     * @tc.name      testExtHlsPlaylist0009
     * @tc.desc      Segment 9 has duration 6 and window 44-50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 9;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 44;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(44);
      expect(endTime).assertEqual(50);
      expect(segment).assertEqual('seg9.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0011
     * @tc.name      testExtHlsPlaylist0010
     * @tc.desc      Segment 10 has duration 4 and window 50-54.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 10;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 50;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(50);
      expect(endTime).assertEqual(54);
      expect(segment).assertEqual('seg10.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0012
     * @tc.name      testExtHlsPlaylist0011
     * @tc.desc      Segment 11 has duration 6 and window 54-60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 11;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 54;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(54);
      expect(endTime).assertEqual(60);
      expect(segment).assertEqual('seg11.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0013
     * @tc.name      testExtHlsPlaylist0012
     * @tc.desc      Segment 12 has duration 4 and window 60-64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 12;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 60;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(60);
      expect(endTime).assertEqual(64);
      expect(segment).assertEqual('seg12.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0014
     * @tc.name      testExtHlsPlaylist0013
     * @tc.desc      Segment 13 has duration 6 and window 64-70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 13;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 64;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(64);
      expect(endTime).assertEqual(70);
      expect(segment).assertEqual('seg13.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0015
     * @tc.name      testExtHlsPlaylist0014
     * @tc.desc      Segment 14 has duration 4 and window 70-74.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 14;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 70;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(70);
      expect(endTime).assertEqual(74);
      expect(segment).assertEqual('seg14.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0016
     * @tc.name      testExtHlsPlaylist0015
     * @tc.desc      Segment 15 has duration 6 and window 74-80.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 15;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 74;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(74);
      expect(endTime).assertEqual(80);
      expect(segment).assertEqual('seg15.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0017
     * @tc.name      testExtHlsPlaylist0016
     * @tc.desc      Segment 16 has duration 4 and window 80-84.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 16;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 80;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(80);
      expect(endTime).assertEqual(84);
      expect(segment).assertEqual('seg16.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0018
     * @tc.name      testExtHlsPlaylist0017
     * @tc.desc      Segment 17 has duration 6 and window 84-90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 17;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 84;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(84);
      expect(endTime).assertEqual(90);
      expect(segment).assertEqual('seg17.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0019
     * @tc.name      testExtHlsPlaylist0018
     * @tc.desc      Segment 18 has duration 4 and window 90-94.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 18;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 90;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(90);
      expect(endTime).assertEqual(94);
      expect(segment).assertEqual('seg18.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0020
     * @tc.name      testExtHlsPlaylist0019
     * @tc.desc      Segment 19 has duration 6 and window 94-100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 19;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 94;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(94);
      expect(endTime).assertEqual(100);
      expect(segment).assertEqual('seg19.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0021
     * @tc.name      testExtHlsPlaylist0020
     * @tc.desc      Segment 20 has duration 4 and window 100-104.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 20;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 100;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(100);
      expect(endTime).assertEqual(104);
      expect(segment).assertEqual('seg20.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0022
     * @tc.name      testExtHlsPlaylist0021
     * @tc.desc      Segment 21 has duration 6 and window 104-110.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 21;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 104;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(104);
      expect(endTime).assertEqual(110);
      expect(segment).assertEqual('seg21.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0023
     * @tc.name      testExtHlsPlaylist0022
     * @tc.desc      Segment 22 has duration 4 and window 110-114.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 22;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 110;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(110);
      expect(endTime).assertEqual(114);
      expect(segment).assertEqual('seg22.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0024
     * @tc.name      testExtHlsPlaylist0023
     * @tc.desc      Segment 23 has duration 6 and window 114-120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 23;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 114;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(114);
      expect(endTime).assertEqual(120);
      expect(segment).assertEqual('seg23.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0025
     * @tc.name      testExtHlsPlaylist0024
     * @tc.desc      Segment 24 has duration 4 and window 120-124.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 24;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 120;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(120);
      expect(endTime).assertEqual(124);
      expect(segment).assertEqual('seg24.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0026
     * @tc.name      testExtHlsPlaylist0025
     * @tc.desc      Segment 25 has duration 6 and window 124-130.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 25;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 124;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(124);
      expect(endTime).assertEqual(130);
      expect(segment).assertEqual('seg25.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0027
     * @tc.name      testExtHlsPlaylist0026
     * @tc.desc      Segment 26 has duration 4 and window 130-134.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 26;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 130;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(130);
      expect(endTime).assertEqual(134);
      expect(segment).assertEqual('seg26.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0028
     * @tc.name      testExtHlsPlaylist0027
     * @tc.desc      Segment 27 has duration 6 and window 134-140.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 27;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 134;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(134);
      expect(endTime).assertEqual(140);
      expect(segment).assertEqual('seg27.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0029
     * @tc.name      testExtHlsPlaylist0028
     * @tc.desc      Segment 28 has duration 4 and window 140-144.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 28;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 140;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(140);
      expect(endTime).assertEqual(144);
      expect(segment).assertEqual('seg28.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0030
     * @tc.name      testExtHlsPlaylist0029
     * @tc.desc      Segment 29 has duration 6 and window 144-150.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 29;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 144;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(144);
      expect(endTime).assertEqual(150);
      expect(segment).assertEqual('seg29.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0031
     * @tc.name      testExtHlsPlaylist0030
     * @tc.desc      Segment 30 has duration 4 and window 150-154.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 30;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 150;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(150);
      expect(endTime).assertEqual(154);
      expect(segment).assertEqual('seg30.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0032
     * @tc.name      testExtHlsPlaylist0031
     * @tc.desc      Segment 31 has duration 6 and window 154-160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 31;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 154;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(154);
      expect(endTime).assertEqual(160);
      expect(segment).assertEqual('seg31.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0033
     * @tc.name      testExtHlsPlaylist0032
     * @tc.desc      Segment 32 has duration 4 and window 160-164.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 32;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 160;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(160);
      expect(endTime).assertEqual(164);
      expect(segment).assertEqual('seg32.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0034
     * @tc.name      testExtHlsPlaylist0033
     * @tc.desc      Segment 33 has duration 6 and window 164-170.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 33;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 164;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(164);
      expect(endTime).assertEqual(170);
      expect(segment).assertEqual('seg33.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0035
     * @tc.name      testExtHlsPlaylist0034
     * @tc.desc      Segment 34 has duration 4 and window 170-174.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 34;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 170;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(170);
      expect(endTime).assertEqual(174);
      expect(segment).assertEqual('seg34.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0036
     * @tc.name      testExtHlsPlaylist0035
     * @tc.desc      Segment 35 has duration 6 and window 174-180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 35;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 174;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(174);
      expect(endTime).assertEqual(180);
      expect(segment).assertEqual('seg35.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0037
     * @tc.name      testExtHlsPlaylist0036
     * @tc.desc      Segment 36 has duration 4 and window 180-184.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 36;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 180;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(180);
      expect(endTime).assertEqual(184);
      expect(segment).assertEqual('seg36.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0038
     * @tc.name      testExtHlsPlaylist0037
     * @tc.desc      Segment 37 has duration 6 and window 184-190.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 37;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 184;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(184);
      expect(endTime).assertEqual(190);
      expect(segment).assertEqual('seg37.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0039
     * @tc.name      testExtHlsPlaylist0038
     * @tc.desc      Segment 38 has duration 4 and window 190-194.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 38;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 190;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(190);
      expect(endTime).assertEqual(194);
      expect(segment).assertEqual('seg38.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0040
     * @tc.name      testExtHlsPlaylist0039
     * @tc.desc      Segment 39 has duration 6 and window 194-200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 39;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 194;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(194);
      expect(endTime).assertEqual(200);
      expect(segment).assertEqual('seg39.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0041
     * @tc.name      testExtHlsPlaylist0040
     * @tc.desc      Segment 40 has duration 4 and window 200-204.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 40;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 200;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(200);
      expect(endTime).assertEqual(204);
      expect(segment).assertEqual('seg40.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0042
     * @tc.name      testExtHlsPlaylist0041
     * @tc.desc      Segment 41 has duration 6 and window 204-210.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 41;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 204;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(204);
      expect(endTime).assertEqual(210);
      expect(segment).assertEqual('seg41.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0043
     * @tc.name      testExtHlsPlaylist0042
     * @tc.desc      Segment 42 has duration 4 and window 210-214.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 42;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 210;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(210);
      expect(endTime).assertEqual(214);
      expect(segment).assertEqual('seg42.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0044
     * @tc.name      testExtHlsPlaylist0043
     * @tc.desc      Segment 43 has duration 6 and window 214-220.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 43;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 214;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(214);
      expect(endTime).assertEqual(220);
      expect(segment).assertEqual('seg43.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0045
     * @tc.name      testExtHlsPlaylist0044
     * @tc.desc      Segment 44 has duration 4 and window 220-224.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 44;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 220;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(220);
      expect(endTime).assertEqual(224);
      expect(segment).assertEqual('seg44.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0046
     * @tc.name      testExtHlsPlaylist0045
     * @tc.desc      Segment 45 has duration 6 and window 224-230.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 45;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 224;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(224);
      expect(endTime).assertEqual(230);
      expect(segment).assertEqual('seg45.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0047
     * @tc.name      testExtHlsPlaylist0046
     * @tc.desc      Segment 46 has duration 4 and window 230-234.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 46;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 230;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(230);
      expect(endTime).assertEqual(234);
      expect(segment).assertEqual('seg46.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0048
     * @tc.name      testExtHlsPlaylist0047
     * @tc.desc      Segment 47 has duration 6 and window 234-240.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 47;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 234;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(234);
      expect(endTime).assertEqual(240);
      expect(segment).assertEqual('seg47.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0049
     * @tc.name      testExtHlsPlaylist0048
     * @tc.desc      Segment 48 has duration 4 and window 240-244.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 48;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 240;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(240);
      expect(endTime).assertEqual(244);
      expect(segment).assertEqual('seg48.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0050
     * @tc.name      testExtHlsPlaylist0049
     * @tc.desc      Segment 49 has duration 6 and window 244-250.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 49;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 244;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(244);
      expect(endTime).assertEqual(250);
      expect(segment).assertEqual('seg49.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0051
     * @tc.name      testExtHlsPlaylist0050
     * @tc.desc      Segment 50 has duration 4 and window 250-254.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 50;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 250;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(250);
      expect(endTime).assertEqual(254);
      expect(segment).assertEqual('seg50.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0052
     * @tc.name      testExtHlsPlaylist0051
     * @tc.desc      Segment 51 has duration 6 and window 254-260.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 51;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 254;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(254);
      expect(endTime).assertEqual(260);
      expect(segment).assertEqual('seg51.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0053
     * @tc.name      testExtHlsPlaylist0052
     * @tc.desc      Segment 52 has duration 4 and window 260-264.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 52;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 260;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(260);
      expect(endTime).assertEqual(264);
      expect(segment).assertEqual('seg52.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0054
     * @tc.name      testExtHlsPlaylist0053
     * @tc.desc      Segment 53 has duration 6 and window 264-270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 53;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 264;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(264);
      expect(endTime).assertEqual(270);
      expect(segment).assertEqual('seg53.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0055
     * @tc.name      testExtHlsPlaylist0054
     * @tc.desc      Segment 54 has duration 4 and window 270-274.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 54;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 270;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(270);
      expect(endTime).assertEqual(274);
      expect(segment).assertEqual('seg54.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0056
     * @tc.name      testExtHlsPlaylist0055
     * @tc.desc      Segment 55 has duration 6 and window 274-280.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 55;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 274;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(274);
      expect(endTime).assertEqual(280);
      expect(segment).assertEqual('seg55.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0057
     * @tc.name      testExtHlsPlaylist0056
     * @tc.desc      Segment 56 has duration 4 and window 280-284.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 56;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 280;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(280);
      expect(endTime).assertEqual(284);
      expect(segment).assertEqual('seg56.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0058
     * @tc.name      testExtHlsPlaylist0057
     * @tc.desc      Segment 57 has duration 6 and window 284-290.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 57;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 284;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(284);
      expect(endTime).assertEqual(290);
      expect(segment).assertEqual('seg57.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0059
     * @tc.name      testExtHlsPlaylist0058
     * @tc.desc      Segment 58 has duration 4 and window 290-294.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 58;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 290;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(290);
      expect(endTime).assertEqual(294);
      expect(segment).assertEqual('seg58.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0060
     * @tc.name      testExtHlsPlaylist0059
     * @tc.desc      Segment 59 has duration 6 and window 294-300.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 59;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 294;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(294);
      expect(endTime).assertEqual(300);
      expect(segment).assertEqual('seg59.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0061
     * @tc.name      testExtHlsPlaylist0060
     * @tc.desc      Segment 60 has duration 4 and window 300-304.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 60;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 300;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(300);
      expect(endTime).assertEqual(304);
      expect(segment).assertEqual('seg60.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0062
     * @tc.name      testExtHlsPlaylist0061
     * @tc.desc      Segment 61 has duration 6 and window 304-310.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 61;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 304;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(304);
      expect(endTime).assertEqual(310);
      expect(segment).assertEqual('seg61.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0063
     * @tc.name      testExtHlsPlaylist0062
     * @tc.desc      Segment 62 has duration 4 and window 310-314.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 62;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 310;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(310);
      expect(endTime).assertEqual(314);
      expect(segment).assertEqual('seg62.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0064
     * @tc.name      testExtHlsPlaylist0063
     * @tc.desc      Segment 63 has duration 6 and window 314-320.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 63;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 314;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(314);
      expect(endTime).assertEqual(320);
      expect(segment).assertEqual('seg63.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0065
     * @tc.name      testExtHlsPlaylist0064
     * @tc.desc      Segment 64 has duration 4 and window 320-324.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 64;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 320;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(320);
      expect(endTime).assertEqual(324);
      expect(segment).assertEqual('seg64.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0066
     * @tc.name      testExtHlsPlaylist0065
     * @tc.desc      Segment 65 has duration 6 and window 324-330.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 65;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 324;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(324);
      expect(endTime).assertEqual(330);
      expect(segment).assertEqual('seg65.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0067
     * @tc.name      testExtHlsPlaylist0066
     * @tc.desc      Segment 66 has duration 4 and window 330-334.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 66;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 330;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(330);
      expect(endTime).assertEqual(334);
      expect(segment).assertEqual('seg66.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0068
     * @tc.name      testExtHlsPlaylist0067
     * @tc.desc      Segment 67 has duration 6 and window 334-340.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 67;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 334;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(334);
      expect(endTime).assertEqual(340);
      expect(segment).assertEqual('seg67.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0069
     * @tc.name      testExtHlsPlaylist0068
     * @tc.desc      Segment 68 has duration 4 and window 340-344.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 68;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 340;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(340);
      expect(endTime).assertEqual(344);
      expect(segment).assertEqual('seg68.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0070
     * @tc.name      testExtHlsPlaylist0069
     * @tc.desc      Segment 69 has duration 6 and window 344-350.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 69;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 344;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(344);
      expect(endTime).assertEqual(350);
      expect(segment).assertEqual('seg69.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0071
     * @tc.name      testExtHlsPlaylist0070
     * @tc.desc      Segment 70 has duration 4 and window 350-354.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 70;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 350;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(350);
      expect(endTime).assertEqual(354);
      expect(segment).assertEqual('seg70.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0072
     * @tc.name      testExtHlsPlaylist0071
     * @tc.desc      Segment 71 has duration 6 and window 354-360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 71;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 354;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(354);
      expect(endTime).assertEqual(360);
      expect(segment).assertEqual('seg71.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0073
     * @tc.name      testExtHlsPlaylist0072
     * @tc.desc      Segment 72 has duration 4 and window 360-364.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 72;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 360;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(360);
      expect(endTime).assertEqual(364);
      expect(segment).assertEqual('seg72.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0074
     * @tc.name      testExtHlsPlaylist0073
     * @tc.desc      Segment 73 has duration 6 and window 364-370.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 73;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 364;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(364);
      expect(endTime).assertEqual(370);
      expect(segment).assertEqual('seg73.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0075
     * @tc.name      testExtHlsPlaylist0074
     * @tc.desc      Segment 74 has duration 4 and window 370-374.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 74;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 370;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(370);
      expect(endTime).assertEqual(374);
      expect(segment).assertEqual('seg74.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0076
     * @tc.name      testExtHlsPlaylist0075
     * @tc.desc      Segment 75 has duration 6 and window 374-380.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 75;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 374;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(374);
      expect(endTime).assertEqual(380);
      expect(segment).assertEqual('seg75.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0077
     * @tc.name      testExtHlsPlaylist0076
     * @tc.desc      Segment 76 has duration 4 and window 380-384.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 76;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 380;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(380);
      expect(endTime).assertEqual(384);
      expect(segment).assertEqual('seg76.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0078
     * @tc.name      testExtHlsPlaylist0077
     * @tc.desc      Segment 77 has duration 6 and window 384-390.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 77;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 384;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(384);
      expect(endTime).assertEqual(390);
      expect(segment).assertEqual('seg77.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0079
     * @tc.name      testExtHlsPlaylist0078
     * @tc.desc      Segment 78 has duration 4 and window 390-394.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 78;
      const duration: number = 4;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 390;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(390);
      expect(endTime).assertEqual(394);
      expect(segment).assertEqual('seg78.ts');
      expect(endTime).assertLarger(startTime);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HLSPLAY_0080
     * @tc.name      testExtHlsPlaylist0079
     * @tc.desc      Segment 79 has duration 6 and window 394-400.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtHlsPlaylist0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: number = 79;
      const duration: number = 6;
      const line: string = `#EXTINF:${duration},`;
      const parsed: number = Number.parseInt(line.substring(8).split(',')[0], 10);
      const startTime: number = 394;
      const endTime: number = startTime + duration;
      const segment: string = `seg${index}.ts`;
      expect(parsed).assertEqual(duration);
      expect(startTime).assertEqual(394);
      expect(endTime).assertEqual(400);
      expect(segment).assertEqual('seg79.ts');
      expect(endTime).assertLarger(startTime);
    })
  });
}
