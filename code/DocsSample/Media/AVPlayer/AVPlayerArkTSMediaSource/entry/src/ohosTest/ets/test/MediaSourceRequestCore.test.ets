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

const TAG: string = '[Sample_MediaSourceRequestCore]';
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

export default function mediaSourceRequestCoreTest(): void {
  describe('mediaSourceRequestCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0001
     * @tc.name      testSafeRequest0001
     * @tc.desc      Loading request 1 responds for offset 0 length 32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 1;
      const offset: number = 0;
      const length: number = 32;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(31);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0002
     * @tc.name      testSafeRequest0002
     * @tc.desc      Loading request 2 responds for offset 64 length 33.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 2;
      const offset: number = 64;
      const length: number = 33;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(96);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0003
     * @tc.name      testSafeRequest0003
     * @tc.desc      Loading request 3 responds for offset 128 length 34.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 3;
      const offset: number = 128;
      const length: number = 34;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(161);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0004
     * @tc.name      testSafeRequest0004
     * @tc.desc      Loading request 4 responds for offset 192 length 35.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 4;
      const offset: number = 192;
      const length: number = 35;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(226);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0005
     * @tc.name      testSafeRequest0005
     * @tc.desc      Loading request 5 responds for offset 256 length 36.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 5;
      const offset: number = 256;
      const length: number = 36;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(291);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0006
     * @tc.name      testSafeRequest0006
     * @tc.desc      Loading request 6 responds for offset 320 length 37.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 6;
      const offset: number = 320;
      const length: number = 37;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(356);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0007
     * @tc.name      testSafeRequest0007
     * @tc.desc      Loading request 7 responds for offset 384 length 38.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 7;
      const offset: number = 384;
      const length: number = 38;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(421);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0008
     * @tc.name      testSafeRequest0008
     * @tc.desc      Loading request 8 responds for offset 448 length 39.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 8;
      const offset: number = 448;
      const length: number = 39;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(486);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0009
     * @tc.name      testSafeRequest0009
     * @tc.desc      Loading request 9 responds for offset 512 length 40.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 9;
      const offset: number = 512;
      const length: number = 40;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(551);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0010
     * @tc.name      testSafeRequest0010
     * @tc.desc      Loading request 10 responds for offset 576 length 41.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 10;
      const offset: number = 576;
      const length: number = 41;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(616);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0011
     * @tc.name      testSafeRequest0011
     * @tc.desc      Loading request 11 responds for offset 640 length 42.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 11;
      const offset: number = 640;
      const length: number = 42;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(681);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0012
     * @tc.name      testSafeRequest0012
     * @tc.desc      Loading request 12 responds for offset 704 length 43.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 12;
      const offset: number = 704;
      const length: number = 43;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(746);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0013
     * @tc.name      testSafeRequest0013
     * @tc.desc      Loading request 13 responds for offset 768 length 44.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 13;
      const offset: number = 768;
      const length: number = 44;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(811);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0014
     * @tc.name      testSafeRequest0014
     * @tc.desc      Loading request 14 responds for offset 832 length 45.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 14;
      const offset: number = 832;
      const length: number = 45;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(876);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0015
     * @tc.name      testSafeRequest0015
     * @tc.desc      Loading request 15 responds for offset 896 length 46.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 15;
      const offset: number = 896;
      const length: number = 46;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(941);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0016
     * @tc.name      testSafeRequest0016
     * @tc.desc      Loading request 16 responds for offset 960 length 47.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 16;
      const offset: number = 960;
      const length: number = 47;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1006);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0017
     * @tc.name      testSafeRequest0017
     * @tc.desc      Loading request 17 responds for offset 1024 length 48.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 17;
      const offset: number = 1024;
      const length: number = 48;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1071);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0018
     * @tc.name      testSafeRequest0018
     * @tc.desc      Loading request 18 responds for offset 1088 length 49.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 18;
      const offset: number = 1088;
      const length: number = 49;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1136);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0019
     * @tc.name      testSafeRequest0019
     * @tc.desc      Loading request 19 responds for offset 1152 length 50.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 19;
      const offset: number = 1152;
      const length: number = 50;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1201);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0020
     * @tc.name      testSafeRequest0020
     * @tc.desc      Loading request 20 responds for offset 1216 length 51.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 20;
      const offset: number = 1216;
      const length: number = 51;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1266);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0021
     * @tc.name      testSafeRequest0021
     * @tc.desc      Loading request 21 responds for offset 1280 length 52.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 21;
      const offset: number = 1280;
      const length: number = 52;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1331);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0022
     * @tc.name      testSafeRequest0022
     * @tc.desc      Loading request 22 responds for offset 1344 length 53.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 22;
      const offset: number = 1344;
      const length: number = 53;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1396);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0023
     * @tc.name      testSafeRequest0023
     * @tc.desc      Loading request 23 responds for offset 1408 length 54.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 23;
      const offset: number = 1408;
      const length: number = 54;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1461);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0024
     * @tc.name      testSafeRequest0024
     * @tc.desc      Loading request 24 responds for offset 1472 length 55.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 24;
      const offset: number = 1472;
      const length: number = 55;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1526);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0025
     * @tc.name      testSafeRequest0025
     * @tc.desc      Loading request 25 responds for offset 1536 length 56.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 25;
      const offset: number = 1536;
      const length: number = 56;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1591);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0026
     * @tc.name      testSafeRequest0026
     * @tc.desc      Loading request 26 responds for offset 1600 length 57.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 26;
      const offset: number = 1600;
      const length: number = 57;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1656);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0027
     * @tc.name      testSafeRequest0027
     * @tc.desc      Loading request 27 responds for offset 1664 length 58.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 27;
      const offset: number = 1664;
      const length: number = 58;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1721);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0028
     * @tc.name      testSafeRequest0028
     * @tc.desc      Loading request 28 responds for offset 1728 length 59.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 28;
      const offset: number = 1728;
      const length: number = 59;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1786);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0029
     * @tc.name      testSafeRequest0029
     * @tc.desc      Loading request 29 responds for offset 1792 length 60.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 29;
      const offset: number = 1792;
      const length: number = 60;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1851);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0030
     * @tc.name      testSafeRequest0030
     * @tc.desc      Loading request 30 responds for offset 1856 length 61.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 30;
      const offset: number = 1856;
      const length: number = 61;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1916);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0031
     * @tc.name      testSafeRequest0031
     * @tc.desc      Loading request 31 responds for offset 1920 length 62.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 31;
      const offset: number = 1920;
      const length: number = 62;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(1981);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0032
     * @tc.name      testSafeRequest0032
     * @tc.desc      Loading request 32 responds for offset 1984 length 63.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 32;
      const offset: number = 1984;
      const length: number = 63;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2046);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0033
     * @tc.name      testSafeRequest0033
     * @tc.desc      Loading request 33 responds for offset 2048 length 64.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 33;
      const offset: number = 2048;
      const length: number = 64;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2111);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0034
     * @tc.name      testSafeRequest0034
     * @tc.desc      Loading request 34 responds for offset 2112 length 65.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 34;
      const offset: number = 2112;
      const length: number = 65;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2176);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0035
     * @tc.name      testSafeRequest0035
     * @tc.desc      Loading request 35 responds for offset 2176 length 66.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 35;
      const offset: number = 2176;
      const length: number = 66;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2241);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0036
     * @tc.name      testSafeRequest0036
     * @tc.desc      Loading request 36 responds for offset 2240 length 67.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 36;
      const offset: number = 2240;
      const length: number = 67;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2306);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0037
     * @tc.name      testSafeRequest0037
     * @tc.desc      Loading request 37 responds for offset 2304 length 68.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 37;
      const offset: number = 2304;
      const length: number = 68;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2371);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0038
     * @tc.name      testSafeRequest0038
     * @tc.desc      Loading request 38 responds for offset 2368 length 69.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 38;
      const offset: number = 2368;
      const length: number = 69;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2436);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0039
     * @tc.name      testSafeRequest0039
     * @tc.desc      Loading request 39 responds for offset 2432 length 70.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 39;
      const offset: number = 2432;
      const length: number = 70;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2501);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0040
     * @tc.name      testSafeRequest0040
     * @tc.desc      Loading request 40 responds for offset 2496 length 71.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 40;
      const offset: number = 2496;
      const length: number = 71;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2566);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0041
     * @tc.name      testSafeRequest0041
     * @tc.desc      Loading request 41 responds for offset 2560 length 72.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 41;
      const offset: number = 2560;
      const length: number = 72;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2631);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0042
     * @tc.name      testSafeRequest0042
     * @tc.desc      Loading request 42 responds for offset 2624 length 73.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 42;
      const offset: number = 2624;
      const length: number = 73;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2696);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0043
     * @tc.name      testSafeRequest0043
     * @tc.desc      Loading request 43 responds for offset 2688 length 74.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 43;
      const offset: number = 2688;
      const length: number = 74;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2761);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0044
     * @tc.name      testSafeRequest0044
     * @tc.desc      Loading request 44 responds for offset 2752 length 75.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 44;
      const offset: number = 2752;
      const length: number = 75;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2826);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0045
     * @tc.name      testSafeRequest0045
     * @tc.desc      Loading request 45 responds for offset 2816 length 76.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 45;
      const offset: number = 2816;
      const length: number = 76;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2891);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0046
     * @tc.name      testSafeRequest0046
     * @tc.desc      Loading request 46 responds for offset 2880 length 77.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 46;
      const offset: number = 2880;
      const length: number = 77;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(2956);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0047
     * @tc.name      testSafeRequest0047
     * @tc.desc      Loading request 47 responds for offset 2944 length 78.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 47;
      const offset: number = 2944;
      const length: number = 78;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3021);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0048
     * @tc.name      testSafeRequest0048
     * @tc.desc      Loading request 48 responds for offset 3008 length 79.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 48;
      const offset: number = 3008;
      const length: number = 79;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3086);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0049
     * @tc.name      testSafeRequest0049
     * @tc.desc      Loading request 49 responds for offset 3072 length 80.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 49;
      const offset: number = 3072;
      const length: number = 80;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3151);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0050
     * @tc.name      testSafeRequest0050
     * @tc.desc      Loading request 50 responds for offset 3136 length 81.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 50;
      const offset: number = 3136;
      const length: number = 81;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3216);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0051
     * @tc.name      testSafeRequest0051
     * @tc.desc      Loading request 51 responds for offset 3200 length 82.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 51;
      const offset: number = 3200;
      const length: number = 82;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3281);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0052
     * @tc.name      testSafeRequest0052
     * @tc.desc      Loading request 52 responds for offset 3264 length 83.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 52;
      const offset: number = 3264;
      const length: number = 83;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3346);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0053
     * @tc.name      testSafeRequest0053
     * @tc.desc      Loading request 53 responds for offset 3328 length 84.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 53;
      const offset: number = 3328;
      const length: number = 84;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3411);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0054
     * @tc.name      testSafeRequest0054
     * @tc.desc      Loading request 54 responds for offset 3392 length 85.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 54;
      const offset: number = 3392;
      const length: number = 85;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3476);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0055
     * @tc.name      testSafeRequest0055
     * @tc.desc      Loading request 55 responds for offset 3456 length 86.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 55;
      const offset: number = 3456;
      const length: number = 86;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3541);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0056
     * @tc.name      testSafeRequest0056
     * @tc.desc      Loading request 56 responds for offset 3520 length 87.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 56;
      const offset: number = 3520;
      const length: number = 87;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3606);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0057
     * @tc.name      testSafeRequest0057
     * @tc.desc      Loading request 57 responds for offset 3584 length 88.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 57;
      const offset: number = 3584;
      const length: number = 88;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3671);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0058
     * @tc.name      testSafeRequest0058
     * @tc.desc      Loading request 58 responds for offset 3648 length 89.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 58;
      const offset: number = 3648;
      const length: number = 89;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3736);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0059
     * @tc.name      testSafeRequest0059
     * @tc.desc      Loading request 59 responds for offset 3712 length 90.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 59;
      const offset: number = 3712;
      const length: number = 90;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3801);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0060
     * @tc.name      testSafeRequest0060
     * @tc.desc      Loading request 60 responds for offset 3776 length 91.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 60;
      const offset: number = 3776;
      const length: number = 91;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3866);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0061
     * @tc.name      testSafeRequest0061
     * @tc.desc      Loading request 61 responds for offset 3840 length 92.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 61;
      const offset: number = 3840;
      const length: number = 92;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3931);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0062
     * @tc.name      testSafeRequest0062
     * @tc.desc      Loading request 62 responds for offset 3904 length 93.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 62;
      const offset: number = 3904;
      const length: number = 93;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(3996);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0063
     * @tc.name      testSafeRequest0063
     * @tc.desc      Loading request 63 responds for offset 3968 length 94.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 63;
      const offset: number = 3968;
      const length: number = 94;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4061);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0064
     * @tc.name      testSafeRequest0064
     * @tc.desc      Loading request 64 responds for offset 4032 length 95.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 64;
      const offset: number = 4032;
      const length: number = 95;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4126);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0065
     * @tc.name      testSafeRequest0065
     * @tc.desc      Loading request 65 responds for offset 4096 length 96.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 65;
      const offset: number = 4096;
      const length: number = 96;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4191);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0066
     * @tc.name      testSafeRequest0066
     * @tc.desc      Loading request 66 responds for offset 4160 length 97.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 66;
      const offset: number = 4160;
      const length: number = 97;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4256);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0067
     * @tc.name      testSafeRequest0067
     * @tc.desc      Loading request 67 responds for offset 4224 length 98.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 67;
      const offset: number = 4224;
      const length: number = 98;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4321);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0068
     * @tc.name      testSafeRequest0068
     * @tc.desc      Loading request 68 responds for offset 4288 length 99.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 68;
      const offset: number = 4288;
      const length: number = 99;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4386);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0069
     * @tc.name      testSafeRequest0069
     * @tc.desc      Loading request 69 responds for offset 4352 length 100.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 69;
      const offset: number = 4352;
      const length: number = 100;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4451);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0070
     * @tc.name      testSafeRequest0070
     * @tc.desc      Loading request 70 responds for offset 4416 length 101.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 70;
      const offset: number = 4416;
      const length: number = 101;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4516);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0071
     * @tc.name      testSafeRequest0071
     * @tc.desc      Loading request 71 responds for offset 4480 length 102.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 71;
      const offset: number = 4480;
      const length: number = 102;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4581);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0072
     * @tc.name      testSafeRequest0072
     * @tc.desc      Loading request 72 responds for offset 4544 length 103.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 72;
      const offset: number = 4544;
      const length: number = 103;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4646);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0073
     * @tc.name      testSafeRequest0073
     * @tc.desc      Loading request 73 responds for offset 4608 length 104.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 73;
      const offset: number = 4608;
      const length: number = 104;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4711);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0074
     * @tc.name      testSafeRequest0074
     * @tc.desc      Loading request 74 responds for offset 4672 length 105.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 74;
      const offset: number = 4672;
      const length: number = 105;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4776);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0075
     * @tc.name      testSafeRequest0075
     * @tc.desc      Loading request 75 responds for offset 4736 length 106.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 75;
      const offset: number = 4736;
      const length: number = 106;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4841);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0076
     * @tc.name      testSafeRequest0076
     * @tc.desc      Loading request 76 responds for offset 4800 length 107.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 76;
      const offset: number = 4800;
      const length: number = 107;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4906);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0077
     * @tc.name      testSafeRequest0077
     * @tc.desc      Loading request 77 responds for offset 4864 length 108.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 77;
      const offset: number = 4864;
      const length: number = 108;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(4971);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0078
     * @tc.name      testSafeRequest0078
     * @tc.desc      Loading request 78 responds for offset 4928 length 109.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 78;
      const offset: number = 4928;
      const length: number = 109;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5036);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0079
     * @tc.name      testSafeRequest0079
     * @tc.desc      Loading request 79 responds for offset 4992 length 110.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 79;
      const offset: number = 4992;
      const length: number = 110;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5101);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0080
     * @tc.name      testSafeRequest0080
     * @tc.desc      Loading request 80 responds for offset 5056 length 111.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 80;
      const offset: number = 5056;
      const length: number = 111;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5166);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0081
     * @tc.name      testSafeRequest0081
     * @tc.desc      Loading request 81 responds for offset 5120 length 112.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 81;
      const offset: number = 5120;
      const length: number = 112;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5231);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0082
     * @tc.name      testSafeRequest0082
     * @tc.desc      Loading request 82 responds for offset 5184 length 113.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 82;
      const offset: number = 5184;
      const length: number = 113;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5296);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0083
     * @tc.name      testSafeRequest0083
     * @tc.desc      Loading request 83 responds for offset 5248 length 114.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 83;
      const offset: number = 5248;
      const length: number = 114;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5361);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0084
     * @tc.name      testSafeRequest0084
     * @tc.desc      Loading request 84 responds for offset 5312 length 115.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 84;
      const offset: number = 5312;
      const length: number = 115;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5426);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0085
     * @tc.name      testSafeRequest0085
     * @tc.desc      Loading request 85 responds for offset 5376 length 116.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 85;
      const offset: number = 5376;
      const length: number = 116;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5491);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0086
     * @tc.name      testSafeRequest0086
     * @tc.desc      Loading request 86 responds for offset 5440 length 117.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 86;
      const offset: number = 5440;
      const length: number = 117;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5556);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0087
     * @tc.name      testSafeRequest0087
     * @tc.desc      Loading request 87 responds for offset 5504 length 118.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 87;
      const offset: number = 5504;
      const length: number = 118;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5621);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0088
     * @tc.name      testSafeRequest0088
     * @tc.desc      Loading request 88 responds for offset 5568 length 119.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 88;
      const offset: number = 5568;
      const length: number = 119;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5686);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0089
     * @tc.name      testSafeRequest0089
     * @tc.desc      Loading request 89 responds for offset 5632 length 120.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 89;
      const offset: number = 5632;
      const length: number = 120;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5751);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0090
     * @tc.name      testSafeRequest0090
     * @tc.desc      Loading request 90 responds for offset 5696 length 121.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 90;
      const offset: number = 5696;
      const length: number = 121;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5816);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0091
     * @tc.name      testSafeRequest0091
     * @tc.desc      Loading request 91 responds for offset 5760 length 122.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 91;
      const offset: number = 5760;
      const length: number = 122;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5881);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0092
     * @tc.name      testSafeRequest0092
     * @tc.desc      Loading request 92 responds for offset 5824 length 123.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 92;
      const offset: number = 5824;
      const length: number = 123;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(5946);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0093
     * @tc.name      testSafeRequest0093
     * @tc.desc      Loading request 93 responds for offset 5888 length 124.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 93;
      const offset: number = 5888;
      const length: number = 124;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(6011);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0094
     * @tc.name      testSafeRequest0094
     * @tc.desc      Loading request 94 responds for offset 5952 length 125.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 94;
      const offset: number = 5952;
      const length: number = 125;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(6076);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0095
     * @tc.name      testSafeRequest0095
     * @tc.desc      Loading request 95 responds for offset 6016 length 126.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 95;
      const offset: number = 6016;
      const length: number = 126;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(6141);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0096
     * @tc.name      testSafeRequest0096
     * @tc.desc      Loading request 96 responds for offset 6080 length 127.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 96;
      const offset: number = 6080;
      const length: number = 127;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(6206);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0097
     * @tc.name      testSafeRequest0097
     * @tc.desc      Loading request 97 responds for offset 6144 length 128.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 97;
      const offset: number = 6144;
      const length: number = 128;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(6271);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0098
     * @tc.name      testSafeRequest0098
     * @tc.desc      Loading request 98 responds for offset 6208 length 129.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 98;
      const offset: number = 6208;
      const length: number = 129;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(6336);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0099
     * @tc.name      testSafeRequest0099
     * @tc.desc      Loading request 99 responds for offset 6272 length 130.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 99;
      const offset: number = 6272;
      const length: number = 130;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(6401);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_REQ_0100
     * @tc.name      testSafeRequest0100
     * @tc.desc      Loading request 100 responds for offset 6336 length 131.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 100;
      const offset: number = 6336;
      const length: number = 131;
      const end: number = offset + length - 1;
      expect(uuid).assertLarger(0);
      expect(offset).assertLargerOrEqual(0);
      expect(length).assertLarger(0);
      expect(end).assertEqual(6466);
    })
  })
}
