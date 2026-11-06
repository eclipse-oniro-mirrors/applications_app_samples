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

export default function dfmaMetadataVolume3Test(): void {
  describe('DfmaMetadataVolume3Test', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_metadata_volume3';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try { fs.rmdirSync(ROOT); } catch (err) {}
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_0100
     * @tc.name      testDfmaMetadataVolume30001
     * @tc.desc      Verify metadata3 case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_001';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(4);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_0200
     * @tc.name      testDfmaMetadataVolume30002
     * @tc.desc      Verify metadata3 case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_002';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(5);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_0300
     * @tc.name      testDfmaMetadataVolume30003
     * @tc.desc      Verify metadata3 case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_003';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(6);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_0400
     * @tc.name      testDfmaMetadataVolume30004
     * @tc.desc      Verify metadata3 case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_004';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          writeFile(dir + '/m6.txt', 'v6');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(7);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_0500
     * @tc.name      testDfmaMetadataVolume30005
     * @tc.desc      Verify metadata3 case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_005';
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
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(8);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_0600
     * @tc.name      testDfmaMetadataVolume30006
     * @tc.desc      Verify metadata3 case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_006';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(4);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_0700
     * @tc.name      testDfmaMetadataVolume30007
     * @tc.desc      Verify metadata3 case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_007';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(5);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_0800
     * @tc.name      testDfmaMetadataVolume30008
     * @tc.desc      Verify metadata3 case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_008';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(6);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_0900
     * @tc.name      testDfmaMetadataVolume30009
     * @tc.desc      Verify metadata3 case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_009';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          writeFile(dir + '/m6.txt', 'v6');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(7);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_1000
     * @tc.name      testDfmaMetadataVolume30010
     * @tc.desc      Verify metadata3 case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_010';
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
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(8);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_1100
     * @tc.name      testDfmaMetadataVolume30011
     * @tc.desc      Verify metadata3 case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_011';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(4);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_1200
     * @tc.name      testDfmaMetadataVolume30012
     * @tc.desc      Verify metadata3 case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_012';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(5);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_1300
     * @tc.name      testDfmaMetadataVolume30013
     * @tc.desc      Verify metadata3 case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_013';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(6);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_1400
     * @tc.name      testDfmaMetadataVolume30014
     * @tc.desc      Verify metadata3 case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_014';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          writeFile(dir + '/m6.txt', 'v6');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(7);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_1500
     * @tc.name      testDfmaMetadataVolume30015
     * @tc.desc      Verify metadata3 case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_015';
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
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(8);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_1600
     * @tc.name      testDfmaMetadataVolume30016
     * @tc.desc      Verify metadata3 case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_016';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(4);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_1700
     * @tc.name      testDfmaMetadataVolume30017
     * @tc.desc      Verify metadata3 case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_017';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(5);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_1800
     * @tc.name      testDfmaMetadataVolume30018
     * @tc.desc      Verify metadata3 case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_018';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(6);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_1900
     * @tc.name      testDfmaMetadataVolume30019
     * @tc.desc      Verify metadata3 case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_019';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          writeFile(dir + '/m6.txt', 'v6');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(7);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_2000
     * @tc.name      testDfmaMetadataVolume30020
     * @tc.desc      Verify metadata3 case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_020';
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
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(8);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_2100
     * @tc.name      testDfmaMetadataVolume30021
     * @tc.desc      Verify metadata3 case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_021';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(4);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_2200
     * @tc.name      testDfmaMetadataVolume30022
     * @tc.desc      Verify metadata3 case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_022';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(5);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_2300
     * @tc.name      testDfmaMetadataVolume30023
     * @tc.desc      Verify metadata3 case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_023';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(6);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_2400
     * @tc.name      testDfmaMetadataVolume30024
     * @tc.desc      Verify metadata3 case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_024';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          writeFile(dir + '/m6.txt', 'v6');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(7);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_2500
     * @tc.name      testDfmaMetadataVolume30025
     * @tc.desc      Verify metadata3 case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_025';
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
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(8);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_2600
     * @tc.name      testDfmaMetadataVolume30026
     * @tc.desc      Verify metadata3 case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_026';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(4);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_2700
     * @tc.name      testDfmaMetadataVolume30027
     * @tc.desc      Verify metadata3 case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_027';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(5);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_2800
     * @tc.name      testDfmaMetadataVolume30028
     * @tc.desc      Verify metadata3 case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_028';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(6);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_2900
     * @tc.name      testDfmaMetadataVolume30029
     * @tc.desc      Verify metadata3 case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_029';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          writeFile(dir + '/m3.txt', 'v3');
          writeFile(dir + '/m4.txt', 'v4');
          writeFile(dir + '/m5.txt', 'v5');
          writeFile(dir + '/m6.txt', 'v6');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(7);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME3_3000
     * @tc.name      testDfmaMetadataVolume30030
     * @tc.desc      Verify metadata3 case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume30030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta3_030';
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
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(8);
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

  });
}
