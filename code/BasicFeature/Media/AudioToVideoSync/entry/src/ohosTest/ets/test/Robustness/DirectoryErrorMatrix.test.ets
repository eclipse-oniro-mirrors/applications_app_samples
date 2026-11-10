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

function directoryFor(label: string): string {
  return `${appContext().filesDir}/${uniqueName(`avs_derr_${label}`, '')}`;
}

function codeOf(action: () => void): number {
  try {
    action();
  } catch (error) {
    return (error as BusinessError).code;
  }
  return -1;
}

function threw(action: () => void): boolean {
  try {
    action();
    return false;
  } catch (error) {
    return true;
  }
}

export default function directoryErrorMatrixTest() {
  describe('directoryErrorMatrixTest', () => {
    beforeAll(() => {
      console.info('directoryErrorMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('directoryErrorMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_DIR_0100
     * @tc.name      testDirectoryError0001
     * @tc.desc      Verify creating an existing directory fails with the file-exists code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDirectoryError0001', 0, () => {
      const dir: string = directoryFor('exists');
      try {
        fileIo.mkdirSync(dir);
        expect(codeOf(() => {
          fileIo.mkdirSync(dir);
        })).assertEqual(ERR_FILE_EXISTS);
        expect(pathExists(dir)).assertTrue();
      } finally {
        removeDirQuietly(dir);
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_DIR_0200
     * @tc.name      testDirectoryError0002
     * @tc.desc      Verify removing a missing directory fails with the no-such-file code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDirectoryError0002', 0, () => {
      const dir: string = directoryFor('missing');
      expect(codeOf(() => {
        fileIo.rmdirSync(dir);
      })).assertEqual(ERR_NO_SUCH_FILE);
      expect(pathExists(dir)).assertFalse();
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_DIR_0300
     * @tc.name      testDirectoryError0003
     * @tc.desc      Verify opening a directory as a file fails and leaves the directory intact
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDirectoryError0003', 0, () => {
      const dir: string = directoryFor('open_as_file');
      try {
        fileIo.mkdirSync(dir);
        const handle: fileIo.File = fileIo.openSync(dir, fileIo.OpenMode.READ_ONLY);
        const readFailed: boolean = threw(() => {
          fileIo.readSync(handle.fd, new ArrayBuffer(1));
        });
        fileIo.closeSync(handle);
        expect(readFailed).assertTrue();
        expect(pathExists(dir)).assertTrue();
        expect(fileIo.statSync(dir).isDirectory()).assertTrue();
      } finally {
        removeDirQuietly(dir);
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_DIR_0400
     * @tc.name      testDirectoryError0004
     * @tc.desc      Verify unlinking a directory fails and leaves the directory intact
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDirectoryError0004', 0, () => {
      const dir: string = directoryFor('unlink_dir');
      try {
        fileIo.mkdirSync(dir);
        const failed: boolean = threw(() => {
          fileIo.unlinkSync(dir);
        });
        expect(failed).assertTrue();
        expect(pathExists(dir)).assertTrue();
      } finally {
        removeDirQuietly(dir);
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_DIR_0500
     * @tc.name      testDirectoryError0005
     * @tc.desc      Verify listing a regular file as a directory fails without touching the file
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDirectoryError0005', 0, () => {
      const file: string = pathInFiles(uniqueName('avs_derr_list', '.txt'));
      try {
        writeTextFile(file, 'not-a-directory');
        const failed: boolean = threw(() => {
          fileIo.listFileSync(file);
        });
        expect(failed).assertTrue();
        expect(pathExists(file)).assertTrue();
        expect(fileIo.statSync(file).isFile()).assertTrue();
        expect(fileIo.statSync(file).size).assertEqual(15);
      } finally {
        removeQuietly(file);
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_DIR_0600
     * @tc.name      testDirectoryError0006
     * @tc.desc      Verify copying a directory as a file fails and leaves the directory intact
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDirectoryError0006', 0, () => {
      const dir: string = directoryFor('copy_source');
      const target: string = pathInFiles(uniqueName('avs_derr_copy', '.txt'));
      try {
        fileIo.mkdirSync(dir);
        const failed: boolean = threw(() => {
          fileIo.copyFileSync(dir, target);
        });
        expect(failed).assertTrue();
        expect(pathExists(dir)).assertTrue();
        expect(pathExists(target)).assertFalse();
      } finally {
        removeDirQuietly(dir);
        removeQuietly(target);
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_DIR_0700
     * @tc.name      testDirectoryError0007
     * @tc.desc      Verify a positive stat control distinguishes a directory from a file
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDirectoryError0007', 0, () => {
      const dir: string = directoryFor('control');
      const file: string = pathInFiles(uniqueName('avs_derr_control', '.txt'));
      try {
        fileIo.mkdirSync(dir);
        writeTextFile(file, 'control');
        expect(fileIo.statSync(dir).isDirectory()).assertTrue();
        expect(fileIo.statSync(dir).isFile()).assertFalse();
        expect(fileIo.statSync(file).isFile()).assertTrue();
        expect(fileIo.statSync(file).isDirectory()).assertFalse();
      } finally {
        removeDirQuietly(dir);
        removeQuietly(file);
      }
    })
  });
}
