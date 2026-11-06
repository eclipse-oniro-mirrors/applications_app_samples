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
function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => setTimeout(resolve, ms));
}

export default function dfmaWatcherTest(): void {
  describe('DfmaWatcherTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_watcher';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try { fs.rmdirSync(ROOT); } catch (err) {}
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_0100
     * @tc.name      testDfmaWatcher0001
     * @tc.desc      Verify directory watcher event case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_001.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_1');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_1');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_0200
     * @tc.name      testDfmaWatcher0002
     * @tc.desc      Verify directory watcher event case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_002.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_2');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_2');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_0300
     * @tc.name      testDfmaWatcher0003
     * @tc.desc      Verify directory watcher event case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_003.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_3');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_3');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_0400
     * @tc.name      testDfmaWatcher0004
     * @tc.desc      Verify directory watcher event case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_004.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_4');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_4');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_0500
     * @tc.name      testDfmaWatcher0005
     * @tc.desc      Verify directory watcher event case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_005.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_5');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_5');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_0600
     * @tc.name      testDfmaWatcher0006
     * @tc.desc      Verify directory watcher event case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_006.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_6');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_6');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_0700
     * @tc.name      testDfmaWatcher0007
     * @tc.desc      Verify directory watcher event case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_007.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_7');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_7');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_0800
     * @tc.name      testDfmaWatcher0008
     * @tc.desc      Verify directory watcher event case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_008.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_8');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_8');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_0900
     * @tc.name      testDfmaWatcher0009
     * @tc.desc      Verify directory watcher event case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_009.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_9');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_9');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_1000
     * @tc.name      testDfmaWatcher0010
     * @tc.desc      Verify directory watcher event case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_010.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_10');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_10');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_1100
     * @tc.name      testDfmaWatcher0011
     * @tc.desc      Verify directory watcher event case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_011.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_11');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_11');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_1200
     * @tc.name      testDfmaWatcher0012
     * @tc.desc      Verify directory watcher event case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_012.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_12');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_12');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_1300
     * @tc.name      testDfmaWatcher0013
     * @tc.desc      Verify directory watcher event case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_013.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_13');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_13');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_1400
     * @tc.name      testDfmaWatcher0014
     * @tc.desc      Verify directory watcher event case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_014.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_14');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_14');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_1500
     * @tc.name      testDfmaWatcher0015
     * @tc.desc      Verify directory watcher event case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcher0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let fileName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => {
              received = true;
              fileName = event.fileName;
            });
          watcher.start();
          const path: string = ROOT + '/watch_015.txt';
          const file: fs.File = fs.openSync(path,
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'watch_15');
          fs.closeSync(file);
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fileName.length > 0).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('watch_15');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
