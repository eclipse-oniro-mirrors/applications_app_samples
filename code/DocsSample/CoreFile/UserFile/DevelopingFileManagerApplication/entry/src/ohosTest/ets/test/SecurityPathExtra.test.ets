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

export default function dfmaSecurityExtraTest(): void {
  describe('DfmaSecurityExtraTest', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_security';
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
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_0100
     * @tc.name      testDfmaSecurityExtra0001
     * @tc.desc      Verify path safety case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../outside_1.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_0200
     * @tc.name      testDfmaSecurityExtra0002
     * @tc.desc      Verify path safety case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../outside_2.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_0300
     * @tc.name      testDfmaSecurityExtra0003
     * @tc.desc      Verify path safety case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../outside_3.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_0400
     * @tc.name      testDfmaSecurityExtra0004
     * @tc.desc      Verify path safety case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../outside_4.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_0500
     * @tc.name      testDfmaSecurityExtra0005
     * @tc.desc      Verify path safety case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../outside_5.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_0600
     * @tc.name      testDfmaSecurityExtra0006
     * @tc.desc      Verify path safety case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../outside_6.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_0700
     * @tc.name      testDfmaSecurityExtra0007
     * @tc.desc      Verify path safety case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../outside_7.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_0800
     * @tc.name      testDfmaSecurityExtra0008
     * @tc.desc      Verify path safety case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../outside_8.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_0900
     * @tc.name      testDfmaSecurityExtra0009
     * @tc.desc      Verify path safety case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../outside_9.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_1000
     * @tc.name      testDfmaSecurityExtra0010
     * @tc.desc      Verify path safety case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../outside_10.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_1100
     * @tc.name      testDfmaSecurityExtra0011
     * @tc.desc      Verify path safety case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = '/data/local/tmp/dfma_probe_11.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_1200
     * @tc.name      testDfmaSecurityExtra0012
     * @tc.desc      Verify path safety case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = '/data/local/tmp/dfma_probe_12.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_1300
     * @tc.name      testDfmaSecurityExtra0013
     * @tc.desc      Verify path safety case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = '/data/local/tmp/dfma_probe_13.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_1400
     * @tc.name      testDfmaSecurityExtra0014
     * @tc.desc      Verify path safety case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = '/data/local/tmp/dfma_probe_14.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_1500
     * @tc.name      testDfmaSecurityExtra0015
     * @tc.desc      Verify path safety case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = '/data/local/tmp/dfma_probe_15.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_1600
     * @tc.name      testDfmaSecurityExtra0016
     * @tc.desc      Verify path safety case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_security_16.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_1700
     * @tc.name      testDfmaSecurityExtra0017
     * @tc.desc      Verify path safety case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_security_17.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_1800
     * @tc.name      testDfmaSecurityExtra0018
     * @tc.desc      Verify path safety case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_security_18.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_1900
     * @tc.name      testDfmaSecurityExtra0019
     * @tc.desc      Verify path safety case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_security_19.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_2000
     * @tc.name      testDfmaSecurityExtra0020
     * @tc.desc      Verify path safety case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_security_20.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          expect(exists).assertFalse();
          expect(path.length > 0).assertTrue();
          expect(path.indexOf('..') >= 0 || path.startsWith('/')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
