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
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0061
     * @tc.name      testCacheError0061
     * @tc.desc      Stat of missing absent_0061.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0061.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0061', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0062
     * @tc.name      testCacheError0062
     * @tc.desc      Stat of missing absent_0062.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0062.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0062', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0063
     * @tc.name      testCacheError0063
     * @tc.desc      Stat of missing absent_0063.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0063.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0063', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0064
     * @tc.name      testCacheError0064
     * @tc.desc      Stat of missing absent_0064.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0064.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0064', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0065
     * @tc.name      testCacheError0065
     * @tc.desc      Stat of missing absent_0065.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0065.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0065', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0066
     * @tc.name      testCacheError0066
     * @tc.desc      Stat of missing absent_0066.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0066.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0066', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0067
     * @tc.name      testCacheError0067
     * @tc.desc      Stat of missing absent_0067.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0067.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0067', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0068
     * @tc.name      testCacheError0068
     * @tc.desc      Stat of missing absent_0068.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0068.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0068', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0069
     * @tc.name      testCacheError0069
     * @tc.desc      Stat of missing absent_0069.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0069.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0069', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0070
     * @tc.name      testCacheError0070
     * @tc.desc      Stat of missing absent_0070.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0070.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0070', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0071
     * @tc.name      testCacheError0071
     * @tc.desc      Stat of missing absent_0071.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0071.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0071', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0072
     * @tc.name      testCacheError0072
     * @tc.desc      Stat of missing absent_0072.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0072.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0072', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0073
     * @tc.name      testCacheError0073
     * @tc.desc      Stat of missing absent_0073.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0073.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0073', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0074
     * @tc.name      testCacheError0074
     * @tc.desc      Stat of missing absent_0074.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0074.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0074', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0075
     * @tc.name      testCacheError0075
     * @tc.desc      Stat of missing absent_0075.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0075.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0075', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0076
     * @tc.name      testCacheError0076
     * @tc.desc      Stat of missing absent_0076.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0076.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0076', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0077
     * @tc.name      testCacheError0077
     * @tc.desc      Stat of missing absent_0077.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0077.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0077', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0078
     * @tc.name      testCacheError0078
     * @tc.desc      Stat of missing absent_0078.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0078.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0078', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0079
     * @tc.name      testCacheError0079
     * @tc.desc      Stat of missing absent_0079.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0079.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0079', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0080
     * @tc.name      testCacheError0080
     * @tc.desc      Stat of missing absent_0080.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0080.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0080', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0081
     * @tc.name      testCacheError0081
     * @tc.desc      Stat of missing absent_0081.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0081.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0081', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0082
     * @tc.name      testCacheError0082
     * @tc.desc      Stat of missing absent_0082.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0082.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0082', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0083
     * @tc.name      testCacheError0083
     * @tc.desc      Stat of missing absent_0083.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0083.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0083', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0084
     * @tc.name      testCacheError0084
     * @tc.desc      Stat of missing absent_0084.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0084.tmp');
      const code: number = errorCode(() => {
        fs.statSync(path);
      });
      logCase('testCacheError0084', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0085
     * @tc.name      testCacheError0085
     * @tc.desc      Unlink of missing absent_0085.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0085.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0085', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0086
     * @tc.name      testCacheError0086
     * @tc.desc      Unlink of missing absent_0086.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0086.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0086', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0087
     * @tc.name      testCacheError0087
     * @tc.desc      Unlink of missing absent_0087.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0087.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0087', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0088
     * @tc.name      testCacheError0088
     * @tc.desc      Unlink of missing absent_0088.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0088.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0088', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0089
     * @tc.name      testCacheError0089
     * @tc.desc      Unlink of missing absent_0089.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0089.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0089', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0090
     * @tc.name      testCacheError0090
     * @tc.desc      Unlink of missing absent_0090.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheError0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const path: string = testPath('absent_0090.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0090', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0091
     * @tc.name      testCacheError0091
     * @tc.desc      Unlink of missing absent_0091.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0091.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0091', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0092
     * @tc.name      testCacheError0092
     * @tc.desc      Unlink of missing absent_0092.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0092.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0092', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0093
     * @tc.name      testCacheError0093
     * @tc.desc      Unlink of missing absent_0093.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0093.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0093', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0094
     * @tc.name      testCacheError0094
     * @tc.desc      Unlink of missing absent_0094.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0094.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0094', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0095
     * @tc.name      testCacheError0095
     * @tc.desc      Unlink of missing absent_0095.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0095.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0095', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0096
     * @tc.name      testCacheError0096
     * @tc.desc      Unlink of missing absent_0096.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0096.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0096', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0097
     * @tc.name      testCacheError0097
     * @tc.desc      Unlink of missing absent_0097.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0097.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0097', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0098
     * @tc.name      testCacheError0098
     * @tc.desc      Unlink of missing absent_0098.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0098.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0098', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0099
     * @tc.name      testCacheError0099
     * @tc.desc      Unlink of missing absent_0099.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0099.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0099', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0100
     * @tc.name      testCacheError0100
     * @tc.desc      Unlink of missing absent_0100.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0100.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0100', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0101
     * @tc.name      testCacheError0101
     * @tc.desc      Unlink of missing absent_0101.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0101.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0101', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0102
     * @tc.name      testCacheError0102
     * @tc.desc      Unlink of missing absent_0102.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0102.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0102', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0103
     * @tc.name      testCacheError0103
     * @tc.desc      Unlink of missing absent_0103.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0103.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0103', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0104
     * @tc.name      testCacheError0104
     * @tc.desc      Unlink of missing absent_0104.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0104.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0104', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0105
     * @tc.name      testCacheError0105
     * @tc.desc      Unlink of missing absent_0105.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0105.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0105', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0106
     * @tc.name      testCacheError0106
     * @tc.desc      Unlink of missing absent_0106.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0106.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0106', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0107
     * @tc.name      testCacheError0107
     * @tc.desc      Unlink of missing absent_0107.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0107.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0107', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0108
     * @tc.name      testCacheError0108
     * @tc.desc      Unlink of missing absent_0108.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0108.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0108', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0109
     * @tc.name      testCacheError0109
     * @tc.desc      Unlink of missing absent_0109.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0109.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0109', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0110
     * @tc.name      testCacheError0110
     * @tc.desc      Unlink of missing absent_0110.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0110.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0110', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0111
     * @tc.name      testCacheError0111
     * @tc.desc      Unlink of missing absent_0111.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0111.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0111', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0112
     * @tc.name      testCacheError0112
     * @tc.desc      Unlink of missing absent_0112.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0112.tmp');
      const code: number = errorCode(() => {
        fs.unlinkSync(path);
      });
      logCase('testCacheError0112', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0113
     * @tc.name      testCacheError0113
     * @tc.desc      Copy into missing folder for absent_0113.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0113.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0113', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0114
     * @tc.name      testCacheError0114
     * @tc.desc      Copy into missing folder for absent_0114.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0114.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0114', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0115
     * @tc.name      testCacheError0115
     * @tc.desc      Copy into missing folder for absent_0115.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0115.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0115', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0116
     * @tc.name      testCacheError0116
     * @tc.desc      Copy into missing folder for absent_0116.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0116.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0116', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0117
     * @tc.name      testCacheError0117
     * @tc.desc      Copy into missing folder for absent_0117.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0117.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0117', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0118
     * @tc.name      testCacheError0118
     * @tc.desc      Copy into missing folder for absent_0118.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0118.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0118', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0119
     * @tc.name      testCacheError0119
     * @tc.desc      Copy into missing folder for absent_0119.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0119.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0119', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0120
     * @tc.name      testCacheError0120
     * @tc.desc      Copy into missing folder for absent_0120.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0120.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0120', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0121
     * @tc.name      testCacheError0121
     * @tc.desc      Copy into missing folder for absent_0121.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0121.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0121', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0122
     * @tc.name      testCacheError0122
     * @tc.desc      Copy into missing folder for absent_0122.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0122.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0122', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0123
     * @tc.name      testCacheError0123
     * @tc.desc      Copy into missing folder for absent_0123.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0123.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0123', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0124
     * @tc.name      testCacheError0124
     * @tc.desc      Copy into missing folder for absent_0124.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0124.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0124', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0125
     * @tc.name      testCacheError0125
     * @tc.desc      Copy into missing folder for absent_0125.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0125.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0125', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0126
     * @tc.name      testCacheError0126
     * @tc.desc      Copy into missing folder for absent_0126.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0126.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0126', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0127
     * @tc.name      testCacheError0127
     * @tc.desc      Copy into missing folder for absent_0127.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0127.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0127', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0128
     * @tc.name      testCacheError0128
     * @tc.desc      Copy into missing folder for absent_0128.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0128.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0128', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0129
     * @tc.name      testCacheError0129
     * @tc.desc      Copy into missing folder for absent_0129.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0129.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0129', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0130
     * @tc.name      testCacheError0130
     * @tc.desc      Copy into missing folder for absent_0130.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0130.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0130', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0131
     * @tc.name      testCacheError0131
     * @tc.desc      Copy into missing folder for absent_0131.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0131.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0131', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0132
     * @tc.name      testCacheError0132
     * @tc.desc      Copy into missing folder for absent_0132.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0132.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0132', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0133
     * @tc.name      testCacheError0133
     * @tc.desc      Copy into missing folder for absent_0133.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0133.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0133', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0134
     * @tc.name      testCacheError0134
     * @tc.desc      Copy into missing folder for absent_0134.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0134.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0134', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0135
     * @tc.name      testCacheError0135
     * @tc.desc      Copy into missing folder for absent_0135.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0135.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0135', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0136
     * @tc.name      testCacheError0136
     * @tc.desc      Copy into missing folder for absent_0136.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0136.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0136', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0137
     * @tc.name      testCacheError0137
     * @tc.desc      Copy into missing folder for absent_0137.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0137.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0137', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0138
     * @tc.name      testCacheError0138
     * @tc.desc      Copy into missing folder for absent_0138.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0138.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0138', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0139
     * @tc.name      testCacheError0139
     * @tc.desc      Copy into missing folder for absent_0139.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0139.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0139', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0140
     * @tc.name      testCacheError0140
     * @tc.desc      Copy into missing folder for absent_0140.tmp reports an error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0140.tmp');
      const code: number = errorCode(() => {
        fs.copyFileSync(path, path + '.bak');
      });
      logCase('testCacheError0140', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0141
     * @tc.name      testCacheError0141
     * @tc.desc      Rename of missing absent_0141.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0141.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0141', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0142
     * @tc.name      testCacheError0142
     * @tc.desc      Rename of missing absent_0142.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0142.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0142', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0143
     * @tc.name      testCacheError0143
     * @tc.desc      Rename of missing absent_0143.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0143.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0143', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0144
     * @tc.name      testCacheError0144
     * @tc.desc      Rename of missing absent_0144.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0144.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0144', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0145
     * @tc.name      testCacheError0145
     * @tc.desc      Rename of missing absent_0145.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0145.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0145', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0146
     * @tc.name      testCacheError0146
     * @tc.desc      Rename of missing absent_0146.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0146.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0146', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0147
     * @tc.name      testCacheError0147
     * @tc.desc      Rename of missing absent_0147.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0147.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0147', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0148
     * @tc.name      testCacheError0148
     * @tc.desc      Rename of missing absent_0148.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0148.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0148', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0149
     * @tc.name      testCacheError0149
     * @tc.desc      Rename of missing absent_0149.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0149.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0149', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0150
     * @tc.name      testCacheError0150
     * @tc.desc      Rename of missing absent_0150.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0150.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0150', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0151
     * @tc.name      testCacheError0151
     * @tc.desc      Rename of missing absent_0151.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0151.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0151', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0152
     * @tc.name      testCacheError0152
     * @tc.desc      Rename of missing absent_0152.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0152.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0152', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0153
     * @tc.name      testCacheError0153
     * @tc.desc      Rename of missing absent_0153.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0153.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0153', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0154
     * @tc.name      testCacheError0154
     * @tc.desc      Rename of missing absent_0154.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0154.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0154', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0155
     * @tc.name      testCacheError0155
     * @tc.desc      Rename of missing absent_0155.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0155.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0155', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0156
     * @tc.name      testCacheError0156
     * @tc.desc      Rename of missing absent_0156.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0156.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0156', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0157
     * @tc.name      testCacheError0157
     * @tc.desc      Rename of missing absent_0157.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0157.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0157', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0158
     * @tc.name      testCacheError0158
     * @tc.desc      Rename of missing absent_0158.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0158.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0158', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0159
     * @tc.name      testCacheError0159
     * @tc.desc      Rename of missing absent_0159.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0159.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0159', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0160
     * @tc.name      testCacheError0160
     * @tc.desc      Rename of missing absent_0160.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0160.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0160', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0161
     * @tc.name      testCacheError0161
     * @tc.desc      Rename of missing absent_0161.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0161.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0161', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0162
     * @tc.name      testCacheError0162
     * @tc.desc      Rename of missing absent_0162.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0162.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0162', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0163
     * @tc.name      testCacheError0163
     * @tc.desc      Rename of missing absent_0163.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0163.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0163', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0164
     * @tc.name      testCacheError0164
     * @tc.desc      Rename of missing absent_0164.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0164.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0164', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0165
     * @tc.name      testCacheError0165
     * @tc.desc      Rename of missing absent_0165.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0165.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0165', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0166
     * @tc.name      testCacheError0166
     * @tc.desc      Rename of missing absent_0166.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0166.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0166', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0167
     * @tc.name      testCacheError0167
     * @tc.desc      Rename of missing absent_0167.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0167.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0167', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0168
     * @tc.name      testCacheError0168
     * @tc.desc      Rename of missing absent_0168.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0168.tmp');
      const code: number = errorCode(() => {
        fs.renameSync(path, path + '.new');
      });
      logCase('testCacheError0168', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0169
     * @tc.name      testCacheError0169
     * @tc.desc      Remove missing folder for absent_0169.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0169.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0169'));
      });
      logCase('testCacheError0169', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0170
     * @tc.name      testCacheError0170
     * @tc.desc      Remove missing folder for absent_0170.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0170.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0170'));
      });
      logCase('testCacheError0170', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0171
     * @tc.name      testCacheError0171
     * @tc.desc      Remove missing folder for absent_0171.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0171.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0171'));
      });
      logCase('testCacheError0171', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0172
     * @tc.name      testCacheError0172
     * @tc.desc      Remove missing folder for absent_0172.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0172.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0172'));
      });
      logCase('testCacheError0172', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0173
     * @tc.name      testCacheError0173
     * @tc.desc      Remove missing folder for absent_0173.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0173.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0173'));
      });
      logCase('testCacheError0173', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0174
     * @tc.name      testCacheError0174
     * @tc.desc      Remove missing folder for absent_0174.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0174.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0174'));
      });
      logCase('testCacheError0174', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0175
     * @tc.name      testCacheError0175
     * @tc.desc      Remove missing folder for absent_0175.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0175.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0175'));
      });
      logCase('testCacheError0175', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0176
     * @tc.name      testCacheError0176
     * @tc.desc      Remove missing folder for absent_0176.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0176.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0176'));
      });
      logCase('testCacheError0176', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0177
     * @tc.name      testCacheError0177
     * @tc.desc      Remove missing folder for absent_0177.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0177.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0177'));
      });
      logCase('testCacheError0177', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0178
     * @tc.name      testCacheError0178
     * @tc.desc      Remove missing folder for absent_0178.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0178.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0178'));
      });
      logCase('testCacheError0178', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0179
     * @tc.name      testCacheError0179
     * @tc.desc      Remove missing folder for absent_0179.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0179.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0179'));
      });
      logCase('testCacheError0179', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0180
     * @tc.name      testCacheError0180
     * @tc.desc      Remove missing folder for absent_0180.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0180.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0180'));
      });
      logCase('testCacheError0180', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0181
     * @tc.name      testCacheError0181
     * @tc.desc      Remove missing folder for absent_0181.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0181.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0181'));
      });
      logCase('testCacheError0181', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0182
     * @tc.name      testCacheError0182
     * @tc.desc      Remove missing folder for absent_0182.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0182.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0182'));
      });
      logCase('testCacheError0182', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0183
     * @tc.name      testCacheError0183
     * @tc.desc      Remove missing folder for absent_0183.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0183.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0183'));
      });
      logCase('testCacheError0183', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0184
     * @tc.name      testCacheError0184
     * @tc.desc      Remove missing folder for absent_0184.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0184.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0184'));
      });
      logCase('testCacheError0184', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0185
     * @tc.name      testCacheError0185
     * @tc.desc      Remove missing folder for absent_0185.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0185.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0185'));
      });
      logCase('testCacheError0185', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0186
     * @tc.name      testCacheError0186
     * @tc.desc      Remove missing folder for absent_0186.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0186.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0186'));
      });
      logCase('testCacheError0186', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0187
     * @tc.name      testCacheError0187
     * @tc.desc      Remove missing folder for absent_0187.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0187.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0187'));
      });
      logCase('testCacheError0187', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0188
     * @tc.name      testCacheError0188
     * @tc.desc      Remove missing folder for absent_0188.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0188.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0188'));
      });
      logCase('testCacheError0188', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0189
     * @tc.name      testCacheError0189
     * @tc.desc      Remove missing folder for absent_0189.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0189.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0189'));
      });
      logCase('testCacheError0189', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0190
     * @tc.name      testCacheError0190
     * @tc.desc      Remove missing folder for absent_0190.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0190.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0190'));
      });
      logCase('testCacheError0190', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0191
     * @tc.name      testCacheError0191
     * @tc.desc      Remove missing folder for absent_0191.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0191.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0191'));
      });
      logCase('testCacheError0191', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0192
     * @tc.name      testCacheError0192
     * @tc.desc      Remove missing folder for absent_0192.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0192.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0192'));
      });
      logCase('testCacheError0192', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0193
     * @tc.name      testCacheError0193
     * @tc.desc      Remove missing folder for absent_0193.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0193.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0193'));
      });
      logCase('testCacheError0193', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0194
     * @tc.name      testCacheError0194
     * @tc.desc      Remove missing folder for absent_0194.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0194.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0194'));
      });
      logCase('testCacheError0194', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0195
     * @tc.name      testCacheError0195
     * @tc.desc      Remove missing folder for absent_0195.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0195.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0195'));
      });
      logCase('testCacheError0195', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0196
     * @tc.name      testCacheError0196
     * @tc.desc      Remove missing folder for absent_0196.tmp reports a non-zero error code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0196.tmp');
      const code: number = errorCode(() => {
        fs.rmdirSync(dirPath('no_dir_0196'));
      });
      logCase('testCacheError0196', `path=${path} code=${code}`);
      expect(code !== 0).assertTrue();
      if (code !== 0) {
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
      expect(fs.accessSync(path)).assertFalse();
      expect(path.length).assertEqual(appContext().filesDir.length + 1 + 15);
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0197
     * @tc.name      testCacheError0197
     * @tc.desc      Access check on missing absent_0197.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0197.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0197', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0197.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0198
     * @tc.name      testCacheError0198
     * @tc.desc      Access check on missing absent_0198.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0198.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0198', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0198.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0199
     * @tc.name      testCacheError0199
     * @tc.desc      Access check on missing absent_0199.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0199.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0199', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0199.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0200
     * @tc.name      testCacheError0200
     * @tc.desc      Access check on missing absent_0200.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0200.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0200', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0200.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0201
     * @tc.name      testCacheError0201
     * @tc.desc      Access check on missing absent_0201.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0201.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0201', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0201.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0202
     * @tc.name      testCacheError0202
     * @tc.desc      Access check on missing absent_0202.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0202.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0202', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0202.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0203
     * @tc.name      testCacheError0203
     * @tc.desc      Access check on missing absent_0203.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0203.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0203', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0203.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0204
     * @tc.name      testCacheError0204
     * @tc.desc      Access check on missing absent_0204.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0204.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0204', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0204.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0205
     * @tc.name      testCacheError0205
     * @tc.desc      Access check on missing absent_0205.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0205.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0205', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0205.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0206
     * @tc.name      testCacheError0206
     * @tc.desc      Access check on missing absent_0206.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0206.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0206', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0206.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0207
     * @tc.name      testCacheError0207
     * @tc.desc      Access check on missing absent_0207.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0207.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0207', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0207.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0208
     * @tc.name      testCacheError0208
     * @tc.desc      Access check on missing absent_0208.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0208.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0208', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0208.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0209
     * @tc.name      testCacheError0209
     * @tc.desc      Access check on missing absent_0209.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0209.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0209', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0209.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0210
     * @tc.name      testCacheError0210
     * @tc.desc      Access check on missing absent_0210.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCacheError0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = testPath('absent_0210.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0210', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0210.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0211
     * @tc.name      testCacheError0211
     * @tc.desc      Access check on missing absent_0211.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCacheError0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const path: string = testPath('absent_0211.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0211', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0211.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0212
     * @tc.name      testCacheError0212
     * @tc.desc      Access check on missing absent_0212.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCacheError0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const path: string = testPath('absent_0212.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0212', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0212.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0213
     * @tc.name      testCacheError0213
     * @tc.desc      Access check on missing absent_0213.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCacheError0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const path: string = testPath('absent_0213.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0213', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0213.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0214
     * @tc.name      testCacheError0214
     * @tc.desc      Access check on missing absent_0214.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCacheError0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const path: string = testPath('absent_0214.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0214', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0214.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0215
     * @tc.name      testCacheError0215
     * @tc.desc      Access check on missing absent_0215.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCacheError0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const path: string = testPath('absent_0215.tmp');
      let code: number = 0;
      try {
        fs.accessSync(path);
      } catch (error) {
        code = -1;
      }
      logCase('testCacheError0215', `path=${path} code=${code}`);
      expect(fs.accessSync(path)).assertFalse();
      expect(path.endsWith('absent_0215.tmp')).assertTrue();
      expect(path.startsWith(appContext().filesDir)).assertTrue();
      expect(code).assertEqual(0);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEERR_0216
     * @tc.name      testCacheError0216
     * @tc.desc      Access check on missing absent_0216.tmp returns false without throwing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
