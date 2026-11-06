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

export default function dfmaWatcherEventExtraTest(): void {
  describe('DfmaWatcherEventExtraTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_watcher_event';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try { fs.rmdirSync(ROOT); } catch (err) {}
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_0100
     * @tc.name      testDfmaWatcherEventExtra0001
     * @tc.desc      Verify watcher rename event case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_001.txt';
          const dst: string = ROOT + '/rename_dst_001.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_0200
     * @tc.name      testDfmaWatcherEventExtra0002
     * @tc.desc      Verify watcher rename event case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_002.txt';
          const dst: string = ROOT + '/rename_dst_002.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_0300
     * @tc.name      testDfmaWatcherEventExtra0003
     * @tc.desc      Verify watcher rename event case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_003.txt';
          const dst: string = ROOT + '/rename_dst_003.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_0400
     * @tc.name      testDfmaWatcherEventExtra0004
     * @tc.desc      Verify watcher rename event case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_004.txt';
          const dst: string = ROOT + '/rename_dst_004.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_0500
     * @tc.name      testDfmaWatcherEventExtra0005
     * @tc.desc      Verify watcher rename event case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_005.txt';
          const dst: string = ROOT + '/rename_dst_005.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_0600
     * @tc.name      testDfmaWatcherEventExtra0006
     * @tc.desc      Verify watcher rename event case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_006.txt';
          const dst: string = ROOT + '/rename_dst_006.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_0700
     * @tc.name      testDfmaWatcherEventExtra0007
     * @tc.desc      Verify watcher rename event case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_007.txt';
          const dst: string = ROOT + '/rename_dst_007.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_0800
     * @tc.name      testDfmaWatcherEventExtra0008
     * @tc.desc      Verify watcher rename event case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_008.txt';
          const dst: string = ROOT + '/rename_dst_008.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_0900
     * @tc.name      testDfmaWatcherEventExtra0009
     * @tc.desc      Verify watcher rename event case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_009.txt';
          const dst: string = ROOT + '/rename_dst_009.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_1000
     * @tc.name      testDfmaWatcherEventExtra0010
     * @tc.desc      Verify watcher rename event case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_010.txt';
          const dst: string = ROOT + '/rename_dst_010.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_1100
     * @tc.name      testDfmaWatcherEventExtra0011
     * @tc.desc      Verify watcher rename event case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_011.txt';
          const dst: string = ROOT + '/rename_dst_011.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_1200
     * @tc.name      testDfmaWatcherEventExtra0012
     * @tc.desc      Verify watcher rename event case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_012.txt';
          const dst: string = ROOT + '/rename_dst_012.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_1300
     * @tc.name      testDfmaWatcherEventExtra0013
     * @tc.desc      Verify watcher rename event case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_013.txt';
          const dst: string = ROOT + '/rename_dst_013.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_1400
     * @tc.name      testDfmaWatcherEventExtra0014
     * @tc.desc      Verify watcher rename event case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_014.txt';
          const dst: string = ROOT + '/rename_dst_014.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_WATCHER_EVENT_1500
     * @tc.name      testDfmaWatcherEventExtra0015
     * @tc.desc      Verify watcher rename event case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaWatcherEventExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const src: string = ROOT + '/rename_src_015.txt';
          const dst: string = ROOT + '/rename_dst_015.txt';
          writeFile(src, 'rename');
          let received: boolean = false;
          const watcher: fs.Watcher = fs.createWatcher(ROOT, 0x40 | 0x80 | 0x100 | 0x200,
            (event: WatchEvent) => { received = true; });
          watcher.start();
          fs.renameSync(src, dst);
          await sleep(900);
          watcher.stop();
          expect(received).assertTrue();
          expect(fs.accessSync(dst)).assertTrue();
          expect(fs.readTextSync(dst)).assertEqual('rename');
          fs.unlinkSync(dst);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
