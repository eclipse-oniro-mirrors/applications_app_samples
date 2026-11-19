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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { fileIo as fs } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { ERR_NO_SUCH_FILE, appContext, dirPath, errorCode, testPath } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function fileCacheErrorMatrixTest() {
  describe('FileCacheErrorMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0001
     * @tc.name      testCacheError0001
     * @tc.desc      Opening missing absent_0001.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0001.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0001', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0002
     * @tc.name      testCacheError0002
     * @tc.desc      Opening missing absent_0002.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0002.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0002', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0003
     * @tc.name      testCacheError0003
     * @tc.desc      Opening missing absent_0003.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0003.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0003', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0004
     * @tc.name      testCacheError0004
     * @tc.desc      Opening missing absent_0004.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0004.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0004', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0005
     * @tc.name      testCacheError0005
     * @tc.desc      Opening missing absent_0005.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0005.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0005', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0006
     * @tc.name      testCacheError0006
     * @tc.desc      Opening missing absent_0006.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0006.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0006', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0007
     * @tc.name      testCacheError0007
     * @tc.desc      Opening missing absent_0007.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0007.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0007', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0008
     * @tc.name      testCacheError0008
     * @tc.desc      Opening missing absent_0008.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0008.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0008', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0009
     * @tc.name      testCacheError0009
     * @tc.desc      Opening missing absent_0009.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0009.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0009', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0010
     * @tc.name      testCacheError0010
     * @tc.desc      Opening missing absent_0010.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0010.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0010', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0011
     * @tc.name      testCacheError0011
     * @tc.desc      Opening missing absent_0011.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0011.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0011', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0012
     * @tc.name      testCacheError0012
     * @tc.desc      Opening missing absent_0012.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0012.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0012', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0013
     * @tc.name      testCacheError0013
     * @tc.desc      Opening missing absent_0013.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0013.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0013', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0014
     * @tc.name      testCacheError0014
     * @tc.desc      Opening missing absent_0014.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0014.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0014', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0015
     * @tc.name      testCacheError0015
     * @tc.desc      Opening missing absent_0015.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0015.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0015', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0016
     * @tc.name      testCacheError0016
     * @tc.desc      Opening missing absent_0016.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0016.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0016', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0017
     * @tc.name      testCacheError0017
     * @tc.desc      Opening missing absent_0017.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0017.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0017', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0018
     * @tc.name      testCacheError0018
     * @tc.desc      Opening missing absent_0018.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0018.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0018', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0019
     * @tc.name      testCacheError0019
     * @tc.desc      Opening missing absent_0019.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0019.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0019', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0020
     * @tc.name      testCacheError0020
     * @tc.desc      Opening missing absent_0020.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0020.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0020', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0021
     * @tc.name      testCacheError0021
     * @tc.desc      Opening missing absent_0021.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0021.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0021', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0022
     * @tc.name      testCacheError0022
     * @tc.desc      Opening missing absent_0022.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0022.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0022', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0023
     * @tc.name      testCacheError0023
     * @tc.desc      Opening missing absent_0023.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0023.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0023', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0024
     * @tc.name      testCacheError0024
     * @tc.desc      Opening missing absent_0024.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0024.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0024', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0025
     * @tc.name      testCacheError0025
     * @tc.desc      Opening missing absent_0025.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0025.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0025', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0026
     * @tc.name      testCacheError0026
     * @tc.desc      Opening missing absent_0026.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0026.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0026', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0027
     * @tc.name      testCacheError0027
     * @tc.desc      Opening missing absent_0027.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0027.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0027', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0028
     * @tc.name      testCacheError0028
     * @tc.desc      Opening missing absent_0028.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0028.tmp');
      const code: number = errorCode(() => {
        const file: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
        fs.closeSync(file);
      });
      logCase('testCacheError0028', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0029
     * @tc.name      testCacheError0029
     * @tc.desc      Reading missing absent_0029.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0029.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0029', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0030
     * @tc.name      testCacheError0030
     * @tc.desc      Reading missing absent_0030.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0030.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0030', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0031
     * @tc.name      testCacheError0031
     * @tc.desc      Reading missing absent_0031.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0031.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0031', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0032
     * @tc.name      testCacheError0032
     * @tc.desc      Reading missing absent_0032.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0032.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0032', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0033
     * @tc.name      testCacheError0033
     * @tc.desc      Reading missing absent_0033.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0033.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0033', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0034
     * @tc.name      testCacheError0034
     * @tc.desc      Reading missing absent_0034.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0034.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0034', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0035
     * @tc.name      testCacheError0035
     * @tc.desc      Reading missing absent_0035.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0035.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0035', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0036
     * @tc.name      testCacheError0036
     * @tc.desc      Reading missing absent_0036.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0036.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0036', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0037
     * @tc.name      testCacheError0037
     * @tc.desc      Reading missing absent_0037.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0037.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0037', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0038
     * @tc.name      testCacheError0038
     * @tc.desc      Reading missing absent_0038.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0038.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0038', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0039
     * @tc.name      testCacheError0039
     * @tc.desc      Reading missing absent_0039.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0039.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0039', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0040
     * @tc.name      testCacheError0040
     * @tc.desc      Reading missing absent_0040.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0040.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0040', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0041
     * @tc.name      testCacheError0041
     * @tc.desc      Reading missing absent_0041.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0041.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0041', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0042
     * @tc.name      testCacheError0042
     * @tc.desc      Reading missing absent_0042.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0042.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0042', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0043
     * @tc.name      testCacheError0043
     * @tc.desc      Reading missing absent_0043.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0043.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0043', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0044
     * @tc.name      testCacheError0044
     * @tc.desc      Reading missing absent_0044.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0044.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0044', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0045
     * @tc.name      testCacheError0045
     * @tc.desc      Reading missing absent_0045.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0045.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0045', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0046
     * @tc.name      testCacheError0046
     * @tc.desc      Reading missing absent_0046.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0046.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0046', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0047
     * @tc.name      testCacheError0047
     * @tc.desc      Reading missing absent_0047.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0047.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0047', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0048
     * @tc.name      testCacheError0048
     * @tc.desc      Reading missing absent_0048.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0048.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0048', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0049
     * @tc.name      testCacheError0049
     * @tc.desc      Reading missing absent_0049.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0049.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0049', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0050
     * @tc.name      testCacheError0050
     * @tc.desc      Reading missing absent_0050.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0050.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0050', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0051
     * @tc.name      testCacheError0051
     * @tc.desc      Reading missing absent_0051.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0051.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0051', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0052
     * @tc.name      testCacheError0052
     * @tc.desc      Reading missing absent_0052.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0052.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0052', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0053
     * @tc.name      testCacheError0053
     * @tc.desc      Reading missing absent_0053.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0053.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0053', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0054
     * @tc.name      testCacheError0054
     * @tc.desc      Reading missing absent_0054.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0054.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0054', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0055
     * @tc.name      testCacheError0055
     * @tc.desc      Reading missing absent_0055.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0055.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0055', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0056
     * @tc.name      testCacheError0056
     * @tc.desc      Reading missing absent_0056.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0056.tmp');
      const code: number = errorCode(() => {
        fs.readTextSync(path);
      });
      logCase('testCacheError0056', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0057
     * @tc.name      testCacheError0057
     * @tc.desc      Stat of missing absent_0057.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0057.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0057', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0058
     * @tc.name      testCacheError0058
     * @tc.desc      Stat of missing absent_0058.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0058.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0058', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0059
     * @tc.name      testCacheError0059
     * @tc.desc      Stat of missing absent_0059.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0059.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0059', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0060
     * @tc.name      testCacheError0060
     * @tc.desc      Stat of missing absent_0060.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0060.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0060', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
