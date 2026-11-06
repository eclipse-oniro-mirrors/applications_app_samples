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

export default function fileIoMatrix3Test(): void {
  describe('DfmaFileIoMatrix3Test', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_matrix3';
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
        console.error('afterAll cleanup failed: ' + JSON.stringify(err));
      }
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_34500
     * @tc.name      testDfmaFileIo0345
     * @tc.desc      Verify sandbox file lifecycle case 345.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0345',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0345.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0345');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0345');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_34600
     * @tc.name      testDfmaFileIo0346
     * @tc.desc      Verify sandbox file lifecycle case 346.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0346',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0346.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0346');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0346');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_34700
     * @tc.name      testDfmaFileIo0347
     * @tc.desc      Verify sandbox file lifecycle case 347.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0347',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0347.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0347');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0347');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_34800
     * @tc.name      testDfmaFileIo0348
     * @tc.desc      Verify sandbox file lifecycle case 348.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0348',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0348.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0348');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0348');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_34900
     * @tc.name      testDfmaFileIo0349
     * @tc.desc      Verify sandbox file lifecycle case 349.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0349',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0349.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0349');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0349');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_35000
     * @tc.name      testDfmaFileIo0350
     * @tc.desc      Verify sandbox file lifecycle case 350.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0350',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0350.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0350');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0350');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_35100
     * @tc.name      testDfmaFileIo0351
     * @tc.desc      Verify sandbox file lifecycle case 351.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0351',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0351.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0351');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0351');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_35200
     * @tc.name      testDfmaFileIo0352
     * @tc.desc      Verify sandbox file lifecycle case 352.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0352',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0352.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0352');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0352');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_35300
     * @tc.name      testDfmaFileIo0353
     * @tc.desc      Verify sandbox file lifecycle case 353.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0353',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0353.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0353');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0353');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_35400
     * @tc.name      testDfmaFileIo0354
     * @tc.desc      Verify sandbox file lifecycle case 354.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0354',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0354.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0354');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0354');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_35500
     * @tc.name      testDfmaFileIo0355
     * @tc.desc      Verify sandbox file lifecycle case 355.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0355',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0355.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0355');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0355');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_35600
     * @tc.name      testDfmaFileIo0356
     * @tc.desc      Verify sandbox file lifecycle case 356.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0356',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0356.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0356');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0356');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_35700
     * @tc.name      testDfmaFileIo0357
     * @tc.desc      Verify sandbox file lifecycle case 357.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0357',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0357.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0357');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0357');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_35800
     * @tc.name      testDfmaFileIo0358
     * @tc.desc      Verify sandbox file lifecycle case 358.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0358',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0358.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0358');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0358');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_35900
     * @tc.name      testDfmaFileIo0359
     * @tc.desc      Verify sandbox file lifecycle case 359.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0359',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0359.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0359');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0359');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_36000
     * @tc.name      testDfmaFileIo0360
     * @tc.desc      Verify sandbox file lifecycle case 360.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0360',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0360.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0360');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0360');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_36100
     * @tc.name      testDfmaFileIo0361
     * @tc.desc      Verify sandbox file lifecycle case 361.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0361',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0361.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0361');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0361');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_36200
     * @tc.name      testDfmaFileIo0362
     * @tc.desc      Verify sandbox file lifecycle case 362.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0362',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0362.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0362');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0362');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_36300
     * @tc.name      testDfmaFileIo0363
     * @tc.desc      Verify sandbox file lifecycle case 363.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0363',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0363.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0363');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0363');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_36400
     * @tc.name      testDfmaFileIo0364
     * @tc.desc      Verify sandbox file lifecycle case 364.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0364',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0364.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0364');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0364');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_36500
     * @tc.name      testDfmaFileIo0365
     * @tc.desc      Verify sandbox file lifecycle case 365.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0365',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0365.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0365');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0365');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_36600
     * @tc.name      testDfmaFileIo0366
     * @tc.desc      Verify sandbox file lifecycle case 366.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0366',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0366.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0366');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0366');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_36700
     * @tc.name      testDfmaFileIo0367
     * @tc.desc      Verify sandbox file lifecycle case 367.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0367',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0367.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0367');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0367');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_36800
     * @tc.name      testDfmaFileIo0368
     * @tc.desc      Verify sandbox file lifecycle case 368.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0368',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0368.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0368');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0368');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_36900
     * @tc.name      testDfmaFileIo0369
     * @tc.desc      Verify sandbox file lifecycle case 369.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0369',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0369.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0369');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0369');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_37000
     * @tc.name      testDfmaFileIo0370
     * @tc.desc      Verify sandbox file lifecycle case 370.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0370',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0370.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0370');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0370');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_37100
     * @tc.name      testDfmaFileIo0371
     * @tc.desc      Verify sandbox file lifecycle case 371.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0371',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0371.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0371');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0371');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_37200
     * @tc.name      testDfmaFileIo0372
     * @tc.desc      Verify sandbox file lifecycle case 372.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0372',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0372.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0372');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0372');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_37300
     * @tc.name      testDfmaFileIo0373
     * @tc.desc      Verify sandbox file lifecycle case 373.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0373',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0373.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0373');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0373');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_37400
     * @tc.name      testDfmaFileIo0374
     * @tc.desc      Verify sandbox file lifecycle case 374.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0374',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0374.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0374');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0374');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_37500
     * @tc.name      testDfmaFileIo0375
     * @tc.desc      Verify sandbox file lifecycle case 375.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0375',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0375.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0375');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0375');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_37600
     * @tc.name      testDfmaFileIo0376
     * @tc.desc      Verify sandbox file lifecycle case 376.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0376',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0376.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0376');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0376');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_37700
     * @tc.name      testDfmaFileIo0377
     * @tc.desc      Verify sandbox file lifecycle case 377.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0377',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0377.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0377');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0377');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_37800
     * @tc.name      testDfmaFileIo0378
     * @tc.desc      Verify sandbox file lifecycle case 378.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0378',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0378.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0378');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0378');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_37900
     * @tc.name      testDfmaFileIo0379
     * @tc.desc      Verify sandbox file lifecycle case 379.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0379',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0379.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0379');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0379');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_38000
     * @tc.name      testDfmaFileIo0380
     * @tc.desc      Verify sandbox file lifecycle case 380.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0380',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0380.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0380');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0380');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_38100
     * @tc.name      testDfmaFileIo0381
     * @tc.desc      Verify sandbox file lifecycle case 381.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0381',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0381.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0381');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0381');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_38200
     * @tc.name      testDfmaFileIo0382
     * @tc.desc      Verify sandbox file lifecycle case 382.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0382',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0382.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0382');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0382');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_38300
     * @tc.name      testDfmaFileIo0383
     * @tc.desc      Verify sandbox file lifecycle case 383.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0383',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0383.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0383');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0383');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_38400
     * @tc.name      testDfmaFileIo0384
     * @tc.desc      Verify sandbox file lifecycle case 384.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0384',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0384.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0384');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0384');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_38500
     * @tc.name      testDfmaFileIo0385
     * @tc.desc      Verify sandbox file lifecycle case 385.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0385',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0385.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0385');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0385');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_38600
     * @tc.name      testDfmaFileIo0386
     * @tc.desc      Verify sandbox file lifecycle case 386.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0386',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0386.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0386');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0386');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_38700
     * @tc.name      testDfmaFileIo0387
     * @tc.desc      Verify sandbox file lifecycle case 387.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0387',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0387.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0387');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0387');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_38800
     * @tc.name      testDfmaFileIo0388
     * @tc.desc      Verify sandbox file lifecycle case 388.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0388',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0388.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0388');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0388');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_38900
     * @tc.name      testDfmaFileIo0389
     * @tc.desc      Verify sandbox file lifecycle case 389.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0389',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0389.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0389');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0389');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_39000
     * @tc.name      testDfmaFileIo0390
     * @tc.desc      Verify sandbox file lifecycle case 390.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0390',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0390.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0390');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0390');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_39100
     * @tc.name      testDfmaFileIo0391
     * @tc.desc      Verify sandbox file lifecycle case 391.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0391',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0391.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0391');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0391');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_39200
     * @tc.name      testDfmaFileIo0392
     * @tc.desc      Verify sandbox file lifecycle case 392.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0392',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0392.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0392');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0392');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_39300
     * @tc.name      testDfmaFileIo0393
     * @tc.desc      Verify sandbox file lifecycle case 393.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0393',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0393.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0393');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0393');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_39400
     * @tc.name      testDfmaFileIo0394
     * @tc.desc      Verify sandbox file lifecycle case 394.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0394',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0394.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0394');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0394');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_39500
     * @tc.name      testDfmaFileIo0395
     * @tc.desc      Verify sandbox file lifecycle case 395.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0395',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0395.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0395');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0395');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_39600
     * @tc.name      testDfmaFileIo0396
     * @tc.desc      Verify sandbox file lifecycle case 396.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0396',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0396.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0396');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0396');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_39700
     * @tc.name      testDfmaFileIo0397
     * @tc.desc      Verify sandbox file lifecycle case 397.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0397',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0397.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0397');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0397');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_39800
     * @tc.name      testDfmaFileIo0398
     * @tc.desc      Verify sandbox file lifecycle case 398.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0398',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0398.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0398');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0398');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_39900
     * @tc.name      testDfmaFileIo0399
     * @tc.desc      Verify sandbox file lifecycle case 399.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0399',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0399.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0399');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0399');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_40000
     * @tc.name      testDfmaFileIo0400
     * @tc.desc      Verify sandbox file lifecycle case 400.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0400.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0400');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0400');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_40100
     * @tc.name      testDfmaFileIo0401
     * @tc.desc      Verify sandbox file lifecycle case 401.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0401.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0401');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0401');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_40200
     * @tc.name      testDfmaFileIo0402
     * @tc.desc      Verify sandbox file lifecycle case 402.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0402',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0402.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0402');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0402');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_40300
     * @tc.name      testDfmaFileIo0403
     * @tc.desc      Verify sandbox file lifecycle case 403.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0403',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0403.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0403');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0403');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_40400
     * @tc.name      testDfmaFileIo0404
     * @tc.desc      Verify sandbox file lifecycle case 404.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0404',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0404.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0404');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0404');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_40500
     * @tc.name      testDfmaFileIo0405
     * @tc.desc      Verify sandbox file lifecycle case 405.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0405',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0405.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0405');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0405');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_40600
     * @tc.name      testDfmaFileIo0406
     * @tc.desc      Verify sandbox file lifecycle case 406.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0406',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0406.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0406');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0406');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_40700
     * @tc.name      testDfmaFileIo0407
     * @tc.desc      Verify sandbox file lifecycle case 407.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0407',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0407.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0407');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0407');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_40800
     * @tc.name      testDfmaFileIo0408
     * @tc.desc      Verify sandbox file lifecycle case 408.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0408',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0408.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0408');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0408');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_40900
     * @tc.name      testDfmaFileIo0409
     * @tc.desc      Verify sandbox file lifecycle case 409.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0409',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0409.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0409');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0409');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_41000
     * @tc.name      testDfmaFileIo0410
     * @tc.desc      Verify sandbox file lifecycle case 410.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0410',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0410.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0410');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0410');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_41100
     * @tc.name      testDfmaFileIo0411
     * @tc.desc      Verify sandbox file lifecycle case 411.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0411',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0411.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0411');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0411');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_41200
     * @tc.name      testDfmaFileIo0412
     * @tc.desc      Verify sandbox file lifecycle case 412.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0412',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0412.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0412');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0412');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_41300
     * @tc.name      testDfmaFileIo0413
     * @tc.desc      Verify sandbox file lifecycle case 413.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0413',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0413.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0413');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0413');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_41400
     * @tc.name      testDfmaFileIo0414
     * @tc.desc      Verify sandbox file lifecycle case 414.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0414',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0414.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0414');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0414');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_41500
     * @tc.name      testDfmaFileIo0415
     * @tc.desc      Verify sandbox file lifecycle case 415.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0415',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0415.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0415');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0415');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_41600
     * @tc.name      testDfmaFileIo0416
     * @tc.desc      Verify sandbox file lifecycle case 416.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0416',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0416.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0416');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0416');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_41700
     * @tc.name      testDfmaFileIo0417
     * @tc.desc      Verify sandbox file lifecycle case 417.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0417',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0417.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0417');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0417');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_41800
     * @tc.name      testDfmaFileIo0418
     * @tc.desc      Verify sandbox file lifecycle case 418.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0418',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0418.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0418');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0418');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_41900
     * @tc.name      testDfmaFileIo0419
     * @tc.desc      Verify sandbox file lifecycle case 419.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0419',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0419.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0419');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0419');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_42000
     * @tc.name      testDfmaFileIo0420
     * @tc.desc      Verify sandbox file lifecycle case 420.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0420',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0420.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0420');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0420');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_42100
     * @tc.name      testDfmaFileIo0421
     * @tc.desc      Verify sandbox file lifecycle case 421.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0421',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0421.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0421');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0421');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_42200
     * @tc.name      testDfmaFileIo0422
     * @tc.desc      Verify sandbox file lifecycle case 422.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0422',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0422.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0422');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0422');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_42300
     * @tc.name      testDfmaFileIo0423
     * @tc.desc      Verify sandbox file lifecycle case 423.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0423',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0423.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0423');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0423');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_42400
     * @tc.name      testDfmaFileIo0424
     * @tc.desc      Verify sandbox file lifecycle case 424.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0424',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0424.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0424');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0424');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_42500
     * @tc.name      testDfmaFileIo0425
     * @tc.desc      Verify sandbox file lifecycle case 425.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0425',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0425.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0425');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0425');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_42600
     * @tc.name      testDfmaFileIo0426
     * @tc.desc      Verify sandbox file lifecycle case 426.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0426',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0426.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0426');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0426');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_42700
     * @tc.name      testDfmaFileIo0427
     * @tc.desc      Verify sandbox file lifecycle case 427.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0427',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0427.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0427');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0427');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_42800
     * @tc.name      testDfmaFileIo0428
     * @tc.desc      Verify sandbox file lifecycle case 428.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0428',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0428.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0428');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0428');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_42900
     * @tc.name      testDfmaFileIo0429
     * @tc.desc      Verify sandbox file lifecycle case 429.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0429',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0429.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0429');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0429');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_43000
     * @tc.name      testDfmaFileIo0430
     * @tc.desc      Verify sandbox file lifecycle case 430.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0430',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0430.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0430');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0430');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_43100
     * @tc.name      testDfmaFileIo0431
     * @tc.desc      Verify sandbox file lifecycle case 431.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0431',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0431.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0431');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0431');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_43200
     * @tc.name      testDfmaFileIo0432
     * @tc.desc      Verify sandbox file lifecycle case 432.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0432',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0432.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0432');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0432');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_43300
     * @tc.name      testDfmaFileIo0433
     * @tc.desc      Verify sandbox file lifecycle case 433.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0433',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0433.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0433');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0433');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_43400
     * @tc.name      testDfmaFileIo0434
     * @tc.desc      Verify sandbox file lifecycle case 434.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0434',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0434.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0434');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0434');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_43500
     * @tc.name      testDfmaFileIo0435
     * @tc.desc      Verify sandbox file lifecycle case 435.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0435',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0435.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0435');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0435');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_43600
     * @tc.name      testDfmaFileIo0436
     * @tc.desc      Verify sandbox file lifecycle case 436.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0436',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0436.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0436');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0436');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_43700
     * @tc.name      testDfmaFileIo0437
     * @tc.desc      Verify sandbox file lifecycle case 437.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0437',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0437.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0437');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0437');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_43800
     * @tc.name      testDfmaFileIo0438
     * @tc.desc      Verify sandbox file lifecycle case 438.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0438',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0438.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0438');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0438');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_43900
     * @tc.name      testDfmaFileIo0439
     * @tc.desc      Verify sandbox file lifecycle case 439.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0439',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0439.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0439');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0439');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_44000
     * @tc.name      testDfmaFileIo0440
     * @tc.desc      Verify sandbox file lifecycle case 440.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0440',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0440.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0440');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0440');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_44100
     * @tc.name      testDfmaFileIo0441
     * @tc.desc      Verify sandbox file lifecycle case 441.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0441',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0441.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0441');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0441');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_44200
     * @tc.name      testDfmaFileIo0442
     * @tc.desc      Verify sandbox file lifecycle case 442.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0442',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0442.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0442');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0442');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_44300
     * @tc.name      testDfmaFileIo0443
     * @tc.desc      Verify sandbox file lifecycle case 443.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0443',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0443.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0443');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0443');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_44400
     * @tc.name      testDfmaFileIo0444
     * @tc.desc      Verify sandbox file lifecycle case 444.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0444',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0444.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0444');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0444');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_44500
     * @tc.name      testDfmaFileIo0445
     * @tc.desc      Verify sandbox file lifecycle case 445.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0445',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0445.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0445');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0445');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_44600
     * @tc.name      testDfmaFileIo0446
     * @tc.desc      Verify sandbox file lifecycle case 446.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0446',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0446.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0446');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0446');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_44700
     * @tc.name      testDfmaFileIo0447
     * @tc.desc      Verify sandbox file lifecycle case 447.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0447',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0447.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0447');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0447');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_44800
     * @tc.name      testDfmaFileIo0448
     * @tc.desc      Verify sandbox file lifecycle case 448.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0448',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0448.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0448');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0448');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_44900
     * @tc.name      testDfmaFileIo0449
     * @tc.desc      Verify sandbox file lifecycle case 449.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0449',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0449.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0449');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0449');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_45000
     * @tc.name      testDfmaFileIo0450
     * @tc.desc      Verify sandbox file lifecycle case 450.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0450',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0450.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0450');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0450');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_45100
     * @tc.name      testDfmaFileIo0451
     * @tc.desc      Verify sandbox file lifecycle case 451.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0451',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0451.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0451');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0451');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_45200
     * @tc.name      testDfmaFileIo0452
     * @tc.desc      Verify sandbox file lifecycle case 452.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0452',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0452.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0452');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0452');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_45300
     * @tc.name      testDfmaFileIo0453
     * @tc.desc      Verify sandbox file lifecycle case 453.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0453',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0453.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0453');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0453');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_45400
     * @tc.name      testDfmaFileIo0454
     * @tc.desc      Verify sandbox file lifecycle case 454.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0454',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0454.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0454');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0454');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_45500
     * @tc.name      testDfmaFileIo0455
     * @tc.desc      Verify sandbox file lifecycle case 455.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0455',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0455.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0455');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0455');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_45600
     * @tc.name      testDfmaFileIo0456
     * @tc.desc      Verify sandbox file lifecycle case 456.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0456',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0456.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0456');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0456');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_45700
     * @tc.name      testDfmaFileIo0457
     * @tc.desc      Verify sandbox file lifecycle case 457.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0457',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0457.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0457');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0457');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_45800
     * @tc.name      testDfmaFileIo0458
     * @tc.desc      Verify sandbox file lifecycle case 458.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0458',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0458.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0458');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0458');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_45900
     * @tc.name      testDfmaFileIo0459
     * @tc.desc      Verify sandbox file lifecycle case 459.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0459',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0459.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0459');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0459');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_46000
     * @tc.name      testDfmaFileIo0460
     * @tc.desc      Verify sandbox file lifecycle case 460.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0460',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0460.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0460');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0460');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_46100
     * @tc.name      testDfmaFileIo0461
     * @tc.desc      Verify sandbox file lifecycle case 461.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0461',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0461.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0461');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0461');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_46200
     * @tc.name      testDfmaFileIo0462
     * @tc.desc      Verify sandbox file lifecycle case 462.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0462',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0462.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0462');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0462');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_46300
     * @tc.name      testDfmaFileIo0463
     * @tc.desc      Verify sandbox file lifecycle case 463.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0463',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0463.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0463');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0463');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_46400
     * @tc.name      testDfmaFileIo0464
     * @tc.desc      Verify sandbox file lifecycle case 464.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0464',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0464.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0464');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0464');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_46500
     * @tc.name      testDfmaFileIo0465
     * @tc.desc      Verify sandbox file lifecycle case 465.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0465',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0465.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0465');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0465');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_46600
     * @tc.name      testDfmaFileIo0466
     * @tc.desc      Verify sandbox file lifecycle case 466.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0466',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0466.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0466');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0466');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_46700
     * @tc.name      testDfmaFileIo0467
     * @tc.desc      Verify sandbox file lifecycle case 467.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0467',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0467.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0467');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0467');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_46800
     * @tc.name      testDfmaFileIo0468
     * @tc.desc      Verify sandbox file lifecycle case 468.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0468',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0468.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0468');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0468');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_46900
     * @tc.name      testDfmaFileIo0469
     * @tc.desc      Verify sandbox file lifecycle case 469.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0469',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0469.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0469');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0469');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_47000
     * @tc.name      testDfmaFileIo0470
     * @tc.desc      Verify sandbox file lifecycle case 470.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0470',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0470.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0470');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0470');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_47100
     * @tc.name      testDfmaFileIo0471
     * @tc.desc      Verify sandbox file lifecycle case 471.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0471',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0471.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0471');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0471');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_47200
     * @tc.name      testDfmaFileIo0472
     * @tc.desc      Verify sandbox file lifecycle case 472.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0472',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0472.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0472');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0472');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_47300
     * @tc.name      testDfmaFileIo0473
     * @tc.desc      Verify sandbox file lifecycle case 473.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0473',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0473.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0473');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0473');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_47400
     * @tc.name      testDfmaFileIo0474
     * @tc.desc      Verify sandbox file lifecycle case 474.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0474',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0474.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0474');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0474');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_47500
     * @tc.name      testDfmaFileIo0475
     * @tc.desc      Verify sandbox file lifecycle case 475.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0475',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0475.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0475');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0475');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_47600
     * @tc.name      testDfmaFileIo0476
     * @tc.desc      Verify sandbox file lifecycle case 476.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0476',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0476.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0476');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0476');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_47700
     * @tc.name      testDfmaFileIo0477
     * @tc.desc      Verify sandbox file lifecycle case 477.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0477',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0477.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0477');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0477');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_47800
     * @tc.name      testDfmaFileIo0478
     * @tc.desc      Verify sandbox file lifecycle case 478.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0478',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0478.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0478');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0478');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_47900
     * @tc.name      testDfmaFileIo0479
     * @tc.desc      Verify sandbox file lifecycle case 479.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0479',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0479.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0479');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0479');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_48000
     * @tc.name      testDfmaFileIo0480
     * @tc.desc      Verify sandbox file lifecycle case 480.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0480',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0480.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0480');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0480');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_48100
     * @tc.name      testDfmaFileIo0481
     * @tc.desc      Verify sandbox file lifecycle case 481.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0481',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0481.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0481');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0481');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_48200
     * @tc.name      testDfmaFileIo0482
     * @tc.desc      Verify sandbox file lifecycle case 482.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0482',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0482.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0482');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0482');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_48300
     * @tc.name      testDfmaFileIo0483
     * @tc.desc      Verify sandbox file lifecycle case 483.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0483',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0483.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0483');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0483');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_48400
     * @tc.name      testDfmaFileIo0484
     * @tc.desc      Verify sandbox file lifecycle case 484.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0484',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0484.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0484');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0484');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_48500
     * @tc.name      testDfmaFileIo0485
     * @tc.desc      Verify sandbox file lifecycle case 485.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0485',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0485.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0485');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0485');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_48600
     * @tc.name      testDfmaFileIo0486
     * @tc.desc      Verify sandbox file lifecycle case 486.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0486',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0486.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0486');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0486');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_48700
     * @tc.name      testDfmaFileIo0487
     * @tc.desc      Verify sandbox file lifecycle case 487.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0487',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0487.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0487');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0487');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_48800
     * @tc.name      testDfmaFileIo0488
     * @tc.desc      Verify sandbox file lifecycle case 488.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0488',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0488.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0488');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0488');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_48900
     * @tc.name      testDfmaFileIo0489
     * @tc.desc      Verify sandbox file lifecycle case 489.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0489',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0489.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0489');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0489');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_49000
     * @tc.name      testDfmaFileIo0490
     * @tc.desc      Verify sandbox file lifecycle case 490.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0490',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0490.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0490');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0490');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_49100
     * @tc.name      testDfmaFileIo0491
     * @tc.desc      Verify sandbox file lifecycle case 491.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0491',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0491.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0491');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0491');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_49200
     * @tc.name      testDfmaFileIo0492
     * @tc.desc      Verify sandbox file lifecycle case 492.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0492',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0492.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0492');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0492');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_49300
     * @tc.name      testDfmaFileIo0493
     * @tc.desc      Verify sandbox file lifecycle case 493.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0493',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0493.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0493');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0493');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_49400
     * @tc.name      testDfmaFileIo0494
     * @tc.desc      Verify sandbox file lifecycle case 494.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0494',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0494.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0494');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0494');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_49500
     * @tc.name      testDfmaFileIo0495
     * @tc.desc      Verify sandbox file lifecycle case 495.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0495',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0495.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0495');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0495');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_49600
     * @tc.name      testDfmaFileIo0496
     * @tc.desc      Verify sandbox file lifecycle case 496.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0496',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0496.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0496');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0496');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_49700
     * @tc.name      testDfmaFileIo0497
     * @tc.desc      Verify sandbox file lifecycle case 497.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0497',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0497.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0497');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0497');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_49800
     * @tc.name      testDfmaFileIo0498
     * @tc.desc      Verify sandbox file lifecycle case 498.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0498',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0498.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0498');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0498');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_49900
     * @tc.name      testDfmaFileIo0499
     * @tc.desc      Verify sandbox file lifecycle case 499.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0499',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0499.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0499');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0499');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_50000
     * @tc.name      testDfmaFileIo0500
     * @tc.desc      Verify sandbox file lifecycle case 500.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0500.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0500');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0500');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_50100
     * @tc.name      testDfmaFileIo0501
     * @tc.desc      Verify sandbox file lifecycle case 501.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0501',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0501.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0501');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0501');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_50200
     * @tc.name      testDfmaFileIo0502
     * @tc.desc      Verify sandbox file lifecycle case 502.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0502',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0502.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0502');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0502');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_50300
     * @tc.name      testDfmaFileIo0503
     * @tc.desc      Verify sandbox file lifecycle case 503.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0503',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0503.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0503');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0503');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_50400
     * @tc.name      testDfmaFileIo0504
     * @tc.desc      Verify sandbox file lifecycle case 504.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0504',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0504.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0504');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0504');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_50500
     * @tc.name      testDfmaFileIo0505
     * @tc.desc      Verify sandbox file lifecycle case 505.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0505',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0505.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0505');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0505');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_50600
     * @tc.name      testDfmaFileIo0506
     * @tc.desc      Verify sandbox file lifecycle case 506.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0506',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0506.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0506');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0506');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_50700
     * @tc.name      testDfmaFileIo0507
     * @tc.desc      Verify sandbox file lifecycle case 507.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0507',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0507.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0507');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0507');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_50800
     * @tc.name      testDfmaFileIo0508
     * @tc.desc      Verify sandbox file lifecycle case 508.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0508',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0508.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0508');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0508');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_50900
     * @tc.name      testDfmaFileIo0509
     * @tc.desc      Verify sandbox file lifecycle case 509.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0509',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0509.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0509');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0509');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_51000
     * @tc.name      testDfmaFileIo0510
     * @tc.desc      Verify sandbox file lifecycle case 510.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0510',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0510.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0510');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0510');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_51100
     * @tc.name      testDfmaFileIo0511
     * @tc.desc      Verify sandbox file lifecycle case 511.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0511',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0511.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0511');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0511');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_51200
     * @tc.name      testDfmaFileIo0512
     * @tc.desc      Verify sandbox file lifecycle case 512.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0512',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0512.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0512');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0512');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_51300
     * @tc.name      testDfmaFileIo0513
     * @tc.desc      Verify sandbox file lifecycle case 513.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0513',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0513.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0513');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0513');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_51400
     * @tc.name      testDfmaFileIo0514
     * @tc.desc      Verify sandbox file lifecycle case 514.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0514',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0514.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0514');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0514');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_51500
     * @tc.name      testDfmaFileIo0515
     * @tc.desc      Verify sandbox file lifecycle case 515.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0515',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0515.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0515');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0515');
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
