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

import { describe, expect, it, Level, Size, TestType, beforeAll, afterAll } from '@ohos/hypium';
import { fileIo as fs } from '@kit.CoreFileKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

let ROOT: string = '';
function writeFile(path: string, content: string): void {
  const file: fs.File = fs.openSync(path,
    fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
  fs.writeSync(file.fd, content);
  fs.closeSync(file);
}

export default function dfmaFileOpsTest(): void {
  describe('DfmaFileOpsTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_ops';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try {
        fs.rmdirSync(ROOT);
      } catch (err) {
      }
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_0100
     * @tc.name      testDfmaFileOps0001
     * @tc.desc      Verify rename operation case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_001.txt', 'rename_content_001');
          fs.renameSync(ROOT + '/rename_src_001.txt', ROOT + '/rename_dst_001.txt');
          expect(fs.accessSync(ROOT + '/rename_src_001.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_001.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_001.txt')).assertEqual('rename_content_001');
          fs.unlinkSync(ROOT + '/rename_dst_001.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_0200
     * @tc.name      testDfmaFileOps0002
     * @tc.desc      Verify rename operation case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_002.txt', 'rename_content_002');
          fs.renameSync(ROOT + '/rename_src_002.txt', ROOT + '/rename_dst_002.txt');
          expect(fs.accessSync(ROOT + '/rename_src_002.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_002.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_002.txt')).assertEqual('rename_content_002');
          fs.unlinkSync(ROOT + '/rename_dst_002.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_0300
     * @tc.name      testDfmaFileOps0003
     * @tc.desc      Verify rename operation case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_003.txt', 'rename_content_003');
          fs.renameSync(ROOT + '/rename_src_003.txt', ROOT + '/rename_dst_003.txt');
          expect(fs.accessSync(ROOT + '/rename_src_003.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_003.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_003.txt')).assertEqual('rename_content_003');
          fs.unlinkSync(ROOT + '/rename_dst_003.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_0400
     * @tc.name      testDfmaFileOps0004
     * @tc.desc      Verify rename operation case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_004.txt', 'rename_content_004');
          fs.renameSync(ROOT + '/rename_src_004.txt', ROOT + '/rename_dst_004.txt');
          expect(fs.accessSync(ROOT + '/rename_src_004.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_004.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_004.txt')).assertEqual('rename_content_004');
          fs.unlinkSync(ROOT + '/rename_dst_004.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_0500
     * @tc.name      testDfmaFileOps0005
     * @tc.desc      Verify rename operation case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_005.txt', 'rename_content_005');
          fs.renameSync(ROOT + '/rename_src_005.txt', ROOT + '/rename_dst_005.txt');
          expect(fs.accessSync(ROOT + '/rename_src_005.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_005.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_005.txt')).assertEqual('rename_content_005');
          fs.unlinkSync(ROOT + '/rename_dst_005.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_0600
     * @tc.name      testDfmaFileOps0006
     * @tc.desc      Verify rename operation case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_006.txt', 'rename_content_006');
          fs.renameSync(ROOT + '/rename_src_006.txt', ROOT + '/rename_dst_006.txt');
          expect(fs.accessSync(ROOT + '/rename_src_006.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_006.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_006.txt')).assertEqual('rename_content_006');
          fs.unlinkSync(ROOT + '/rename_dst_006.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_0700
     * @tc.name      testDfmaFileOps0007
     * @tc.desc      Verify rename operation case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_007.txt', 'rename_content_007');
          fs.renameSync(ROOT + '/rename_src_007.txt', ROOT + '/rename_dst_007.txt');
          expect(fs.accessSync(ROOT + '/rename_src_007.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_007.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_007.txt')).assertEqual('rename_content_007');
          fs.unlinkSync(ROOT + '/rename_dst_007.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_0800
     * @tc.name      testDfmaFileOps0008
     * @tc.desc      Verify rename operation case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_008.txt', 'rename_content_008');
          fs.renameSync(ROOT + '/rename_src_008.txt', ROOT + '/rename_dst_008.txt');
          expect(fs.accessSync(ROOT + '/rename_src_008.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_008.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_008.txt')).assertEqual('rename_content_008');
          fs.unlinkSync(ROOT + '/rename_dst_008.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_0900
     * @tc.name      testDfmaFileOps0009
     * @tc.desc      Verify rename operation case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_009.txt', 'rename_content_009');
          fs.renameSync(ROOT + '/rename_src_009.txt', ROOT + '/rename_dst_009.txt');
          expect(fs.accessSync(ROOT + '/rename_src_009.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_009.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_009.txt')).assertEqual('rename_content_009');
          fs.unlinkSync(ROOT + '/rename_dst_009.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_1000
     * @tc.name      testDfmaFileOps0010
     * @tc.desc      Verify rename operation case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_010.txt', 'rename_content_010');
          fs.renameSync(ROOT + '/rename_src_010.txt', ROOT + '/rename_dst_010.txt');
          expect(fs.accessSync(ROOT + '/rename_src_010.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_010.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_010.txt')).assertEqual('rename_content_010');
          fs.unlinkSync(ROOT + '/rename_dst_010.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_1100
     * @tc.name      testDfmaFileOps0011
     * @tc.desc      Verify rename operation case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_011.txt', 'rename_content_011');
          fs.renameSync(ROOT + '/rename_src_011.txt', ROOT + '/rename_dst_011.txt');
          expect(fs.accessSync(ROOT + '/rename_src_011.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_011.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_011.txt')).assertEqual('rename_content_011');
          fs.unlinkSync(ROOT + '/rename_dst_011.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_1200
     * @tc.name      testDfmaFileOps0012
     * @tc.desc      Verify rename operation case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_012.txt', 'rename_content_012');
          fs.renameSync(ROOT + '/rename_src_012.txt', ROOT + '/rename_dst_012.txt');
          expect(fs.accessSync(ROOT + '/rename_src_012.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_012.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_012.txt')).assertEqual('rename_content_012');
          fs.unlinkSync(ROOT + '/rename_dst_012.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_1300
     * @tc.name      testDfmaFileOps0013
     * @tc.desc      Verify rename operation case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_013.txt', 'rename_content_013');
          fs.renameSync(ROOT + '/rename_src_013.txt', ROOT + '/rename_dst_013.txt');
          expect(fs.accessSync(ROOT + '/rename_src_013.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_013.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_013.txt')).assertEqual('rename_content_013');
          fs.unlinkSync(ROOT + '/rename_dst_013.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_1400
     * @tc.name      testDfmaFileOps0014
     * @tc.desc      Verify rename operation case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_014.txt', 'rename_content_014');
          fs.renameSync(ROOT + '/rename_src_014.txt', ROOT + '/rename_dst_014.txt');
          expect(fs.accessSync(ROOT + '/rename_src_014.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_014.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_014.txt')).assertEqual('rename_content_014');
          fs.unlinkSync(ROOT + '/rename_dst_014.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_1500
     * @tc.name      testDfmaFileOps0015
     * @tc.desc      Verify rename operation case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_015.txt', 'rename_content_015');
          fs.renameSync(ROOT + '/rename_src_015.txt', ROOT + '/rename_dst_015.txt');
          expect(fs.accessSync(ROOT + '/rename_src_015.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_015.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_015.txt')).assertEqual('rename_content_015');
          fs.unlinkSync(ROOT + '/rename_dst_015.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_1600
     * @tc.name      testDfmaFileOps0016
     * @tc.desc      Verify rename operation case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_016.txt', 'rename_content_016');
          fs.renameSync(ROOT + '/rename_src_016.txt', ROOT + '/rename_dst_016.txt');
          expect(fs.accessSync(ROOT + '/rename_src_016.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_016.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_016.txt')).assertEqual('rename_content_016');
          fs.unlinkSync(ROOT + '/rename_dst_016.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_1700
     * @tc.name      testDfmaFileOps0017
     * @tc.desc      Verify rename operation case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_017.txt', 'rename_content_017');
          fs.renameSync(ROOT + '/rename_src_017.txt', ROOT + '/rename_dst_017.txt');
          expect(fs.accessSync(ROOT + '/rename_src_017.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_017.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_017.txt')).assertEqual('rename_content_017');
          fs.unlinkSync(ROOT + '/rename_dst_017.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_1800
     * @tc.name      testDfmaFileOps0018
     * @tc.desc      Verify rename operation case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_018.txt', 'rename_content_018');
          fs.renameSync(ROOT + '/rename_src_018.txt', ROOT + '/rename_dst_018.txt');
          expect(fs.accessSync(ROOT + '/rename_src_018.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_018.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_018.txt')).assertEqual('rename_content_018');
          fs.unlinkSync(ROOT + '/rename_dst_018.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_1900
     * @tc.name      testDfmaFileOps0019
     * @tc.desc      Verify rename operation case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_019.txt', 'rename_content_019');
          fs.renameSync(ROOT + '/rename_src_019.txt', ROOT + '/rename_dst_019.txt');
          expect(fs.accessSync(ROOT + '/rename_src_019.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_019.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_019.txt')).assertEqual('rename_content_019');
          fs.unlinkSync(ROOT + '/rename_dst_019.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_2000
     * @tc.name      testDfmaFileOps0020
     * @tc.desc      Verify rename operation case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_020.txt', 'rename_content_020');
          fs.renameSync(ROOT + '/rename_src_020.txt', ROOT + '/rename_dst_020.txt');
          expect(fs.accessSync(ROOT + '/rename_src_020.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_020.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_020.txt')).assertEqual('rename_content_020');
          fs.unlinkSync(ROOT + '/rename_dst_020.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_2100
     * @tc.name      testDfmaFileOps0021
     * @tc.desc      Verify rename operation case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_021.txt', 'rename_content_021');
          fs.renameSync(ROOT + '/rename_src_021.txt', ROOT + '/rename_dst_021.txt');
          expect(fs.accessSync(ROOT + '/rename_src_021.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_021.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_021.txt')).assertEqual('rename_content_021');
          fs.unlinkSync(ROOT + '/rename_dst_021.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_2200
     * @tc.name      testDfmaFileOps0022
     * @tc.desc      Verify rename operation case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_022.txt', 'rename_content_022');
          fs.renameSync(ROOT + '/rename_src_022.txt', ROOT + '/rename_dst_022.txt');
          expect(fs.accessSync(ROOT + '/rename_src_022.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_022.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_022.txt')).assertEqual('rename_content_022');
          fs.unlinkSync(ROOT + '/rename_dst_022.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_2300
     * @tc.name      testDfmaFileOps0023
     * @tc.desc      Verify rename operation case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_023.txt', 'rename_content_023');
          fs.renameSync(ROOT + '/rename_src_023.txt', ROOT + '/rename_dst_023.txt');
          expect(fs.accessSync(ROOT + '/rename_src_023.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_023.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_023.txt')).assertEqual('rename_content_023');
          fs.unlinkSync(ROOT + '/rename_dst_023.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_2400
     * @tc.name      testDfmaFileOps0024
     * @tc.desc      Verify rename operation case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_024.txt', 'rename_content_024');
          fs.renameSync(ROOT + '/rename_src_024.txt', ROOT + '/rename_dst_024.txt');
          expect(fs.accessSync(ROOT + '/rename_src_024.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_024.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_024.txt')).assertEqual('rename_content_024');
          fs.unlinkSync(ROOT + '/rename_dst_024.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_2500
     * @tc.name      testDfmaFileOps0025
     * @tc.desc      Verify rename operation case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_025.txt', 'rename_content_025');
          fs.renameSync(ROOT + '/rename_src_025.txt', ROOT + '/rename_dst_025.txt');
          expect(fs.accessSync(ROOT + '/rename_src_025.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_025.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_025.txt')).assertEqual('rename_content_025');
          fs.unlinkSync(ROOT + '/rename_dst_025.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_2600
     * @tc.name      testDfmaFileOps0026
     * @tc.desc      Verify rename operation case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_026.txt', 'rename_content_026');
          fs.renameSync(ROOT + '/rename_src_026.txt', ROOT + '/rename_dst_026.txt');
          expect(fs.accessSync(ROOT + '/rename_src_026.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_026.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_026.txt')).assertEqual('rename_content_026');
          fs.unlinkSync(ROOT + '/rename_dst_026.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_2700
     * @tc.name      testDfmaFileOps0027
     * @tc.desc      Verify rename operation case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_027.txt', 'rename_content_027');
          fs.renameSync(ROOT + '/rename_src_027.txt', ROOT + '/rename_dst_027.txt');
          expect(fs.accessSync(ROOT + '/rename_src_027.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_027.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_027.txt')).assertEqual('rename_content_027');
          fs.unlinkSync(ROOT + '/rename_dst_027.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_2800
     * @tc.name      testDfmaFileOps0028
     * @tc.desc      Verify rename operation case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_028.txt', 'rename_content_028');
          fs.renameSync(ROOT + '/rename_src_028.txt', ROOT + '/rename_dst_028.txt');
          expect(fs.accessSync(ROOT + '/rename_src_028.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_028.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_028.txt')).assertEqual('rename_content_028');
          fs.unlinkSync(ROOT + '/rename_dst_028.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_2900
     * @tc.name      testDfmaFileOps0029
     * @tc.desc      Verify rename operation case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_029.txt', 'rename_content_029');
          fs.renameSync(ROOT + '/rename_src_029.txt', ROOT + '/rename_dst_029.txt');
          expect(fs.accessSync(ROOT + '/rename_src_029.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_029.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_029.txt')).assertEqual('rename_content_029');
          fs.unlinkSync(ROOT + '/rename_dst_029.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_3000
     * @tc.name      testDfmaFileOps0030
     * @tc.desc      Verify rename operation case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/rename_src_030.txt', 'rename_content_030');
          fs.renameSync(ROOT + '/rename_src_030.txt', ROOT + '/rename_dst_030.txt');
          expect(fs.accessSync(ROOT + '/rename_src_030.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/rename_dst_030.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/rename_dst_030.txt')).assertEqual('rename_content_030');
          fs.unlinkSync(ROOT + '/rename_dst_030.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_3100
     * @tc.name      testDfmaFileOps0031
     * @tc.desc      Verify copy operation case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_001.txt', 'copy_content_001');
          fs.copyFileSync(ROOT + '/copy_src_001.txt', ROOT + '/copy_dst_001.txt');
          expect(fs.accessSync(ROOT + '/copy_src_001.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_001.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_001.txt')).assertEqual('copy_content_001');
          fs.unlinkSync(ROOT + '/copy_dst_001.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_3200
     * @tc.name      testDfmaFileOps0032
     * @tc.desc      Verify copy operation case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_002.txt', 'copy_content_002');
          fs.copyFileSync(ROOT + '/copy_src_002.txt', ROOT + '/copy_dst_002.txt');
          expect(fs.accessSync(ROOT + '/copy_src_002.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_002.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_002.txt')).assertEqual('copy_content_002');
          fs.unlinkSync(ROOT + '/copy_dst_002.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_3300
     * @tc.name      testDfmaFileOps0033
     * @tc.desc      Verify copy operation case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_003.txt', 'copy_content_003');
          fs.copyFileSync(ROOT + '/copy_src_003.txt', ROOT + '/copy_dst_003.txt');
          expect(fs.accessSync(ROOT + '/copy_src_003.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_003.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_003.txt')).assertEqual('copy_content_003');
          fs.unlinkSync(ROOT + '/copy_dst_003.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_3400
     * @tc.name      testDfmaFileOps0034
     * @tc.desc      Verify copy operation case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_004.txt', 'copy_content_004');
          fs.copyFileSync(ROOT + '/copy_src_004.txt', ROOT + '/copy_dst_004.txt');
          expect(fs.accessSync(ROOT + '/copy_src_004.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_004.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_004.txt')).assertEqual('copy_content_004');
          fs.unlinkSync(ROOT + '/copy_dst_004.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_3500
     * @tc.name      testDfmaFileOps0035
     * @tc.desc      Verify copy operation case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_005.txt', 'copy_content_005');
          fs.copyFileSync(ROOT + '/copy_src_005.txt', ROOT + '/copy_dst_005.txt');
          expect(fs.accessSync(ROOT + '/copy_src_005.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_005.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_005.txt')).assertEqual('copy_content_005');
          fs.unlinkSync(ROOT + '/copy_dst_005.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_3600
     * @tc.name      testDfmaFileOps0036
     * @tc.desc      Verify copy operation case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_006.txt', 'copy_content_006');
          fs.copyFileSync(ROOT + '/copy_src_006.txt', ROOT + '/copy_dst_006.txt');
          expect(fs.accessSync(ROOT + '/copy_src_006.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_006.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_006.txt')).assertEqual('copy_content_006');
          fs.unlinkSync(ROOT + '/copy_dst_006.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_3700
     * @tc.name      testDfmaFileOps0037
     * @tc.desc      Verify copy operation case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_007.txt', 'copy_content_007');
          fs.copyFileSync(ROOT + '/copy_src_007.txt', ROOT + '/copy_dst_007.txt');
          expect(fs.accessSync(ROOT + '/copy_src_007.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_007.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_007.txt')).assertEqual('copy_content_007');
          fs.unlinkSync(ROOT + '/copy_dst_007.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_3800
     * @tc.name      testDfmaFileOps0038
     * @tc.desc      Verify copy operation case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_008.txt', 'copy_content_008');
          fs.copyFileSync(ROOT + '/copy_src_008.txt', ROOT + '/copy_dst_008.txt');
          expect(fs.accessSync(ROOT + '/copy_src_008.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_008.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_008.txt')).assertEqual('copy_content_008');
          fs.unlinkSync(ROOT + '/copy_dst_008.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_3900
     * @tc.name      testDfmaFileOps0039
     * @tc.desc      Verify copy operation case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_009.txt', 'copy_content_009');
          fs.copyFileSync(ROOT + '/copy_src_009.txt', ROOT + '/copy_dst_009.txt');
          expect(fs.accessSync(ROOT + '/copy_src_009.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_009.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_009.txt')).assertEqual('copy_content_009');
          fs.unlinkSync(ROOT + '/copy_dst_009.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_4000
     * @tc.name      testDfmaFileOps0040
     * @tc.desc      Verify copy operation case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_010.txt', 'copy_content_010');
          fs.copyFileSync(ROOT + '/copy_src_010.txt', ROOT + '/copy_dst_010.txt');
          expect(fs.accessSync(ROOT + '/copy_src_010.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_010.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_010.txt')).assertEqual('copy_content_010');
          fs.unlinkSync(ROOT + '/copy_dst_010.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_4100
     * @tc.name      testDfmaFileOps0041
     * @tc.desc      Verify copy operation case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_011.txt', 'copy_content_011');
          fs.copyFileSync(ROOT + '/copy_src_011.txt', ROOT + '/copy_dst_011.txt');
          expect(fs.accessSync(ROOT + '/copy_src_011.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_011.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_011.txt')).assertEqual('copy_content_011');
          fs.unlinkSync(ROOT + '/copy_dst_011.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_4200
     * @tc.name      testDfmaFileOps0042
     * @tc.desc      Verify copy operation case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_012.txt', 'copy_content_012');
          fs.copyFileSync(ROOT + '/copy_src_012.txt', ROOT + '/copy_dst_012.txt');
          expect(fs.accessSync(ROOT + '/copy_src_012.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_012.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_012.txt')).assertEqual('copy_content_012');
          fs.unlinkSync(ROOT + '/copy_dst_012.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_4300
     * @tc.name      testDfmaFileOps0043
     * @tc.desc      Verify copy operation case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_013.txt', 'copy_content_013');
          fs.copyFileSync(ROOT + '/copy_src_013.txt', ROOT + '/copy_dst_013.txt');
          expect(fs.accessSync(ROOT + '/copy_src_013.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_013.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_013.txt')).assertEqual('copy_content_013');
          fs.unlinkSync(ROOT + '/copy_dst_013.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_4400
     * @tc.name      testDfmaFileOps0044
     * @tc.desc      Verify copy operation case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_014.txt', 'copy_content_014');
          fs.copyFileSync(ROOT + '/copy_src_014.txt', ROOT + '/copy_dst_014.txt');
          expect(fs.accessSync(ROOT + '/copy_src_014.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_014.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_014.txt')).assertEqual('copy_content_014');
          fs.unlinkSync(ROOT + '/copy_dst_014.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_4500
     * @tc.name      testDfmaFileOps0045
     * @tc.desc      Verify copy operation case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_015.txt', 'copy_content_015');
          fs.copyFileSync(ROOT + '/copy_src_015.txt', ROOT + '/copy_dst_015.txt');
          expect(fs.accessSync(ROOT + '/copy_src_015.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_015.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_015.txt')).assertEqual('copy_content_015');
          fs.unlinkSync(ROOT + '/copy_dst_015.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
