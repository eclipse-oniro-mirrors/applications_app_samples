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
import { fileIo as fs, WatchEvent } from '@kit.CoreFileKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

let ROOT: string = '';
function writeFile(path: string, content: string): void {
  const file: fs.File = fs.openSync(path,
    fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
  fs.writeSync(file.fd, content);
  fs.closeSync(file);
}
function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => setTimeout(resolve, ms));
}

export default function dfmaLargeStreamExtraTest(): void {
  describe('DfmaLargeStreamExtraTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_large_extra';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try { fs.rmdirSync(ROOT); } catch (err) {}
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_0100
     * @tc.name      testDfmaLargeContent0001
     * @tc.desc      Verify large content size 1 case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_001.dat';
          writeFile(path, 'x'.repeat(1));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(1);
          expect(fs.readTextSync(path).length).assertEqual(1);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_0200
     * @tc.name      testDfmaLargeContent0002
     * @tc.desc      Verify large content size 2 case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_002.dat';
          writeFile(path, 'x'.repeat(2));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(2);
          expect(fs.readTextSync(path).length).assertEqual(2);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_0300
     * @tc.name      testDfmaLargeContent0003
     * @tc.desc      Verify large content size 4 case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_003.dat';
          writeFile(path, 'x'.repeat(4));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(4);
          expect(fs.readTextSync(path).length).assertEqual(4);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_0400
     * @tc.name      testDfmaLargeContent0004
     * @tc.desc      Verify large content size 8 case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_004.dat';
          writeFile(path, 'x'.repeat(8));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(8);
          expect(fs.readTextSync(path).length).assertEqual(8);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_0500
     * @tc.name      testDfmaLargeContent0005
     * @tc.desc      Verify large content size 16 case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_005.dat';
          writeFile(path, 'x'.repeat(16));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(16);
          expect(fs.readTextSync(path).length).assertEqual(16);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_0600
     * @tc.name      testDfmaLargeContent0006
     * @tc.desc      Verify large content size 32 case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_006.dat';
          writeFile(path, 'x'.repeat(32));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(32);
          expect(fs.readTextSync(path).length).assertEqual(32);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_0700
     * @tc.name      testDfmaLargeContent0007
     * @tc.desc      Verify large content size 64 case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_007.dat';
          writeFile(path, 'x'.repeat(64));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(64);
          expect(fs.readTextSync(path).length).assertEqual(64);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_0800
     * @tc.name      testDfmaLargeContent0008
     * @tc.desc      Verify large content size 128 case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_008.dat';
          writeFile(path, 'x'.repeat(128));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(128);
          expect(fs.readTextSync(path).length).assertEqual(128);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_0900
     * @tc.name      testDfmaLargeContent0009
     * @tc.desc      Verify large content size 256 case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_009.dat';
          writeFile(path, 'x'.repeat(256));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(256);
          expect(fs.readTextSync(path).length).assertEqual(256);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_1000
     * @tc.name      testDfmaLargeContent0010
     * @tc.desc      Verify large content size 512 case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_010.dat';
          writeFile(path, 'x'.repeat(512));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(512);
          expect(fs.readTextSync(path).length).assertEqual(512);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_1100
     * @tc.name      testDfmaLargeContent0011
     * @tc.desc      Verify large content size 1024 case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_011.dat';
          writeFile(path, 'x'.repeat(1024));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(1024);
          expect(fs.readTextSync(path).length).assertEqual(1024);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_1200
     * @tc.name      testDfmaLargeContent0012
     * @tc.desc      Verify large content size 2048 case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_012.dat';
          writeFile(path, 'x'.repeat(2048));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(2048);
          expect(fs.readTextSync(path).length).assertEqual(2048);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_1300
     * @tc.name      testDfmaLargeContent0013
     * @tc.desc      Verify large content size 4096 case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_013.dat';
          writeFile(path, 'x'.repeat(4096));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(4096);
          expect(fs.readTextSync(path).length).assertEqual(4096);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_1400
     * @tc.name      testDfmaLargeContent0014
     * @tc.desc      Verify large content size 8192 case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_014.dat';
          writeFile(path, 'x'.repeat(8192));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(8192);
          expect(fs.readTextSync(path).length).assertEqual(8192);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_1500
     * @tc.name      testDfmaLargeContent0015
     * @tc.desc      Verify large content size 16384 case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_015.dat';
          writeFile(path, 'x'.repeat(16384));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(16384);
          expect(fs.readTextSync(path).length).assertEqual(16384);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_1600
     * @tc.name      testDfmaLargeContent0016
     * @tc.desc      Verify large content size 32768 case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_016.dat';
          writeFile(path, 'x'.repeat(32768));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(32768);
          expect(fs.readTextSync(path).length).assertEqual(32768);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_1700
     * @tc.name      testDfmaLargeContent0017
     * @tc.desc      Verify large content size 65536 case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_017.dat';
          writeFile(path, 'x'.repeat(65536));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(65536);
          expect(fs.readTextSync(path).length).assertEqual(65536);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_1800
     * @tc.name      testDfmaLargeContent0018
     * @tc.desc      Verify large content size 131072 case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_018.dat';
          writeFile(path, 'x'.repeat(131072));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(131072);
          expect(fs.readTextSync(path).length).assertEqual(131072);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_1900
     * @tc.name      testDfmaLargeContent0019
     * @tc.desc      Verify large content size 262144 case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_019.dat';
          writeFile(path, 'x'.repeat(262144));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(262144);
          expect(fs.readTextSync(path).length).assertEqual(262144);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_2000
     * @tc.name      testDfmaLargeContent0020
     * @tc.desc      Verify large content size 524288 case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/large_020.dat';
          writeFile(path, 'x'.repeat(524288));
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.statSync(path).size).assertEqual(524288);
          expect(fs.readTextSync(path).length).assertEqual(524288);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_2100
     * @tc.name      testDfmaLargeContent0021
     * @tc.desc      Verify append mode case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/append_021.txt';
          writeFile(path, 'A');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.APPEND);
          fs.writeSync(file.fd, 'B');
          fs.closeSync(file);
          expect(fs.readTextSync(path)).assertEqual('AB');
          expect(fs.statSync(path).size).assertEqual(2);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_2200
     * @tc.name      testDfmaLargeContent0022
     * @tc.desc      Verify append mode case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/append_022.txt';
          writeFile(path, 'A');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.APPEND);
          fs.writeSync(file.fd, 'B');
          fs.closeSync(file);
          expect(fs.readTextSync(path)).assertEqual('AB');
          expect(fs.statSync(path).size).assertEqual(2);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_2300
     * @tc.name      testDfmaLargeContent0023
     * @tc.desc      Verify append mode case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/append_023.txt';
          writeFile(path, 'A');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.APPEND);
          fs.writeSync(file.fd, 'B');
          fs.closeSync(file);
          expect(fs.readTextSync(path)).assertEqual('AB');
          expect(fs.statSync(path).size).assertEqual(2);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_2400
     * @tc.name      testDfmaLargeContent0024
     * @tc.desc      Verify append mode case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/append_024.txt';
          writeFile(path, 'A');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.APPEND);
          fs.writeSync(file.fd, 'B');
          fs.closeSync(file);
          expect(fs.readTextSync(path)).assertEqual('AB');
          expect(fs.statSync(path).size).assertEqual(2);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_2500
     * @tc.name      testDfmaLargeContent0025
     * @tc.desc      Verify append mode case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/append_025.txt';
          writeFile(path, 'A');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.APPEND);
          fs.writeSync(file.fd, 'B');
          fs.closeSync(file);
          expect(fs.readTextSync(path)).assertEqual('AB');
          expect(fs.statSync(path).size).assertEqual(2);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_2600
     * @tc.name      testDfmaLargeContent0026
     * @tc.desc      Verify truncate case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/truncate_026.txt';
          writeFile(path, 'abcdefghij');
          fs.truncateSync(path, 3);
          expect(fs.readTextSync(path)).assertEqual('abc');
          expect(fs.statSync(path).size).assertEqual(3);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_2700
     * @tc.name      testDfmaLargeContent0027
     * @tc.desc      Verify truncate case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/truncate_027.txt';
          writeFile(path, 'abcdefghij');
          fs.truncateSync(path, 3);
          expect(fs.readTextSync(path)).assertEqual('abc');
          expect(fs.statSync(path).size).assertEqual(3);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_2800
     * @tc.name      testDfmaLargeContent0028
     * @tc.desc      Verify truncate case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/truncate_028.txt';
          writeFile(path, 'abcdefghij');
          fs.truncateSync(path, 3);
          expect(fs.readTextSync(path)).assertEqual('abc');
          expect(fs.statSync(path).size).assertEqual(3);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_2900
     * @tc.name      testDfmaLargeContent0029
     * @tc.desc      Verify truncate case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/truncate_029.txt';
          writeFile(path, 'abcdefghij');
          fs.truncateSync(path, 3);
          expect(fs.readTextSync(path)).assertEqual('abc');
          expect(fs.statSync(path).size).assertEqual(3);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_LARGE_3000
     * @tc.name      testDfmaLargeContent0030
     * @tc.desc      Verify truncate case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaLargeContent0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/truncate_030.txt';
          writeFile(path, 'abcdefghij');
          fs.truncateSync(path, 3);
          expect(fs.readTextSync(path)).assertEqual('abc');
          expect(fs.statSync(path).size).assertEqual(3);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
