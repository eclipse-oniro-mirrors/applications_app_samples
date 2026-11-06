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

export default function dfmaMetadataConcurrencyTest(): void {
  describe('DfmaMetadataConcurrencyTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_metadata_concurrency';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_0100
     * @tc.name      testDfmaMetadataConcurrency0001
     * @tc.desc      Verify directory metadata/list case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_001';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(3);
          expect(files.includes('f0.txt')).assertTrue();
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_0200
     * @tc.name      testDfmaMetadataConcurrency0002
     * @tc.desc      Verify directory metadata/list case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_002';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(4);
          expect(files.includes('f0.txt')).assertTrue();
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_0300
     * @tc.name      testDfmaMetadataConcurrency0003
     * @tc.desc      Verify directory metadata/list case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_003';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(5);
          expect(files.includes('f0.txt')).assertTrue();
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.unlinkSync(dir + '/f4.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_0400
     * @tc.name      testDfmaMetadataConcurrency0004
     * @tc.desc      Verify directory metadata/list case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_004';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(6);
          expect(files.includes('f0.txt')).assertTrue();
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.unlinkSync(dir + '/f4.txt');
          fs.unlinkSync(dir + '/f5.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_0500
     * @tc.name      testDfmaMetadataConcurrency0005
     * @tc.desc      Verify directory metadata/list case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_005';
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
          expect(files.includes('f0.txt')).assertTrue();
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.unlinkSync(dir + '/f4.txt');
          fs.unlinkSync(dir + '/f5.txt');
          fs.unlinkSync(dir + '/f6.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_0600
     * @tc.name      testDfmaMetadataConcurrency0006
     * @tc.desc      Verify directory metadata/list case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_006';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(3);
          expect(files.includes('f0.txt')).assertTrue();
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_0700
     * @tc.name      testDfmaMetadataConcurrency0007
     * @tc.desc      Verify directory metadata/list case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_007';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(4);
          expect(files.includes('f0.txt')).assertTrue();
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_0800
     * @tc.name      testDfmaMetadataConcurrency0008
     * @tc.desc      Verify directory metadata/list case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_008';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(5);
          expect(files.includes('f0.txt')).assertTrue();
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.unlinkSync(dir + '/f4.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_0900
     * @tc.name      testDfmaMetadataConcurrency0009
     * @tc.desc      Verify directory metadata/list case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_009';
          fs.mkdirSync(dir);
          writeFile(dir + '/f0.txt', 'v0');
          writeFile(dir + '/f1.txt', 'v1');
          writeFile(dir + '/f2.txt', 'v2');
          writeFile(dir + '/f3.txt', 'v3');
          writeFile(dir + '/f4.txt', 'v4');
          writeFile(dir + '/f5.txt', 'v5');
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(6);
          expect(files.includes('f0.txt')).assertTrue();
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.unlinkSync(dir + '/f4.txt');
          fs.unlinkSync(dir + '/f5.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_1000
     * @tc.name      testDfmaMetadataConcurrency0010
     * @tc.desc      Verify directory metadata/list case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_010';
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
          expect(files.includes('f0.txt')).assertTrue();
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          fs.unlinkSync(dir + '/f0.txt');
          fs.unlinkSync(dir + '/f1.txt');
          fs.unlinkSync(dir + '/f2.txt');
          fs.unlinkSync(dir + '/f3.txt');
          fs.unlinkSync(dir + '/f4.txt');
          fs.unlinkSync(dir + '/f5.txt');
          fs.unlinkSync(dir + '/f6.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_1100
     * @tc.name      testDfmaMetadataConcurrency0011
     * @tc.desc      Verify bulk file lifecycle case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_011';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 5; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(5);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 5; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_1200
     * @tc.name      testDfmaMetadataConcurrency0012
     * @tc.desc      Verify bulk file lifecycle case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_012';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 6; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(6);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 6; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_1300
     * @tc.name      testDfmaMetadataConcurrency0013
     * @tc.desc      Verify bulk file lifecycle case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_013';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 7; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(7);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 7; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_1400
     * @tc.name      testDfmaMetadataConcurrency0014
     * @tc.desc      Verify bulk file lifecycle case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_014';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 8; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(8);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 8; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_1500
     * @tc.name      testDfmaMetadataConcurrency0015
     * @tc.desc      Verify bulk file lifecycle case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_015';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 5; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(5);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 5; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_1600
     * @tc.name      testDfmaMetadataConcurrency0016
     * @tc.desc      Verify bulk file lifecycle case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_016';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 6; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(6);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 6; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_1700
     * @tc.name      testDfmaMetadataConcurrency0017
     * @tc.desc      Verify bulk file lifecycle case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_017';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 7; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(7);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 7; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_1800
     * @tc.name      testDfmaMetadataConcurrency0018
     * @tc.desc      Verify bulk file lifecycle case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_018';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 8; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(8);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 8; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_1900
     * @tc.name      testDfmaMetadataConcurrency0019
     * @tc.desc      Verify bulk file lifecycle case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_019';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 5; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(5);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 5; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_2000
     * @tc.name      testDfmaMetadataConcurrency0020
     * @tc.desc      Verify bulk file lifecycle case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_020';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 6; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(6);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 6; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_2100
     * @tc.name      testDfmaMetadataConcurrency0021
     * @tc.desc      Verify bulk file lifecycle case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_021';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 7; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(7);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 7; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_2200
     * @tc.name      testDfmaMetadataConcurrency0022
     * @tc.desc      Verify bulk file lifecycle case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_022';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 8; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(8);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 8; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_2300
     * @tc.name      testDfmaMetadataConcurrency0023
     * @tc.desc      Verify bulk file lifecycle case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_023';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 5; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(5);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 5; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_2400
     * @tc.name      testDfmaMetadataConcurrency0024
     * @tc.desc      Verify bulk file lifecycle case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_024';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 6; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(6);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 6; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_2500
     * @tc.name      testDfmaMetadataConcurrency0025
     * @tc.desc      Verify bulk file lifecycle case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_025';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 7; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(7);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 7; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_2600
     * @tc.name      testDfmaMetadataConcurrency0026
     * @tc.desc      Verify bulk file lifecycle case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_026';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 8; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(8);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 8; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_2700
     * @tc.name      testDfmaMetadataConcurrency0027
     * @tc.desc      Verify bulk file lifecycle case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_027';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 5; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(5);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 5; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_2800
     * @tc.name      testDfmaMetadataConcurrency0028
     * @tc.desc      Verify bulk file lifecycle case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_028';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 6; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(6);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 6; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_2900
     * @tc.name      testDfmaMetadataConcurrency0029
     * @tc.desc      Verify bulk file lifecycle case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_029';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 7; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(7);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 7; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_3000
     * @tc.name      testDfmaMetadataConcurrency0030
     * @tc.desc      Verify bulk file lifecycle case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataConcurrency0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/bulk_030';
          fs.mkdirSync(dir);
          for (let index: number = 0; index < 8; index++) {
            writeFile(dir + '/b' + index.toString() + '.txt', 'bulk');
          }
          const files: string[] = fs.listFileSync(dir);
          expect(files.length).assertEqual(8);
          expect(files.length > 0).assertTrue();
          for (let index: number = 0; index < 8; index++) {
            fs.unlinkSync(dir + '/b' + index.toString() + '.txt');
          }
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
