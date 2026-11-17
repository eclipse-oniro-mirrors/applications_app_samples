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


import { describe, it, expect } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Logger from '../../utils/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.ERROR_MATRIX;

function baseDir(): string {
  const dir: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/lottie_error_cases';
  if (!fs.accessSync(dir)) {
    fs.mkdirSync(dir);
  }
  return dir;
}

function missingPath(name: string): string {
  const path: string = baseDir() + '/' + name;
  removeIfExists(path);
  return path;
}

function removeIfExists(path: string): void {
  if (fs.accessSync(path)) {
    fs.unlinkSync(path);
  }
}

function removeDirIfExists(dir: string): void {
  if (!fs.accessSync(dir)) {
    return;
  }
  const names: Array<string> = fs.listFileSync(dir);
  for (let i: number = 0; i < names.length; i++) {
    fs.unlinkSync(dir + '/' + names[i]);
  }
  fs.rmdirSync(dir);
}

function freshDir(name: string): string {
  const dir: string = baseDir() + '/' + name;
  removeDirIfExists(dir);
  fs.mkdirSync(dir);
  return dir;
}

function writeInDir(dir: string, name: string, text: string): void {
  const path: string = dir + '/' + name;
  const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
  fs.writeSync(file.fd, text);
  fs.closeSync(file);
}

function rejects(action: () => void): boolean {
  try {
    action();
    return false;
  } catch (error) {
    return true;
  }
}

async function rejectsAsync(action: () => Promise<void>): Promise<boolean> {
  try {
    await action();
    return false;
  } catch (error) {
    return true;
  }
}

export default function errorMatrixTest(): void {
  describe('ErrorMatrixTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_0100
     * @tc.name rejectOpenMissing001
     * @tc.desc Verify opening a missing file is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectOpenMissing_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectOpenMissing_001 begin');
      const path: string = missingPath('open_missing.txt');
      const rejected: boolean = rejects((): void => {
        fs.openSync(path, fs.OpenMode.READ_ONLY);
      });
      Logger.info(TAG, 'rejectOpenMissing_001, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectOpenMissing_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_0200
     * @tc.name rejectStatMissing002
     * @tc.desc Verify stating a missing file is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectStatMissing_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectStatMissing_002 begin');
      const path: string = missingPath('stat_missing.txt');
      const rejected: boolean = rejects((): void => {
        fs.statSync(path);
      });
      Logger.info(TAG, 'rejectStatMissing_002, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectStatMissing_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_0300
     * @tc.name rejectUnlinkMissing003
     * @tc.desc Verify unlinking a missing file is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectUnlinkMissing_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectUnlinkMissing_003 begin');
      const path: string = missingPath('unlink_missing.txt');
      const rejected: boolean = rejects((): void => {
        fs.unlinkSync(path);
      });
      Logger.info(TAG, 'rejectUnlinkMissing_003, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectUnlinkMissing_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_0400
     * @tc.name rejectRmdirMissing004
     * @tc.desc Verify removing a missing directory is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectRmdirMissing_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectRmdirMissing_004 begin');
      const path: string = missingPath('rmdir_missing');
      const rejected: boolean = rejects((): void => {
        fs.rmdirSync(path);
      });
      Logger.info(TAG, 'rejectRmdirMissing_004, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectRmdirMissing_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_0500
     * @tc.name rejectRenameMissing005
     * @tc.desc Verify renaming a missing file is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectRenameMissing_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectRenameMissing_005 begin');
      const source: string = missingPath('rename_missing.txt');
      const target: string = baseDir() + '/rename_target.txt';
      const rejected: boolean = rejects((): void => {
        fs.renameSync(source, target);
      });
      Logger.info(TAG, 'rejectRenameMissing_005, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectRenameMissing_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_0600
     * @tc.name rejectCopyMissing006
     * @tc.desc Verify copying a missing file is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectCopyMissing_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectCopyMissing_006 begin');
      const source: string = missingPath('copy_missing.txt');
      const target: string = baseDir() + '/copy_target.txt';
      const rejected: boolean = rejects((): void => {
        fs.copyFileSync(source, target);
      });
      Logger.info(TAG, 'rejectCopyMissing_006, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectCopyMissing_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_0700
     * @tc.name rejectTruncateMissing007
     * @tc.desc Verify truncating a missing file is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectTruncateMissing_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectTruncateMissing_007 begin');
      const path: string = missingPath('truncate_missing.txt');
      const rejected: boolean = rejects((): void => {
        fs.truncateSync(path, 0);
      });
      Logger.info(TAG, 'rejectTruncateMissing_007, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectTruncateMissing_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_0800
     * @tc.name rejectListMissing008
     * @tc.desc Verify listing a missing directory is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectListMissing_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectListMissing_008 begin');
      const path: string = missingPath('list_missing');
      const rejected: boolean = rejects((): void => {
        fs.listFileSync(path);
      });
      Logger.info(TAG, 'rejectListMissing_008, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectListMissing_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_0900
     * @tc.name rejectMkdirExisting009
     * @tc.desc Verify creating an existing directory is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectMkdirExisting_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectMkdirExisting_009 begin');
      const dir: string = freshDir('mkdir_existing');
      const rejected: boolean = rejects((): void => {
        fs.mkdirSync(dir);
      });
      Logger.info(TAG, 'rejectMkdirExisting_009, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectMkdirExisting_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_1000
     * @tc.name rejectWriteClosedFd010
     * @tc.desc Verify writing through a closed descriptor is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectWriteClosedFd_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectWriteClosedFd_010 begin');
      const path: string = baseDir() + '/closed_write.txt';
removeIfExists(path);
      const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      const rejected: boolean = rejects((): void => {
        fs.writeSync(file.fd, 'x');
      });
      Logger.info(TAG, 'rejectWriteClosedFd_010, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectWriteClosedFd_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_1100
     * @tc.name rejectReadClosedFd011
     * @tc.desc Verify reading through a closed descriptor is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectReadClosedFd_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectReadClosedFd_011 begin');
      const path: string = baseDir() + '/closed_read.txt';
removeIfExists(path);
      const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      const rejected: boolean = rejects((): void => {
        fs.readSync(file.fd, new ArrayBuffer(1));
      });
      Logger.info(TAG, 'rejectReadClosedFd_011, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectReadClosedFd_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_1200
     * @tc.name rejectUnlinkDirectory012
     * @tc.desc Verify unlinking a directory is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectUnlinkDirectory_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectUnlinkDirectory_012 begin');
      const dir: string = freshDir('unlink_dir');
      const rejected: boolean = rejects((): void => {
        fs.unlinkSync(dir);
      });
      Logger.info(TAG, 'rejectUnlinkDirectory_012, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectUnlinkDirectory_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_1300
     * @tc.name rejectStatClosedFd013
     * @tc.desc Verify stating a closed descriptor is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectStatClosedFd_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectStatClosedFd_013 begin');
      const path: string = baseDir() + '/stat_closed.txt';
removeIfExists(path);
      const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      const rejected: boolean = rejects((): void => {
        fs.statSync(file.fd);
      });
      Logger.info(TAG, 'rejectStatClosedFd_013, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectStatClosedFd_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_1400
     * @tc.name rejectWriteInvalidFd014
     * @tc.desc Verify writing through an invalid descriptor is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectWriteInvalidFd_014', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectWriteInvalidFd_014 begin');
      const rejected: boolean = rejects((): void => {
        fs.writeSync(-1, 'x');
      });
      Logger.info(TAG, 'rejectWriteInvalidFd_014, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectWriteInvalidFd_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_1500
     * @tc.name rejectBufferNegativeAlloc015
     * @tc.desc Verify allocating a negative buffer size is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectBufferNegativeAlloc_015', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectBufferNegativeAlloc_015 begin');
      const rejected: boolean = rejects((): void => {
        buffer.alloc(-1);
      });
      Logger.info(TAG, 'rejectBufferNegativeAlloc_015, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectBufferNegativeAlloc_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_ERROR_MATRIX_1600
     * @tc.name rejectBufferReadOutOfRange016
     * @tc.desc Verify reading past the end of a buffer is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rejectBufferReadOutOfRange_016', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rejectBufferReadOutOfRange_016 begin');
      const data: buffer.Buffer = buffer.from([1]);
      const rejected: boolean = rejects((): void => {
        data.readUInt32LE(0);
      });
      Logger.info(TAG, 'rejectBufferReadOutOfRange_016, check01=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'rejectBufferReadOutOfRange_016 end');
    });

  });
}
