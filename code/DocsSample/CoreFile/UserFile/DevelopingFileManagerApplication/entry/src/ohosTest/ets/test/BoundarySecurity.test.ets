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

export default function dfmaBoundaryTest(): void {
  describe('DfmaBoundaryTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_boundary';
      if (!fs.accessSync(ROOT)) {
        fs.mkdirSync(ROOT);
      }
    });
    afterAll(async () => {
      try {
        fs.rmdirSync(ROOT);
      } catch (err) {
      }
    });
    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_0100
     * @tc.name      testDfmaBoundary0001
     * @tc.desc      Verify path boundary case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/space name.txt';
          writeFile(path, 'boundary_1');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_1');
          expect(fs.statSync(path).size).assertEqual('boundary_1'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_0200
     * @tc.name      testDfmaBoundary0002
     * @tc.desc      Verify path boundary case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/中文文件.txt';
          writeFile(path, 'boundary_2');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_2');
          expect(fs.statSync(path).size).assertEqual('boundary_2'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_0300
     * @tc.name      testDfmaBoundary0003
     * @tc.desc      Verify path boundary case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/emoji⏰.txt';
          writeFile(path, 'boundary_3');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_3');
          expect(fs.statSync(path).size).assertEqual('boundary_3'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_0400
     * @tc.name      testDfmaBoundary0004
     * @tc.desc      Verify path boundary case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/special<>.txt';
          writeFile(path, 'boundary_4');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_4');
          expect(fs.statSync(path).size).assertEqual('boundary_4'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_0500
     * @tc.name      testDfmaBoundary0005
     * @tc.desc      Verify path boundary case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/quote.txt';
          writeFile(path, 'boundary_5');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_5');
          expect(fs.statSync(path).size).assertEqual('boundary_5'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_0600
     * @tc.name      testDfmaBoundary0006
     * @tc.desc      Verify path boundary case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/dot.name.txt';
          writeFile(path, 'boundary_6');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_6');
          expect(fs.statSync(path).size).assertEqual('boundary_6'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_0700
     * @tc.name      testDfmaBoundary0007
     * @tc.desc      Verify path boundary case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/dash-name.txt';
          writeFile(path, 'boundary_7');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_7');
          expect(fs.statSync(path).size).assertEqual('boundary_7'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_0800
     * @tc.name      testDfmaBoundary0008
     * @tc.desc      Verify path boundary case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/under_score.txt';
          writeFile(path, 'boundary_8');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_8');
          expect(fs.statSync(path).size).assertEqual('boundary_8'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_0900
     * @tc.name      testDfmaBoundary0009
     * @tc.desc      Verify path boundary case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/plus+name.txt';
          writeFile(path, 'boundary_9');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_9');
          expect(fs.statSync(path).size).assertEqual('boundary_9'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_1000
     * @tc.name      testDfmaBoundary0010
     * @tc.desc      Verify path boundary case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/percent%name.txt';
          writeFile(path, 'boundary_10');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_10');
          expect(fs.statSync(path).size).assertEqual('boundary_10'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_1100
     * @tc.name      testDfmaBoundary0011
     * @tc.desc      Verify path boundary case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.txt';
          writeFile(path, 'boundary_11');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_11');
          expect(fs.statSync(path).size).assertEqual('boundary_11'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_1200
     * @tc.name      testDfmaBoundary0012
     * @tc.desc      Verify path boundary case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb.txt';
          writeFile(path, 'boundary_12');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_12');
          expect(fs.statSync(path).size).assertEqual('boundary_12'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_1300
     * @tc.name      testDfmaBoundary0013
     * @tc.desc      Verify path boundary case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/case.UPPER.txt';
          writeFile(path, 'boundary_13');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_13');
          expect(fs.statSync(path).size).assertEqual('boundary_13'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_1400
     * @tc.name      testDfmaBoundary0014
     * @tc.desc      Verify path boundary case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/UPPER.TXT';
          writeFile(path, 'boundary_14');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_14');
          expect(fs.statSync(path).size).assertEqual('boundary_14'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_1500
     * @tc.name      testDfmaBoundary0015
     * @tc.desc      Verify path boundary case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/mixed.Case.txt';
          writeFile(path, 'boundary_15');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_15');
          expect(fs.statSync(path).size).assertEqual('boundary_15'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_1600
     * @tc.name      testDfmaBoundary0016
     * @tc.desc      Verify path boundary case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          fs.mkdirSync(ROOT + '/nested name');
          const path: string = ROOT + '/nested name/child.txt';
          writeFile(path, 'boundary_16');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_16');
          expect(fs.statSync(path).size).assertEqual('boundary_16'.length);
          fs.unlinkSync(path); fs.rmdirSync(ROOT + '/nested name');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_1700
     * @tc.name      testDfmaBoundary0017
     * @tc.desc      Verify path boundary case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/name,comma.txt';
          writeFile(path, 'boundary_17');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_17');
          expect(fs.statSync(path).size).assertEqual('boundary_17'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_1800
     * @tc.name      testDfmaBoundary0018
     * @tc.desc      Verify path boundary case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/name;colon.txt';
          writeFile(path, 'boundary_18');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_18');
          expect(fs.statSync(path).size).assertEqual('boundary_18'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_1900
     * @tc.name      testDfmaBoundary0019
     * @tc.desc      Verify path boundary case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/name=equal.txt';
          writeFile(path, 'boundary_19');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_19');
          expect(fs.statSync(path).size).assertEqual('boundary_19'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_2000
     * @tc.name      testDfmaBoundary0020
     * @tc.desc      Verify path boundary case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          
          const path: string = ROOT + '/name~tilde.txt';
          writeFile(path, 'boundary_20');
          expect(fs.accessSync(path)).assertTrue();
          expect(fs.readTextSync(path)).assertEqual('boundary_20');
          expect(fs.statSync(path).size).assertEqual('boundary_20'.length);
          fs.unlinkSync(path);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_2100
     * @tc.name      testDfmaBoundary0021
     * @tc.desc      Verify missing/invalid path case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_1.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_2200
     * @tc.name      testDfmaBoundary0022
     * @tc.desc      Verify missing/invalid path case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_2.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_2300
     * @tc.name      testDfmaBoundary0023
     * @tc.desc      Verify missing/invalid path case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_3.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_2400
     * @tc.name      testDfmaBoundary0024
     * @tc.desc      Verify missing/invalid path case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_4.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_2500
     * @tc.name      testDfmaBoundary0025
     * @tc.desc      Verify missing/invalid path case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_5.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_2600
     * @tc.name      testDfmaBoundary0026
     * @tc.desc      Verify missing/invalid path case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_6.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_2700
     * @tc.name      testDfmaBoundary0027
     * @tc.desc      Verify missing/invalid path case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_7.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_2800
     * @tc.name      testDfmaBoundary0028
     * @tc.desc      Verify missing/invalid path case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_8.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_2900
     * @tc.name      testDfmaBoundary0029
     * @tc.desc      Verify missing/invalid path case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_9.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_3000
     * @tc.name      testDfmaBoundary0030
     * @tc.desc      Verify missing/invalid path case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_10.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_3100
     * @tc.name      testDfmaBoundary0031
     * @tc.desc      Verify missing/invalid path case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_11.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_3200
     * @tc.name      testDfmaBoundary0032
     * @tc.desc      Verify missing/invalid path case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_12.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_3300
     * @tc.name      testDfmaBoundary0033
     * @tc.desc      Verify missing/invalid path case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_13.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_3400
     * @tc.name      testDfmaBoundary0034
     * @tc.desc      Verify missing/invalid path case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_14.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_3500
     * @tc.name      testDfmaBoundary0035
     * @tc.desc      Verify missing/invalid path case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_15.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_3600
     * @tc.name      testDfmaBoundary0036
     * @tc.desc      Verify missing/invalid path case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_16.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_3700
     * @tc.name      testDfmaBoundary0037
     * @tc.desc      Verify missing/invalid path case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_17.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_3800
     * @tc.name      testDfmaBoundary0038
     * @tc.desc      Verify missing/invalid path case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_18.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_3900
     * @tc.name      testDfmaBoundary0039
     * @tc.desc      Verify missing/invalid path case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_19.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_BOUNDARY_4000
     * @tc.name      testDfmaBoundary0040
     * @tc.desc      Verify missing/invalid path case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaBoundary0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_20.txt';
          let failed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(fs.accessSync(path)).assertFalse();
          expect(path.length >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
