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

export default function dfmaMetadataVolume2Test(): void {
  describe('DfmaMetadataVolume2Test', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_metadata_volume2';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try { fs.rmdirSync(ROOT); } catch (err) {}
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_0100
     * @tc.name      testDfmaMetadataVolume20001
     * @tc.desc      Verify metadata2 case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_001';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(3);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_0200
     * @tc.name      testDfmaMetadataVolume20002
     * @tc.desc      Verify metadata2 case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_002';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_0300
     * @tc.name      testDfmaMetadataVolume20003
     * @tc.desc      Verify metadata2 case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_003';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_0400
     * @tc.name      testDfmaMetadataVolume20004
     * @tc.desc      Verify metadata2 case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_004';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_0500
     * @tc.name      testDfmaMetadataVolume20005
     * @tc.desc      Verify metadata2 case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_005';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_0600
     * @tc.name      testDfmaMetadataVolume20006
     * @tc.desc      Verify metadata2 case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_006';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(3);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_0700
     * @tc.name      testDfmaMetadataVolume20007
     * @tc.desc      Verify metadata2 case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_007';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_0800
     * @tc.name      testDfmaMetadataVolume20008
     * @tc.desc      Verify metadata2 case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_008';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_0900
     * @tc.name      testDfmaMetadataVolume20009
     * @tc.desc      Verify metadata2 case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_009';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_1000
     * @tc.name      testDfmaMetadataVolume20010
     * @tc.desc      Verify metadata2 case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_010';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_1100
     * @tc.name      testDfmaMetadataVolume20011
     * @tc.desc      Verify metadata2 case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_011';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(3);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_1200
     * @tc.name      testDfmaMetadataVolume20012
     * @tc.desc      Verify metadata2 case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_012';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_1300
     * @tc.name      testDfmaMetadataVolume20013
     * @tc.desc      Verify metadata2 case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_013';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_1400
     * @tc.name      testDfmaMetadataVolume20014
     * @tc.desc      Verify metadata2 case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_014';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_1500
     * @tc.name      testDfmaMetadataVolume20015
     * @tc.desc      Verify metadata2 case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_015';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_1600
     * @tc.name      testDfmaMetadataVolume20016
     * @tc.desc      Verify metadata2 case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_016';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(3);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_1700
     * @tc.name      testDfmaMetadataVolume20017
     * @tc.desc      Verify metadata2 case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_017';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_1800
     * @tc.name      testDfmaMetadataVolume20018
     * @tc.desc      Verify metadata2 case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_018';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_1900
     * @tc.name      testDfmaMetadataVolume20019
     * @tc.desc      Verify metadata2 case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_019';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_2000
     * @tc.name      testDfmaMetadataVolume20020
     * @tc.desc      Verify metadata2 case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_020';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_2100
     * @tc.name      testDfmaMetadataVolume20021
     * @tc.desc      Verify metadata2 case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_021';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(3);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_2200
     * @tc.name      testDfmaMetadataVolume20022
     * @tc.desc      Verify metadata2 case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_022';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_2300
     * @tc.name      testDfmaMetadataVolume20023
     * @tc.desc      Verify metadata2 case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_023';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_2400
     * @tc.name      testDfmaMetadataVolume20024
     * @tc.desc      Verify metadata2 case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_024';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_2500
     * @tc.name      testDfmaMetadataVolume20025
     * @tc.desc      Verify metadata2 case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_025';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_2600
     * @tc.name      testDfmaMetadataVolume20026
     * @tc.desc      Verify metadata2 case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_026';
          fs.mkdirSync(dir);
          writeFile(dir + '/m0.txt', 'v0');
          writeFile(dir + '/m1.txt', 'v1');
          writeFile(dir + '/m2.txt', 'v2');
          const stat: fs.Stat = fs.statSync(dir);
          expect(stat.isDirectory()).assertTrue();
          expect(stat.mtime > 0).assertTrue();
          expect(fs.listFileSync(dir).length).assertEqual(3);
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_2700
     * @tc.name      testDfmaMetadataVolume20027
     * @tc.desc      Verify metadata2 case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_027';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_2800
     * @tc.name      testDfmaMetadataVolume20028
     * @tc.desc      Verify metadata2 case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_028';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_2900
     * @tc.name      testDfmaMetadataVolume20029
     * @tc.desc      Verify metadata2 case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_029';
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
     * @tc.number    SUB_COREFILE_DFMA_METADATA_VOLUME2_3000
     * @tc.name      testDfmaMetadataVolume20030
     * @tc.desc      Verify metadata2 case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaMetadataVolume20030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = ROOT + '/meta2_030';
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

  });
}
