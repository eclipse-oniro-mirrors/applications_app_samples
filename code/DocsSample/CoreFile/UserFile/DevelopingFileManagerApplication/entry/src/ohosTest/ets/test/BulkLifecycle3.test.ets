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
function writeFile(path: string, content: string): void {
  const file: fs.File = fs.openSync(path,
    fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
  fs.writeSync(file.fd, content);
  fs.closeSync(file);
}

export default function dfmaBulkLifecycle3Test(): void {
  describe('DfmaBulkLifecycle3Test', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_bulk_lifecycle3';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try { fs.rmdirSync(ROOT); } catch (err) {}
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_0100
     * @tc.name      testDfmaBulkLifecycle30001
     * @tc.desc      Verify bulk3 lifecycle 5 files case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_001';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          expect(fs.listFileSync(dir).length).assertEqual(5);
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.unlinkSync(dir + '/f4.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_0200
     * @tc.name      testDfmaBulkLifecycle30002
     * @tc.desc      Verify bulk3 lifecycle 6 files case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_002';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          expect(fs.listFileSync(dir).length).assertEqual(6);
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.unlinkSync(dir + '/f4.txt');
          fs.unlinkSync(dir + '/f5.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_0300
     * @tc.name      testDfmaBulkLifecycle30003
     * @tc.desc      Verify bulk3 lifecycle 7 files case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_003';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          expect(fs.listFileSync(dir).length).assertEqual(7);
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.unlinkSync(dir + '/f4.txt');
          fs.unlinkSync(dir + '/f5.txt');
          fs.unlinkSync(dir + '/f6.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_0400
     * @tc.name      testDfmaBulkLifecycle30004
     * @tc.desc      Verify bulk3 lifecycle 8 files case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_004';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          writeFile(dir + '/f7.txt', 'v7');
          expect(fs.listFileSync(dir).length).assertEqual(8);
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.unlinkSync(dir + '/f4.txt');
          fs.unlinkSync(dir + '/f5.txt');
          fs.unlinkSync(dir + '/f6.txt');
          fs.unlinkSync(dir + '/f7.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_0500
     * @tc.name      testDfmaBulkLifecycle30005
     * @tc.desc      Verify bulk3 lifecycle 9 files case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_005';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          writeFile(dir + '/f7.txt', 'v7');
          writeFile(dir + '/f8.txt', 'v8');
          expect(fs.listFileSync(dir).length).assertEqual(9);
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.unlinkSync(dir + '/f4.txt');
          fs.unlinkSync(dir + '/f5.txt');
          fs.unlinkSync(dir + '/f6.txt');
          fs.unlinkSync(dir + '/f7.txt');
          fs.unlinkSync(dir + '/f8.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_0600
     * @tc.name      testDfmaBulkLifecycle30006
     * @tc.desc      Verify bulk3 lifecycle 10 files case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_006';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          writeFile(dir + '/f7.txt', 'v7');
          writeFile(dir + '/f8.txt', 'v8');
          writeFile(dir + '/f9.txt', 'v9');
          expect(fs.listFileSync(dir).length).assertEqual(10);
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.unlinkSync(dir + '/f4.txt');
          fs.unlinkSync(dir + '/f5.txt');
          fs.unlinkSync(dir + '/f6.txt');
          fs.unlinkSync(dir + '/f7.txt');
          fs.unlinkSync(dir + '/f8.txt');
          fs.unlinkSync(dir + '/f9.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_0700
     * @tc.name      testDfmaBulkLifecycle30007
     * @tc.desc      Verify bulk3 lifecycle 11 files case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_007';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          writeFile(dir + '/f7.txt', 'v7');
          writeFile(dir + '/f8.txt', 'v8');
          writeFile(dir + '/f9.txt', 'v9');
          writeFile(dir + '/f10.txt', 'v10');
          expect(fs.listFileSync(dir).length).assertEqual(11);
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.unlinkSync(dir + '/f4.txt');
          fs.unlinkSync(dir + '/f5.txt');
          fs.unlinkSync(dir + '/f6.txt');
          fs.unlinkSync(dir + '/f7.txt');
          fs.unlinkSync(dir + '/f8.txt');
          fs.unlinkSync(dir + '/f9.txt');
          fs.unlinkSync(dir + '/f10.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
