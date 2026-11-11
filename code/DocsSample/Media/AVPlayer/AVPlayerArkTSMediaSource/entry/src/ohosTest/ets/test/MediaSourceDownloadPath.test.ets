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
import { beforeEach, describe, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_MediaSourceDownloadPath]';
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

export default function mediaSourceDownloadPathTest(): void {
  describe('mediaSourceDownloadPathTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0001
     * @tc.name      testExtDownloadPath0000
     * @tc.desc      Cache path for uuid 0 offset 0 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 0;
      const offset: number = 0;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_0_0.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0002
     * @tc.name      testExtDownloadPath0001
     * @tc.desc      Cache path for uuid 1 offset 1 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 1;
      const offset: number = 1;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_1_1.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0003
     * @tc.name      testExtDownloadPath0002
     * @tc.desc      Cache path for uuid 2 offset 1023 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 2;
      const offset: number = 1023;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_2_1023.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0004
     * @tc.name      testExtDownloadPath0003
     * @tc.desc      Cache path for uuid 3 offset 1024 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 3;
      const offset: number = 1024;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_3_1024.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0005
     * @tc.name      testExtDownloadPath0004
     * @tc.desc      Cache path for uuid 4 offset 65535 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 4;
      const offset: number = 65535;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_4_65535.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0006
     * @tc.name      testExtDownloadPath0005
     * @tc.desc      Cache path for uuid 5 offset 1048576 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 5;
      const offset: number = 1048576;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_5_1048576.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0007
     * @tc.name      testExtDownloadPath0006
     * @tc.desc      Cache path for uuid 6 offset 7 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 6;
      const offset: number = 7;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_6_7.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0008
     * @tc.name      testExtDownloadPath0007
     * @tc.desc      Cache path for uuid 7 offset 8 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 7;
      const offset: number = 8;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_7_8.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0009
     * @tc.name      testExtDownloadPath0008
     * @tc.desc      Cache path for uuid 8 offset 1030 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 8;
      const offset: number = 1030;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_8_1030.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0010
     * @tc.name      testExtDownloadPath0009
     * @tc.desc      Cache path for uuid 9 offset 1031 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 9;
      const offset: number = 1031;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_9_1031.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0011
     * @tc.name      testExtDownloadPath0010
     * @tc.desc      Cache path for uuid 10 offset 65542 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 10;
      const offset: number = 65542;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_10_65542.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0012
     * @tc.name      testExtDownloadPath0011
     * @tc.desc      Cache path for uuid 11 offset 1048583 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 11;
      const offset: number = 1048583;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_11_1048583.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0013
     * @tc.name      testExtDownloadPath0012
     * @tc.desc      Cache path for uuid 12 offset 14 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 12;
      const offset: number = 14;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_12_14.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0014
     * @tc.name      testExtDownloadPath0013
     * @tc.desc      Cache path for uuid 13 offset 15 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 13;
      const offset: number = 15;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_13_15.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0015
     * @tc.name      testExtDownloadPath0014
     * @tc.desc      Cache path for uuid 14 offset 1037 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 14;
      const offset: number = 1037;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_14_1037.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0016
     * @tc.name      testExtDownloadPath0015
     * @tc.desc      Cache path for uuid 15 offset 1038 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 15;
      const offset: number = 1038;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_15_1038.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0017
     * @tc.name      testExtDownloadPath0016
     * @tc.desc      Cache path for uuid 16 offset 65549 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 16;
      const offset: number = 65549;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_16_65549.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0018
     * @tc.name      testExtDownloadPath0017
     * @tc.desc      Cache path for uuid 17 offset 1048590 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 17;
      const offset: number = 1048590;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_17_1048590.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0019
     * @tc.name      testExtDownloadPath0018
     * @tc.desc      Cache path for uuid 18 offset 21 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 18;
      const offset: number = 21;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_18_21.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0020
     * @tc.name      testExtDownloadPath0019
     * @tc.desc      Cache path for uuid 19 offset 22 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 19;
      const offset: number = 22;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_19_22.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0021
     * @tc.name      testExtDownloadPath0020
     * @tc.desc      Cache path for uuid 20 offset 1044 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 20;
      const offset: number = 1044;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_20_1044.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0022
     * @tc.name      testExtDownloadPath0021
     * @tc.desc      Cache path for uuid 21 offset 1045 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 21;
      const offset: number = 1045;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_21_1045.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0023
     * @tc.name      testExtDownloadPath0022
     * @tc.desc      Cache path for uuid 22 offset 65556 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 22;
      const offset: number = 65556;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_22_65556.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0024
     * @tc.name      testExtDownloadPath0023
     * @tc.desc      Cache path for uuid 23 offset 1048597 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 23;
      const offset: number = 1048597;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_23_1048597.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0025
     * @tc.name      testExtDownloadPath0024
     * @tc.desc      Cache path for uuid 24 offset 28 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 24;
      const offset: number = 28;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_24_28.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0026
     * @tc.name      testExtDownloadPath0025
     * @tc.desc      Cache path for uuid 25 offset 29 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 25;
      const offset: number = 29;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_25_29.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0027
     * @tc.name      testExtDownloadPath0026
     * @tc.desc      Cache path for uuid 26 offset 1051 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 26;
      const offset: number = 1051;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_26_1051.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0028
     * @tc.name      testExtDownloadPath0027
     * @tc.desc      Cache path for uuid 27 offset 1052 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 27;
      const offset: number = 1052;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_27_1052.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0029
     * @tc.name      testExtDownloadPath0028
     * @tc.desc      Cache path for uuid 28 offset 65563 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 28;
      const offset: number = 65563;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_28_65563.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0030
     * @tc.name      testExtDownloadPath0029
     * @tc.desc      Cache path for uuid 29 offset 1048604 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 29;
      const offset: number = 1048604;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_29_1048604.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0031
     * @tc.name      testExtDownloadPath0030
     * @tc.desc      Cache path for uuid 30 offset 35 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 30;
      const offset: number = 35;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_30_35.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0032
     * @tc.name      testExtDownloadPath0031
     * @tc.desc      Cache path for uuid 31 offset 36 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 31;
      const offset: number = 36;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_31_36.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0033
     * @tc.name      testExtDownloadPath0032
     * @tc.desc      Cache path for uuid 32 offset 1058 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 32;
      const offset: number = 1058;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_32_1058.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0034
     * @tc.name      testExtDownloadPath0033
     * @tc.desc      Cache path for uuid 33 offset 1059 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 33;
      const offset: number = 1059;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_33_1059.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0035
     * @tc.name      testExtDownloadPath0034
     * @tc.desc      Cache path for uuid 34 offset 65570 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 34;
      const offset: number = 65570;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_34_65570.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0036
     * @tc.name      testExtDownloadPath0035
     * @tc.desc      Cache path for uuid 35 offset 1048611 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 35;
      const offset: number = 1048611;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_35_1048611.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0037
     * @tc.name      testExtDownloadPath0036
     * @tc.desc      Cache path for uuid 36 offset 42 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 36;
      const offset: number = 42;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_36_42.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0038
     * @tc.name      testExtDownloadPath0037
     * @tc.desc      Cache path for uuid 37 offset 43 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 37;
      const offset: number = 43;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_37_43.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0039
     * @tc.name      testExtDownloadPath0038
     * @tc.desc      Cache path for uuid 38 offset 1065 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 38;
      const offset: number = 1065;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_38_1065.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0040
     * @tc.name      testExtDownloadPath0039
     * @tc.desc      Cache path for uuid 39 offset 1066 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 39;
      const offset: number = 1066;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_39_1066.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0041
     * @tc.name      testExtDownloadPath0040
     * @tc.desc      Cache path for uuid 40 offset 65577 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 40;
      const offset: number = 65577;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_40_65577.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0042
     * @tc.name      testExtDownloadPath0041
     * @tc.desc      Cache path for uuid 41 offset 1048618 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 41;
      const offset: number = 1048618;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_41_1048618.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0043
     * @tc.name      testExtDownloadPath0042
     * @tc.desc      Cache path for uuid 42 offset 49 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 42;
      const offset: number = 49;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_42_49.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0044
     * @tc.name      testExtDownloadPath0043
     * @tc.desc      Cache path for uuid 43 offset 50 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 43;
      const offset: number = 50;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_43_50.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0045
     * @tc.name      testExtDownloadPath0044
     * @tc.desc      Cache path for uuid 44 offset 1072 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 44;
      const offset: number = 1072;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_44_1072.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0046
     * @tc.name      testExtDownloadPath0045
     * @tc.desc      Cache path for uuid 45 offset 1073 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 45;
      const offset: number = 1073;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_45_1073.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0047
     * @tc.name      testExtDownloadPath0046
     * @tc.desc      Cache path for uuid 46 offset 65584 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 46;
      const offset: number = 65584;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_46_65584.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0048
     * @tc.name      testExtDownloadPath0047
     * @tc.desc      Cache path for uuid 47 offset 1048625 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 47;
      const offset: number = 1048625;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_47_1048625.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0049
     * @tc.name      testExtDownloadPath0048
     * @tc.desc      Cache path for uuid 48 offset 56 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 48;
      const offset: number = 56;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_48_56.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0050
     * @tc.name      testExtDownloadPath0049
     * @tc.desc      Cache path for uuid 49 offset 57 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 49;
      const offset: number = 57;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_49_57.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0051
     * @tc.name      testExtDownloadPath0050
     * @tc.desc      Cache path for uuid 50 offset 1079 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 50;
      const offset: number = 1079;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_50_1079.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0052
     * @tc.name      testExtDownloadPath0051
     * @tc.desc      Cache path for uuid 51 offset 1080 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 51;
      const offset: number = 1080;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_51_1080.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0053
     * @tc.name      testExtDownloadPath0052
     * @tc.desc      Cache path for uuid 52 offset 65591 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 52;
      const offset: number = 65591;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_52_65591.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0054
     * @tc.name      testExtDownloadPath0053
     * @tc.desc      Cache path for uuid 53 offset 1048632 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 53;
      const offset: number = 1048632;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_53_1048632.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0055
     * @tc.name      testExtDownloadPath0054
     * @tc.desc      Cache path for uuid 54 offset 63 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 54;
      const offset: number = 63;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_54_63.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0056
     * @tc.name      testExtDownloadPath0055
     * @tc.desc      Cache path for uuid 55 offset 64 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 55;
      const offset: number = 64;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_55_64.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0057
     * @tc.name      testExtDownloadPath0056
     * @tc.desc      Cache path for uuid 56 offset 1086 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 56;
      const offset: number = 1086;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_56_1086.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0058
     * @tc.name      testExtDownloadPath0057
     * @tc.desc      Cache path for uuid 57 offset 1087 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 57;
      const offset: number = 1087;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_57_1087.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0059
     * @tc.name      testExtDownloadPath0058
     * @tc.desc      Cache path for uuid 58 offset 65598 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 58;
      const offset: number = 65598;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_58_65598.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0060
     * @tc.name      testExtDownloadPath0059
     * @tc.desc      Cache path for uuid 59 offset 1048639 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 59;
      const offset: number = 1048639;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_59_1048639.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0061
     * @tc.name      testExtDownloadPath0060
     * @tc.desc      Cache path for uuid 60 offset 70 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 60;
      const offset: number = 70;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_60_70.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0062
     * @tc.name      testExtDownloadPath0061
     * @tc.desc      Cache path for uuid 61 offset 71 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 61;
      const offset: number = 71;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_61_71.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0063
     * @tc.name      testExtDownloadPath0062
     * @tc.desc      Cache path for uuid 62 offset 1093 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 62;
      const offset: number = 1093;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_62_1093.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0064
     * @tc.name      testExtDownloadPath0063
     * @tc.desc      Cache path for uuid 63 offset 1094 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 63;
      const offset: number = 1094;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_63_1094.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0065
     * @tc.name      testExtDownloadPath0064
     * @tc.desc      Cache path for uuid 64 offset 65605 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 64;
      const offset: number = 65605;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_64_65605.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0066
     * @tc.name      testExtDownloadPath0065
     * @tc.desc      Cache path for uuid 65 offset 1048646 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 65;
      const offset: number = 1048646;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_65_1048646.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0067
     * @tc.name      testExtDownloadPath0066
     * @tc.desc      Cache path for uuid 66 offset 77 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 66;
      const offset: number = 77;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_66_77.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0068
     * @tc.name      testExtDownloadPath0067
     * @tc.desc      Cache path for uuid 67 offset 78 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 67;
      const offset: number = 78;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_67_78.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0069
     * @tc.name      testExtDownloadPath0068
     * @tc.desc      Cache path for uuid 68 offset 1100 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 68;
      const offset: number = 1100;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_68_1100.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0070
     * @tc.name      testExtDownloadPath0069
     * @tc.desc      Cache path for uuid 69 offset 1101 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 69;
      const offset: number = 1101;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_69_1101.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0071
     * @tc.name      testExtDownloadPath0070
     * @tc.desc      Cache path for uuid 70 offset 65612 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 70;
      const offset: number = 65612;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_70_65612.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0072
     * @tc.name      testExtDownloadPath0071
     * @tc.desc      Cache path for uuid 71 offset 1048653 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 71;
      const offset: number = 1048653;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_71_1048653.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0073
     * @tc.name      testExtDownloadPath0072
     * @tc.desc      Cache path for uuid 72 offset 84 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 72;
      const offset: number = 84;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_72_84.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0074
     * @tc.name      testExtDownloadPath0073
     * @tc.desc      Cache path for uuid 73 offset 85 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 73;
      const offset: number = 85;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_73_85.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0075
     * @tc.name      testExtDownloadPath0074
     * @tc.desc      Cache path for uuid 74 offset 1107 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 74;
      const offset: number = 1107;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_74_1107.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0076
     * @tc.name      testExtDownloadPath0075
     * @tc.desc      Cache path for uuid 75 offset 1108 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 75;
      const offset: number = 1108;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_75_1108.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0077
     * @tc.name      testExtDownloadPath0076
     * @tc.desc      Cache path for uuid 76 offset 65619 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 76;
      const offset: number = 65619;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_76_65619.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0078
     * @tc.name      testExtDownloadPath0077
     * @tc.desc      Cache path for uuid 77 offset 1048660 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 77;
      const offset: number = 1048660;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_77_1048660.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0079
     * @tc.name      testExtDownloadPath0078
     * @tc.desc      Cache path for uuid 78 offset 91 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 78;
      const offset: number = 91;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_78_91.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PATH_0080
     * @tc.name      testExtDownloadPath0079
     * @tc.desc      Cache path for uuid 79 offset 92 is stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadPath0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uuid: number = 79;
      const offset: number = 92;
      const filePath: string = `/data/storage/el2/base/haps/entry/files/segment_${uuid}_${offset}.data`;
      expect(filePath).assertEqual('/data/storage/el2/base/haps/entry/files/segment_79_92.data');
      expect(filePath.startsWith('/data/storage/el2/base/haps/entry/files/segment_')).assertTrue();
      expect(filePath.endsWith('.data')).assertTrue();
      expect(filePath.indexOf('_' + uuid + '_' + offset + '.data') >= 0).assertTrue();
      expect(filePath.length).assertLarger(0);
    })
  });
}
