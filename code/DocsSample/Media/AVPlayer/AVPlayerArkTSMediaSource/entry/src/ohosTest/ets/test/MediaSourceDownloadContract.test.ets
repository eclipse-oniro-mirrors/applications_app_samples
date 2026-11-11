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
import { DownloadPool, FileInfo, FileType, ProgressType } from '../../../main/ets/components/download';

const TAG: string = '[Sample_MediaSourceDownloadContract]';
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

export default function mediaSourceDownloadContractTest(): void {
  describe('mediaSourceDownloadContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0001
     * @tc.name      testExtDownloadContract0000
     * @tc.desc      DownloadPool/FileInfo combination 1 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0002
     * @tc.name      testExtDownloadContract0001
     * @tc.desc      DownloadPool/FileInfo combination 2 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0003
     * @tc.name      testExtDownloadContract0002
     * @tc.desc      DownloadPool/FileInfo combination 3 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0004
     * @tc.name      testExtDownloadContract0003
     * @tc.desc      DownloadPool/FileInfo combination 4 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.LOCAL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0005
     * @tc.name      testExtDownloadContract0004
     * @tc.desc      DownloadPool/FileInfo combination 5 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.URL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0006
     * @tc.name      testExtDownloadContract0005
     * @tc.desc      DownloadPool/FileInfo combination 6 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0007
     * @tc.name      testExtDownloadContract0006
     * @tc.desc      DownloadPool/FileInfo combination 7 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0008
     * @tc.name      testExtDownloadContract0007
     * @tc.desc      DownloadPool/FileInfo combination 8 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0009
     * @tc.name      testExtDownloadContract0008
     * @tc.desc      DownloadPool/FileInfo combination 9 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0010
     * @tc.name      testExtDownloadContract0009
     * @tc.desc      DownloadPool/FileInfo combination 10 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.LOCAL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0011
     * @tc.name      testExtDownloadContract0010
     * @tc.desc      DownloadPool/FileInfo combination 11 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.URL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0012
     * @tc.name      testExtDownloadContract0011
     * @tc.desc      DownloadPool/FileInfo combination 12 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0013
     * @tc.name      testExtDownloadContract0012
     * @tc.desc      DownloadPool/FileInfo combination 13 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0014
     * @tc.name      testExtDownloadContract0013
     * @tc.desc      DownloadPool/FileInfo combination 14 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0015
     * @tc.name      testExtDownloadContract0014
     * @tc.desc      DownloadPool/FileInfo combination 15 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0016
     * @tc.name      testExtDownloadContract0015
     * @tc.desc      DownloadPool/FileInfo combination 16 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.LOCAL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0017
     * @tc.name      testExtDownloadContract0016
     * @tc.desc      DownloadPool/FileInfo combination 17 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.URL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0018
     * @tc.name      testExtDownloadContract0017
     * @tc.desc      DownloadPool/FileInfo combination 18 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0019
     * @tc.name      testExtDownloadContract0018
     * @tc.desc      DownloadPool/FileInfo combination 19 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0020
     * @tc.name      testExtDownloadContract0019
     * @tc.desc      DownloadPool/FileInfo combination 20 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0021
     * @tc.name      testExtDownloadContract0020
     * @tc.desc      DownloadPool/FileInfo combination 21 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0022
     * @tc.name      testExtDownloadContract0021
     * @tc.desc      DownloadPool/FileInfo combination 22 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.LOCAL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0023
     * @tc.name      testExtDownloadContract0022
     * @tc.desc      DownloadPool/FileInfo combination 23 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.URL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0024
     * @tc.name      testExtDownloadContract0023
     * @tc.desc      DownloadPool/FileInfo combination 24 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0025
     * @tc.name      testExtDownloadContract0024
     * @tc.desc      DownloadPool/FileInfo combination 25 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0026
     * @tc.name      testExtDownloadContract0025
     * @tc.desc      DownloadPool/FileInfo combination 26 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0027
     * @tc.name      testExtDownloadContract0026
     * @tc.desc      DownloadPool/FileInfo combination 27 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0028
     * @tc.name      testExtDownloadContract0027
     * @tc.desc      DownloadPool/FileInfo combination 28 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.LOCAL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0029
     * @tc.name      testExtDownloadContract0028
     * @tc.desc      DownloadPool/FileInfo combination 29 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.URL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0030
     * @tc.name      testExtDownloadContract0029
     * @tc.desc      DownloadPool/FileInfo combination 30 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0031
     * @tc.name      testExtDownloadContract0030
     * @tc.desc      DownloadPool/FileInfo combination 31 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0032
     * @tc.name      testExtDownloadContract0031
     * @tc.desc      DownloadPool/FileInfo combination 32 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0033
     * @tc.name      testExtDownloadContract0032
     * @tc.desc      DownloadPool/FileInfo combination 33 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0034
     * @tc.name      testExtDownloadContract0033
     * @tc.desc      DownloadPool/FileInfo combination 34 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.LOCAL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0035
     * @tc.name      testExtDownloadContract0034
     * @tc.desc      DownloadPool/FileInfo combination 35 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.URL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0036
     * @tc.name      testExtDownloadContract0035
     * @tc.desc      DownloadPool/FileInfo combination 36 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0037
     * @tc.name      testExtDownloadContract0036
     * @tc.desc      DownloadPool/FileInfo combination 37 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0038
     * @tc.name      testExtDownloadContract0037
     * @tc.desc      DownloadPool/FileInfo combination 38 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0039
     * @tc.name      testExtDownloadContract0038
     * @tc.desc      DownloadPool/FileInfo combination 39 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0040
     * @tc.name      testExtDownloadContract0039
     * @tc.desc      DownloadPool/FileInfo combination 40 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.LOCAL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0041
     * @tc.name      testExtDownloadContract0040
     * @tc.desc      DownloadPool/FileInfo combination 41 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.URL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0042
     * @tc.name      testExtDownloadContract0041
     * @tc.desc      DownloadPool/FileInfo combination 42 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0043
     * @tc.name      testExtDownloadContract0042
     * @tc.desc      DownloadPool/FileInfo combination 43 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0044
     * @tc.name      testExtDownloadContract0043
     * @tc.desc      DownloadPool/FileInfo combination 44 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0045
     * @tc.name      testExtDownloadContract0044
     * @tc.desc      DownloadPool/FileInfo combination 45 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0046
     * @tc.name      testExtDownloadContract0045
     * @tc.desc      DownloadPool/FileInfo combination 46 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.LOCAL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0047
     * @tc.name      testExtDownloadContract0046
     * @tc.desc      DownloadPool/FileInfo combination 47 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.URL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0048
     * @tc.name      testExtDownloadContract0047
     * @tc.desc      DownloadPool/FileInfo combination 48 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0049
     * @tc.name      testExtDownloadContract0048
     * @tc.desc      DownloadPool/FileInfo combination 49 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0050
     * @tc.name      testExtDownloadContract0049
     * @tc.desc      DownloadPool/FileInfo combination 50 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0051
     * @tc.name      testExtDownloadContract0050
     * @tc.desc      DownloadPool/FileInfo combination 51 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0052
     * @tc.name      testExtDownloadContract0051
     * @tc.desc      DownloadPool/FileInfo combination 52 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.LOCAL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0053
     * @tc.name      testExtDownloadContract0052
     * @tc.desc      DownloadPool/FileInfo combination 53 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.URL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0054
     * @tc.name      testExtDownloadContract0053
     * @tc.desc      DownloadPool/FileInfo combination 54 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0055
     * @tc.name      testExtDownloadContract0054
     * @tc.desc      DownloadPool/FileInfo combination 55 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0056
     * @tc.name      testExtDownloadContract0055
     * @tc.desc      DownloadPool/FileInfo combination 56 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0057
     * @tc.name      testExtDownloadContract0056
     * @tc.desc      DownloadPool/FileInfo combination 57 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0058
     * @tc.name      testExtDownloadContract0057
     * @tc.desc      DownloadPool/FileInfo combination 58 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.LOCAL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0059
     * @tc.name      testExtDownloadContract0058
     * @tc.desc      DownloadPool/FileInfo combination 59 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.URL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0060
     * @tc.name      testExtDownloadContract0059
     * @tc.desc      DownloadPool/FileInfo combination 60 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0061
     * @tc.name      testExtDownloadContract0060
     * @tc.desc      DownloadPool/FileInfo combination 61 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0062
     * @tc.name      testExtDownloadContract0061
     * @tc.desc      DownloadPool/FileInfo combination 62 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0063
     * @tc.name      testExtDownloadContract0062
     * @tc.desc      DownloadPool/FileInfo combination 63 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0064
     * @tc.name      testExtDownloadContract0063
     * @tc.desc      DownloadPool/FileInfo combination 64 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.LOCAL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0065
     * @tc.name      testExtDownloadContract0064
     * @tc.desc      DownloadPool/FileInfo combination 65 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.URL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0066
     * @tc.name      testExtDownloadContract0065
     * @tc.desc      DownloadPool/FileInfo combination 66 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0067
     * @tc.name      testExtDownloadContract0066
     * @tc.desc      DownloadPool/FileInfo combination 67 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0068
     * @tc.name      testExtDownloadContract0067
     * @tc.desc      DownloadPool/FileInfo combination 68 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0069
     * @tc.name      testExtDownloadContract0068
     * @tc.desc      DownloadPool/FileInfo combination 69 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0070
     * @tc.name      testExtDownloadContract0069
     * @tc.desc      DownloadPool/FileInfo combination 70 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.LOCAL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0071
     * @tc.name      testExtDownloadContract0070
     * @tc.desc      DownloadPool/FileInfo combination 71 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.URL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0072
     * @tc.name      testExtDownloadContract0071
     * @tc.desc      DownloadPool/FileInfo combination 72 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0073
     * @tc.name      testExtDownloadContract0072
     * @tc.desc      DownloadPool/FileInfo combination 73 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0074
     * @tc.name      testExtDownloadContract0073
     * @tc.desc      DownloadPool/FileInfo combination 74 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0075
     * @tc.name      testExtDownloadContract0074
     * @tc.desc      DownloadPool/FileInfo combination 75 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0076
     * @tc.name      testExtDownloadContract0075
     * @tc.desc      DownloadPool/FileInfo combination 76 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('', FileType.LOCAL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = '_updated';
      expect(info.fileName).assertEqual('_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0077
     * @tc.name      testExtDownloadContract0076
     * @tc.desc      DownloadPool/FileInfo combination 77 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('a', FileType.URL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('a');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'a_updated';
      expect(info.fileName).assertEqual('a_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0078
     * @tc.name      testExtDownloadContract0077
     * @tc.desc      DownloadPool/FileInfo combination 78 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('test_01.mp3', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('test_01.mp3');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'test_01.mp3_updated';
      expect(info.fileName).assertEqual('test_01.mp3_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0079
     * @tc.name      testExtDownloadContract0078
     * @tc.desc      DownloadPool/FileInfo combination 79 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('segment_0_0.data', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('segment_0_0.data');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      info.fileName = 'segment_0_0.data_updated';
      expect(info.fileName).assertEqual('segment_0_0.data_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_DLOAD_0080
     * @tc.name      testExtDownloadContract0079
     * @tc.desc      DownloadPool/FileInfo combination 80 keeps fields and mutability.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtDownloadContract0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pool: DownloadPool = new DownloadPool();
      const info: FileInfo = new FileInfo('file with space.dat', FileType.URL, ProgressType.GET_PTS);
      expect(pool instanceof DownloadPool).assertTrue();
      expect(info.fileName).assertEqual('file with space.dat');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      info.fileName = 'file with space.dat_updated';
      expect(info.fileName).assertEqual('file with space.dat_updated');
      expect(info.fileName.length).assertLargerOrEqual(0);
    })
  });
}
