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
        console.error('afterAll cleanup failed: ' + JSON.stringify(err));
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

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_4600
     * @tc.name      testDfmaFileOps0046
     * @tc.desc      Verify copy operation case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_016.txt', 'copy_content_016');
          fs.copyFileSync(ROOT + '/copy_src_016.txt', ROOT + '/copy_dst_016.txt');
          expect(fs.accessSync(ROOT + '/copy_src_016.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_016.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_016.txt')).assertEqual('copy_content_016');
          fs.unlinkSync(ROOT + '/copy_dst_016.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_4700
     * @tc.name      testDfmaFileOps0047
     * @tc.desc      Verify copy operation case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_017.txt', 'copy_content_017');
          fs.copyFileSync(ROOT + '/copy_src_017.txt', ROOT + '/copy_dst_017.txt');
          expect(fs.accessSync(ROOT + '/copy_src_017.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_017.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_017.txt')).assertEqual('copy_content_017');
          fs.unlinkSync(ROOT + '/copy_dst_017.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_4800
     * @tc.name      testDfmaFileOps0048
     * @tc.desc      Verify copy operation case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_018.txt', 'copy_content_018');
          fs.copyFileSync(ROOT + '/copy_src_018.txt', ROOT + '/copy_dst_018.txt');
          expect(fs.accessSync(ROOT + '/copy_src_018.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_018.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_018.txt')).assertEqual('copy_content_018');
          fs.unlinkSync(ROOT + '/copy_dst_018.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_4900
     * @tc.name      testDfmaFileOps0049
     * @tc.desc      Verify copy operation case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_019.txt', 'copy_content_019');
          fs.copyFileSync(ROOT + '/copy_src_019.txt', ROOT + '/copy_dst_019.txt');
          expect(fs.accessSync(ROOT + '/copy_src_019.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_019.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_019.txt')).assertEqual('copy_content_019');
          fs.unlinkSync(ROOT + '/copy_dst_019.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_5000
     * @tc.name      testDfmaFileOps0050
     * @tc.desc      Verify copy operation case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_020.txt', 'copy_content_020');
          fs.copyFileSync(ROOT + '/copy_src_020.txt', ROOT + '/copy_dst_020.txt');
          expect(fs.accessSync(ROOT + '/copy_src_020.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_020.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_020.txt')).assertEqual('copy_content_020');
          fs.unlinkSync(ROOT + '/copy_dst_020.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_5100
     * @tc.name      testDfmaFileOps0051
     * @tc.desc      Verify copy operation case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_021.txt', 'copy_content_021');
          fs.copyFileSync(ROOT + '/copy_src_021.txt', ROOT + '/copy_dst_021.txt');
          expect(fs.accessSync(ROOT + '/copy_src_021.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_021.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_021.txt')).assertEqual('copy_content_021');
          fs.unlinkSync(ROOT + '/copy_dst_021.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_5200
     * @tc.name      testDfmaFileOps0052
     * @tc.desc      Verify copy operation case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_022.txt', 'copy_content_022');
          fs.copyFileSync(ROOT + '/copy_src_022.txt', ROOT + '/copy_dst_022.txt');
          expect(fs.accessSync(ROOT + '/copy_src_022.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_022.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_022.txt')).assertEqual('copy_content_022');
          fs.unlinkSync(ROOT + '/copy_dst_022.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_5300
     * @tc.name      testDfmaFileOps0053
     * @tc.desc      Verify copy operation case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_023.txt', 'copy_content_023');
          fs.copyFileSync(ROOT + '/copy_src_023.txt', ROOT + '/copy_dst_023.txt');
          expect(fs.accessSync(ROOT + '/copy_src_023.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_023.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_023.txt')).assertEqual('copy_content_023');
          fs.unlinkSync(ROOT + '/copy_dst_023.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_5400
     * @tc.name      testDfmaFileOps0054
     * @tc.desc      Verify copy operation case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_024.txt', 'copy_content_024');
          fs.copyFileSync(ROOT + '/copy_src_024.txt', ROOT + '/copy_dst_024.txt');
          expect(fs.accessSync(ROOT + '/copy_src_024.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_024.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_024.txt')).assertEqual('copy_content_024');
          fs.unlinkSync(ROOT + '/copy_dst_024.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_5500
     * @tc.name      testDfmaFileOps0055
     * @tc.desc      Verify copy operation case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_025.txt', 'copy_content_025');
          fs.copyFileSync(ROOT + '/copy_src_025.txt', ROOT + '/copy_dst_025.txt');
          expect(fs.accessSync(ROOT + '/copy_src_025.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_025.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_025.txt')).assertEqual('copy_content_025');
          fs.unlinkSync(ROOT + '/copy_dst_025.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_5600
     * @tc.name      testDfmaFileOps0056
     * @tc.desc      Verify copy operation case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_026.txt', 'copy_content_026');
          fs.copyFileSync(ROOT + '/copy_src_026.txt', ROOT + '/copy_dst_026.txt');
          expect(fs.accessSync(ROOT + '/copy_src_026.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_026.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_026.txt')).assertEqual('copy_content_026');
          fs.unlinkSync(ROOT + '/copy_dst_026.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_5700
     * @tc.name      testDfmaFileOps0057
     * @tc.desc      Verify copy operation case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_027.txt', 'copy_content_027');
          fs.copyFileSync(ROOT + '/copy_src_027.txt', ROOT + '/copy_dst_027.txt');
          expect(fs.accessSync(ROOT + '/copy_src_027.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_027.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_027.txt')).assertEqual('copy_content_027');
          fs.unlinkSync(ROOT + '/copy_dst_027.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_5800
     * @tc.name      testDfmaFileOps0058
     * @tc.desc      Verify copy operation case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_028.txt', 'copy_content_028');
          fs.copyFileSync(ROOT + '/copy_src_028.txt', ROOT + '/copy_dst_028.txt');
          expect(fs.accessSync(ROOT + '/copy_src_028.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_028.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_028.txt')).assertEqual('copy_content_028');
          fs.unlinkSync(ROOT + '/copy_dst_028.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_5900
     * @tc.name      testDfmaFileOps0059
     * @tc.desc      Verify copy operation case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_029.txt', 'copy_content_029');
          fs.copyFileSync(ROOT + '/copy_src_029.txt', ROOT + '/copy_dst_029.txt');
          expect(fs.accessSync(ROOT + '/copy_src_029.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_029.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_029.txt')).assertEqual('copy_content_029');
          fs.unlinkSync(ROOT + '/copy_dst_029.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_6000
     * @tc.name      testDfmaFileOps0060
     * @tc.desc      Verify copy operation case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/copy_src_030.txt', 'copy_content_030');
          fs.copyFileSync(ROOT + '/copy_src_030.txt', ROOT + '/copy_dst_030.txt');
          expect(fs.accessSync(ROOT + '/copy_src_030.txt')).assertTrue();
          expect(fs.accessSync(ROOT + '/copy_dst_030.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/copy_dst_030.txt')).assertEqual('copy_content_030');
          fs.unlinkSync(ROOT + '/copy_dst_030.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_6100
     * @tc.name      testDfmaFileOps0061
     * @tc.desc      Verify move operation case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_001.txt', 'move_content_001');
          fs.moveFileSync(ROOT + '/move_src_001.txt', ROOT + '/move_dst_001.txt');
          expect(fs.accessSync(ROOT + '/move_src_001.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_001.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_001.txt')).assertEqual('move_content_001');
          fs.unlinkSync(ROOT + '/move_dst_001.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_6200
     * @tc.name      testDfmaFileOps0062
     * @tc.desc      Verify move operation case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_002.txt', 'move_content_002');
          fs.moveFileSync(ROOT + '/move_src_002.txt', ROOT + '/move_dst_002.txt');
          expect(fs.accessSync(ROOT + '/move_src_002.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_002.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_002.txt')).assertEqual('move_content_002');
          fs.unlinkSync(ROOT + '/move_dst_002.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_6300
     * @tc.name      testDfmaFileOps0063
     * @tc.desc      Verify move operation case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_003.txt', 'move_content_003');
          fs.moveFileSync(ROOT + '/move_src_003.txt', ROOT + '/move_dst_003.txt');
          expect(fs.accessSync(ROOT + '/move_src_003.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_003.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_003.txt')).assertEqual('move_content_003');
          fs.unlinkSync(ROOT + '/move_dst_003.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_6400
     * @tc.name      testDfmaFileOps0064
     * @tc.desc      Verify move operation case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_004.txt', 'move_content_004');
          fs.moveFileSync(ROOT + '/move_src_004.txt', ROOT + '/move_dst_004.txt');
          expect(fs.accessSync(ROOT + '/move_src_004.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_004.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_004.txt')).assertEqual('move_content_004');
          fs.unlinkSync(ROOT + '/move_dst_004.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_6500
     * @tc.name      testDfmaFileOps0065
     * @tc.desc      Verify move operation case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_005.txt', 'move_content_005');
          fs.moveFileSync(ROOT + '/move_src_005.txt', ROOT + '/move_dst_005.txt');
          expect(fs.accessSync(ROOT + '/move_src_005.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_005.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_005.txt')).assertEqual('move_content_005');
          fs.unlinkSync(ROOT + '/move_dst_005.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_6600
     * @tc.name      testDfmaFileOps0066
     * @tc.desc      Verify move operation case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_006.txt', 'move_content_006');
          fs.moveFileSync(ROOT + '/move_src_006.txt', ROOT + '/move_dst_006.txt');
          expect(fs.accessSync(ROOT + '/move_src_006.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_006.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_006.txt')).assertEqual('move_content_006');
          fs.unlinkSync(ROOT + '/move_dst_006.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_6700
     * @tc.name      testDfmaFileOps0067
     * @tc.desc      Verify move operation case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_007.txt', 'move_content_007');
          fs.moveFileSync(ROOT + '/move_src_007.txt', ROOT + '/move_dst_007.txt');
          expect(fs.accessSync(ROOT + '/move_src_007.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_007.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_007.txt')).assertEqual('move_content_007');
          fs.unlinkSync(ROOT + '/move_dst_007.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_6800
     * @tc.name      testDfmaFileOps0068
     * @tc.desc      Verify move operation case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_008.txt', 'move_content_008');
          fs.moveFileSync(ROOT + '/move_src_008.txt', ROOT + '/move_dst_008.txt');
          expect(fs.accessSync(ROOT + '/move_src_008.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_008.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_008.txt')).assertEqual('move_content_008');
          fs.unlinkSync(ROOT + '/move_dst_008.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_6900
     * @tc.name      testDfmaFileOps0069
     * @tc.desc      Verify move operation case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_009.txt', 'move_content_009');
          fs.moveFileSync(ROOT + '/move_src_009.txt', ROOT + '/move_dst_009.txt');
          expect(fs.accessSync(ROOT + '/move_src_009.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_009.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_009.txt')).assertEqual('move_content_009');
          fs.unlinkSync(ROOT + '/move_dst_009.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_7000
     * @tc.name      testDfmaFileOps0070
     * @tc.desc      Verify move operation case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_010.txt', 'move_content_010');
          fs.moveFileSync(ROOT + '/move_src_010.txt', ROOT + '/move_dst_010.txt');
          expect(fs.accessSync(ROOT + '/move_src_010.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_010.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_010.txt')).assertEqual('move_content_010');
          fs.unlinkSync(ROOT + '/move_dst_010.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_7100
     * @tc.name      testDfmaFileOps0071
     * @tc.desc      Verify move operation case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_011.txt', 'move_content_011');
          fs.moveFileSync(ROOT + '/move_src_011.txt', ROOT + '/move_dst_011.txt');
          expect(fs.accessSync(ROOT + '/move_src_011.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_011.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_011.txt')).assertEqual('move_content_011');
          fs.unlinkSync(ROOT + '/move_dst_011.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_7200
     * @tc.name      testDfmaFileOps0072
     * @tc.desc      Verify move operation case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_012.txt', 'move_content_012');
          fs.moveFileSync(ROOT + '/move_src_012.txt', ROOT + '/move_dst_012.txt');
          expect(fs.accessSync(ROOT + '/move_src_012.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_012.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_012.txt')).assertEqual('move_content_012');
          fs.unlinkSync(ROOT + '/move_dst_012.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_7300
     * @tc.name      testDfmaFileOps0073
     * @tc.desc      Verify move operation case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_013.txt', 'move_content_013');
          fs.moveFileSync(ROOT + '/move_src_013.txt', ROOT + '/move_dst_013.txt');
          expect(fs.accessSync(ROOT + '/move_src_013.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_013.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_013.txt')).assertEqual('move_content_013');
          fs.unlinkSync(ROOT + '/move_dst_013.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_7400
     * @tc.name      testDfmaFileOps0074
     * @tc.desc      Verify move operation case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_014.txt', 'move_content_014');
          fs.moveFileSync(ROOT + '/move_src_014.txt', ROOT + '/move_dst_014.txt');
          expect(fs.accessSync(ROOT + '/move_src_014.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_014.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_014.txt')).assertEqual('move_content_014');
          fs.unlinkSync(ROOT + '/move_dst_014.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_7500
     * @tc.name      testDfmaFileOps0075
     * @tc.desc      Verify move operation case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_015.txt', 'move_content_015');
          fs.moveFileSync(ROOT + '/move_src_015.txt', ROOT + '/move_dst_015.txt');
          expect(fs.accessSync(ROOT + '/move_src_015.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_015.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_015.txt')).assertEqual('move_content_015');
          fs.unlinkSync(ROOT + '/move_dst_015.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_7600
     * @tc.name      testDfmaFileOps0076
     * @tc.desc      Verify move operation case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_016.txt', 'move_content_016');
          fs.moveFileSync(ROOT + '/move_src_016.txt', ROOT + '/move_dst_016.txt');
          expect(fs.accessSync(ROOT + '/move_src_016.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_016.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_016.txt')).assertEqual('move_content_016');
          fs.unlinkSync(ROOT + '/move_dst_016.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_7700
     * @tc.name      testDfmaFileOps0077
     * @tc.desc      Verify move operation case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_017.txt', 'move_content_017');
          fs.moveFileSync(ROOT + '/move_src_017.txt', ROOT + '/move_dst_017.txt');
          expect(fs.accessSync(ROOT + '/move_src_017.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_017.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_017.txt')).assertEqual('move_content_017');
          fs.unlinkSync(ROOT + '/move_dst_017.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_7800
     * @tc.name      testDfmaFileOps0078
     * @tc.desc      Verify move operation case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_018.txt', 'move_content_018');
          fs.moveFileSync(ROOT + '/move_src_018.txt', ROOT + '/move_dst_018.txt');
          expect(fs.accessSync(ROOT + '/move_src_018.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_018.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_018.txt')).assertEqual('move_content_018');
          fs.unlinkSync(ROOT + '/move_dst_018.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_7900
     * @tc.name      testDfmaFileOps0079
     * @tc.desc      Verify move operation case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_019.txt', 'move_content_019');
          fs.moveFileSync(ROOT + '/move_src_019.txt', ROOT + '/move_dst_019.txt');
          expect(fs.accessSync(ROOT + '/move_src_019.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_019.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_019.txt')).assertEqual('move_content_019');
          fs.unlinkSync(ROOT + '/move_dst_019.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_8000
     * @tc.name      testDfmaFileOps0080
     * @tc.desc      Verify move operation case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_020.txt', 'move_content_020');
          fs.moveFileSync(ROOT + '/move_src_020.txt', ROOT + '/move_dst_020.txt');
          expect(fs.accessSync(ROOT + '/move_src_020.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_020.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_020.txt')).assertEqual('move_content_020');
          fs.unlinkSync(ROOT + '/move_dst_020.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_8100
     * @tc.name      testDfmaFileOps0081
     * @tc.desc      Verify move operation case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_021.txt', 'move_content_021');
          fs.moveFileSync(ROOT + '/move_src_021.txt', ROOT + '/move_dst_021.txt');
          expect(fs.accessSync(ROOT + '/move_src_021.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_021.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_021.txt')).assertEqual('move_content_021');
          fs.unlinkSync(ROOT + '/move_dst_021.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_8200
     * @tc.name      testDfmaFileOps0082
     * @tc.desc      Verify move operation case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_022.txt', 'move_content_022');
          fs.moveFileSync(ROOT + '/move_src_022.txt', ROOT + '/move_dst_022.txt');
          expect(fs.accessSync(ROOT + '/move_src_022.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_022.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_022.txt')).assertEqual('move_content_022');
          fs.unlinkSync(ROOT + '/move_dst_022.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_8300
     * @tc.name      testDfmaFileOps0083
     * @tc.desc      Verify move operation case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_023.txt', 'move_content_023');
          fs.moveFileSync(ROOT + '/move_src_023.txt', ROOT + '/move_dst_023.txt');
          expect(fs.accessSync(ROOT + '/move_src_023.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_023.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_023.txt')).assertEqual('move_content_023');
          fs.unlinkSync(ROOT + '/move_dst_023.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_8400
     * @tc.name      testDfmaFileOps0084
     * @tc.desc      Verify move operation case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_024.txt', 'move_content_024');
          fs.moveFileSync(ROOT + '/move_src_024.txt', ROOT + '/move_dst_024.txt');
          expect(fs.accessSync(ROOT + '/move_src_024.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_024.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_024.txt')).assertEqual('move_content_024');
          fs.unlinkSync(ROOT + '/move_dst_024.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_8500
     * @tc.name      testDfmaFileOps0085
     * @tc.desc      Verify move operation case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_025.txt', 'move_content_025');
          fs.moveFileSync(ROOT + '/move_src_025.txt', ROOT + '/move_dst_025.txt');
          expect(fs.accessSync(ROOT + '/move_src_025.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_025.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_025.txt')).assertEqual('move_content_025');
          fs.unlinkSync(ROOT + '/move_dst_025.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_8600
     * @tc.name      testDfmaFileOps0086
     * @tc.desc      Verify move operation case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_026.txt', 'move_content_026');
          fs.moveFileSync(ROOT + '/move_src_026.txt', ROOT + '/move_dst_026.txt');
          expect(fs.accessSync(ROOT + '/move_src_026.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_026.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_026.txt')).assertEqual('move_content_026');
          fs.unlinkSync(ROOT + '/move_dst_026.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_8700
     * @tc.name      testDfmaFileOps0087
     * @tc.desc      Verify move operation case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_027.txt', 'move_content_027');
          fs.moveFileSync(ROOT + '/move_src_027.txt', ROOT + '/move_dst_027.txt');
          expect(fs.accessSync(ROOT + '/move_src_027.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_027.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_027.txt')).assertEqual('move_content_027');
          fs.unlinkSync(ROOT + '/move_dst_027.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_8800
     * @tc.name      testDfmaFileOps0088
     * @tc.desc      Verify move operation case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_028.txt', 'move_content_028');
          fs.moveFileSync(ROOT + '/move_src_028.txt', ROOT + '/move_dst_028.txt');
          expect(fs.accessSync(ROOT + '/move_src_028.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_028.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_028.txt')).assertEqual('move_content_028');
          fs.unlinkSync(ROOT + '/move_dst_028.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_8900
     * @tc.name      testDfmaFileOps0089
     * @tc.desc      Verify move operation case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_029.txt', 'move_content_029');
          fs.moveFileSync(ROOT + '/move_src_029.txt', ROOT + '/move_dst_029.txt');
          expect(fs.accessSync(ROOT + '/move_src_029.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_029.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_029.txt')).assertEqual('move_content_029');
          fs.unlinkSync(ROOT + '/move_dst_029.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_9000
     * @tc.name      testDfmaFileOps0090
     * @tc.desc      Verify move operation case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          writeFile(ROOT + '/move_src_030.txt', 'move_content_030');
          fs.moveFileSync(ROOT + '/move_src_030.txt', ROOT + '/move_dst_030.txt');
          expect(fs.accessSync(ROOT + '/move_src_030.txt')).assertFalse();
          expect(fs.accessSync(ROOT + '/move_dst_030.txt')).assertTrue();
          expect(fs.readTextSync(ROOT + '/move_dst_030.txt')).assertEqual('move_content_030');
          fs.unlinkSync(ROOT + '/move_dst_030.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_9100
     * @tc.name      testDfmaFileOps0091
     * @tc.desc      Verify directory create/list case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir001';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a1');
          writeFile(dir + '/b.txt', 'b1');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_9200
     * @tc.name      testDfmaFileOps0092
     * @tc.desc      Verify directory create/list case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir002';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a2');
          writeFile(dir + '/b.txt', 'b2');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_9300
     * @tc.name      testDfmaFileOps0093
     * @tc.desc      Verify directory create/list case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir003';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a3');
          writeFile(dir + '/b.txt', 'b3');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_9400
     * @tc.name      testDfmaFileOps0094
     * @tc.desc      Verify directory create/list case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir004';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a4');
          writeFile(dir + '/b.txt', 'b4');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_9500
     * @tc.name      testDfmaFileOps0095
     * @tc.desc      Verify directory create/list case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir005';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a5');
          writeFile(dir + '/b.txt', 'b5');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_9600
     * @tc.name      testDfmaFileOps0096
     * @tc.desc      Verify directory create/list case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir006';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a6');
          writeFile(dir + '/b.txt', 'b6');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_9700
     * @tc.name      testDfmaFileOps0097
     * @tc.desc      Verify directory create/list case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir007';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a7');
          writeFile(dir + '/b.txt', 'b7');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_9800
     * @tc.name      testDfmaFileOps0098
     * @tc.desc      Verify directory create/list case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir008';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a8');
          writeFile(dir + '/b.txt', 'b8');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_9900
     * @tc.name      testDfmaFileOps0099
     * @tc.desc      Verify directory create/list case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir009';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a9');
          writeFile(dir + '/b.txt', 'b9');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_10000
     * @tc.name      testDfmaFileOps0100
     * @tc.desc      Verify directory create/list case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir010';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a10');
          writeFile(dir + '/b.txt', 'b10');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_10100
     * @tc.name      testDfmaFileOps0101
     * @tc.desc      Verify directory create/list case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir011';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a11');
          writeFile(dir + '/b.txt', 'b11');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_10200
     * @tc.name      testDfmaFileOps0102
     * @tc.desc      Verify directory create/list case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir012';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a12');
          writeFile(dir + '/b.txt', 'b12');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_10300
     * @tc.name      testDfmaFileOps0103
     * @tc.desc      Verify directory create/list case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir013';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a13');
          writeFile(dir + '/b.txt', 'b13');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_10400
     * @tc.name      testDfmaFileOps0104
     * @tc.desc      Verify directory create/list case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir014';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a14');
          writeFile(dir + '/b.txt', 'b14');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_10500
     * @tc.name      testDfmaFileOps0105
     * @tc.desc      Verify directory create/list case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir015';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a15');
          writeFile(dir + '/b.txt', 'b15');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_10600
     * @tc.name      testDfmaFileOps0106
     * @tc.desc      Verify directory create/list case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0106',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir016';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a16');
          writeFile(dir + '/b.txt', 'b16');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_10700
     * @tc.name      testDfmaFileOps0107
     * @tc.desc      Verify directory create/list case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0107',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir017';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a17');
          writeFile(dir + '/b.txt', 'b17');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_10800
     * @tc.name      testDfmaFileOps0108
     * @tc.desc      Verify directory create/list case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0108',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir018';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a18');
          writeFile(dir + '/b.txt', 'b18');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_10900
     * @tc.name      testDfmaFileOps0109
     * @tc.desc      Verify directory create/list case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0109',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir019';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a19');
          writeFile(dir + '/b.txt', 'b19');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEOPS_11000
     * @tc.name      testDfmaFileOps0110
     * @tc.desc      Verify directory create/list case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileOps0110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/dir020';
          fs.mkdirSync(dir);
          writeFile(dir + '/a.txt', 'a20');
          writeFile(dir + '/b.txt', 'b20');
          const entries: string[] = fs.listFileSync(dir);
          expect(fs.accessSync(dir)).assertTrue();
          expect(entries.length).assertEqual(2);
          expect(entries.length > 0).assertTrue();
          fs.unlinkSync(dir + '/a.txt');
          fs.unlinkSync(dir + '/b.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
