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

export default function dfmaBulkLifecycleTest(): void {
  describe('DfmaBulkLifecycleTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_bulk_lifecycle';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try { fs.rmdirSync(ROOT); } catch (err) {}
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_0100
     * @tc.name      testDfmaBulkLifecycle0001
     * @tc.desc      Verify bulk lifecycle files 3 case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_001';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(3);
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_0200
     * @tc.name      testDfmaBulkLifecycle0002
     * @tc.desc      Verify bulk lifecycle files 4 case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_002';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_0300
     * @tc.name      testDfmaBulkLifecycle0003
     * @tc.desc      Verify bulk lifecycle files 5 case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_003';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_0400
     * @tc.name      testDfmaBulkLifecycle0004
     * @tc.desc      Verify bulk lifecycle files 6 case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_004';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_0500
     * @tc.name      testDfmaBulkLifecycle0005
     * @tc.desc      Verify bulk lifecycle files 7 case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_005';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_0600
     * @tc.name      testDfmaBulkLifecycle0006
     * @tc.desc      Verify bulk lifecycle files 8 case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_006';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_0700
     * @tc.name      testDfmaBulkLifecycle0007
     * @tc.desc      Verify bulk lifecycle files 9 case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_007';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_0800
     * @tc.name      testDfmaBulkLifecycle0008
     * @tc.desc      Verify bulk lifecycle files 10 case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_008';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_0900
     * @tc.name      testDfmaBulkLifecycle0009
     * @tc.desc      Verify bulk lifecycle files 11 case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_009';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_1000
     * @tc.name      testDfmaBulkLifecycle0010
     * @tc.desc      Verify bulk lifecycle files 12 case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_010';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_1100
     * @tc.name      testDfmaBulkLifecycle0011
     * @tc.desc      Verify bulk lifecycle files 13 case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_011';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_1200
     * @tc.name      testDfmaBulkLifecycle0012
     * @tc.desc      Verify bulk lifecycle files 14 case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_012';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_1300
     * @tc.name      testDfmaBulkLifecycle0013
     * @tc.desc      Verify bulk lifecycle files 15 case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_013';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_1400
     * @tc.name      testDfmaBulkLifecycle0014
     * @tc.desc      Verify bulk lifecycle files 16 case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_014';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_1500
     * @tc.name      testDfmaBulkLifecycle0015
     * @tc.desc      Verify bulk lifecycle files 17 case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_015';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_1600
     * @tc.name      testDfmaBulkLifecycle0016
     * @tc.desc      Verify bulk lifecycle files 18 case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_016';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_1700
     * @tc.name      testDfmaBulkLifecycle0017
     * @tc.desc      Verify bulk lifecycle files 19 case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_017';
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
          writeFile(dir + '/f18.txt', 'v18');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(19);
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
          fs.unlinkSync(dir + '/f18.txt');
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_1800
     * @tc.name      testDfmaBulkLifecycle0018
     * @tc.desc      Verify bulk lifecycle files 20 case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_018';
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
          writeFile(dir + '/f18.txt', 'v18');
          writeFile(dir + '/f19.txt', 'v19');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(20);
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
          fs.unlinkSync(dir + '/f18.txt');
          fs.unlinkSync(dir + '/f19.txt');
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_1900
     * @tc.name      testDfmaBulkLifecycle0019
     * @tc.desc      Verify bulk lifecycle files 21 case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_019';
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
          writeFile(dir + '/f18.txt', 'v18');
          writeFile(dir + '/f19.txt', 'v19');
          writeFile(dir + '/f20.txt', 'v20');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(21);
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
          fs.unlinkSync(dir + '/f18.txt');
          fs.unlinkSync(dir + '/f19.txt');
          fs.unlinkSync(dir + '/f20.txt');
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_2000
     * @tc.name      testDfmaBulkLifecycle0020
     * @tc.desc      Verify bulk lifecycle files 22 case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_020';
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
          writeFile(dir + '/f18.txt', 'v18');
          writeFile(dir + '/f19.txt', 'v19');
          writeFile(dir + '/f20.txt', 'v20');
          writeFile(dir + '/f21.txt', 'v21');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(22);
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
          fs.unlinkSync(dir + '/f18.txt');
          fs.unlinkSync(dir + '/f19.txt');
          fs.unlinkSync(dir + '/f20.txt');
          fs.unlinkSync(dir + '/f21.txt');
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_2100
     * @tc.name      testDfmaBulkLifecycle0021
     * @tc.desc      Verify bulk lifecycle files 3 case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_021';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(3);
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_2200
     * @tc.name      testDfmaBulkLifecycle0022
     * @tc.desc      Verify bulk lifecycle files 4 case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_022';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_2300
     * @tc.name      testDfmaBulkLifecycle0023
     * @tc.desc      Verify bulk lifecycle files 5 case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_023';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_2400
     * @tc.name      testDfmaBulkLifecycle0024
     * @tc.desc      Verify bulk lifecycle files 6 case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_024';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_2500
     * @tc.name      testDfmaBulkLifecycle0025
     * @tc.desc      Verify bulk lifecycle files 7 case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_025';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_2600
     * @tc.name      testDfmaBulkLifecycle0026
     * @tc.desc      Verify bulk lifecycle files 8 case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_026';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_2700
     * @tc.name      testDfmaBulkLifecycle0027
     * @tc.desc      Verify bulk lifecycle files 9 case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_027';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_2800
     * @tc.name      testDfmaBulkLifecycle0028
     * @tc.desc      Verify bulk lifecycle files 10 case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_028';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_2900
     * @tc.name      testDfmaBulkLifecycle0029
     * @tc.desc      Verify bulk lifecycle files 11 case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_029';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_3000
     * @tc.name      testDfmaBulkLifecycle0030
     * @tc.desc      Verify bulk lifecycle files 12 case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_030';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_3100
     * @tc.name      testDfmaBulkLifecycle0031
     * @tc.desc      Verify bulk lifecycle files 13 case 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_031';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_3200
     * @tc.name      testDfmaBulkLifecycle0032
     * @tc.desc      Verify bulk lifecycle files 14 case 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_032';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_3300
     * @tc.name      testDfmaBulkLifecycle0033
     * @tc.desc      Verify bulk lifecycle files 15 case 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_033';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_3400
     * @tc.name      testDfmaBulkLifecycle0034
     * @tc.desc      Verify bulk lifecycle files 16 case 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_034';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_3500
     * @tc.name      testDfmaBulkLifecycle0035
     * @tc.desc      Verify bulk lifecycle files 17 case 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_035';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_3600
     * @tc.name      testDfmaBulkLifecycle0036
     * @tc.desc      Verify bulk lifecycle files 18 case 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_036';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_3700
     * @tc.name      testDfmaBulkLifecycle0037
     * @tc.desc      Verify bulk lifecycle files 19 case 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_037';
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
          writeFile(dir + '/f18.txt', 'v18');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(19);
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
          fs.unlinkSync(dir + '/f18.txt');
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_3800
     * @tc.name      testDfmaBulkLifecycle0038
     * @tc.desc      Verify bulk lifecycle files 20 case 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_038';
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
          writeFile(dir + '/f18.txt', 'v18');
          writeFile(dir + '/f19.txt', 'v19');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(20);
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
          fs.unlinkSync(dir + '/f18.txt');
          fs.unlinkSync(dir + '/f19.txt');
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_3900
     * @tc.name      testDfmaBulkLifecycle0039
     * @tc.desc      Verify bulk lifecycle files 21 case 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_039';
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
          writeFile(dir + '/f18.txt', 'v18');
          writeFile(dir + '/f19.txt', 'v19');
          writeFile(dir + '/f20.txt', 'v20');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(21);
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
          fs.unlinkSync(dir + '/f18.txt');
          fs.unlinkSync(dir + '/f19.txt');
          fs.unlinkSync(dir + '/f20.txt');
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_4000
     * @tc.name      testDfmaBulkLifecycle0040
     * @tc.desc      Verify bulk lifecycle files 22 case 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_040';
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
          writeFile(dir + '/f18.txt', 'v18');
          writeFile(dir + '/f19.txt', 'v19');
          writeFile(dir + '/f20.txt', 'v20');
          writeFile(dir + '/f21.txt', 'v21');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(22);
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
          fs.unlinkSync(dir + '/f18.txt');
          fs.unlinkSync(dir + '/f19.txt');
          fs.unlinkSync(dir + '/f20.txt');
          fs.unlinkSync(dir + '/f21.txt');
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_4100
     * @tc.name      testDfmaBulkLifecycle0041
     * @tc.desc      Verify bulk lifecycle files 3 case 41.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_041';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(3);
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_4200
     * @tc.name      testDfmaBulkLifecycle0042
     * @tc.desc      Verify bulk lifecycle files 4 case 42.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_042';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_4300
     * @tc.name      testDfmaBulkLifecycle0043
     * @tc.desc      Verify bulk lifecycle files 5 case 43.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_043';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_4400
     * @tc.name      testDfmaBulkLifecycle0044
     * @tc.desc      Verify bulk lifecycle files 6 case 44.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_044';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_4500
     * @tc.name      testDfmaBulkLifecycle0045
     * @tc.desc      Verify bulk lifecycle files 7 case 45.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_045';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_4600
     * @tc.name      testDfmaBulkLifecycle0046
     * @tc.desc      Verify bulk lifecycle files 8 case 46.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_046';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_4700
     * @tc.name      testDfmaBulkLifecycle0047
     * @tc.desc      Verify bulk lifecycle files 9 case 47.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_047';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_LIFECYCLE_4800
     * @tc.name      testDfmaBulkLifecycle0048
     * @tc.desc      Verify bulk lifecycle files 10 case 48.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkLifecycle0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_048';
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
          const after: string[] = fs.listFileSync(dir);
          expect(after.length).assertEqual(0);
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
