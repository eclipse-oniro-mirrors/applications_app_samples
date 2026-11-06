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

export default function dfmaFileIoVolume2Test(): void {
  describe('DfmaFileIoVolume2Test', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_volume2';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try { fs.rmdirSync(ROOT); } catch (err) {}
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_0100
     * @tc.name      testDfmaFileIoVolume20001
     * @tc.desc      Verify volume2 file case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_001.txt';
          writeFile(path, 'wwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(11);
          expect(fs.statSync(path).size).assertEqual(11);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_0200
     * @tc.name      testDfmaFileIoVolume20002
     * @tc.desc      Verify volume2 file case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_002.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(22);
          expect(fs.statSync(path).size).assertEqual(22);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_0300
     * @tc.name      testDfmaFileIoVolume20003
     * @tc.desc      Verify volume2 file case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_003.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(33);
          expect(fs.statSync(path).size).assertEqual(33);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_0400
     * @tc.name      testDfmaFileIoVolume20004
     * @tc.desc      Verify volume2 file case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_004.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(44);
          expect(fs.statSync(path).size).assertEqual(44);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_0500
     * @tc.name      testDfmaFileIoVolume20005
     * @tc.desc      Verify volume2 file case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_005.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(55);
          expect(fs.statSync(path).size).assertEqual(55);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_0600
     * @tc.name      testDfmaFileIoVolume20006
     * @tc.desc      Verify volume2 file case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_006.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(66);
          expect(fs.statSync(path).size).assertEqual(66);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_0700
     * @tc.name      testDfmaFileIoVolume20007
     * @tc.desc      Verify volume2 file case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_007.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(77);
          expect(fs.statSync(path).size).assertEqual(77);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_0800
     * @tc.name      testDfmaFileIoVolume20008
     * @tc.desc      Verify volume2 file case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_008.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(88);
          expect(fs.statSync(path).size).assertEqual(88);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_0900
     * @tc.name      testDfmaFileIoVolume20009
     * @tc.desc      Verify volume2 file case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_009.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(99);
          expect(fs.statSync(path).size).assertEqual(99);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_1000
     * @tc.name      testDfmaFileIoVolume20010
     * @tc.desc      Verify volume2 file case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_010.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(110);
          expect(fs.statSync(path).size).assertEqual(110);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_1100
     * @tc.name      testDfmaFileIoVolume20011
     * @tc.desc      Verify volume2 file case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_011.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(121);
          expect(fs.statSync(path).size).assertEqual(121);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_1200
     * @tc.name      testDfmaFileIoVolume20012
     * @tc.desc      Verify volume2 file case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_012.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(132);
          expect(fs.statSync(path).size).assertEqual(132);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_1300
     * @tc.name      testDfmaFileIoVolume20013
     * @tc.desc      Verify volume2 file case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_013.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(143);
          expect(fs.statSync(path).size).assertEqual(143);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_1400
     * @tc.name      testDfmaFileIoVolume20014
     * @tc.desc      Verify volume2 file case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_014.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(154);
          expect(fs.statSync(path).size).assertEqual(154);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_1500
     * @tc.name      testDfmaFileIoVolume20015
     * @tc.desc      Verify volume2 file case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_015.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(165);
          expect(fs.statSync(path).size).assertEqual(165);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_1600
     * @tc.name      testDfmaFileIoVolume20016
     * @tc.desc      Verify volume2 file case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_016.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(176);
          expect(fs.statSync(path).size).assertEqual(176);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_1700
     * @tc.name      testDfmaFileIoVolume20017
     * @tc.desc      Verify volume2 file case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_017.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(187);
          expect(fs.statSync(path).size).assertEqual(187);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_1800
     * @tc.name      testDfmaFileIoVolume20018
     * @tc.desc      Verify volume2 file case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_018.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(198);
          expect(fs.statSync(path).size).assertEqual(198);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_1900
     * @tc.name      testDfmaFileIoVolume20019
     * @tc.desc      Verify volume2 file case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_019.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(209);
          expect(fs.statSync(path).size).assertEqual(209);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_2000
     * @tc.name      testDfmaFileIoVolume20020
     * @tc.desc      Verify volume2 file case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_020.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(220);
          expect(fs.statSync(path).size).assertEqual(220);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_2100
     * @tc.name      testDfmaFileIoVolume20021
     * @tc.desc      Verify volume2 file case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_021.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(231);
          expect(fs.statSync(path).size).assertEqual(231);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_2200
     * @tc.name      testDfmaFileIoVolume20022
     * @tc.desc      Verify volume2 file case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_022.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(242);
          expect(fs.statSync(path).size).assertEqual(242);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_2300
     * @tc.name      testDfmaFileIoVolume20023
     * @tc.desc      Verify volume2 file case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_023.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(253);
          expect(fs.statSync(path).size).assertEqual(253);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_2400
     * @tc.name      testDfmaFileIoVolume20024
     * @tc.desc      Verify volume2 file case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_024.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(264);
          expect(fs.statSync(path).size).assertEqual(264);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_2500
     * @tc.name      testDfmaFileIoVolume20025
     * @tc.desc      Verify volume2 file case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_025.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(275);
          expect(fs.statSync(path).size).assertEqual(275);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_2600
     * @tc.name      testDfmaFileIoVolume20026
     * @tc.desc      Verify volume2 file case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_026.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(286);
          expect(fs.statSync(path).size).assertEqual(286);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_2700
     * @tc.name      testDfmaFileIoVolume20027
     * @tc.desc      Verify volume2 file case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_027.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(297);
          expect(fs.statSync(path).size).assertEqual(297);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_2800
     * @tc.name      testDfmaFileIoVolume20028
     * @tc.desc      Verify volume2 file case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_028.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(308);
          expect(fs.statSync(path).size).assertEqual(308);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_2900
     * @tc.name      testDfmaFileIoVolume20029
     * @tc.desc      Verify volume2 file case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_029.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(319);
          expect(fs.statSync(path).size).assertEqual(319);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_3000
     * @tc.name      testDfmaFileIoVolume20030
     * @tc.desc      Verify volume2 file case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_030.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(330);
          expect(fs.statSync(path).size).assertEqual(330);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_3100
     * @tc.name      testDfmaFileIoVolume20031
     * @tc.desc      Verify volume2 file case 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_031.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(341);
          expect(fs.statSync(path).size).assertEqual(341);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_3200
     * @tc.name      testDfmaFileIoVolume20032
     * @tc.desc      Verify volume2 file case 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_032.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(352);
          expect(fs.statSync(path).size).assertEqual(352);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_3300
     * @tc.name      testDfmaFileIoVolume20033
     * @tc.desc      Verify volume2 file case 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_033.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(363);
          expect(fs.statSync(path).size).assertEqual(363);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_3400
     * @tc.name      testDfmaFileIoVolume20034
     * @tc.desc      Verify volume2 file case 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_034.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(374);
          expect(fs.statSync(path).size).assertEqual(374);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_3500
     * @tc.name      testDfmaFileIoVolume20035
     * @tc.desc      Verify volume2 file case 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_035.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(385);
          expect(fs.statSync(path).size).assertEqual(385);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_3600
     * @tc.name      testDfmaFileIoVolume20036
     * @tc.desc      Verify volume2 file case 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_036.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(396);
          expect(fs.statSync(path).size).assertEqual(396);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_3700
     * @tc.name      testDfmaFileIoVolume20037
     * @tc.desc      Verify volume2 file case 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_037.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(407);
          expect(fs.statSync(path).size).assertEqual(407);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_3800
     * @tc.name      testDfmaFileIoVolume20038
     * @tc.desc      Verify volume2 file case 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_038.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(418);
          expect(fs.statSync(path).size).assertEqual(418);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_VOLUME2_3900
     * @tc.name      testDfmaFileIoVolume20039
     * @tc.desc      Verify volume2 file case 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaFileIoVolume20039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/volume2_039.txt';
          writeFile(path, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path).length).assertEqual(429);
          expect(fs.statSync(path).size).assertEqual(429);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
