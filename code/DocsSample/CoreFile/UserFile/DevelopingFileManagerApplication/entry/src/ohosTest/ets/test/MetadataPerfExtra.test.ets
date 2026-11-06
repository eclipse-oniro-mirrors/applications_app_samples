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

export default function dfmaMetadataPerfExtraTest(): void {
  describe('DfmaMetadataPerfExtraTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_metadata_perf';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try { fs.rmdirSync(ROOT); } catch (err) {}
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_0100
     * @tc.name      testDfmaMetadataPerfExtra0001
     * @tc.desc      Verify metadata and mtime case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_001';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(3);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.unlinkSync(dir + '/m2.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_0200
     * @tc.name      testDfmaMetadataPerfExtra0002
     * @tc.desc      Verify metadata and mtime case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_002';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(4);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.unlinkSync(dir + '/m2.txt');
          fs.unlinkSync(dir + '/m3.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_0300
     * @tc.name      testDfmaMetadataPerfExtra0003
     * @tc.desc      Verify metadata and mtime case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_003';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(5);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.unlinkSync(dir + '/m2.txt');
          fs.unlinkSync(dir + '/m3.txt');
          fs.unlinkSync(dir + '/m4.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_0400
     * @tc.name      testDfmaMetadataPerfExtra0004
     * @tc.desc      Verify metadata and mtime case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_004';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(6);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.unlinkSync(dir + '/m2.txt');
          fs.unlinkSync(dir + '/m3.txt');
          fs.unlinkSync(dir + '/m4.txt');
          fs.unlinkSync(dir + '/m5.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_0500
     * @tc.name      testDfmaMetadataPerfExtra0005
     * @tc.desc      Verify metadata and mtime case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_005';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          writeFile(dir + '/m6.txt', 'v6');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(7);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.unlinkSync(dir + '/m2.txt');
          fs.unlinkSync(dir + '/m3.txt');
          fs.unlinkSync(dir + '/m4.txt');
          fs.unlinkSync(dir + '/m5.txt');
          fs.unlinkSync(dir + '/m6.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_0600
     * @tc.name      testDfmaMetadataPerfExtra0006
     * @tc.desc      Verify metadata and mtime case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_006';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          writeFile(dir + '/m6.txt', 'v6');
          writeFile(dir + '/m7.txt', 'v7');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(8);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.unlinkSync(dir + '/m2.txt');
          fs.unlinkSync(dir + '/m3.txt');
          fs.unlinkSync(dir + '/m4.txt');
          fs.unlinkSync(dir + '/m5.txt');
          fs.unlinkSync(dir + '/m6.txt');
          fs.unlinkSync(dir + '/m7.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_0700
     * @tc.name      testDfmaMetadataPerfExtra0007
     * @tc.desc      Verify metadata and mtime case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_007';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          writeFile(dir + '/m6.txt', 'v6');
          writeFile(dir + '/m7.txt', 'v7');
          writeFile(dir + '/m8.txt', 'v8');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(9);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.unlinkSync(dir + '/m2.txt');
          fs.unlinkSync(dir + '/m3.txt');
          fs.unlinkSync(dir + '/m4.txt');
          fs.unlinkSync(dir + '/m5.txt');
          fs.unlinkSync(dir + '/m6.txt');
          fs.unlinkSync(dir + '/m7.txt');
          fs.unlinkSync(dir + '/m8.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_0800
     * @tc.name      testDfmaMetadataPerfExtra0008
     * @tc.desc      Verify metadata and mtime case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_008';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          writeFile(dir + '/m6.txt', 'v6');
          writeFile(dir + '/m7.txt', 'v7');
          writeFile(dir + '/m8.txt', 'v8');
          writeFile(dir + '/m9.txt', 'v9');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(10);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.unlinkSync(dir + '/m2.txt');
          fs.unlinkSync(dir + '/m3.txt');
          fs.unlinkSync(dir + '/m4.txt');
          fs.unlinkSync(dir + '/m5.txt');
          fs.unlinkSync(dir + '/m6.txt');
          fs.unlinkSync(dir + '/m7.txt');
          fs.unlinkSync(dir + '/m8.txt');
          fs.unlinkSync(dir + '/m9.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_0900
     * @tc.name      testDfmaMetadataPerfExtra0009
     * @tc.desc      Verify metadata and mtime case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_009';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          writeFile(dir + '/m6.txt', 'v6');
          writeFile(dir + '/m7.txt', 'v7');
          writeFile(dir + '/m8.txt', 'v8');
          writeFile(dir + '/m9.txt', 'v9');
          writeFile(dir + '/m10.txt', 'v10');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(11);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.unlinkSync(dir + '/m2.txt');
          fs.unlinkSync(dir + '/m3.txt');
          fs.unlinkSync(dir + '/m4.txt');
          fs.unlinkSync(dir + '/m5.txt');
          fs.unlinkSync(dir + '/m6.txt');
          fs.unlinkSync(dir + '/m7.txt');
          fs.unlinkSync(dir + '/m8.txt');
          fs.unlinkSync(dir + '/m9.txt');
          fs.unlinkSync(dir + '/m10.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_1000
     * @tc.name      testDfmaMetadataPerfExtra0010
     * @tc.desc      Verify metadata and mtime case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_010';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          writeFile(dir + '/m6.txt', 'v6');
          writeFile(dir + '/m7.txt', 'v7');
          writeFile(dir + '/m8.txt', 'v8');
          writeFile(dir + '/m9.txt', 'v9');
          writeFile(dir + '/m10.txt', 'v10');
          writeFile(dir + '/m11.txt', 'v11');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(12);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.unlinkSync(dir + '/m2.txt');
          fs.unlinkSync(dir + '/m3.txt');
          fs.unlinkSync(dir + '/m4.txt');
          fs.unlinkSync(dir + '/m5.txt');
          fs.unlinkSync(dir + '/m6.txt');
          fs.unlinkSync(dir + '/m7.txt');
          fs.unlinkSync(dir + '/m8.txt');
          fs.unlinkSync(dir + '/m9.txt');
          fs.unlinkSync(dir + '/m10.txt');
          fs.unlinkSync(dir + '/m11.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_1100
     * @tc.name      testDfmaMetadataPerfExtra0011
     * @tc.desc      Verify bulk lifecycle case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/perf_011';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 5; index++) {
            writeFile(dir + '/p' + index.toString() + '.txt', 'perf');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(5);
          for (let index: number = 0; index < 5; index++) {
            fs.unlinkSync(dir + '/p' + index.toString() + '.txt');
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_1200
     * @tc.name      testDfmaMetadataPerfExtra0012
     * @tc.desc      Verify bulk lifecycle case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/perf_012';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 6; index++) {
            writeFile(dir + '/p' + index.toString() + '.txt', 'perf');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(6);
          for (let index: number = 0; index < 6; index++) {
            fs.unlinkSync(dir + '/p' + index.toString() + '.txt');
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_1300
     * @tc.name      testDfmaMetadataPerfExtra0013
     * @tc.desc      Verify bulk lifecycle case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/perf_013';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 7; index++) {
            writeFile(dir + '/p' + index.toString() + '.txt', 'perf');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(7);
          for (let index: number = 0; index < 7; index++) {
            fs.unlinkSync(dir + '/p' + index.toString() + '.txt');
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_1400
     * @tc.name      testDfmaMetadataPerfExtra0014
     * @tc.desc      Verify bulk lifecycle case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/perf_014';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 8; index++) {
            writeFile(dir + '/p' + index.toString() + '.txt', 'perf');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(8);
          for (let index: number = 0; index < 8; index++) {
            fs.unlinkSync(dir + '/p' + index.toString() + '.txt');
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_1500
     * @tc.name      testDfmaMetadataPerfExtra0015
     * @tc.desc      Verify bulk lifecycle case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/perf_015';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 9; index++) {
            writeFile(dir + '/p' + index.toString() + '.txt', 'perf');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(9);
          for (let index: number = 0; index < 9; index++) {
            fs.unlinkSync(dir + '/p' + index.toString() + '.txt');
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_1600
     * @tc.name      testDfmaMetadataPerfExtra0016
     * @tc.desc      Verify bulk lifecycle case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/perf_016';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 5; index++) {
            writeFile(dir + '/p' + index.toString() + '.txt', 'perf');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(5);
          for (let index: number = 0; index < 5; index++) {
            fs.unlinkSync(dir + '/p' + index.toString() + '.txt');
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_1700
     * @tc.name      testDfmaMetadataPerfExtra0017
     * @tc.desc      Verify bulk lifecycle case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/perf_017';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 6; index++) {
            writeFile(dir + '/p' + index.toString() + '.txt', 'perf');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(6);
          for (let index: number = 0; index < 6; index++) {
            fs.unlinkSync(dir + '/p' + index.toString() + '.txt');
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_1800
     * @tc.name      testDfmaMetadataPerfExtra0018
     * @tc.desc      Verify bulk lifecycle case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/perf_018';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 7; index++) {
            writeFile(dir + '/p' + index.toString() + '.txt', 'perf');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(7);
          for (let index: number = 0; index < 7; index++) {
            fs.unlinkSync(dir + '/p' + index.toString() + '.txt');
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_1900
     * @tc.name      testDfmaMetadataPerfExtra0019
     * @tc.desc      Verify bulk lifecycle case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/perf_019';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 8; index++) {
            writeFile(dir + '/p' + index.toString() + '.txt', 'perf');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(8);
          for (let index: number = 0; index < 8; index++) {
            fs.unlinkSync(dir + '/p' + index.toString() + '.txt');
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_PERF_2000
     * @tc.name      testDfmaMetadataPerfExtra0020
     * @tc.desc      Verify bulk lifecycle case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataPerfExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/perf_020';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 9; index++) {
            writeFile(dir + '/p' + index.toString() + '.txt', 'perf');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(9);
          for (let index: number = 0; index < 9; index++) {
            fs.unlinkSync(dir + '/p' + index.toString() + '.txt');
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
