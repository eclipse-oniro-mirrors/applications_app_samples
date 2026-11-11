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

export default function dfmaRandomAccessTest(): void {
  describe('DfmaRandomAccessTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_random';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try { fs.rmdirSync(ROOT); } catch (err) {
        console.error('afterAll cleanup failed: ' + JSON.stringify(err));
      }
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_0100
     * @tc.name      testDfmaRandomAccess0001
     * @tc.desc      Verify random read offset 0 length 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_001.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(1);
          const read: number = fs.readSync(file.fd, buffer, { offset: 0, length: 1 });
          fs.closeSync(file);
          expect(read).assertEqual(1);
          expect(new Uint8Array(buffer)[0]).assertEqual(65);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_0200
     * @tc.name      testDfmaRandomAccess0002
     * @tc.desc      Verify random read offset 1 length 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_002.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(2);
          const read: number = fs.readSync(file.fd, buffer, { offset: 1, length: 2 });
          fs.closeSync(file);
          expect(read).assertEqual(2);
          expect(new Uint8Array(buffer)[0]).assertEqual(66);
          expect(new Uint8Array(buffer)[1]).assertEqual(67);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_0300
     * @tc.name      testDfmaRandomAccess0003
     * @tc.desc      Verify random read offset 2 length 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_003.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(3);
          const read: number = fs.readSync(file.fd, buffer, { offset: 2, length: 3 });
          fs.closeSync(file);
          expect(read).assertEqual(3);
          expect(new Uint8Array(buffer)[0]).assertEqual(67);
          expect(new Uint8Array(buffer)[2]).assertEqual(69);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_0400
     * @tc.name      testDfmaRandomAccess0004
     * @tc.desc      Verify random read offset 3 length 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_004.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(1);
          const read: number = fs.readSync(file.fd, buffer, { offset: 3, length: 1 });
          fs.closeSync(file);
          expect(read).assertEqual(1);
          expect(new Uint8Array(buffer)[0]).assertEqual(68);
          expect(new Uint8Array(buffer)[0]).assertEqual(68);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_0500
     * @tc.name      testDfmaRandomAccess0005
     * @tc.desc      Verify random read offset 4 length 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_005.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(2);
          const read: number = fs.readSync(file.fd, buffer, { offset: 4, length: 2 });
          fs.closeSync(file);
          expect(read).assertEqual(2);
          expect(new Uint8Array(buffer)[0]).assertEqual(69);
          expect(new Uint8Array(buffer)[1]).assertEqual(70);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_0600
     * @tc.name      testDfmaRandomAccess0006
     * @tc.desc      Verify random read offset 5 length 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_006.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(3);
          const read: number = fs.readSync(file.fd, buffer, { offset: 5, length: 3 });
          fs.closeSync(file);
          expect(read).assertEqual(3);
          expect(new Uint8Array(buffer)[0]).assertEqual(70);
          expect(new Uint8Array(buffer)[2]).assertEqual(72);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_0700
     * @tc.name      testDfmaRandomAccess0007
     * @tc.desc      Verify random read offset 6 length 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_007.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(1);
          const read: number = fs.readSync(file.fd, buffer, { offset: 6, length: 1 });
          fs.closeSync(file);
          expect(read).assertEqual(1);
          expect(new Uint8Array(buffer)[0]).assertEqual(71);
          expect(new Uint8Array(buffer)[0]).assertEqual(71);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_0800
     * @tc.name      testDfmaRandomAccess0008
     * @tc.desc      Verify random read offset 0 length 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_008.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(2);
          const read: number = fs.readSync(file.fd, buffer, { offset: 0, length: 2 });
          fs.closeSync(file);
          expect(read).assertEqual(2);
          expect(new Uint8Array(buffer)[0]).assertEqual(65);
          expect(new Uint8Array(buffer)[1]).assertEqual(66);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_0900
     * @tc.name      testDfmaRandomAccess0009
     * @tc.desc      Verify random read offset 1 length 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_009.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(3);
          const read: number = fs.readSync(file.fd, buffer, { offset: 1, length: 3 });
          fs.closeSync(file);
          expect(read).assertEqual(3);
          expect(new Uint8Array(buffer)[0]).assertEqual(66);
          expect(new Uint8Array(buffer)[2]).assertEqual(68);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_1000
     * @tc.name      testDfmaRandomAccess0010
     * @tc.desc      Verify random read offset 2 length 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_010.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(1);
          const read: number = fs.readSync(file.fd, buffer, { offset: 2, length: 1 });
          fs.closeSync(file);
          expect(read).assertEqual(1);
          expect(new Uint8Array(buffer)[0]).assertEqual(67);
          expect(new Uint8Array(buffer)[0]).assertEqual(67);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_1100
     * @tc.name      testDfmaRandomAccess0011
     * @tc.desc      Verify random read offset 3 length 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_011.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(2);
          const read: number = fs.readSync(file.fd, buffer, { offset: 3, length: 2 });
          fs.closeSync(file);
          expect(read).assertEqual(2);
          expect(new Uint8Array(buffer)[0]).assertEqual(68);
          expect(new Uint8Array(buffer)[1]).assertEqual(69);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_1200
     * @tc.name      testDfmaRandomAccess0012
     * @tc.desc      Verify random read offset 4 length 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_012.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(3);
          const read: number = fs.readSync(file.fd, buffer, { offset: 4, length: 3 });
          fs.closeSync(file);
          expect(read).assertEqual(3);
          expect(new Uint8Array(buffer)[0]).assertEqual(69);
          expect(new Uint8Array(buffer)[2]).assertEqual(71);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_1300
     * @tc.name      testDfmaRandomAccess0013
     * @tc.desc      Verify random read offset 5 length 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_013.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(1);
          const read: number = fs.readSync(file.fd, buffer, { offset: 5, length: 1 });
          fs.closeSync(file);
          expect(read).assertEqual(1);
          expect(new Uint8Array(buffer)[0]).assertEqual(70);
          expect(new Uint8Array(buffer)[0]).assertEqual(70);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_1400
     * @tc.name      testDfmaRandomAccess0014
     * @tc.desc      Verify random read offset 6 length 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_014.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(2);
          const read: number = fs.readSync(file.fd, buffer, { offset: 6, length: 2 });
          fs.closeSync(file);
          expect(read).assertEqual(2);
          expect(new Uint8Array(buffer)[0]).assertEqual(71);
          expect(new Uint8Array(buffer)[1]).assertEqual(72);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_1500
     * @tc.name      testDfmaRandomAccess0015
     * @tc.desc      Verify random read offset 0 length 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_015.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(3);
          const read: number = fs.readSync(file.fd, buffer, { offset: 0, length: 3 });
          fs.closeSync(file);
          expect(read).assertEqual(3);
          expect(new Uint8Array(buffer)[0]).assertEqual(65);
          expect(new Uint8Array(buffer)[2]).assertEqual(67);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_1600
     * @tc.name      testDfmaRandomAccess0016
     * @tc.desc      Verify random read offset 1 length 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_016.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(1);
          const read: number = fs.readSync(file.fd, buffer, { offset: 1, length: 1 });
          fs.closeSync(file);
          expect(read).assertEqual(1);
          expect(new Uint8Array(buffer)[0]).assertEqual(66);
          expect(new Uint8Array(buffer)[0]).assertEqual(66);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_1700
     * @tc.name      testDfmaRandomAccess0017
     * @tc.desc      Verify random read offset 2 length 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_017.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(2);
          const read: number = fs.readSync(file.fd, buffer, { offset: 2, length: 2 });
          fs.closeSync(file);
          expect(read).assertEqual(2);
          expect(new Uint8Array(buffer)[0]).assertEqual(67);
          expect(new Uint8Array(buffer)[1]).assertEqual(68);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_1800
     * @tc.name      testDfmaRandomAccess0018
     * @tc.desc      Verify random read offset 3 length 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_018.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(3);
          const read: number = fs.readSync(file.fd, buffer, { offset: 3, length: 3 });
          fs.closeSync(file);
          expect(read).assertEqual(3);
          expect(new Uint8Array(buffer)[0]).assertEqual(68);
          expect(new Uint8Array(buffer)[2]).assertEqual(70);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_1900
     * @tc.name      testDfmaRandomAccess0019
     * @tc.desc      Verify random read offset 4 length 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_019.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(1);
          const read: number = fs.readSync(file.fd, buffer, { offset: 4, length: 1 });
          fs.closeSync(file);
          expect(read).assertEqual(1);
          expect(new Uint8Array(buffer)[0]).assertEqual(69);
          expect(new Uint8Array(buffer)[0]).assertEqual(69);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_RANDOM_2000
     * @tc.name      testDfmaRandomAccess0020
     * @tc.desc      Verify random read offset 5 length 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaRandomAccess0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/random_020.txt';
          writeFile(path, 'ABCDEFGHIJ');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const buffer: ArrayBuffer = new ArrayBuffer(2);
          const read: number = fs.readSync(file.fd, buffer, { offset: 5, length: 2 });
          fs.closeSync(file);
          expect(read).assertEqual(2);
          expect(new Uint8Array(buffer)[0]).assertEqual(70);
          expect(new Uint8Array(buffer)[1]).assertEqual(71);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
