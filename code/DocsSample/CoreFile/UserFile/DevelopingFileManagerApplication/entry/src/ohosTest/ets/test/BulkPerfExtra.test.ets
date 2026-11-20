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

export default function dfmaBulkPerfExtraTest(): void {
  describe('DfmaBulkPerfExtraTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_bulk_perf';
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
     * @tc.number    SUB_COREFILE_DFMA_BULK_PERF_0100
     * @tc.name      testDfmaBulkPerfExtra0001
     * @tc.desc      Verify bulk lifecycle 10 files case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkPerfExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_001';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          writeFile(dir + '/f7.txt', 'v7');
          writeFile(dir + '/f8.txt', 'content8');
          writeFile(dir + '/f9.txt', 'v9');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(10);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 10; index++) {
            fs.unlinkSync(dir + '/f' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
          expect(fs.accessSync(dir)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_PERF_0200
     * @tc.name      testDfmaBulkPerfExtra0002
     * @tc.desc      Verify bulk lifecycle 20 files case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkPerfExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_002';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          writeFile(dir + '/f7.txt', 'v7');
          writeFile(dir + '/f8.txt', 'content8');
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
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 20; index++) {
            fs.unlinkSync(dir + '/f' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
          expect(fs.accessSync(dir)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_PERF_0300
     * @tc.name      testDfmaBulkPerfExtra0003
     * @tc.desc      Verify bulk lifecycle 30 files case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkPerfExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_003';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          writeFile(dir + '/f6.txt', 'v6');
          writeFile(dir + '/f7.txt', 'v7');
          writeFile(dir + '/f8.txt', 'content8');
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
          writeFile(dir + '/f22.txt', 'v22');
          writeFile(dir + '/f23.txt', 'v23');
          writeFile(dir + '/f24.txt', 'v24');
          writeFile(dir + '/f25.txt', 'v25');
          writeFile(dir + '/f26.txt', 'v26');
          writeFile(dir + '/f27.txt', 'v27');
          writeFile(dir + '/f28.txt', 'v28');
          writeFile(dir + '/f29.txt', 'v29');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(30);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 30; index++) {
            fs.unlinkSync(dir + '/f' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
          expect(fs.accessSync(dir)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_PERF_0400
     * @tc.name      testDfmaBulkPerfExtra0004
     * @tc.desc      Verify bulk lifecycle 40 files case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkPerfExtra0004',
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
          writeFile(dir + '/f6.txt', 'v6');
          writeFile(dir + '/f7.txt', 'v7');
          writeFile(dir + '/f8.txt', 'content8');
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
          writeFile(dir + '/f22.txt', 'v22');
          writeFile(dir + '/f23.txt', 'v23');
          writeFile(dir + '/f24.txt', 'v24');
          writeFile(dir + '/f25.txt', 'v25');
          writeFile(dir + '/f26.txt', 'v26');
          writeFile(dir + '/f27.txt', 'v27');
          writeFile(dir + '/f28.txt', 'v28');
          writeFile(dir + '/f29.txt', 'v29');
          writeFile(dir + '/f30.txt', 'v30');
          writeFile(dir + '/f31.txt', 'v31');
          writeFile(dir + '/f32.txt', 'v32');
          writeFile(dir + '/f33.txt', 'v33');
          writeFile(dir + '/f34.txt', 'v34');
          writeFile(dir + '/f35.txt', 'v35');
          writeFile(dir + '/f36.txt', 'v36');
          writeFile(dir + '/f37.txt', 'v37');
          writeFile(dir + '/f38.txt', 'v38');
          writeFile(dir + '/f39.txt', 'v39');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(40);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 40; index++) {
            fs.unlinkSync(dir + '/f' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
          expect(fs.accessSync(dir)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_PERF_0500
     * @tc.name      testDfmaBulkPerfExtra0005
     * @tc.desc      Verify bulk lifecycle 50 files case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkPerfExtra0005',
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
          writeFile(dir + '/f7.txt', 'v7');
          writeFile(dir + '/f8.txt', 'content8');
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
          writeFile(dir + '/f22.txt', 'v22');
          writeFile(dir + '/f23.txt', 'v23');
          writeFile(dir + '/f24.txt', 'v24');
          writeFile(dir + '/f25.txt', 'v25');
          writeFile(dir + '/f26.txt', 'v26');
          writeFile(dir + '/f27.txt', 'v27');
          writeFile(dir + '/f28.txt', 'v28');
          writeFile(dir + '/f29.txt', 'v29');
          writeFile(dir + '/f30.txt', 'v30');
          writeFile(dir + '/f31.txt', 'v31');
          writeFile(dir + '/f32.txt', 'v32');
          writeFile(dir + '/f33.txt', 'v33');
          writeFile(dir + '/f34.txt', 'v34');
          writeFile(dir + '/f35.txt', 'v35');
          writeFile(dir + '/f36.txt', 'v36');
          writeFile(dir + '/f37.txt', 'v37');
          writeFile(dir + '/f38.txt', 'v38');
          writeFile(dir + '/f39.txt', 'v39');
          writeFile(dir + '/f40.txt', 'v40');
          writeFile(dir + '/f41.txt', 'v41');
          writeFile(dir + '/f42.txt', 'v42');
          writeFile(dir + '/f43.txt', 'v43');
          writeFile(dir + '/f44.txt', 'v44');
          writeFile(dir + '/f45.txt', 'v45');
          writeFile(dir + '/f46.txt', 'v46');
          writeFile(dir + '/f47.txt', 'v47');
          writeFile(dir + '/f48.txt', 'v48');
          writeFile(dir + '/f49.txt', 'v49');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(50);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 50; index++) {
            fs.unlinkSync(dir + '/f' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
          expect(fs.accessSync(dir)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_PERF_0600
     * @tc.name      testDfmaBulkPerfExtra0006
     * @tc.desc      Verify bulk lifecycle 10 files case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkPerfExtra0006',
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
          writeFile(dir + '/f8.txt', 'content8');
          writeFile(dir + '/f9.txt', 'v9');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(10);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 10; index++) {
            fs.unlinkSync(dir + '/f' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
          expect(fs.accessSync(dir)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_PERF_0700
     * @tc.name      testDfmaBulkPerfExtra0007
     * @tc.desc      Verify bulk lifecycle 20 files case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkPerfExtra0007',
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
          writeFile(dir + '/f8.txt', 'content8');
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
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 20; index++) {
            fs.unlinkSync(dir + '/f' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
          expect(fs.accessSync(dir)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_PERF_0800
     * @tc.name      testDfmaBulkPerfExtra0008
     * @tc.desc      Verify bulk lifecycle 30 files case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkPerfExtra0008',
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
          writeFile(dir + '/f8.txt', 'content8');
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
          writeFile(dir + '/f22.txt', 'v22');
          writeFile(dir + '/f23.txt', 'v23');
          writeFile(dir + '/f24.txt', 'v24');
          writeFile(dir + '/f25.txt', 'v25');
          writeFile(dir + '/f26.txt', 'v26');
          writeFile(dir + '/f27.txt', 'v27');
          writeFile(dir + '/f28.txt', 'v28');
          writeFile(dir + '/f29.txt', 'v29');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(30);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 30; index++) {
            fs.unlinkSync(dir + '/f' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
          expect(fs.accessSync(dir)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_PERF_0900
     * @tc.name      testDfmaBulkPerfExtra0009
     * @tc.desc      Verify bulk lifecycle 40 files case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkPerfExtra0009',
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
          writeFile(dir + '/f8.txt', 'content8');
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
          writeFile(dir + '/f22.txt', 'v22');
          writeFile(dir + '/f23.txt', 'v23');
          writeFile(dir + '/f24.txt', 'v24');
          writeFile(dir + '/f25.txt', 'v25');
          writeFile(dir + '/f26.txt', 'v26');
          writeFile(dir + '/f27.txt', 'v27');
          writeFile(dir + '/f28.txt', 'v28');
          writeFile(dir + '/f29.txt', 'v29');
          writeFile(dir + '/f30.txt', 'v30');
          writeFile(dir + '/f31.txt', 'v31');
          writeFile(dir + '/f32.txt', 'v32');
          writeFile(dir + '/f33.txt', 'v33');
          writeFile(dir + '/f34.txt', 'v34');
          writeFile(dir + '/f35.txt', 'v35');
          writeFile(dir + '/f36.txt', 'v36');
          writeFile(dir + '/f37.txt', 'v37');
          writeFile(dir + '/f38.txt', 'v38');
          writeFile(dir + '/f39.txt', 'v39');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(40);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 40; index++) {
            fs.unlinkSync(dir + '/f' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
          expect(fs.accessSync(dir)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BULK_PERF_1000
     * @tc.name      testDfmaBulkPerfExtra0010
     * @tc.desc      Verify bulk lifecycle 50 files case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBulkPerfExtra0010',
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
          writeFile(dir + '/f8.txt', 'content8');
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
          writeFile(dir + '/f22.txt', 'v22');
          writeFile(dir + '/f23.txt', 'v23');
          writeFile(dir + '/f24.txt', 'v24');
          writeFile(dir + '/f25.txt', 'v25');
          writeFile(dir + '/f26.txt', 'v26');
          writeFile(dir + '/f27.txt', 'v27');
          writeFile(dir + '/f28.txt', 'v28');
          writeFile(dir + '/f29.txt', 'v29');
          writeFile(dir + '/f30.txt', 'v30');
          writeFile(dir + '/f31.txt', 'v31');
          writeFile(dir + '/f32.txt', 'v32');
          writeFile(dir + '/f33.txt', 'v33');
          writeFile(dir + '/f34.txt', 'v34');
          writeFile(dir + '/f35.txt', 'v35');
          writeFile(dir + '/f36.txt', 'v36');
          writeFile(dir + '/f37.txt', 'v37');
          writeFile(dir + '/f38.txt', 'v38');
          writeFile(dir + '/f39.txt', 'v39');
          writeFile(dir + '/f40.txt', 'v40');
          writeFile(dir + '/f41.txt', 'v41');
          writeFile(dir + '/f42.txt', 'v42');
          writeFile(dir + '/f43.txt', 'v43');
          writeFile(dir + '/f44.txt', 'v44');
          writeFile(dir + '/f45.txt', 'v45');
          writeFile(dir + '/f46.txt', 'v46');
          writeFile(dir + '/f47.txt', 'v47');
          writeFile(dir + '/f48.txt', 'v48');
          writeFile(dir + '/f49.txt', 'v49');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(50);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 50; index++) {
            fs.unlinkSync(dir + '/f' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
          expect(fs.accessSync(dir)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
