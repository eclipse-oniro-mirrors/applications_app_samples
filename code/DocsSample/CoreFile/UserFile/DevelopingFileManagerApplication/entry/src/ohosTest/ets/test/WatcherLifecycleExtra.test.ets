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

export default function dfmaWatcherLifecycleExtraTest(): void {
  describe('DfmaWatcherLifecycleExtraTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_watcher_lifecycle';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try { fs.rmdirSync(ROOT); } catch (err) {}
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_0100
     * @tc.name      testDfmaWatcherLifecycle0001
     * @tc.desc      Verify stopped watcher receives no event case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          watcher.stop();
          const path: string = ROOT + '/stopped_001.txt';
          writeFile(path, 'stopped');
          await sleep(1500);
          expect(received).assertFalse();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_0200
     * @tc.name      testDfmaWatcherLifecycle0002
     * @tc.desc      Verify stopped watcher receives no event case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          watcher.stop();
          const path: string = ROOT + '/stopped_002.txt';
          writeFile(path, 'stopped');
          await sleep(1500);
          expect(received).assertFalse();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_0300
     * @tc.name      testDfmaWatcherLifecycle0003
     * @tc.desc      Verify stopped watcher receives no event case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          watcher.stop();
          const path: string = ROOT + '/stopped_003.txt';
          writeFile(path, 'stopped');
          await sleep(1500);
          expect(received).assertFalse();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_0400
     * @tc.name      testDfmaWatcherLifecycle0004
     * @tc.desc      Verify stopped watcher receives no event case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          watcher.stop();
          const path: string = ROOT + '/stopped_004.txt';
          writeFile(path, 'stopped');
          await sleep(1500);
          expect(received).assertFalse();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_0500
     * @tc.name      testDfmaWatcherLifecycle0005
     * @tc.desc      Verify stopped watcher receives no event case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          watcher.stop();
          const path: string = ROOT + '/stopped_005.txt';
          writeFile(path, 'stopped');
          await sleep(1500);
          expect(received).assertFalse();
          expect(fs.accessSync(path)).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_1100
     * @tc.name      testDfmaWatcherLifecycle0011
     * @tc.desc      Verify multiple watchers event case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let first: boolean = false;
          let second: boolean = false;
          const w1: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { first = true; });
          const w2: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { second = true; });
          w1.start();
          w2.start();
          const path: string = ROOT + '/multi_011.txt';
          writeFile(path, 'multi');
          await sleep(1500);
          w1.stop();
          w2.stop();
          expect(first).assertTrue();
          expect(second).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_1200
     * @tc.name      testDfmaWatcherLifecycle0012
     * @tc.desc      Verify multiple watchers event case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let first: boolean = false;
          let second: boolean = false;
          const w1: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { first = true; });
          const w2: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { second = true; });
          w1.start();
          w2.start();
          const path: string = ROOT + '/multi_012.txt';
          writeFile(path, 'multi');
          await sleep(1500);
          w1.stop();
          w2.stop();
          expect(first).assertTrue();
          expect(second).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_1300
     * @tc.name      testDfmaWatcherLifecycle0013
     * @tc.desc      Verify multiple watchers event case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let first: boolean = false;
          let second: boolean = false;
          const w1: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { first = true; });
          const w2: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { second = true; });
          w1.start();
          w2.start();
          const path: string = ROOT + '/multi_013.txt';
          writeFile(path, 'multi');
          await sleep(1500);
          w1.stop();
          w2.stop();
          expect(first).assertTrue();
          expect(second).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_1400
     * @tc.name      testDfmaWatcherLifecycle0014
     * @tc.desc      Verify multiple watchers event case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let first: boolean = false;
          let second: boolean = false;
          const w1: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { first = true; });
          const w2: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { second = true; });
          w1.start();
          w2.start();
          const path: string = ROOT + '/multi_014.txt';
          writeFile(path, 'multi');
          await sleep(1500);
          w1.stop();
          w2.stop();
          expect(first).assertTrue();
          expect(second).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_1500
     * @tc.name      testDfmaWatcherLifecycle0015
     * @tc.desc      Verify multiple watchers event case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let first: boolean = false;
          let second: boolean = false;
          const w1: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { first = true; });
          const w2: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { second = true; });
          w1.start();
          w2.start();
          const path: string = ROOT + '/multi_015.txt';
          writeFile(path, 'multi');
          await sleep(1500);
          w1.stop();
          w2.stop();
          expect(first).assertTrue();
          expect(second).assertTrue();
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_1600
     * @tc.name      testDfmaWatcherLifecycle0016
     * @tc.desc      Verify watcher delete event case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/delete_016.txt';
          writeFile(path, 'delete');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.unlinkSync(path);
          await sleep(1500);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_1700
     * @tc.name      testDfmaWatcherLifecycle0017
     * @tc.desc      Verify watcher delete event case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/delete_017.txt';
          writeFile(path, 'delete');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.unlinkSync(path);
          await sleep(1500);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_1800
     * @tc.name      testDfmaWatcherLifecycle0018
     * @tc.desc      Verify watcher delete event case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/delete_018.txt';
          writeFile(path, 'delete');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.unlinkSync(path);
          await sleep(1500);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_1900
     * @tc.name      testDfmaWatcherLifecycle0019
     * @tc.desc      Verify watcher delete event case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/delete_019.txt';
          writeFile(path, 'delete');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.unlinkSync(path);
          await sleep(1500);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_LIFECYCLE_2000
     * @tc.name      testDfmaWatcherLifecycle0020
     * @tc.desc      Verify watcher delete event case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherLifecycle0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/delete_020.txt';
          writeFile(path, 'delete');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x100 | 0x200 | 0x2,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.unlinkSync(path);
          await sleep(1500);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
