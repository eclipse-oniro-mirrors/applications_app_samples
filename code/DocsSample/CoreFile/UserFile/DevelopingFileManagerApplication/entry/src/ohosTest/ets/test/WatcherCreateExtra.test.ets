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

export default function dfmaWatcherCreateExtraTest(): void {
  describe('DfmaWatcherCreateExtraTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_watcher_create';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try { fs.rmdirSync(ROOT); } catch (err) {}
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_CREATE_0100
     * @tc.name      testDfmaWatcherCreateExtra0001
     * @tc.desc      Verify watcher create event case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherCreateExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let eventName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x40 | 0x80,
            (event: WatchEvent) => { received = true; eventName = event.fileName; });
          watcher.start();
          const path: string = ROOT + '/created_001.txt';
          writeFile(path, 'created_1');
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('created_1');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_CREATE_0200
     * @tc.name      testDfmaWatcherCreateExtra0002
     * @tc.desc      Verify watcher create event case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherCreateExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let eventName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x40 | 0x80,
            (event: WatchEvent) => { received = true; eventName = event.fileName; });
          watcher.start();
          const path: string = ROOT + '/created_002.txt';
          writeFile(path, 'created_2');
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('created_2');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_CREATE_0300
     * @tc.name      testDfmaWatcherCreateExtra0003
     * @tc.desc      Verify watcher create event case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherCreateExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let eventName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x40 | 0x80,
            (event: WatchEvent) => { received = true; eventName = event.fileName; });
          watcher.start();
          const path: string = ROOT + '/created_003.txt';
          writeFile(path, 'created_3');
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('created_3');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_CREATE_0400
     * @tc.name      testDfmaWatcherCreateExtra0004
     * @tc.desc      Verify watcher create event case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherCreateExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let eventName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x40 | 0x80,
            (event: WatchEvent) => { received = true; eventName = event.fileName; });
          watcher.start();
          const path: string = ROOT + '/created_004.txt';
          writeFile(path, 'created_4');
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('created_4');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_CREATE_0500
     * @tc.name      testDfmaWatcherCreateExtra0005
     * @tc.desc      Verify watcher create event case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherCreateExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let eventName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x40 | 0x80,
            (event: WatchEvent) => { received = true; eventName = event.fileName; });
          watcher.start();
          const path: string = ROOT + '/created_005.txt';
          writeFile(path, 'created_5');
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('created_5');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_CREATE_0600
     * @tc.name      testDfmaWatcherCreateExtra0006
     * @tc.desc      Verify watcher create event case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherCreateExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let eventName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x40 | 0x80,
            (event: WatchEvent) => { received = true; eventName = event.fileName; });
          watcher.start();
          const path: string = ROOT + '/created_006.txt';
          writeFile(path, 'created_6');
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('created_6');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_CREATE_0700
     * @tc.name      testDfmaWatcherCreateExtra0007
     * @tc.desc      Verify watcher create event case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherCreateExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let eventName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x40 | 0x80,
            (event: WatchEvent) => { received = true; eventName = event.fileName; });
          watcher.start();
          const path: string = ROOT + '/created_007.txt';
          writeFile(path, 'created_7');
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('created_7');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_CREATE_0800
     * @tc.name      testDfmaWatcherCreateExtra0008
     * @tc.desc      Verify watcher create event case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherCreateExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let eventName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x40 | 0x80,
            (event: WatchEvent) => { received = true; eventName = event.fileName; });
          watcher.start();
          const path: string = ROOT + '/created_008.txt';
          writeFile(path, 'created_8');
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('created_8');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_CREATE_0900
     * @tc.name      testDfmaWatcherCreateExtra0009
     * @tc.desc      Verify watcher create event case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherCreateExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let eventName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x40 | 0x80,
            (event: WatchEvent) => { received = true; eventName = event.fileName; });
          watcher.start();
          const path: string = ROOT + '/created_009.txt';
          writeFile(path, 'created_9');
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('created_9');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_CREATE_1000
     * @tc.name      testDfmaWatcherCreateExtra0010
     * @tc.desc      Verify watcher create event case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherCreateExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          let eventName: string = '';
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x40 | 0x80,
            (event: WatchEvent) => { received = true; eventName = event.fileName; });
          watcher.start();
          const path: string = ROOT + '/created_010.txt';
          writeFile(path, 'created_10');
          await sleep(800);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('created_10');
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
