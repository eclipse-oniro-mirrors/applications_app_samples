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
      try { fs.rmdirSync(ROOT); } catch (err) {
        console.error('afterAll cleanup failed: ' + JSON.stringify(err));
      }
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

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_0800
     * @tc.name      testDfmaBulkLifecycle30008
     * @tc.desc      Verify bulk3 lifecycle 12 files case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_008';
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
          writeFile(dir + '/f11.txt', 'v11');
          expect(fs.listFileSync(dir).length).assertEqual(12);
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
          fs.unlinkSync(dir + '/f11.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_0900
     * @tc.name      testDfmaBulkLifecycle30009
     * @tc.desc      Verify bulk3 lifecycle 13 files case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_009';
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
          writeFile(dir + '/f11.txt', 'v11');
          writeFile(dir + '/f12.txt', 'v12');
          expect(fs.listFileSync(dir).length).assertEqual(13);
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
          fs.unlinkSync(dir + '/f11.txt');
          fs.unlinkSync(dir + '/f12.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_1000
     * @tc.name      testDfmaBulkLifecycle30010
     * @tc.desc      Verify bulk3 lifecycle 14 files case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_010';
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
          writeFile(dir + '/f11.txt', 'v11');
          writeFile(dir + '/f12.txt', 'v12');
          writeFile(dir + '/f13.txt', 'v13');
          expect(fs.listFileSync(dir).length).assertEqual(14);
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
          fs.unlinkSync(dir + '/f11.txt');
          fs.unlinkSync(dir + '/f12.txt');
          fs.unlinkSync(dir + '/f13.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_1100
     * @tc.name      testDfmaBulkLifecycle30011
     * @tc.desc      Verify bulk3 lifecycle 15 files case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_011';
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
          writeFile(dir + '/f11.txt', 'v11');
          writeFile(dir + '/f12.txt', 'v12');
          writeFile(dir + '/f13.txt', 'v13');
          writeFile(dir + '/f14.txt', 'v14');
          expect(fs.listFileSync(dir).length).assertEqual(15);
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
          fs.unlinkSync(dir + '/f11.txt');
          fs.unlinkSync(dir + '/f12.txt');
          fs.unlinkSync(dir + '/f13.txt');
          fs.unlinkSync(dir + '/f14.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_1200
     * @tc.name      testDfmaBulkLifecycle30012
     * @tc.desc      Verify bulk3 lifecycle 16 files case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_012';
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
          writeFile(dir + '/f11.txt', 'v11');
          writeFile(dir + '/f12.txt', 'v12');
          writeFile(dir + '/f13.txt', 'v13');
          writeFile(dir + '/f14.txt', 'v14');
          writeFile(dir + '/f15.txt', 'v15');
          expect(fs.listFileSync(dir).length).assertEqual(16);
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
          fs.unlinkSync(dir + '/f11.txt');
          fs.unlinkSync(dir + '/f12.txt');
          fs.unlinkSync(dir + '/f13.txt');
          fs.unlinkSync(dir + '/f14.txt');
          fs.unlinkSync(dir + '/f15.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_1300
     * @tc.name      testDfmaBulkLifecycle30013
     * @tc.desc      Verify bulk3 lifecycle 5 files case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_013';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_1400
     * @tc.name      testDfmaBulkLifecycle30014
     * @tc.desc      Verify bulk3 lifecycle 6 files case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_014';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_1500
     * @tc.name      testDfmaBulkLifecycle30015
     * @tc.desc      Verify bulk3 lifecycle 7 files case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_015';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_1600
     * @tc.name      testDfmaBulkLifecycle30016
     * @tc.desc      Verify bulk3 lifecycle 8 files case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_016';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_1700
     * @tc.name      testDfmaBulkLifecycle30017
     * @tc.desc      Verify bulk3 lifecycle 9 files case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_017';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_1800
     * @tc.name      testDfmaBulkLifecycle30018
     * @tc.desc      Verify bulk3 lifecycle 10 files case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_018';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_1900
     * @tc.name      testDfmaBulkLifecycle30019
     * @tc.desc      Verify bulk3 lifecycle 11 files case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_019';
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

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_2000
     * @tc.name      testDfmaBulkLifecycle30020
     * @tc.desc      Verify bulk3 lifecycle 12 files case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_020';
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
          writeFile(dir + '/f11.txt', 'v11');
          expect(fs.listFileSync(dir).length).assertEqual(12);
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
          fs.unlinkSync(dir + '/f11.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_2100
     * @tc.name      testDfmaBulkLifecycle30021
     * @tc.desc      Verify bulk3 lifecycle 13 files case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_021';
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
          writeFile(dir + '/f11.txt', 'v11');
          writeFile(dir + '/f12.txt', 'v12');
          expect(fs.listFileSync(dir).length).assertEqual(13);
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
          fs.unlinkSync(dir + '/f11.txt');
          fs.unlinkSync(dir + '/f12.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_2200
     * @tc.name      testDfmaBulkLifecycle30022
     * @tc.desc      Verify bulk3 lifecycle 14 files case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_022';
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
          writeFile(dir + '/f11.txt', 'v11');
          writeFile(dir + '/f12.txt', 'v12');
          writeFile(dir + '/f13.txt', 'v13');
          expect(fs.listFileSync(dir).length).assertEqual(14);
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
          fs.unlinkSync(dir + '/f11.txt');
          fs.unlinkSync(dir + '/f12.txt');
          fs.unlinkSync(dir + '/f13.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_2300
     * @tc.name      testDfmaBulkLifecycle30023
     * @tc.desc      Verify bulk3 lifecycle 15 files case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_023';
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
          writeFile(dir + '/f11.txt', 'v11');
          writeFile(dir + '/f12.txt', 'v12');
          writeFile(dir + '/f13.txt', 'v13');
          writeFile(dir + '/f14.txt', 'v14');
          expect(fs.listFileSync(dir).length).assertEqual(15);
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
          fs.unlinkSync(dir + '/f11.txt');
          fs.unlinkSync(dir + '/f12.txt');
          fs.unlinkSync(dir + '/f13.txt');
          fs.unlinkSync(dir + '/f14.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_2400
     * @tc.name      testDfmaBulkLifecycle30024
     * @tc.desc      Verify bulk3 lifecycle 16 files case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_024';
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
          writeFile(dir + '/f11.txt', 'v11');
          writeFile(dir + '/f12.txt', 'v12');
          writeFile(dir + '/f13.txt', 'v13');
          writeFile(dir + '/f14.txt', 'v14');
          writeFile(dir + '/f15.txt', 'v15');
          expect(fs.listFileSync(dir).length).assertEqual(16);
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
          fs.unlinkSync(dir + '/f11.txt');
          fs.unlinkSync(dir + '/f12.txt');
          fs.unlinkSync(dir + '/f13.txt');
          fs.unlinkSync(dir + '/f14.txt');
          fs.unlinkSync(dir + '/f15.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_2500
     * @tc.name      testDfmaBulkLifecycle30025
     * @tc.desc      Verify bulk3 lifecycle 5 files case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_025';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_2600
     * @tc.name      testDfmaBulkLifecycle30026
     * @tc.desc      Verify bulk3 lifecycle 6 files case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_026';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_2700
     * @tc.name      testDfmaBulkLifecycle30027
     * @tc.desc      Verify bulk3 lifecycle 7 files case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_027';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_2800
     * @tc.name      testDfmaBulkLifecycle30028
     * @tc.desc      Verify bulk3 lifecycle 8 files case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_028';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_2900
     * @tc.name      testDfmaBulkLifecycle30029
     * @tc.desc      Verify bulk3 lifecycle 9 files case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_029';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_3000
     * @tc.name      testDfmaBulkLifecycle30030
     * @tc.desc      Verify bulk3 lifecycle 10 files case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_030';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_3100
     * @tc.name      testDfmaBulkLifecycle30031
     * @tc.desc      Verify bulk3 lifecycle 11 files case 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_031';
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

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_3200
     * @tc.name      testDfmaBulkLifecycle30032
     * @tc.desc      Verify bulk3 lifecycle 12 files case 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_032';
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
          writeFile(dir + '/f11.txt', 'v11');
          expect(fs.listFileSync(dir).length).assertEqual(12);
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
          fs.unlinkSync(dir + '/f11.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_3300
     * @tc.name      testDfmaBulkLifecycle30033
     * @tc.desc      Verify bulk3 lifecycle 13 files case 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_033';
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
          writeFile(dir + '/f11.txt', 'v11');
          writeFile(dir + '/f12.txt', 'v12');
          expect(fs.listFileSync(dir).length).assertEqual(13);
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
          fs.unlinkSync(dir + '/f11.txt');
          fs.unlinkSync(dir + '/f12.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_3400
     * @tc.name      testDfmaBulkLifecycle30034
     * @tc.desc      Verify bulk3 lifecycle 14 files case 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_034';
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
          writeFile(dir + '/f11.txt', 'v11');
          writeFile(dir + '/f12.txt', 'v12');
          writeFile(dir + '/f13.txt', 'v13');
          expect(fs.listFileSync(dir).length).assertEqual(14);
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
          fs.unlinkSync(dir + '/f11.txt');
          fs.unlinkSync(dir + '/f12.txt');
          fs.unlinkSync(dir + '/f13.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_3500
     * @tc.name      testDfmaBulkLifecycle30035
     * @tc.desc      Verify bulk3 lifecycle 15 files case 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_035';
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
          writeFile(dir + '/f11.txt', 'v11');
          writeFile(dir + '/f12.txt', 'v12');
          writeFile(dir + '/f13.txt', 'v13');
          writeFile(dir + '/f14.txt', 'v14');
          expect(fs.listFileSync(dir).length).assertEqual(15);
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
          fs.unlinkSync(dir + '/f11.txt');
          fs.unlinkSync(dir + '/f12.txt');
          fs.unlinkSync(dir + '/f13.txt');
          fs.unlinkSync(dir + '/f14.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_3600
     * @tc.name      testDfmaBulkLifecycle30036
     * @tc.desc      Verify bulk3 lifecycle 16 files case 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_036';
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
          writeFile(dir + '/f11.txt', 'v11');
          writeFile(dir + '/f12.txt', 'v12');
          writeFile(dir + '/f13.txt', 'v13');
          writeFile(dir + '/f14.txt', 'v14');
          writeFile(dir + '/f15.txt', 'v15');
          expect(fs.listFileSync(dir).length).assertEqual(16);
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
          fs.unlinkSync(dir + '/f11.txt');
          fs.unlinkSync(dir + '/f12.txt');
          fs.unlinkSync(dir + '/f13.txt');
          fs.unlinkSync(dir + '/f14.txt');
          fs.unlinkSync(dir + '/f15.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_3700
     * @tc.name      testDfmaBulkLifecycle30037
     * @tc.desc      Verify bulk3 lifecycle 5 files case 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_037';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_3800
     * @tc.name      testDfmaBulkLifecycle30038
     * @tc.desc      Verify bulk3 lifecycle 6 files case 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_038';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_3900
     * @tc.name      testDfmaBulkLifecycle30039
     * @tc.desc      Verify bulk3 lifecycle 7 files case 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_039';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE3_4000
     * @tc.name      testDfmaBulkLifecycle30040
     * @tc.desc      Verify bulk3 lifecycle 8 files case 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle30040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk3_040';
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

  });
}
