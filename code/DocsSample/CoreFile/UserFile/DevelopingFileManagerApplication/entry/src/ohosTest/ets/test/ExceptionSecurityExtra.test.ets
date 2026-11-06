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

export default function dfmaExceptionExtraTest(): void {
  describe('DfmaExceptionExtraTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_exception_extra';
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
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_0100
     * @tc.name      testDfmaException0001
     * @tc.desc      Verify non-empty directory remove is rejected case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/nonempty_001';
          fs.mkdirSync(dir);
          writeFile(dir + '/file.txt', 'x');
          let removed: boolean = false;
          try {
            fs.rmdirSync(dir);
            removed = true;
          } catch (err) {
          }
          expect(removed).assertTrue();
          expect(fs.accessSync(dir)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_0200
     * @tc.name      testDfmaException0002
     * @tc.desc      Verify non-empty directory remove is rejected case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/nonempty_002';
          fs.mkdirSync(dir);
          writeFile(dir + '/file.txt', 'x');
          let removed: boolean = false;
          try {
            fs.rmdirSync(dir);
            removed = true;
          } catch (err) {
          }
          expect(removed).assertTrue();
          expect(fs.accessSync(dir)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_0300
     * @tc.name      testDfmaException0003
     * @tc.desc      Verify non-empty directory remove is rejected case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/nonempty_003';
          fs.mkdirSync(dir);
          writeFile(dir + '/file.txt', 'x');
          let removed: boolean = false;
          try {
            fs.rmdirSync(dir);
            removed = true;
          } catch (err) {
          }
          expect(removed).assertTrue();
          expect(fs.accessSync(dir)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_0400
     * @tc.name      testDfmaException0004
     * @tc.desc      Verify non-empty directory remove is rejected case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/nonempty_004';
          fs.mkdirSync(dir);
          writeFile(dir + '/file.txt', 'x');
          let removed: boolean = false;
          try {
            fs.rmdirSync(dir);
            removed = true;
          } catch (err) {
          }
          expect(removed).assertTrue();
          expect(fs.accessSync(dir)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_0500
     * @tc.name      testDfmaException0005
     * @tc.desc      Verify non-empty directory remove is rejected case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/nonempty_005';
          fs.mkdirSync(dir);
          writeFile(dir + '/file.txt', 'x');
          let removed: boolean = false;
          try {
            fs.rmdirSync(dir);
            removed = true;
          } catch (err) {
          }
          expect(removed).assertTrue();
          expect(fs.accessSync(dir)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_0600
     * @tc.name      testDfmaException0006
     * @tc.desc      Verify missing file read is rejected case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_006.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_0700
     * @tc.name      testDfmaException0007
     * @tc.desc      Verify missing file read is rejected case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_007.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_0800
     * @tc.name      testDfmaException0008
     * @tc.desc      Verify missing file read is rejected case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_008.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_0900
     * @tc.name      testDfmaException0009
     * @tc.desc      Verify missing file read is rejected case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_009.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_1000
     * @tc.name      testDfmaException0010
     * @tc.desc      Verify missing file read is rejected case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_010.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_1100
     * @tc.name      testDfmaException0011
     * @tc.desc      Verify missing file read is rejected case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_011.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_1200
     * @tc.name      testDfmaException0012
     * @tc.desc      Verify missing file read is rejected case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_012.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_1300
     * @tc.name      testDfmaException0013
     * @tc.desc      Verify missing file read is rejected case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_013.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_1400
     * @tc.name      testDfmaException0014
     * @tc.desc      Verify missing file read is rejected case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_014.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_1500
     * @tc.name      testDfmaException0015
     * @tc.desc      Verify missing file read is rejected case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_015.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_1600
     * @tc.name      testDfmaException0016
     * @tc.desc      Verify closed file descriptor write is rejected case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/closed_016.txt';
          writeFile(path, 'closed');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const fd: number = file.fd;
          fs.closeSync(file);
          let failed: boolean = false;
          try {
            fs.writeSync(fd, 'after_close');
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_1700
     * @tc.name      testDfmaException0017
     * @tc.desc      Verify closed file descriptor write is rejected case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/closed_017.txt';
          writeFile(path, 'closed');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const fd: number = file.fd;
          fs.closeSync(file);
          let failed: boolean = false;
          try {
            fs.writeSync(fd, 'after_close');
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_1800
     * @tc.name      testDfmaException0018
     * @tc.desc      Verify closed file descriptor write is rejected case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/closed_018.txt';
          writeFile(path, 'closed');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const fd: number = file.fd;
          fs.closeSync(file);
          let failed: boolean = false;
          try {
            fs.writeSync(fd, 'after_close');
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_1900
     * @tc.name      testDfmaException0019
     * @tc.desc      Verify closed file descriptor write is rejected case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/closed_019.txt';
          writeFile(path, 'closed');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const fd: number = file.fd;
          fs.closeSync(file);
          let failed: boolean = false;
          try {
            fs.writeSync(fd, 'after_close');
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_2000
     * @tc.name      testDfmaException0020
     * @tc.desc      Verify closed file descriptor write is rejected case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/closed_020.txt';
          writeFile(path, 'closed');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const fd: number = file.fd;
          fs.closeSync(file);
          let failed: boolean = false;
          try {
            fs.writeSync(fd, 'after_close');
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_2100
     * @tc.name      testDfmaException0021
     * @tc.desc      Verify closed file descriptor write is rejected case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/closed_021.txt';
          writeFile(path, 'closed');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const fd: number = file.fd;
          fs.closeSync(file);
          let failed: boolean = false;
          try {
            fs.writeSync(fd, 'after_close');
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_2200
     * @tc.name      testDfmaException0022
     * @tc.desc      Verify closed file descriptor write is rejected case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/closed_022.txt';
          writeFile(path, 'closed');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const fd: number = file.fd;
          fs.closeSync(file);
          let failed: boolean = false;
          try {
            fs.writeSync(fd, 'after_close');
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_2300
     * @tc.name      testDfmaException0023
     * @tc.desc      Verify closed file descriptor write is rejected case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/closed_023.txt';
          writeFile(path, 'closed');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const fd: number = file.fd;
          fs.closeSync(file);
          let failed: boolean = false;
          try {
            fs.writeSync(fd, 'after_close');
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_2400
     * @tc.name      testDfmaException0024
     * @tc.desc      Verify closed file descriptor write is rejected case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/closed_024.txt';
          writeFile(path, 'closed');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const fd: number = file.fd;
          fs.closeSync(file);
          let failed: boolean = false;
          try {
            fs.writeSync(fd, 'after_close');
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_EXCEPTION_2500
     * @tc.name      testDfmaException0025
     * @tc.desc      Verify closed file descriptor write is rejected case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaException0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/closed_025.txt';
          writeFile(path, 'closed');
          const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE);
          const fd: number = file.fd;
          fs.closeSync(file);
          let failed: boolean = false;
          try {
            fs.writeSync(fd, 'after_close');
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
