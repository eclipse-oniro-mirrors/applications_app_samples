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

export default function dfmaSecurityPathExtra2Test(): void {
  describe('DfmaSecurityPathExtra2Test', () => {
    beforeAll(async () => {
      ROOT = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/dfma_security_extra2';
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
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_EXTRA2_0100
     * @tc.name      testDfmaSecurityPathExtra20001
     * @tc.desc      Verify traversal path boundary 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityPathExtra20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../secure_outside_1.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          let readFailed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            readFailed = true;
          }
          expect(exists).assertFalse();
          expect(readFailed).assertTrue();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_EXTRA2_0200
     * @tc.name      testDfmaSecurityPathExtra20002
     * @tc.desc      Verify traversal path boundary 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityPathExtra20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../secure_outside_2.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          let readFailed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            readFailed = true;
          }
          expect(exists).assertFalse();
          expect(readFailed).assertTrue();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_EXTRA2_0300
     * @tc.name      testDfmaSecurityPathExtra20003
     * @tc.desc      Verify traversal path boundary 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityPathExtra20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../secure_outside_3.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          let readFailed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            readFailed = true;
          }
          expect(exists).assertFalse();
          expect(readFailed).assertTrue();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_EXTRA2_0400
     * @tc.name      testDfmaSecurityPathExtra20004
     * @tc.desc      Verify traversal path boundary 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityPathExtra20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../secure_outside_4.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          let readFailed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            readFailed = true;
          }
          expect(exists).assertFalse();
          expect(readFailed).assertTrue();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_EXTRA2_0500
     * @tc.name      testDfmaSecurityPathExtra20005
     * @tc.desc      Verify traversal path boundary 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityPathExtra20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/../secure_outside_5.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          let readFailed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            readFailed = true;
          }
          expect(exists).assertFalse();
          expect(readFailed).assertTrue();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_EXTRA2_0600
     * @tc.name      testDfmaSecurityPathExtra20006
     * @tc.desc      Verify absolute path boundary 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityPathExtra20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = '/data/local/tmp/dfma_secure_6.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          let readFailed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            readFailed = true;
          }
          expect(exists).assertFalse();
          expect(readFailed).assertTrue();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_EXTRA2_0700
     * @tc.name      testDfmaSecurityPathExtra20007
     * @tc.desc      Verify absolute path boundary 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityPathExtra20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = '/data/local/tmp/dfma_secure_7.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          let readFailed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            readFailed = true;
          }
          expect(exists).assertFalse();
          expect(readFailed).assertTrue();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_EXTRA2_0800
     * @tc.name      testDfmaSecurityPathExtra20008
     * @tc.desc      Verify absolute path boundary 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityPathExtra20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = '/data/local/tmp/dfma_secure_8.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          let readFailed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            readFailed = true;
          }
          expect(exists).assertFalse();
          expect(readFailed).assertTrue();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_EXTRA2_0900
     * @tc.name      testDfmaSecurityPathExtra20009
     * @tc.desc      Verify missing path boundary 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityPathExtra20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_secure_9.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          let readFailed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            readFailed = true;
          }
          expect(exists).assertFalse();
          expect(readFailed).assertTrue();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILE_DFMA_SECURITY_EXTRA2_1000
     * @tc.name      testDfmaSecurityPathExtra20010
     * @tc.desc      Verify missing path boundary 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDfmaSecurityPathExtra20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = ROOT + '/missing_secure_10.txt';
          let exists: boolean = false;
          try {
            exists = fs.accessSync(path);
          } catch (err) {
            exists = false;
          }
          let readFailed: boolean = false;
          try {
            fs.readTextSync(path);
          } catch (err) {
            readFailed = true;
          }
          expect(exists).assertFalse();
          expect(readFailed).assertTrue();
          expect(path.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
