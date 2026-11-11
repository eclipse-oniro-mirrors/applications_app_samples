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

export default function dfmaMetadataVolumeTest(): void {
  describe('DfmaMetadataVolumeTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_metadata_volume';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_0100
     * @tc.name      testDfmaMetadataVolume0001
     * @tc.desc      Verify metadata volume case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_001';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(2);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_0200
     * @tc.name      testDfmaMetadataVolume0002
     * @tc.desc      Verify metadata volume case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_002';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_0300
     * @tc.name      testDfmaMetadataVolume0003
     * @tc.desc      Verify metadata volume case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_003';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_0400
     * @tc.name      testDfmaMetadataVolume0004
     * @tc.desc      Verify metadata volume case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_004';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_0500
     * @tc.name      testDfmaMetadataVolume0005
     * @tc.desc      Verify metadata volume case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0005',
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_0600
     * @tc.name      testDfmaMetadataVolume0006
     * @tc.desc      Verify metadata volume case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0006',
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_0700
     * @tc.name      testDfmaMetadataVolume0007
     * @tc.desc      Verify metadata volume case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_007';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(2);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_0800
     * @tc.name      testDfmaMetadataVolume0008
     * @tc.desc      Verify metadata volume case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_008';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_0900
     * @tc.name      testDfmaMetadataVolume0009
     * @tc.desc      Verify metadata volume case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_009';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_1000
     * @tc.name      testDfmaMetadataVolume0010
     * @tc.desc      Verify metadata volume case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_010';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_1100
     * @tc.name      testDfmaMetadataVolume0011
     * @tc.desc      Verify metadata volume case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_011';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_1200
     * @tc.name      testDfmaMetadataVolume0012
     * @tc.desc      Verify metadata volume case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_012';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_1300
     * @tc.name      testDfmaMetadataVolume0013
     * @tc.desc      Verify metadata volume case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_013';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(2);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_1400
     * @tc.name      testDfmaMetadataVolume0014
     * @tc.desc      Verify metadata volume case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_014';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_1500
     * @tc.name      testDfmaMetadataVolume0015
     * @tc.desc      Verify metadata volume case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_015';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_1600
     * @tc.name      testDfmaMetadataVolume0016
     * @tc.desc      Verify metadata volume case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_016';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_1700
     * @tc.name      testDfmaMetadataVolume0017
     * @tc.desc      Verify metadata volume case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_017';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_1800
     * @tc.name      testDfmaMetadataVolume0018
     * @tc.desc      Verify metadata volume case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_018';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_1900
     * @tc.name      testDfmaMetadataVolume0019
     * @tc.desc      Verify metadata volume case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_019';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(2);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_2000
     * @tc.name      testDfmaMetadataVolume0020
     * @tc.desc      Verify metadata volume case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_020';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_2100
     * @tc.name      testDfmaMetadataVolume0021
     * @tc.desc      Verify metadata volume case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_021';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_2200
     * @tc.name      testDfmaMetadataVolume0022
     * @tc.desc      Verify metadata volume case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_022';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_2300
     * @tc.name      testDfmaMetadataVolume0023
     * @tc.desc      Verify metadata volume case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_023';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_2400
     * @tc.name      testDfmaMetadataVolume0024
     * @tc.desc      Verify metadata volume case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_024';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_2500
     * @tc.name      testDfmaMetadataVolume0025
     * @tc.desc      Verify metadata volume case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_025';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          const stat: fs.Stat = fs.statSync(dir);
          const files: string[] = fs.listFileSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(files.length).assertEqual(2);
          fs.unlinkSync(dir + '/m0.txt');
          fs.unlinkSync(dir + '/m1.txt');
          fs.rmdirSync(dir);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_2600
     * @tc.name      testDfmaMetadataVolume0026
     * @tc.desc      Verify metadata volume case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_026';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_2700
     * @tc.name      testDfmaMetadataVolume0027
     * @tc.desc      Verify metadata volume case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_027';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_2800
     * @tc.name      testDfmaMetadataVolume0028
     * @tc.desc      Verify metadata volume case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_028';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_2900
     * @tc.name      testDfmaMetadataVolume0029
     * @tc.desc      Verify metadata volume case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_029';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME_3000
     * @tc.name      testDfmaMetadataVolume0030
     * @tc.desc      Verify metadata volume case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta_030';
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

  });
}
