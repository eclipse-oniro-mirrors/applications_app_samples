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

  });
}
