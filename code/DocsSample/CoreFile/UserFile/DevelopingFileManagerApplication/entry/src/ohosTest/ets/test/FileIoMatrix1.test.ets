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

export default function fileIoMatrix1Test(): void {
  describe('DfmaFileIoMatrix1Test', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_matrix1';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try {
        if (fs.accessSync(ROOT)) {
          fs.rmdirSync(ROOT);
        }
      } catch (err) {
      }
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_0100
     * @tc.name      testDfmaFileIo0001
     * @tc.desc      Verify sandbox file lifecycle case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0001.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0001');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0001');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_0200
     * @tc.name      testDfmaFileIo0002
     * @tc.desc      Verify sandbox file lifecycle case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0002.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0002');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0002');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_0300
     * @tc.name      testDfmaFileIo0003
     * @tc.desc      Verify sandbox file lifecycle case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0003.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0003');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0003');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_0400
     * @tc.name      testDfmaFileIo0004
     * @tc.desc      Verify sandbox file lifecycle case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0004.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0004');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0004');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_0500
     * @tc.name      testDfmaFileIo0005
     * @tc.desc      Verify sandbox file lifecycle case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0005.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0005');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0005');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_0600
     * @tc.name      testDfmaFileIo0006
     * @tc.desc      Verify sandbox file lifecycle case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0006.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0006');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0006');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_0700
     * @tc.name      testDfmaFileIo0007
     * @tc.desc      Verify sandbox file lifecycle case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0007.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0007');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0007');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_0800
     * @tc.name      testDfmaFileIo0008
     * @tc.desc      Verify sandbox file lifecycle case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0008.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0008');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0008');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_0900
     * @tc.name      testDfmaFileIo0009
     * @tc.desc      Verify sandbox file lifecycle case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0009.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0009');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0009');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_1000
     * @tc.name      testDfmaFileIo0010
     * @tc.desc      Verify sandbox file lifecycle case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0010.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0010');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0010');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_1100
     * @tc.name      testDfmaFileIo0011
     * @tc.desc      Verify sandbox file lifecycle case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0011.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0011');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0011');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_1200
     * @tc.name      testDfmaFileIo0012
     * @tc.desc      Verify sandbox file lifecycle case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0012.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0012');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0012');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_1300
     * @tc.name      testDfmaFileIo0013
     * @tc.desc      Verify sandbox file lifecycle case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0013.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0013');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0013');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_1400
     * @tc.name      testDfmaFileIo0014
     * @tc.desc      Verify sandbox file lifecycle case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0014.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0014');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0014');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_1500
     * @tc.name      testDfmaFileIo0015
     * @tc.desc      Verify sandbox file lifecycle case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0015.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0015');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0015');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_1600
     * @tc.name      testDfmaFileIo0016
     * @tc.desc      Verify sandbox file lifecycle case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0016.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0016');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0016');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_1700
     * @tc.name      testDfmaFileIo0017
     * @tc.desc      Verify sandbox file lifecycle case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0017.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0017');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0017');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_1800
     * @tc.name      testDfmaFileIo0018
     * @tc.desc      Verify sandbox file lifecycle case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0018.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0018');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0018');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_1900
     * @tc.name      testDfmaFileIo0019
     * @tc.desc      Verify sandbox file lifecycle case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0019.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0019');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0019');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_2000
     * @tc.name      testDfmaFileIo0020
     * @tc.desc      Verify sandbox file lifecycle case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0020.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0020');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0020');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_2100
     * @tc.name      testDfmaFileIo0021
     * @tc.desc      Verify sandbox file lifecycle case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0021.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0021');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0021');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_2200
     * @tc.name      testDfmaFileIo0022
     * @tc.desc      Verify sandbox file lifecycle case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0022.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0022');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0022');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_2300
     * @tc.name      testDfmaFileIo0023
     * @tc.desc      Verify sandbox file lifecycle case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0023.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0023');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0023');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_2400
     * @tc.name      testDfmaFileIo0024
     * @tc.desc      Verify sandbox file lifecycle case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0024.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0024');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0024');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_2500
     * @tc.name      testDfmaFileIo0025
     * @tc.desc      Verify sandbox file lifecycle case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0025.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0025');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0025');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_2600
     * @tc.name      testDfmaFileIo0026
     * @tc.desc      Verify sandbox file lifecycle case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0026.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0026');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0026');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_2700
     * @tc.name      testDfmaFileIo0027
     * @tc.desc      Verify sandbox file lifecycle case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0027.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0027');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0027');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_2800
     * @tc.name      testDfmaFileIo0028
     * @tc.desc      Verify sandbox file lifecycle case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0028.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0028');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0028');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_2900
     * @tc.name      testDfmaFileIo0029
     * @tc.desc      Verify sandbox file lifecycle case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0029.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0029');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0029');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_3000
     * @tc.name      testDfmaFileIo0030
     * @tc.desc      Verify sandbox file lifecycle case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0030.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0030');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0030');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_3100
     * @tc.name      testDfmaFileIo0031
     * @tc.desc      Verify sandbox file lifecycle case 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0031.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0031');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0031');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_3200
     * @tc.name      testDfmaFileIo0032
     * @tc.desc      Verify sandbox file lifecycle case 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0032.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0032');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0032');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_3300
     * @tc.name      testDfmaFileIo0033
     * @tc.desc      Verify sandbox file lifecycle case 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0033.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0033');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0033');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_3400
     * @tc.name      testDfmaFileIo0034
     * @tc.desc      Verify sandbox file lifecycle case 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0034.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0034');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0034');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_3500
     * @tc.name      testDfmaFileIo0035
     * @tc.desc      Verify sandbox file lifecycle case 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0035.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0035');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0035');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_3600
     * @tc.name      testDfmaFileIo0036
     * @tc.desc      Verify sandbox file lifecycle case 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0036.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0036');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0036');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_3700
     * @tc.name      testDfmaFileIo0037
     * @tc.desc      Verify sandbox file lifecycle case 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0037.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0037');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0037');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_3800
     * @tc.name      testDfmaFileIo0038
     * @tc.desc      Verify sandbox file lifecycle case 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0038.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0038');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0038');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_3900
     * @tc.name      testDfmaFileIo0039
     * @tc.desc      Verify sandbox file lifecycle case 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0039.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0039');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0039');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_4000
     * @tc.name      testDfmaFileIo0040
     * @tc.desc      Verify sandbox file lifecycle case 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0040.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0040');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0040');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_4100
     * @tc.name      testDfmaFileIo0041
     * @tc.desc      Verify sandbox file lifecycle case 41.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0041.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0041');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0041');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_4200
     * @tc.name      testDfmaFileIo0042
     * @tc.desc      Verify sandbox file lifecycle case 42.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0042.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0042');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0042');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_4300
     * @tc.name      testDfmaFileIo0043
     * @tc.desc      Verify sandbox file lifecycle case 43.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0043.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0043');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0043');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_4400
     * @tc.name      testDfmaFileIo0044
     * @tc.desc      Verify sandbox file lifecycle case 44.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0044.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0044');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0044');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_4500
     * @tc.name      testDfmaFileIo0045
     * @tc.desc      Verify sandbox file lifecycle case 45.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0045.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0045');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0045');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_4600
     * @tc.name      testDfmaFileIo0046
     * @tc.desc      Verify sandbox file lifecycle case 46.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0046.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0046');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0046');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_4700
     * @tc.name      testDfmaFileIo0047
     * @tc.desc      Verify sandbox file lifecycle case 47.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0047.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0047');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0047');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_4800
     * @tc.name      testDfmaFileIo0048
     * @tc.desc      Verify sandbox file lifecycle case 48.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0048.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0048');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0048');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_4900
     * @tc.name      testDfmaFileIo0049
     * @tc.desc      Verify sandbox file lifecycle case 49.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0049.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0049');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0049');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_5000
     * @tc.name      testDfmaFileIo0050
     * @tc.desc      Verify sandbox file lifecycle case 50.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0050.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0050');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0050');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_5100
     * @tc.name      testDfmaFileIo0051
     * @tc.desc      Verify sandbox file lifecycle case 51.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0051.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0051');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0051');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_5200
     * @tc.name      testDfmaFileIo0052
     * @tc.desc      Verify sandbox file lifecycle case 52.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0052.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0052');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0052');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_5300
     * @tc.name      testDfmaFileIo0053
     * @tc.desc      Verify sandbox file lifecycle case 53.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0053.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0053');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0053');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_5400
     * @tc.name      testDfmaFileIo0054
     * @tc.desc      Verify sandbox file lifecycle case 54.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0054.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0054');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0054');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_5500
     * @tc.name      testDfmaFileIo0055
     * @tc.desc      Verify sandbox file lifecycle case 55.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0055.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0055');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0055');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_5600
     * @tc.name      testDfmaFileIo0056
     * @tc.desc      Verify sandbox file lifecycle case 56.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0056.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0056');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0056');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_5700
     * @tc.name      testDfmaFileIo0057
     * @tc.desc      Verify sandbox file lifecycle case 57.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0057.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0057');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0057');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_5800
     * @tc.name      testDfmaFileIo0058
     * @tc.desc      Verify sandbox file lifecycle case 58.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0058.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0058');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0058');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_5900
     * @tc.name      testDfmaFileIo0059
     * @tc.desc      Verify sandbox file lifecycle case 59.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0059.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0059');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0059');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_6000
     * @tc.name      testDfmaFileIo0060
     * @tc.desc      Verify sandbox file lifecycle case 60.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0060.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0060');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0060');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_6100
     * @tc.name      testDfmaFileIo0061
     * @tc.desc      Verify sandbox file lifecycle case 61.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0061.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0061');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0061');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_6200
     * @tc.name      testDfmaFileIo0062
     * @tc.desc      Verify sandbox file lifecycle case 62.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0062.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0062');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0062');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_6300
     * @tc.name      testDfmaFileIo0063
     * @tc.desc      Verify sandbox file lifecycle case 63.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0063.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0063');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0063');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_6400
     * @tc.name      testDfmaFileIo0064
     * @tc.desc      Verify sandbox file lifecycle case 64.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0064.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0064');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0064');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_6500
     * @tc.name      testDfmaFileIo0065
     * @tc.desc      Verify sandbox file lifecycle case 65.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0065.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0065');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0065');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_6600
     * @tc.name      testDfmaFileIo0066
     * @tc.desc      Verify sandbox file lifecycle case 66.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0066.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0066');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0066');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_6700
     * @tc.name      testDfmaFileIo0067
     * @tc.desc      Verify sandbox file lifecycle case 67.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0067.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0067');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0067');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_6800
     * @tc.name      testDfmaFileIo0068
     * @tc.desc      Verify sandbox file lifecycle case 68.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0068.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0068');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0068');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_6900
     * @tc.name      testDfmaFileIo0069
     * @tc.desc      Verify sandbox file lifecycle case 69.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0069.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0069');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0069');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_7000
     * @tc.name      testDfmaFileIo0070
     * @tc.desc      Verify sandbox file lifecycle case 70.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0070.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0070');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0070');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_7100
     * @tc.name      testDfmaFileIo0071
     * @tc.desc      Verify sandbox file lifecycle case 71.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0071.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0071');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0071');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_7200
     * @tc.name      testDfmaFileIo0072
     * @tc.desc      Verify sandbox file lifecycle case 72.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0072.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0072');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0072');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_7300
     * @tc.name      testDfmaFileIo0073
     * @tc.desc      Verify sandbox file lifecycle case 73.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0073.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0073');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0073');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_7400
     * @tc.name      testDfmaFileIo0074
     * @tc.desc      Verify sandbox file lifecycle case 74.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0074.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0074');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0074');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_7500
     * @tc.name      testDfmaFileIo0075
     * @tc.desc      Verify sandbox file lifecycle case 75.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0075.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0075');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0075');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_7600
     * @tc.name      testDfmaFileIo0076
     * @tc.desc      Verify sandbox file lifecycle case 76.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0076.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0076');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0076');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_7700
     * @tc.name      testDfmaFileIo0077
     * @tc.desc      Verify sandbox file lifecycle case 77.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0077.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0077');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0077');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_7800
     * @tc.name      testDfmaFileIo0078
     * @tc.desc      Verify sandbox file lifecycle case 78.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0078.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0078');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0078');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_7900
     * @tc.name      testDfmaFileIo0079
     * @tc.desc      Verify sandbox file lifecycle case 79.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0079.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0079');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0079');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_8000
     * @tc.name      testDfmaFileIo0080
     * @tc.desc      Verify sandbox file lifecycle case 80.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0080.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0080');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0080');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_8100
     * @tc.name      testDfmaFileIo0081
     * @tc.desc      Verify sandbox file lifecycle case 81.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0081.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0081');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0081');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_8200
     * @tc.name      testDfmaFileIo0082
     * @tc.desc      Verify sandbox file lifecycle case 82.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0082.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0082');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0082');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_8300
     * @tc.name      testDfmaFileIo0083
     * @tc.desc      Verify sandbox file lifecycle case 83.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0083.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0083');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0083');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_8400
     * @tc.name      testDfmaFileIo0084
     * @tc.desc      Verify sandbox file lifecycle case 84.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0084.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0084');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0084');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_8500
     * @tc.name      testDfmaFileIo0085
     * @tc.desc      Verify sandbox file lifecycle case 85.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0085.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0085');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0085');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_8600
     * @tc.name      testDfmaFileIo0086
     * @tc.desc      Verify sandbox file lifecycle case 86.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0086.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0086');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0086');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_8700
     * @tc.name      testDfmaFileIo0087
     * @tc.desc      Verify sandbox file lifecycle case 87.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0087.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0087');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0087');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_8800
     * @tc.name      testDfmaFileIo0088
     * @tc.desc      Verify sandbox file lifecycle case 88.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0088.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0088');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0088');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_8900
     * @tc.name      testDfmaFileIo0089
     * @tc.desc      Verify sandbox file lifecycle case 89.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0089.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0089');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0089');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_9000
     * @tc.name      testDfmaFileIo0090
     * @tc.desc      Verify sandbox file lifecycle case 90.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0090.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0090');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0090');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_9100
     * @tc.name      testDfmaFileIo0091
     * @tc.desc      Verify sandbox file lifecycle case 91.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0091.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0091');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0091');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_9200
     * @tc.name      testDfmaFileIo0092
     * @tc.desc      Verify sandbox file lifecycle case 92.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0092.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0092');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0092');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_9300
     * @tc.name      testDfmaFileIo0093
     * @tc.desc      Verify sandbox file lifecycle case 93.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0093.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0093');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0093');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_9400
     * @tc.name      testDfmaFileIo0094
     * @tc.desc      Verify sandbox file lifecycle case 94.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0094.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0094');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0094');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_9500
     * @tc.name      testDfmaFileIo0095
     * @tc.desc      Verify sandbox file lifecycle case 95.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0095.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0095');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0095');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_9600
     * @tc.name      testDfmaFileIo0096
     * @tc.desc      Verify sandbox file lifecycle case 96.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0096.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0096');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0096');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_9700
     * @tc.name      testDfmaFileIo0097
     * @tc.desc      Verify sandbox file lifecycle case 97.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0097.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0097');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0097');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_9800
     * @tc.name      testDfmaFileIo0098
     * @tc.desc      Verify sandbox file lifecycle case 98.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0098.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0098');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0098');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_9900
     * @tc.name      testDfmaFileIo0099
     * @tc.desc      Verify sandbox file lifecycle case 99.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0099.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0099');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0099');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_10000
     * @tc.name      testDfmaFileIo0100
     * @tc.desc      Verify sandbox file lifecycle case 100.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0100.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0100');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0100');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_10100
     * @tc.name      testDfmaFileIo0101
     * @tc.desc      Verify sandbox file lifecycle case 101.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0101.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0101');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0101');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_10200
     * @tc.name      testDfmaFileIo0102
     * @tc.desc      Verify sandbox file lifecycle case 102.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0102.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0102');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0102');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_10300
     * @tc.name      testDfmaFileIo0103
     * @tc.desc      Verify sandbox file lifecycle case 103.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0103.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0103');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0103');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_10400
     * @tc.name      testDfmaFileIo0104
     * @tc.desc      Verify sandbox file lifecycle case 104.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0104.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0104');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0104');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_10500
     * @tc.name      testDfmaFileIo0105
     * @tc.desc      Verify sandbox file lifecycle case 105.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0105.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0105');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0105');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_10600
     * @tc.name      testDfmaFileIo0106
     * @tc.desc      Verify sandbox file lifecycle case 106.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0106',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0106.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0106');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0106');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_10700
     * @tc.name      testDfmaFileIo0107
     * @tc.desc      Verify sandbox file lifecycle case 107.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0107',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0107.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0107');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0107');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_10800
     * @tc.name      testDfmaFileIo0108
     * @tc.desc      Verify sandbox file lifecycle case 108.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0108',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0108.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0108');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0108');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_10900
     * @tc.name      testDfmaFileIo0109
     * @tc.desc      Verify sandbox file lifecycle case 109.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0109',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0109.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0109');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0109');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_11000
     * @tc.name      testDfmaFileIo0110
     * @tc.desc      Verify sandbox file lifecycle case 110.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0110.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0110');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0110');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_11100
     * @tc.name      testDfmaFileIo0111
     * @tc.desc      Verify sandbox file lifecycle case 111.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0111',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0111.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0111');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0111');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_11200
     * @tc.name      testDfmaFileIo0112
     * @tc.desc      Verify sandbox file lifecycle case 112.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0112',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0112.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0112');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0112');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_11300
     * @tc.name      testDfmaFileIo0113
     * @tc.desc      Verify sandbox file lifecycle case 113.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0113',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0113.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0113');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0113');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_11400
     * @tc.name      testDfmaFileIo0114
     * @tc.desc      Verify sandbox file lifecycle case 114.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0114',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0114.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0114');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0114');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_11500
     * @tc.name      testDfmaFileIo0115
     * @tc.desc      Verify sandbox file lifecycle case 115.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0115',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0115.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0115');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0115');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_11600
     * @tc.name      testDfmaFileIo0116
     * @tc.desc      Verify sandbox file lifecycle case 116.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0116',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0116.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0116');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0116');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_11700
     * @tc.name      testDfmaFileIo0117
     * @tc.desc      Verify sandbox file lifecycle case 117.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0117',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0117.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0117');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0117');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_11800
     * @tc.name      testDfmaFileIo0118
     * @tc.desc      Verify sandbox file lifecycle case 118.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0118',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0118.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0118');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0118');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_11900
     * @tc.name      testDfmaFileIo0119
     * @tc.desc      Verify sandbox file lifecycle case 119.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0119',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0119.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0119');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0119');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_12000
     * @tc.name      testDfmaFileIo0120
     * @tc.desc      Verify sandbox file lifecycle case 120.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0120',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0120.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0120');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0120');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_12100
     * @tc.name      testDfmaFileIo0121
     * @tc.desc      Verify sandbox file lifecycle case 121.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0121',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0121.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0121');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0121');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_12200
     * @tc.name      testDfmaFileIo0122
     * @tc.desc      Verify sandbox file lifecycle case 122.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0122',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0122.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0122');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0122');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_12300
     * @tc.name      testDfmaFileIo0123
     * @tc.desc      Verify sandbox file lifecycle case 123.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0123',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0123.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0123');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0123');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_12400
     * @tc.name      testDfmaFileIo0124
     * @tc.desc      Verify sandbox file lifecycle case 124.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0124',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0124.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0124');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0124');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_12500
     * @tc.name      testDfmaFileIo0125
     * @tc.desc      Verify sandbox file lifecycle case 125.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0125',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0125.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0125');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0125');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_12600
     * @tc.name      testDfmaFileIo0126
     * @tc.desc      Verify sandbox file lifecycle case 126.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0126',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0126.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0126');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0126');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_12700
     * @tc.name      testDfmaFileIo0127
     * @tc.desc      Verify sandbox file lifecycle case 127.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0127',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0127.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0127');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0127');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_12800
     * @tc.name      testDfmaFileIo0128
     * @tc.desc      Verify sandbox file lifecycle case 128.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0128',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0128.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0128');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0128');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_12900
     * @tc.name      testDfmaFileIo0129
     * @tc.desc      Verify sandbox file lifecycle case 129.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0129',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0129.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0129');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0129');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_13000
     * @tc.name      testDfmaFileIo0130
     * @tc.desc      Verify sandbox file lifecycle case 130.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0130',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0130.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0130');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0130');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_13100
     * @tc.name      testDfmaFileIo0131
     * @tc.desc      Verify sandbox file lifecycle case 131.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0131',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0131.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0131');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0131');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_13200
     * @tc.name      testDfmaFileIo0132
     * @tc.desc      Verify sandbox file lifecycle case 132.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0132',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0132.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0132');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0132');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_13300
     * @tc.name      testDfmaFileIo0133
     * @tc.desc      Verify sandbox file lifecycle case 133.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0133',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0133.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0133');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0133');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_13400
     * @tc.name      testDfmaFileIo0134
     * @tc.desc      Verify sandbox file lifecycle case 134.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0134',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0134.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0134');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0134');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_13500
     * @tc.name      testDfmaFileIo0135
     * @tc.desc      Verify sandbox file lifecycle case 135.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0135',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0135.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0135');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0135');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_13600
     * @tc.name      testDfmaFileIo0136
     * @tc.desc      Verify sandbox file lifecycle case 136.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0136',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0136.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0136');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0136');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_13700
     * @tc.name      testDfmaFileIo0137
     * @tc.desc      Verify sandbox file lifecycle case 137.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0137',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0137.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0137');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0137');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_13800
     * @tc.name      testDfmaFileIo0138
     * @tc.desc      Verify sandbox file lifecycle case 138.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0138',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0138.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0138');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0138');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_13900
     * @tc.name      testDfmaFileIo0139
     * @tc.desc      Verify sandbox file lifecycle case 139.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0139',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0139.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0139');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0139');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_14000
     * @tc.name      testDfmaFileIo0140
     * @tc.desc      Verify sandbox file lifecycle case 140.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0140',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0140.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0140');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0140');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_14100
     * @tc.name      testDfmaFileIo0141
     * @tc.desc      Verify sandbox file lifecycle case 141.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0141',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0141.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0141');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0141');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_14200
     * @tc.name      testDfmaFileIo0142
     * @tc.desc      Verify sandbox file lifecycle case 142.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0142',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0142.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0142');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0142');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
