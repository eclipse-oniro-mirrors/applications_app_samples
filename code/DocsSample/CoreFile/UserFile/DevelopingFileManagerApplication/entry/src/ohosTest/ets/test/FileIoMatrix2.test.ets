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

export default function fileIoMatrix2Test(): void {
  describe('DfmaFileIoMatrix2Test', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_matrix2';
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
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_17300
     * @tc.name      testDfmaFileIo0173
     * @tc.desc      Verify sandbox file lifecycle case 173.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0173',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0173.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0173');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0173');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_17400
     * @tc.name      testDfmaFileIo0174
     * @tc.desc      Verify sandbox file lifecycle case 174.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0174',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0174.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0174');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0174');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_17500
     * @tc.name      testDfmaFileIo0175
     * @tc.desc      Verify sandbox file lifecycle case 175.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0175',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0175.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0175');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0175');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_17600
     * @tc.name      testDfmaFileIo0176
     * @tc.desc      Verify sandbox file lifecycle case 176.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0176',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0176.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0176');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0176');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_17700
     * @tc.name      testDfmaFileIo0177
     * @tc.desc      Verify sandbox file lifecycle case 177.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0177',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0177.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0177');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0177');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_17800
     * @tc.name      testDfmaFileIo0178
     * @tc.desc      Verify sandbox file lifecycle case 178.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0178',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0178.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0178');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0178');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_17900
     * @tc.name      testDfmaFileIo0179
     * @tc.desc      Verify sandbox file lifecycle case 179.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0179',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0179.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0179');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0179');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_18000
     * @tc.name      testDfmaFileIo0180
     * @tc.desc      Verify sandbox file lifecycle case 180.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0180',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0180.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0180');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0180');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_18100
     * @tc.name      testDfmaFileIo0181
     * @tc.desc      Verify sandbox file lifecycle case 181.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0181',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0181.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0181');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0181');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_18200
     * @tc.name      testDfmaFileIo0182
     * @tc.desc      Verify sandbox file lifecycle case 182.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0182',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0182.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0182');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0182');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_18300
     * @tc.name      testDfmaFileIo0183
     * @tc.desc      Verify sandbox file lifecycle case 183.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0183',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0183.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0183');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0183');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_18400
     * @tc.name      testDfmaFileIo0184
     * @tc.desc      Verify sandbox file lifecycle case 184.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0184',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0184.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0184');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0184');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_18500
     * @tc.name      testDfmaFileIo0185
     * @tc.desc      Verify sandbox file lifecycle case 185.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0185',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0185.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0185');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0185');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_18600
     * @tc.name      testDfmaFileIo0186
     * @tc.desc      Verify sandbox file lifecycle case 186.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0186',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0186.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0186');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0186');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_18700
     * @tc.name      testDfmaFileIo0187
     * @tc.desc      Verify sandbox file lifecycle case 187.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0187',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0187.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0187');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0187');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_18800
     * @tc.name      testDfmaFileIo0188
     * @tc.desc      Verify sandbox file lifecycle case 188.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0188',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0188.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0188');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0188');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_18900
     * @tc.name      testDfmaFileIo0189
     * @tc.desc      Verify sandbox file lifecycle case 189.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0189',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0189.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0189');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0189');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_19000
     * @tc.name      testDfmaFileIo0190
     * @tc.desc      Verify sandbox file lifecycle case 190.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0190',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0190.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0190');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0190');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_19100
     * @tc.name      testDfmaFileIo0191
     * @tc.desc      Verify sandbox file lifecycle case 191.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0191',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0191.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0191');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0191');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_19200
     * @tc.name      testDfmaFileIo0192
     * @tc.desc      Verify sandbox file lifecycle case 192.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0192',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0192.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0192');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0192');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_19300
     * @tc.name      testDfmaFileIo0193
     * @tc.desc      Verify sandbox file lifecycle case 193.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0193',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0193.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0193');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0193');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_19400
     * @tc.name      testDfmaFileIo0194
     * @tc.desc      Verify sandbox file lifecycle case 194.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0194',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0194.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0194');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0194');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_19500
     * @tc.name      testDfmaFileIo0195
     * @tc.desc      Verify sandbox file lifecycle case 195.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0195',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0195.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0195');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0195');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_19600
     * @tc.name      testDfmaFileIo0196
     * @tc.desc      Verify sandbox file lifecycle case 196.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0196',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0196.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0196');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0196');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_19700
     * @tc.name      testDfmaFileIo0197
     * @tc.desc      Verify sandbox file lifecycle case 197.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0197',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0197.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0197');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0197');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_19800
     * @tc.name      testDfmaFileIo0198
     * @tc.desc      Verify sandbox file lifecycle case 198.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0198',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0198.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0198');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0198');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_19900
     * @tc.name      testDfmaFileIo0199
     * @tc.desc      Verify sandbox file lifecycle case 199.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0199',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0199.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0199');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0199');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_20000
     * @tc.name      testDfmaFileIo0200
     * @tc.desc      Verify sandbox file lifecycle case 200.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0200.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0200');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0200');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_20100
     * @tc.name      testDfmaFileIo0201
     * @tc.desc      Verify sandbox file lifecycle case 201.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0201',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0201.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0201');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0201');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_20200
     * @tc.name      testDfmaFileIo0202
     * @tc.desc      Verify sandbox file lifecycle case 202.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0202',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0202.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0202');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0202');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_20300
     * @tc.name      testDfmaFileIo0203
     * @tc.desc      Verify sandbox file lifecycle case 203.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0203',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0203.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0203');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0203');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_20400
     * @tc.name      testDfmaFileIo0204
     * @tc.desc      Verify sandbox file lifecycle case 204.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0204',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0204.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0204');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0204');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_20500
     * @tc.name      testDfmaFileIo0205
     * @tc.desc      Verify sandbox file lifecycle case 205.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0205',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0205.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0205');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0205');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_20600
     * @tc.name      testDfmaFileIo0206
     * @tc.desc      Verify sandbox file lifecycle case 206.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0206',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0206.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0206');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0206');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_20700
     * @tc.name      testDfmaFileIo0207
     * @tc.desc      Verify sandbox file lifecycle case 207.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0207',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0207.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0207');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0207');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_20800
     * @tc.name      testDfmaFileIo0208
     * @tc.desc      Verify sandbox file lifecycle case 208.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0208',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0208.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0208');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0208');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_20900
     * @tc.name      testDfmaFileIo0209
     * @tc.desc      Verify sandbox file lifecycle case 209.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0209',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0209.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0209');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0209');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_21000
     * @tc.name      testDfmaFileIo0210
     * @tc.desc      Verify sandbox file lifecycle case 210.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0210.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0210');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0210');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_21100
     * @tc.name      testDfmaFileIo0211
     * @tc.desc      Verify sandbox file lifecycle case 211.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0211',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0211.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0211');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0211');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_21200
     * @tc.name      testDfmaFileIo0212
     * @tc.desc      Verify sandbox file lifecycle case 212.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0212',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0212.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0212');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0212');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_21300
     * @tc.name      testDfmaFileIo0213
     * @tc.desc      Verify sandbox file lifecycle case 213.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0213',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0213.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0213');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0213');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_21400
     * @tc.name      testDfmaFileIo0214
     * @tc.desc      Verify sandbox file lifecycle case 214.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0214',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0214.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0214');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0214');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_21500
     * @tc.name      testDfmaFileIo0215
     * @tc.desc      Verify sandbox file lifecycle case 215.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0215',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0215.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0215');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0215');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_21600
     * @tc.name      testDfmaFileIo0216
     * @tc.desc      Verify sandbox file lifecycle case 216.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0216',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0216.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0216');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0216');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_21700
     * @tc.name      testDfmaFileIo0217
     * @tc.desc      Verify sandbox file lifecycle case 217.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0217',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0217.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0217');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0217');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_21800
     * @tc.name      testDfmaFileIo0218
     * @tc.desc      Verify sandbox file lifecycle case 218.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0218',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0218.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0218');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0218');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_21900
     * @tc.name      testDfmaFileIo0219
     * @tc.desc      Verify sandbox file lifecycle case 219.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0219',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0219.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0219');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0219');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_22000
     * @tc.name      testDfmaFileIo0220
     * @tc.desc      Verify sandbox file lifecycle case 220.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0220',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0220.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0220');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0220');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_22100
     * @tc.name      testDfmaFileIo0221
     * @tc.desc      Verify sandbox file lifecycle case 221.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0221',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0221.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0221');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0221');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_22200
     * @tc.name      testDfmaFileIo0222
     * @tc.desc      Verify sandbox file lifecycle case 222.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0222',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0222.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0222');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0222');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_22300
     * @tc.name      testDfmaFileIo0223
     * @tc.desc      Verify sandbox file lifecycle case 223.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0223',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0223.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0223');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0223');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_22400
     * @tc.name      testDfmaFileIo0224
     * @tc.desc      Verify sandbox file lifecycle case 224.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0224',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0224.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0224');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0224');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_22500
     * @tc.name      testDfmaFileIo0225
     * @tc.desc      Verify sandbox file lifecycle case 225.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0225',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0225.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0225');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0225');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_22600
     * @tc.name      testDfmaFileIo0226
     * @tc.desc      Verify sandbox file lifecycle case 226.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0226',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0226.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0226');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0226');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_22700
     * @tc.name      testDfmaFileIo0227
     * @tc.desc      Verify sandbox file lifecycle case 227.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0227',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0227.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0227');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0227');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_22800
     * @tc.name      testDfmaFileIo0228
     * @tc.desc      Verify sandbox file lifecycle case 228.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0228',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0228.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0228');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0228');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_22900
     * @tc.name      testDfmaFileIo0229
     * @tc.desc      Verify sandbox file lifecycle case 229.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0229',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0229.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0229');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0229');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_23000
     * @tc.name      testDfmaFileIo0230
     * @tc.desc      Verify sandbox file lifecycle case 230.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0230',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0230.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0230');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0230');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_23100
     * @tc.name      testDfmaFileIo0231
     * @tc.desc      Verify sandbox file lifecycle case 231.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0231',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0231.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0231');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0231');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_23200
     * @tc.name      testDfmaFileIo0232
     * @tc.desc      Verify sandbox file lifecycle case 232.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0232',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0232.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0232');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0232');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_23300
     * @tc.name      testDfmaFileIo0233
     * @tc.desc      Verify sandbox file lifecycle case 233.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0233',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0233.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0233');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0233');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_23400
     * @tc.name      testDfmaFileIo0234
     * @tc.desc      Verify sandbox file lifecycle case 234.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0234',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0234.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0234');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0234');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_23500
     * @tc.name      testDfmaFileIo0235
     * @tc.desc      Verify sandbox file lifecycle case 235.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0235',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0235.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0235');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0235');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_23600
     * @tc.name      testDfmaFileIo0236
     * @tc.desc      Verify sandbox file lifecycle case 236.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0236',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0236.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0236');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0236');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_23700
     * @tc.name      testDfmaFileIo0237
     * @tc.desc      Verify sandbox file lifecycle case 237.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0237',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0237.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0237');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0237');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_23800
     * @tc.name      testDfmaFileIo0238
     * @tc.desc      Verify sandbox file lifecycle case 238.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0238',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0238.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0238');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0238');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_23900
     * @tc.name      testDfmaFileIo0239
     * @tc.desc      Verify sandbox file lifecycle case 239.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0239',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0239.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0239');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0239');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_24000
     * @tc.name      testDfmaFileIo0240
     * @tc.desc      Verify sandbox file lifecycle case 240.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0240',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0240.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0240');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0240');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_24100
     * @tc.name      testDfmaFileIo0241
     * @tc.desc      Verify sandbox file lifecycle case 241.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0241',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0241.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0241');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0241');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_24200
     * @tc.name      testDfmaFileIo0242
     * @tc.desc      Verify sandbox file lifecycle case 242.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0242',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0242.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0242');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0242');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_24300
     * @tc.name      testDfmaFileIo0243
     * @tc.desc      Verify sandbox file lifecycle case 243.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0243',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0243.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0243');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0243');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_24400
     * @tc.name      testDfmaFileIo0244
     * @tc.desc      Verify sandbox file lifecycle case 244.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0244',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0244.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0244');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0244');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_24500
     * @tc.name      testDfmaFileIo0245
     * @tc.desc      Verify sandbox file lifecycle case 245.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0245',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0245.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0245');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0245');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_24600
     * @tc.name      testDfmaFileIo0246
     * @tc.desc      Verify sandbox file lifecycle case 246.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0246',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0246.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0246');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0246');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_24700
     * @tc.name      testDfmaFileIo0247
     * @tc.desc      Verify sandbox file lifecycle case 247.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0247',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0247.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0247');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0247');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_24800
     * @tc.name      testDfmaFileIo0248
     * @tc.desc      Verify sandbox file lifecycle case 248.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0248',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0248.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0248');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0248');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_24900
     * @tc.name      testDfmaFileIo0249
     * @tc.desc      Verify sandbox file lifecycle case 249.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0249',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0249.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0249');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0249');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_25000
     * @tc.name      testDfmaFileIo0250
     * @tc.desc      Verify sandbox file lifecycle case 250.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0250',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0250.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0250');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0250');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_25100
     * @tc.name      testDfmaFileIo0251
     * @tc.desc      Verify sandbox file lifecycle case 251.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0251',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0251.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0251');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0251');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_25200
     * @tc.name      testDfmaFileIo0252
     * @tc.desc      Verify sandbox file lifecycle case 252.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0252',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0252.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0252');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0252');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_25300
     * @tc.name      testDfmaFileIo0253
     * @tc.desc      Verify sandbox file lifecycle case 253.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0253',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0253.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0253');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0253');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_25400
     * @tc.name      testDfmaFileIo0254
     * @tc.desc      Verify sandbox file lifecycle case 254.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0254',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0254.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0254');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0254');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_25500
     * @tc.name      testDfmaFileIo0255
     * @tc.desc      Verify sandbox file lifecycle case 255.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0255',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0255.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0255');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0255');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_25600
     * @tc.name      testDfmaFileIo0256
     * @tc.desc      Verify sandbox file lifecycle case 256.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0256',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0256.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0256');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0256');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_25700
     * @tc.name      testDfmaFileIo0257
     * @tc.desc      Verify sandbox file lifecycle case 257.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0257',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0257.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0257');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0257');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_25800
     * @tc.name      testDfmaFileIo0258
     * @tc.desc      Verify sandbox file lifecycle case 258.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0258',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0258.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0258');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0258');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_25900
     * @tc.name      testDfmaFileIo0259
     * @tc.desc      Verify sandbox file lifecycle case 259.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0259',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0259.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0259');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0259');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_26000
     * @tc.name      testDfmaFileIo0260
     * @tc.desc      Verify sandbox file lifecycle case 260.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0260',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0260.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0260');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0260');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_26100
     * @tc.name      testDfmaFileIo0261
     * @tc.desc      Verify sandbox file lifecycle case 261.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0261',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0261.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0261');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0261');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_26200
     * @tc.name      testDfmaFileIo0262
     * @tc.desc      Verify sandbox file lifecycle case 262.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0262',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0262.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0262');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0262');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_26300
     * @tc.name      testDfmaFileIo0263
     * @tc.desc      Verify sandbox file lifecycle case 263.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0263',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0263.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0263');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0263');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_26400
     * @tc.name      testDfmaFileIo0264
     * @tc.desc      Verify sandbox file lifecycle case 264.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0264',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0264.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0264');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0264');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_26500
     * @tc.name      testDfmaFileIo0265
     * @tc.desc      Verify sandbox file lifecycle case 265.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0265',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0265.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0265');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0265');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_26600
     * @tc.name      testDfmaFileIo0266
     * @tc.desc      Verify sandbox file lifecycle case 266.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0266',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0266.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0266');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0266');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_26700
     * @tc.name      testDfmaFileIo0267
     * @tc.desc      Verify sandbox file lifecycle case 267.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0267',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0267.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0267');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0267');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_26800
     * @tc.name      testDfmaFileIo0268
     * @tc.desc      Verify sandbox file lifecycle case 268.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0268',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0268.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0268');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0268');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_26900
     * @tc.name      testDfmaFileIo0269
     * @tc.desc      Verify sandbox file lifecycle case 269.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0269',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0269.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0269');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0269');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_27000
     * @tc.name      testDfmaFileIo0270
     * @tc.desc      Verify sandbox file lifecycle case 270.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0270',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0270.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0270');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0270');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_27100
     * @tc.name      testDfmaFileIo0271
     * @tc.desc      Verify sandbox file lifecycle case 271.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0271',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0271.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0271');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0271');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_27200
     * @tc.name      testDfmaFileIo0272
     * @tc.desc      Verify sandbox file lifecycle case 272.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0272',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0272.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0272');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0272');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_27300
     * @tc.name      testDfmaFileIo0273
     * @tc.desc      Verify sandbox file lifecycle case 273.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0273',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0273.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0273');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0273');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_27400
     * @tc.name      testDfmaFileIo0274
     * @tc.desc      Verify sandbox file lifecycle case 274.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0274',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0274.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0274');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0274');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_27500
     * @tc.name      testDfmaFileIo0275
     * @tc.desc      Verify sandbox file lifecycle case 275.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0275',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0275.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0275');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0275');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_27600
     * @tc.name      testDfmaFileIo0276
     * @tc.desc      Verify sandbox file lifecycle case 276.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0276',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0276.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0276');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0276');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_27700
     * @tc.name      testDfmaFileIo0277
     * @tc.desc      Verify sandbox file lifecycle case 277.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0277',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0277.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0277');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0277');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_27800
     * @tc.name      testDfmaFileIo0278
     * @tc.desc      Verify sandbox file lifecycle case 278.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0278',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0278.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0278');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0278');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_27900
     * @tc.name      testDfmaFileIo0279
     * @tc.desc      Verify sandbox file lifecycle case 279.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0279',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0279.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0279');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0279');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_28000
     * @tc.name      testDfmaFileIo0280
     * @tc.desc      Verify sandbox file lifecycle case 280.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0280',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0280.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0280');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0280');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_28100
     * @tc.name      testDfmaFileIo0281
     * @tc.desc      Verify sandbox file lifecycle case 281.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0281',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0281.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0281');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0281');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_28200
     * @tc.name      testDfmaFileIo0282
     * @tc.desc      Verify sandbox file lifecycle case 282.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0282',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0282.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0282');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0282');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_28300
     * @tc.name      testDfmaFileIo0283
     * @tc.desc      Verify sandbox file lifecycle case 283.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0283',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0283.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0283');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0283');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_28400
     * @tc.name      testDfmaFileIo0284
     * @tc.desc      Verify sandbox file lifecycle case 284.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0284',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0284.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0284');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0284');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_28500
     * @tc.name      testDfmaFileIo0285
     * @tc.desc      Verify sandbox file lifecycle case 285.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0285',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0285.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0285');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0285');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_28600
     * @tc.name      testDfmaFileIo0286
     * @tc.desc      Verify sandbox file lifecycle case 286.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0286',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0286.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0286');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0286');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_28700
     * @tc.name      testDfmaFileIo0287
     * @tc.desc      Verify sandbox file lifecycle case 287.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0287',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0287.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0287');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0287');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_28800
     * @tc.name      testDfmaFileIo0288
     * @tc.desc      Verify sandbox file lifecycle case 288.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0288',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0288.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0288');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0288');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_28900
     * @tc.name      testDfmaFileIo0289
     * @tc.desc      Verify sandbox file lifecycle case 289.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0289',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0289.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0289');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0289');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_29000
     * @tc.name      testDfmaFileIo0290
     * @tc.desc      Verify sandbox file lifecycle case 290.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0290',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0290.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0290');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0290');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_29100
     * @tc.name      testDfmaFileIo0291
     * @tc.desc      Verify sandbox file lifecycle case 291.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0291',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0291.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0291');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0291');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_29200
     * @tc.name      testDfmaFileIo0292
     * @tc.desc      Verify sandbox file lifecycle case 292.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0292',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0292.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0292');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0292');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_29300
     * @tc.name      testDfmaFileIo0293
     * @tc.desc      Verify sandbox file lifecycle case 293.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0293',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0293.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0293');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0293');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_29400
     * @tc.name      testDfmaFileIo0294
     * @tc.desc      Verify sandbox file lifecycle case 294.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0294',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0294.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0294');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0294');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_29500
     * @tc.name      testDfmaFileIo0295
     * @tc.desc      Verify sandbox file lifecycle case 295.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0295',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0295.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0295');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0295');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_29600
     * @tc.name      testDfmaFileIo0296
     * @tc.desc      Verify sandbox file lifecycle case 296.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0296',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0296.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0296');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0296');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_29700
     * @tc.name      testDfmaFileIo0297
     * @tc.desc      Verify sandbox file lifecycle case 297.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0297',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0297.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0297');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0297');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_29800
     * @tc.name      testDfmaFileIo0298
     * @tc.desc      Verify sandbox file lifecycle case 298.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0298',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0298.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0298');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0298');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_29900
     * @tc.name      testDfmaFileIo0299
     * @tc.desc      Verify sandbox file lifecycle case 299.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0299',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0299.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0299');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0299');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_30000
     * @tc.name      testDfmaFileIo0300
     * @tc.desc      Verify sandbox file lifecycle case 300.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0300.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0300');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0300');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_30100
     * @tc.name      testDfmaFileIo0301
     * @tc.desc      Verify sandbox file lifecycle case 301.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0301',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0301.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0301');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0301');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_30200
     * @tc.name      testDfmaFileIo0302
     * @tc.desc      Verify sandbox file lifecycle case 302.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0302',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0302.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0302');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0302');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_30300
     * @tc.name      testDfmaFileIo0303
     * @tc.desc      Verify sandbox file lifecycle case 303.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0303',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0303.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0303');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0303');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_30400
     * @tc.name      testDfmaFileIo0304
     * @tc.desc      Verify sandbox file lifecycle case 304.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0304',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0304.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0304');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0304');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_30500
     * @tc.name      testDfmaFileIo0305
     * @tc.desc      Verify sandbox file lifecycle case 305.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0305',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0305.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0305');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0305');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_30600
     * @tc.name      testDfmaFileIo0306
     * @tc.desc      Verify sandbox file lifecycle case 306.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0306',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0306.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0306');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0306');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_30700
     * @tc.name      testDfmaFileIo0307
     * @tc.desc      Verify sandbox file lifecycle case 307.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0307',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0307.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0307');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0307');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_30800
     * @tc.name      testDfmaFileIo0308
     * @tc.desc      Verify sandbox file lifecycle case 308.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0308',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0308.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0308');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0308');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_30900
     * @tc.name      testDfmaFileIo0309
     * @tc.desc      Verify sandbox file lifecycle case 309.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0309',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0309.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0309');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0309');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_31000
     * @tc.name      testDfmaFileIo0310
     * @tc.desc      Verify sandbox file lifecycle case 310.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0310',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0310.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0310');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0310');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_31100
     * @tc.name      testDfmaFileIo0311
     * @tc.desc      Verify sandbox file lifecycle case 311.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0311',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0311.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0311');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0311');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_31200
     * @tc.name      testDfmaFileIo0312
     * @tc.desc      Verify sandbox file lifecycle case 312.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0312',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0312.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0312');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0312');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_31300
     * @tc.name      testDfmaFileIo0313
     * @tc.desc      Verify sandbox file lifecycle case 313.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0313',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0313.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0313');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0313');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_31400
     * @tc.name      testDfmaFileIo0314
     * @tc.desc      Verify sandbox file lifecycle case 314.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0314',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0314.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0314');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0314');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_31500
     * @tc.name      testDfmaFileIo0315
     * @tc.desc      Verify sandbox file lifecycle case 315.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0315',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0315.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0315');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0315');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_31600
     * @tc.name      testDfmaFileIo0316
     * @tc.desc      Verify sandbox file lifecycle case 316.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0316',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0316.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0316');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0316');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_31700
     * @tc.name      testDfmaFileIo0317
     * @tc.desc      Verify sandbox file lifecycle case 317.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0317',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0317.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0317');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0317');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_31800
     * @tc.name      testDfmaFileIo0318
     * @tc.desc      Verify sandbox file lifecycle case 318.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0318',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0318.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0318');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0318');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_31900
     * @tc.name      testDfmaFileIo0319
     * @tc.desc      Verify sandbox file lifecycle case 319.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0319',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0319.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0319');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0319');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_32000
     * @tc.name      testDfmaFileIo0320
     * @tc.desc      Verify sandbox file lifecycle case 320.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0320',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0320.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0320');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0320');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_32100
     * @tc.name      testDfmaFileIo0321
     * @tc.desc      Verify sandbox file lifecycle case 321.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0321',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0321.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0321');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0321');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_32200
     * @tc.name      testDfmaFileIo0322
     * @tc.desc      Verify sandbox file lifecycle case 322.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0322',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0322.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0322');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0322');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_32300
     * @tc.name      testDfmaFileIo0323
     * @tc.desc      Verify sandbox file lifecycle case 323.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0323',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0323.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0323');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0323');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_32400
     * @tc.name      testDfmaFileIo0324
     * @tc.desc      Verify sandbox file lifecycle case 324.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0324',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0324.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0324');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0324');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_32500
     * @tc.name      testDfmaFileIo0325
     * @tc.desc      Verify sandbox file lifecycle case 325.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0325',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0325.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0325');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0325');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_32600
     * @tc.name      testDfmaFileIo0326
     * @tc.desc      Verify sandbox file lifecycle case 326.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0326',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0326.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0326');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0326');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_32700
     * @tc.name      testDfmaFileIo0327
     * @tc.desc      Verify sandbox file lifecycle case 327.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0327',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0327.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0327');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0327');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_32800
     * @tc.name      testDfmaFileIo0328
     * @tc.desc      Verify sandbox file lifecycle case 328.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0328',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0328.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0328');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0328');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_32900
     * @tc.name      testDfmaFileIo0329
     * @tc.desc      Verify sandbox file lifecycle case 329.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0329',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0329.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0329');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0329');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_33000
     * @tc.name      testDfmaFileIo0330
     * @tc.desc      Verify sandbox file lifecycle case 330.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0330',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0330.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0330');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0330');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_33100
     * @tc.name      testDfmaFileIo0331
     * @tc.desc      Verify sandbox file lifecycle case 331.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0331',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0331.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0331');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0331');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_33200
     * @tc.name      testDfmaFileIo0332
     * @tc.desc      Verify sandbox file lifecycle case 332.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0332',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0332.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0332');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0332');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_33300
     * @tc.name      testDfmaFileIo0333
     * @tc.desc      Verify sandbox file lifecycle case 333.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0333',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0333.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0333');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0333');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_33400
     * @tc.name      testDfmaFileIo0334
     * @tc.desc      Verify sandbox file lifecycle case 334.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0334',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0334.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0334');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0334');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_33500
     * @tc.name      testDfmaFileIo0335
     * @tc.desc      Verify sandbox file lifecycle case 335.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0335',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0335.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0335');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0335');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_33600
     * @tc.name      testDfmaFileIo0336
     * @tc.desc      Verify sandbox file lifecycle case 336.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0336',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0336.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0336');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0336');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_33700
     * @tc.name      testDfmaFileIo0337
     * @tc.desc      Verify sandbox file lifecycle case 337.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0337',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0337.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0337');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0337');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_33800
     * @tc.name      testDfmaFileIo0338
     * @tc.desc      Verify sandbox file lifecycle case 338.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0338',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0338.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0338');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0338');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_33900
     * @tc.name      testDfmaFileIo0339
     * @tc.desc      Verify sandbox file lifecycle case 339.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0339',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0339.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0339');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0339');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_34000
     * @tc.name      testDfmaFileIo0340
     * @tc.desc      Verify sandbox file lifecycle case 340.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0340',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0340.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0340');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0340');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_34100
     * @tc.name      testDfmaFileIo0341
     * @tc.desc      Verify sandbox file lifecycle case 341.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0341',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0341.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0341');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0341');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_34200
     * @tc.name      testDfmaFileIo0342
     * @tc.desc      Verify sandbox file lifecycle case 342.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0342',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0342.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0342');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0342');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_34300
     * @tc.name      testDfmaFileIo0343
     * @tc.desc      Verify sandbox file lifecycle case 343.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0343',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0343.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0343');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0343');
          fs.unlinkSync(path);
          expect(fs.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_FILEIO_34400
     * @tc.name      testDfmaFileIo0344
     * @tc.desc      Verify sandbox file lifecycle case 344.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIo0344',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/case0344.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'dfma_content_0344');
          fs.closeSync(file);
          expect(fs.accessSync(path)).assertTrue();
          const stat: fs.Stat = fs.statSync(path);
          expect(stat.size).assertEqual(17);
          expect(fs.readTextSync(path)).assertEqual('dfma_content_0344');
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
