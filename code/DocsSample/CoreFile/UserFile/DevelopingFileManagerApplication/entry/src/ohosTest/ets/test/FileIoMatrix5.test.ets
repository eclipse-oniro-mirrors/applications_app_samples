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

export default function fileIoMatrix5Test(): void {
  describe('DfmaFileIoMatrix5Test', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_matrix5';
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
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_68700
     * @tc.name      testDfmaFileIo0687
     * @tc.desc      Verify sandbox file lifecycle case 687.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0687',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0687.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0687');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0687');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_68800
     * @tc.name      testDfmaFileIo0688
     * @tc.desc      Verify sandbox file lifecycle case 688.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0688',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0688.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0688');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0688');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_68900
     * @tc.name      testDfmaFileIo0689
     * @tc.desc      Verify sandbox file lifecycle case 689.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0689',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0689.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0689');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0689');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_69000
     * @tc.name      testDfmaFileIo0690
     * @tc.desc      Verify sandbox file lifecycle case 690.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0690',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0690.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0690');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0690');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_69100
     * @tc.name      testDfmaFileIo0691
     * @tc.desc      Verify sandbox file lifecycle case 691.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0691',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0691.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0691');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0691');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_69200
     * @tc.name      testDfmaFileIo0692
     * @tc.desc      Verify sandbox file lifecycle case 692.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0692',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0692.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0692');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0692');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_69300
     * @tc.name      testDfmaFileIo0693
     * @tc.desc      Verify sandbox file lifecycle case 693.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0693',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0693.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0693');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0693');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_69400
     * @tc.name      testDfmaFileIo0694
     * @tc.desc      Verify sandbox file lifecycle case 694.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0694',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0694.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0694');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0694');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_69500
     * @tc.name      testDfmaFileIo0695
     * @tc.desc      Verify sandbox file lifecycle case 695.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0695',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0695.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0695');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0695');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_69600
     * @tc.name      testDfmaFileIo0696
     * @tc.desc      Verify sandbox file lifecycle case 696.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0696',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0696.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0696');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0696');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_69700
     * @tc.name      testDfmaFileIo0697
     * @tc.desc      Verify sandbox file lifecycle case 697.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0697',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0697.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0697');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0697');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_69800
     * @tc.name      testDfmaFileIo0698
     * @tc.desc      Verify sandbox file lifecycle case 698.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0698',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0698.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0698');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0698');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_69900
     * @tc.name      testDfmaFileIo0699
     * @tc.desc      Verify sandbox file lifecycle case 699.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0699',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0699.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0699');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0699');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_70000
     * @tc.name      testDfmaFileIo0700
     * @tc.desc      Verify sandbox file lifecycle case 700.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0700.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0700');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0700');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_70100
     * @tc.name      testDfmaFileIo0701
     * @tc.desc      Verify sandbox file lifecycle case 701.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0701',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0701.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0701');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0701');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_70200
     * @tc.name      testDfmaFileIo0702
     * @tc.desc      Verify sandbox file lifecycle case 702.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0702',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0702.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0702');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0702');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_70300
     * @tc.name      testDfmaFileIo0703
     * @tc.desc      Verify sandbox file lifecycle case 703.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0703',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0703.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0703');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0703');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_70400
     * @tc.name      testDfmaFileIo0704
     * @tc.desc      Verify sandbox file lifecycle case 704.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0704',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0704.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0704');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0704');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_70500
     * @tc.name      testDfmaFileIo0705
     * @tc.desc      Verify sandbox file lifecycle case 705.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0705',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0705.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0705');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0705');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_70600
     * @tc.name      testDfmaFileIo0706
     * @tc.desc      Verify sandbox file lifecycle case 706.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0706',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0706.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0706');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0706');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_70700
     * @tc.name      testDfmaFileIo0707
     * @tc.desc      Verify sandbox file lifecycle case 707.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0707',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0707.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0707');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0707');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_70800
     * @tc.name      testDfmaFileIo0708
     * @tc.desc      Verify sandbox file lifecycle case 708.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0708',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0708.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0708');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0708');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_70900
     * @tc.name      testDfmaFileIo0709
     * @tc.desc      Verify sandbox file lifecycle case 709.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0709',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0709.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0709');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0709');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_71000
     * @tc.name      testDfmaFileIo0710
     * @tc.desc      Verify sandbox file lifecycle case 710.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0710',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0710.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0710');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0710');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_71100
     * @tc.name      testDfmaFileIo0711
     * @tc.desc      Verify sandbox file lifecycle case 711.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0711',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0711.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0711');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0711');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_71200
     * @tc.name      testDfmaFileIo0712
     * @tc.desc      Verify sandbox file lifecycle case 712.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0712',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0712.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0712');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0712');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_71300
     * @tc.name      testDfmaFileIo0713
     * @tc.desc      Verify sandbox file lifecycle case 713.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0713',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0713.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0713');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0713');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_71400
     * @tc.name      testDfmaFileIo0714
     * @tc.desc      Verify sandbox file lifecycle case 714.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0714',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0714.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0714');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0714');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_71500
     * @tc.name      testDfmaFileIo0715
     * @tc.desc      Verify sandbox file lifecycle case 715.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0715',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0715.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0715');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0715');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_71600
     * @tc.name      testDfmaFileIo0716
     * @tc.desc      Verify sandbox file lifecycle case 716.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0716',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0716.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0716');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0716');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_71700
     * @tc.name      testDfmaFileIo0717
     * @tc.desc      Verify sandbox file lifecycle case 717.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0717',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0717.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0717');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0717');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_71800
     * @tc.name      testDfmaFileIo0718
     * @tc.desc      Verify sandbox file lifecycle case 718.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0718',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0718.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0718');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0718');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_71900
     * @tc.name      testDfmaFileIo0719
     * @tc.desc      Verify sandbox file lifecycle case 719.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0719',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0719.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0719');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0719');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_72000
     * @tc.name      testDfmaFileIo0720
     * @tc.desc      Verify sandbox file lifecycle case 720.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0720',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0720.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0720');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0720');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_72100
     * @tc.name      testDfmaFileIo0721
     * @tc.desc      Verify sandbox file lifecycle case 721.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0721',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0721.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0721');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0721');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_72200
     * @tc.name      testDfmaFileIo0722
     * @tc.desc      Verify sandbox file lifecycle case 722.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0722',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0722.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0722');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0722');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_72300
     * @tc.name      testDfmaFileIo0723
     * @tc.desc      Verify sandbox file lifecycle case 723.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0723',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0723.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0723');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0723');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_72400
     * @tc.name      testDfmaFileIo0724
     * @tc.desc      Verify sandbox file lifecycle case 724.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0724',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0724.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0724');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0724');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_72500
     * @tc.name      testDfmaFileIo0725
     * @tc.desc      Verify sandbox file lifecycle case 725.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0725',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0725.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0725');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0725');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_72600
     * @tc.name      testDfmaFileIo0726
     * @tc.desc      Verify sandbox file lifecycle case 726.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0726',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0726.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0726');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0726');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_72700
     * @tc.name      testDfmaFileIo0727
     * @tc.desc      Verify sandbox file lifecycle case 727.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0727',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0727.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0727');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0727');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_72800
     * @tc.name      testDfmaFileIo0728
     * @tc.desc      Verify sandbox file lifecycle case 728.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0728',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0728.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0728');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0728');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_72900
     * @tc.name      testDfmaFileIo0729
     * @tc.desc      Verify sandbox file lifecycle case 729.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0729',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0729.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0729');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0729');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_73000
     * @tc.name      testDfmaFileIo0730
     * @tc.desc      Verify sandbox file lifecycle case 730.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0730',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0730.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0730');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0730');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_73100
     * @tc.name      testDfmaFileIo0731
     * @tc.desc      Verify sandbox file lifecycle case 731.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0731',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0731.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0731');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0731');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_73200
     * @tc.name      testDfmaFileIo0732
     * @tc.desc      Verify sandbox file lifecycle case 732.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0732',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0732.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0732');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0732');
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
