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
import { TestType, Size, Level } from '@ohos/hypium';

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { paceTurn } from '../Shared/TestPace';
import {
  appContext,
  pathExists,
  pathInFiles,
  removeDirQuietly,
  removeQuietly,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

const ERR_NO_SUCH_FILE: number = 13900002;
const ERR_FILE_EXISTS: number = 13900015;

function errorCodeOf(action: () => void): number {
  try {
    action();
  } catch (error) {
    const businessError: BusinessError = error as BusinessError;
    return businessError.code;
  }
  return -1;
}

function errorMessageOf(action: () => void): string {
  try {
    action();
  } catch (error) {
    const businessError: BusinessError = error as BusinessError;
    return businessError.message;
  }
  return '';
}

export default function fileErrorMatrixTest() {
  describe('fileErrorMatrixTest', () => {
    beforeAll(() => {
      console.info('fileErrorMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileErrorMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_FILE_0100
     * @tc.name      testFileError0001
     * @tc.desc      Verify stat on a missing path fails with the no-such-file error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const missing: string = pathInFiles(uniqueName('avs_err_stat', '.txt'));
      const code: number = errorCodeOf(() => {
        fileIo.statSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(pathExists(missing)).assertFalse();
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_FILE_0200
     * @tc.name      testFileError0002
     * @tc.desc      Verify unlink on a missing path fails with the no-such-file error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const missing: string = pathInFiles(uniqueName('avs_err_unlink', '.txt'));
      const code: number = errorCodeOf(() => {
        fileIo.unlinkSync(missing);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(pathExists(missing)).assertFalse();
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_FILE_0300
     * @tc.name      testFileError0003
     * @tc.desc      Verify opening a missing path for read fails with the no-such-file error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const missing: string = pathInFiles(uniqueName('avs_err_open', '.txt'));
      const code: number = errorCodeOf(() => {
        fileIo.openSync(missing, fileIo.OpenMode.READ_ONLY);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(pathExists(missing)).assertFalse();
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_FILE_0400
     * @tc.name      testFileError0004
     * @tc.desc      Verify creating an existing directory fails with the file-exists error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dir: string = `${appContext().filesDir}/${uniqueName('avs_err_mkdir', '')}`;
      try {
        fileIo.mkdirSync(dir);
        const code: number = errorCodeOf(() => {
          fileIo.mkdirSync(dir);
        });
        expect(code).assertEqual(ERR_FILE_EXISTS);
        expect(pathExists(dir)).assertTrue();
      } finally {
        removeDirQuietly(dir);
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_FILE_0500
     * @tc.name      testFileError0005
     * @tc.desc      Verify removing a missing directory fails with the no-such-file error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dir: string = `${appContext().filesDir}/${uniqueName('avs_err_rmdir', '')}`;
      const code: number = errorCodeOf(() => {
        fileIo.rmdirSync(dir);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(pathExists(dir)).assertFalse();
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_FILE_0600
     * @tc.name      testFileError0006
     * @tc.desc      Verify truncating a missing path fails with the no-such-file error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileError0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const missing: string = pathInFiles(uniqueName('avs_err_truncate', '.txt'));
      const code: number = errorCodeOf(() => {
        fileIo.truncateSync(missing, 1);
      });
      expect(code).assertEqual(ERR_NO_SUCH_FILE);
      expect(pathExists(missing)).assertFalse();
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_FILE_0700
     * @tc.name      testFileError0007
     * @tc.desc      Verify the no-such-file failure carries a non-empty diagnostic message
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileError0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const missing: string = pathInFiles(uniqueName('avs_err_message', '.txt'));
      const message: string = errorMessageOf(() => {
        fileIo.statSync(missing);
      });
      expect(message.length).assertLarger(0);
      expect(message.indexOf('No such file') >= 0 || message.toLowerCase().indexOf('not found') >= 0)
        .assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_FILE_0800
     * @tc.name      testFileError0008
     * @tc.desc      Verify access reports false for a missing path instead of throwing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileError0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const missing: string = pathInFiles(uniqueName('avs_err_access', '.txt'));
      let accessible: boolean = true;
      try {
        accessible = fileIo.accessSync(missing);
      } catch (error) {
        accessible = false;
      }
      expect(accessible).assertFalse();
      expect(pathExists(missing)).assertFalse();
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_FILE_0900
     * @tc.name      testFileError0009
     * @tc.desc      Verify a successful stat on an existing file reports a regular file with zero or more bytes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileError0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = pathInFiles(uniqueName('avs_err_existing', '.txt'));
      try {
        writeTextFile(path, 'existing');
        const stat: fileIo.Stat = fileIo.statSync(path);
        expect(stat.isFile()).assertTrue();
        expect(stat.isDirectory()).assertFalse();
        expect(stat.size).assertEqual(8);
        expect(pathExists(path)).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_FILE_1000
     * @tc.name      testFileError0010
     * @tc.desc      Verify the error code is stable across repeated missing-path stat attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileError0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const missing: string = pathInFiles(uniqueName('avs_err_stable', '.txt'));
      for (let i = 0; i < 5; i++) {
        const code: number = errorCodeOf(() => {
          fileIo.statSync(missing);
        });
        expect(code).assertEqual(ERR_NO_SUCH_FILE);
      }
    })
  });
}
