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

export default function dfmaBulkLifecycle2Test(): void {
  describe('DfmaBulkLifecycle2Test', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_bulk_lifecycle2';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_0100
     * @tc.name      testDfmaBulkLifecycle20001
     * @tc.desc      Verify bulk2 lifecycle 4 files case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_001';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(4);
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_0200
     * @tc.name      testDfmaBulkLifecycle20002
     * @tc.desc      Verify bulk2 lifecycle 5 files case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_002';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(5);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_0300
     * @tc.name      testDfmaBulkLifecycle20003
     * @tc.desc      Verify bulk2 lifecycle 6 files case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_003';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(6);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_0400
     * @tc.name      testDfmaBulkLifecycle20004
     * @tc.desc      Verify bulk2 lifecycle 7 files case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_004';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(7);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_0500
     * @tc.name      testDfmaBulkLifecycle20005
     * @tc.desc      Verify bulk2 lifecycle 8 files case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_005';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          writeFile(dir + '/f7.txt', 'v7');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(8);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_0600
     * @tc.name      testDfmaBulkLifecycle20006
     * @tc.desc      Verify bulk2 lifecycle 9 files case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_006';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(9);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_0700
     * @tc.name      testDfmaBulkLifecycle20007
     * @tc.desc      Verify bulk2 lifecycle 10 files case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_007';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(10);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_0800
     * @tc.name      testDfmaBulkLifecycle20008
     * @tc.desc      Verify bulk2 lifecycle 11 files case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_008';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(11);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_0900
     * @tc.name      testDfmaBulkLifecycle20009
     * @tc.desc      Verify bulk2 lifecycle 12 files case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_009';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(12);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_1000
     * @tc.name      testDfmaBulkLifecycle20010
     * @tc.desc      Verify bulk2 lifecycle 13 files case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_010';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(13);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_1100
     * @tc.name      testDfmaBulkLifecycle20011
     * @tc.desc      Verify bulk2 lifecycle 14 files case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_011';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(14);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_1200
     * @tc.name      testDfmaBulkLifecycle20012
     * @tc.desc      Verify bulk2 lifecycle 15 files case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_012';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(15);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_1300
     * @tc.name      testDfmaBulkLifecycle20013
     * @tc.desc      Verify bulk2 lifecycle 16 files case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_013';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(16);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_1400
     * @tc.name      testDfmaBulkLifecycle20014
     * @tc.desc      Verify bulk2 lifecycle 17 files case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_014';
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
          writeFile(dir + '/f16.txt', 'v16');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(17);
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
          fs.unlinkSync(dir + '/f16.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_1500
     * @tc.name      testDfmaBulkLifecycle20015
     * @tc.desc      Verify bulk2 lifecycle 18 files case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_015';
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
          writeFile(dir + '/f16.txt', 'v16');
          writeFile(dir + '/f17.txt', 'v17');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(18);
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
          fs.unlinkSync(dir + '/f16.txt');
          fs.unlinkSync(dir + '/f17.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_1600
     * @tc.name      testDfmaBulkLifecycle20016
     * @tc.desc      Verify bulk2 lifecycle 4 files case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_016';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(4);
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_1700
     * @tc.name      testDfmaBulkLifecycle20017
     * @tc.desc      Verify bulk2 lifecycle 5 files case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_017';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(5);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_1800
     * @tc.name      testDfmaBulkLifecycle20018
     * @tc.desc      Verify bulk2 lifecycle 6 files case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_018';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(6);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_1900
     * @tc.name      testDfmaBulkLifecycle20019
     * @tc.desc      Verify bulk2 lifecycle 7 files case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_019';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(7);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_2000
     * @tc.name      testDfmaBulkLifecycle20020
     * @tc.desc      Verify bulk2 lifecycle 8 files case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_020';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          writeFile(dir + '/f7.txt', 'v7');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(8);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_2100
     * @tc.name      testDfmaBulkLifecycle20021
     * @tc.desc      Verify bulk2 lifecycle 9 files case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_021';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(9);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_2200
     * @tc.name      testDfmaBulkLifecycle20022
     * @tc.desc      Verify bulk2 lifecycle 10 files case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_022';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(10);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_2300
     * @tc.name      testDfmaBulkLifecycle20023
     * @tc.desc      Verify bulk2 lifecycle 11 files case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_023';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(11);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_2400
     * @tc.name      testDfmaBulkLifecycle20024
     * @tc.desc      Verify bulk2 lifecycle 12 files case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_024';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(12);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_2500
     * @tc.name      testDfmaBulkLifecycle20025
     * @tc.desc      Verify bulk2 lifecycle 13 files case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_025';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(13);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_2600
     * @tc.name      testDfmaBulkLifecycle20026
     * @tc.desc      Verify bulk2 lifecycle 14 files case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_026';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(14);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_2700
     * @tc.name      testDfmaBulkLifecycle20027
     * @tc.desc      Verify bulk2 lifecycle 15 files case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_027';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(15);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_2800
     * @tc.name      testDfmaBulkLifecycle20028
     * @tc.desc      Verify bulk2 lifecycle 16 files case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_028';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(16);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_2900
     * @tc.name      testDfmaBulkLifecycle20029
     * @tc.desc      Verify bulk2 lifecycle 17 files case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_029';
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
          writeFile(dir + '/f16.txt', 'v16');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(17);
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
          fs.unlinkSync(dir + '/f16.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_3000
     * @tc.name      testDfmaBulkLifecycle20030
     * @tc.desc      Verify bulk2 lifecycle 18 files case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_030';
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
          writeFile(dir + '/f16.txt', 'v16');
          writeFile(dir + '/f17.txt', 'v17');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(18);
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
          fs.unlinkSync(dir + '/f16.txt');
          fs.unlinkSync(dir + '/f17.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_3100
     * @tc.name      testDfmaBulkLifecycle20031
     * @tc.desc      Verify bulk2 lifecycle 4 files case 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_031';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(4);
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          expect(fs.listFileSync(dir).length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_3200
     * @tc.name      testDfmaBulkLifecycle20032
     * @tc.desc      Verify bulk2 lifecycle 5 files case 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_032';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(5);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_3300
     * @tc.name      testDfmaBulkLifecycle20033
     * @tc.desc      Verify bulk2 lifecycle 6 files case 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_033';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(6);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_3400
     * @tc.name      testDfmaBulkLifecycle20034
     * @tc.desc      Verify bulk2 lifecycle 7 files case 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_034';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(7);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_3500
     * @tc.name      testDfmaBulkLifecycle20035
     * @tc.desc      Verify bulk2 lifecycle 8 files case 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_035';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          writeFile(dir + '/f7.txt', 'v7');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(8);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_3600
     * @tc.name      testDfmaBulkLifecycle20036
     * @tc.desc      Verify bulk2 lifecycle 9 files case 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_036';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(9);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_3700
     * @tc.name      testDfmaBulkLifecycle20037
     * @tc.desc      Verify bulk2 lifecycle 10 files case 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_037';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(10);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_3800
     * @tc.name      testDfmaBulkLifecycle20038
     * @tc.desc      Verify bulk2 lifecycle 11 files case 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_038';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(11);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_3900
     * @tc.name      testDfmaBulkLifecycle20039
     * @tc.desc      Verify bulk2 lifecycle 12 files case 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_039';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(12);
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE2_4000
     * @tc.name      testDfmaBulkLifecycle20040
     * @tc.desc      Verify bulk2 lifecycle 13 files case 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle20040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk2_040';
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
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(13);
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

  });
}
