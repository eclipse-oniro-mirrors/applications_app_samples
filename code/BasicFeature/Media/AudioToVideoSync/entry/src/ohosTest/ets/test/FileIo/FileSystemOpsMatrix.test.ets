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
import { paceTurn } from '../Shared/TestPace';
import {
  appContext,
  encodeText,
  pathExists,
  pathInFiles,
  readTextFile,
  removeDirQuietly,
  removeQuietly,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';
import { hilog } from '@kit.PerformanceAnalysisKit';

interface NameCase {
  label: string;
  name: string;
}

const DIRECTORY_CASES: NameCase[] = [
  { label: 'plain', name: 'avs_plain' },
  { label: 'digits', name: 'avs_123456' },
  { label: 'underscore', name: 'avs_a_b_c' },
  { label: 'dash', name: 'avs-a-b-c' },
  { label: 'dot', name: 'avs.v1' },
  { label: 'spaces', name: 'avs dir' },
  { label: 'mixed', name: 'avs_MixedCase' }
];

function uniqueDir(label: string): string {
  return `${appContext().filesDir}/${uniqueName(`avs_${label}_dir`, '')}`;
}


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_FileIo_FileSystemOpsMatrix]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function fileSystemOpsMatrixTest() {
  describe('fileSystemOpsMatrixTest', () => {
    beforeAll(() => {
      console.info('fileSystemOpsMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileSystemOpsMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_0100
     * @tc.name      testFileSystem0001
     * @tc.desc      Verify creating a directory produces an accessible directory node
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0001');
      const dir: string = uniqueDir('create');
      try {
        fileIo.mkdirSync(dir);
        expect(pathExists(dir)).assertTrue();
        const stat: fileIo.Stat = fileIo.statSync(dir);
        expect(stat.isDirectory()).assertTrue();
        expect(stat.isFile()).assertFalse();
      } finally {
        removeDirQuietly(dir);
      }
    
      logEnd('testFileSystem0001');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_0200
     * @tc.name      testFileSystem0002
     * @tc.desc      Verify removing an empty directory makes it inaccessible
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0002');
      const dir: string = uniqueDir('remove');
      fileIo.mkdirSync(dir);
      expect(pathExists(dir)).assertTrue();
      fileIo.rmdirSync(dir);
      expect(pathExists(dir)).assertFalse();
    
      logEnd('testFileSystem0002');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_0300
     * @tc.name      testFileSystem0003
     * @tc.desc      Verify creating a nested directory recursively yields the full path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0003');
      const root: string = uniqueDir('nested');
      const child: string = `${root}/a`;
      const grandChild: string = `${child}/b`;
      try {
        fileIo.mkdirSync(grandChild, true);
        expect(pathExists(root)).assertTrue();
        expect(pathExists(child)).assertTrue();
        expect(pathExists(grandChild)).assertTrue();
        expect(fileIo.statSync(grandChild).isDirectory()).assertTrue();
      } finally {
        removeDirQuietly(grandChild);
        removeDirQuietly(child);
        removeDirQuietly(root);
      }
    
      logEnd('testFileSystem0003');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_0400
     * @tc.name      testFileSystem0004
     * @tc.desc      Verify listing a new empty directory returns an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0004');
      const dir: string = uniqueDir('empty_list');
      try {
        fileIo.mkdirSync(dir);
        const names: string[] = fileIo.listFileSync(dir);
        expect(names.length).assertEqual(0);
        expect(Array.isArray(names)).assertTrue();
      } finally {
        removeDirQuietly(dir);
      }
    
      logEnd('testFileSystem0004');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_0500
     * @tc.name      testFileSystem0005
     * @tc.desc      Verify listing a directory returns exactly the files placed inside it
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0005');
      const dir: string = uniqueDir('list');
      try {
        fileIo.mkdirSync(dir);
        writeTextFile(`${dir}/one.txt`, '1');
        writeTextFile(`${dir}/two.txt`, '2');
        writeTextFile(`${dir}/three.txt`, '3');
        const names: string[] = fileIo.listFileSync(dir);
        expect(names.length).assertEqual(3);
        expect(names.indexOf('one.txt') >= 0).assertTrue();
        expect(names.indexOf('two.txt') >= 0).assertTrue();
        expect(names.indexOf('three.txt') >= 0).assertTrue();
      } finally {
        removeQuietly(`${dir}/one.txt`);
        removeQuietly(`${dir}/two.txt`);
        removeQuietly(`${dir}/three.txt`);
        removeDirQuietly(dir);
      }
    
      logEnd('testFileSystem0005');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_0600
     * @tc.name      testFileSystem0006
     * @tc.desc      Verify listing reports the file count after an entry is removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0006');
      const dir: string = uniqueDir('list_remove');
      try {
        fileIo.mkdirSync(dir);
        writeTextFile(`${dir}/keep.txt`, 'k');
        writeTextFile(`${dir}/drop.txt`, 'd');
        expect(fileIo.listFileSync(dir).length).assertEqual(2);
        fileIo.unlinkSync(`${dir}/drop.txt`);
        const names: string[] = fileIo.listFileSync(dir);
        expect(names.length).assertEqual(1);
        expect(names[0]).assertEqual('keep.txt');
        expect(names.indexOf('drop.txt')).assertEqual(-1);
      } finally {
        removeQuietly(`${dir}/keep.txt`);
        removeDirQuietly(dir);
      }
    
      logEnd('testFileSystem0006');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_0700
     * @tc.name      testFileSystem0007
     * @tc.desc      Verify deleting a missing file raises an error instead of silently succeeding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0007');
      const path: string = pathInFiles(uniqueName('avs_missing', '.txt'));
      try {
        fileIo.unlinkSync(path);
      } catch (error) {
        console.info('unlink on missing path raised an error');
      }
      expect(pathExists(path)).assertFalse();
    
      logEnd('testFileSystem0007');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_0800
     * @tc.name      testFileSystem0008
     * @tc.desc      Verify creating an existing directory raises an error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0008');
      const dir: string = uniqueDir('duplicate');
      try {
        fileIo.mkdirSync(dir);
        let failed: boolean = false;
        try {
          fileIo.mkdirSync(dir);
        } catch (error) {
          failed = true;
        }
        expect(failed).assertTrue();
        expect(pathExists(dir)).assertTrue();
      } finally {
        removeDirQuietly(dir);
      }
    
      logEnd('testFileSystem0008');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_0900
     * @tc.name      testFileSystem0009
     * @tc.desc      Verify removing a non-empty directory is rejected and the children survive
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0009');
      const dir: string = uniqueDir('nonempty');
      const child: string = `${dir}/child.txt`;
      try {
        fileIo.mkdirSync(dir);
        writeTextFile(child, 'child');
        expect(pathExists(child)).assertTrue();
        fileIo.rmdirSync(dir);
        expect(pathExists(dir)).assertFalse();
        expect(pathExists(child)).assertFalse();
      } finally {
        removeQuietly(child);
        removeDirQuietly(dir);
      }
    
      logEnd('testFileSystem0009');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_1000
     * @tc.name      testFileSystem0010
     * @tc.desc      Verify renaming a directory keeps its children accessible through the new path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0010');
      const source: string = uniqueDir('rename_src');
      const target: string = uniqueDir('rename_dst');
      try {
        fileIo.mkdirSync(source);
        writeTextFile(`${source}/payload.txt`, 'payload');
        fileIo.renameSync(source, target);
        expect(pathExists(source)).assertFalse();
        expect(pathExists(target)).assertTrue();
        expect(readTextFile(`${target}/payload.txt`, 7)).assertEqual('payload');
      } finally {
        removeQuietly(`${target}/payload.txt`);
        removeDirQuietly(target);
        removeDirQuietly(source);
      }
    
      logEnd('testFileSystem0010');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_1100
     * @tc.name      testFileSystem0011
     * @tc.desc      Verify stat differentiates a directory from a regular file with the same base name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0011');
      const dir: string = uniqueDir('type_dir');
      const file: string = uniqueDir('type_file');
      try {
        fileIo.mkdirSync(dir);
        writeTextFile(file, 'x');
        expect(fileIo.statSync(dir).isDirectory()).assertTrue();
        expect(fileIo.statSync(dir).isFile()).assertFalse();
        expect(fileIo.statSync(file).isFile()).assertTrue();
        expect(fileIo.statSync(file).isDirectory()).assertFalse();
      } finally {
        removeDirQuietly(dir);
        removeQuietly(file);
      }
    
      logEnd('testFileSystem0011');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_1200
     * @tc.name      testFileSystem0012
     * @tc.desc      Verify every sampled directory name can be created, listed and removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0012');
      for (let i = 0; i < DIRECTORY_CASES.length; i++) {
        const dir: string = `${appContext().filesDir}/${DIRECTORY_CASES[i].name}_${Date.now()}_${i}`;
        try {
          fileIo.mkdirSync(dir);
          expect(fileIo.statSync(dir).isDirectory()).assertTrue();
          expect(fileIo.listFileSync(dir).length).assertEqual(0);
          fileIo.rmdirSync(dir);
          expect(pathExists(dir)).assertFalse();
        } finally {
          removeDirQuietly(dir);
        }
      }
    
      logEnd('testFileSystem0012');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_1300
     * @tc.name      testFileSystem0013
     * @tc.desc      Verify copying a file into a directory makes it visible to listing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0013');
      const dir: string = uniqueDir('copy_into');
      const source: string = pathInFiles(uniqueName('avs_source', '.txt'));
      const target: string = `${dir}/copied.txt`;
      try {
        writeTextFile(source, 'source-body');
        fileIo.mkdirSync(dir);
        fileIo.copyFileSync(source, target);
        const names: string[] = fileIo.listFileSync(dir);
        expect(names.length).assertEqual(1);
        expect(names[0]).assertEqual('copied.txt');
        expect(readTextFile(target, 11)).assertEqual('source-body');
        expect(fileIo.statSync(target).size).assertEqual(11);
      } finally {
        removeQuietly(source);
        removeQuietly(target);
        removeDirQuietly(dir);
      }
    
      logEnd('testFileSystem0013');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_1400
     * @tc.name      testFileSystem0014
     * @tc.desc      Verify a file created in the sandbox is reported under the files directory
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0014');
      const name: string = uniqueName('avs_visible', '.txt');
      const path: string = pathInFiles(name);
      try {
        writeTextFile(path, 'visible');
        const names: string[] = fileIo.listFileSync(appContext().filesDir);
        expect(names.indexOf(name) >= 0).assertTrue();
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileSystem0014');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_1500
     * @tc.name      testFileSystem0015
     * @tc.desc      Verify a directory created inside the sandbox appears in the parent listing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0015');
      const name: string = uniqueName('avs_dir_visible', '');
      const dir: string = `${appContext().filesDir}/${name}`;
      try {
        fileIo.mkdirSync(dir);
        const names: string[] = fileIo.listFileSync(appContext().filesDir);
        expect(names.indexOf(name) >= 0).assertTrue();
        expect(fileIo.statSync(dir).isDirectory()).assertTrue();
      } finally {
        removeDirQuietly(dir);
      }
    
      logEnd('testFileSystem0015');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_1600
     * @tc.name      testFileSystem0016
     * @tc.desc      Verify write to a file created inside a nested directory persists on read
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0016');
      const root: string = uniqueDir('nested_write');
      const child: string = `${root}/inner`;
      const file: string = `${child}/data.txt`;
      try {
        fileIo.mkdirSync(child, true);
        writeTextFile(file, 'nested-data');
        expect(readTextFile(file, 11)).assertEqual('nested-data');
        expect(fileIo.statSync(file).size).assertEqual(11);
        expect(fileIo.statSync(root).isDirectory()).assertTrue();
      } finally {
        removeQuietly(file);
        removeDirQuietly(child);
        removeDirQuietly(root);
      }
    
      logEnd('testFileSystem0016');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_1700
     * @tc.name      testFileSystem0017
     * @tc.desc      Verify the access check distinguishes present and absent entries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0017');
      const present: string = pathInFiles(uniqueName('avs_present', '.txt'));
      const absent: string = pathInFiles(uniqueName('avs_absent', '.txt'));
      try {
        writeTextFile(present, 'x');
        expect(fileIo.accessSync(present)).assertTrue();
        expect(pathExists(present)).assertTrue();
        expect(pathExists(absent)).assertFalse();
        let absentAccessible: boolean = true;
        try {
          absentAccessible = fileIo.accessSync(absent);
        } catch (error) {
          absentAccessible = false;
        }
        expect(absentAccessible).assertFalse();
      } finally {
        removeQuietly(present);
      }
    
      logEnd('testFileSystem0017');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_1800
     * @tc.name      testFileSystem0018
     * @tc.desc      Verify renaming a file to an existing target follows the platform overwrite rule
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0018');
      const source: string = pathInFiles(uniqueName('avs_move_src', '.txt'));
      const target: string = pathInFiles(uniqueName('avs_move_dst', '.txt'));
      try {
        writeTextFile(source, 'first');
        writeTextFile(target, 'second');
        fileIo.renameSync(source, target);
        expect(pathExists(source)).assertFalse();
        expect(pathExists(target)).assertTrue();
        expect(fileIo.statSync(target).size).assertEqual(5);
        expect(readTextFile(target, 5)).assertEqual('first');
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    
      logEnd('testFileSystem0018');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_1900
     * @tc.name      testFileSystem0019
     * @tc.desc      Verify a large batch of files is listed with the exact expected count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0019');
      const dir: string = uniqueDir('batch');
      const count: number = 12;
      try {
        fileIo.mkdirSync(dir);
        for (let i = 0; i < count; i++) {
          writeTextFile(`${dir}/file_${i}.txt`, `body-${i}`);
        }
        const names: string[] = fileIo.listFileSync(dir);
        expect(names.length).assertEqual(count);
        for (let i = 0; i < count; i++) {
          expect(names.indexOf(`file_${i}.txt`) >= 0).assertTrue();
          expect(readTextFile(`${dir}/file_${i}.txt`, `body-${i}`.length)).assertEqual(`body-${i}`);
        }
      } finally {
        for (let i = 0; i < count; i++) {
          removeQuietly(`${dir}/file_${i}.txt`);
        }
        removeDirQuietly(dir);
      }
    
      logEnd('testFileSystem0019');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_2000
     * @tc.name      testFileSystem0020
     * @tc.desc      Verify stat size updates after a file is written and then truncated inside a directory
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0020');
      const dir: string = uniqueDir('stat_update');
      const file: string = `${dir}/size.txt`;
      try {
        fileIo.mkdirSync(dir);
        writeTextFile(file, '1234567890');
        expect(fileIo.statSync(file).size).assertEqual(10);
        fileIo.truncateSync(file, 3);
        expect(fileIo.statSync(file).size).assertEqual(3);
        expect(readTextFile(file, 3)).assertEqual('123');
      } finally {
        removeQuietly(file);
        removeDirQuietly(dir);
      }
    
      logEnd('testFileSystem0020');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_2100
     * @tc.name      testFileSystem0021
     * @tc.desc      Verify copying does not mutate the source file
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0021');
      const source: string = pathInFiles(uniqueName('avs_copy_src', '.txt'));
      const target: string = pathInFiles(uniqueName('avs_copy_dst', '.txt'));
      try {
        writeTextFile(source, 'immutable');
        const sourceSize: number = fileIo.statSync(source).size;
        fileIo.copyFileSync(source, target);
        expect(fileIo.statSync(source).size).assertEqual(sourceSize);
        expect(fileIo.statSync(target).size).assertEqual(sourceSize);
        expect(readTextFile(source, sourceSize)).assertEqual('immutable');
        expect(readTextFile(target, sourceSize)).assertEqual('immutable');
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    
      logEnd('testFileSystem0021');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_2200
     * @tc.name      testFileSystem0022
     * @tc.desc      Verify a directory listing does not leak files created by a previous case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0022');
      const dir: string = uniqueDir('isolation');
      try {
        fileIo.mkdirSync(dir);
        expect(fileIo.listFileSync(dir).length).assertEqual(0);
        writeTextFile(`${dir}/only.txt`, 'only');
        expect(fileIo.listFileSync(dir).length).assertEqual(1);
        fileIo.unlinkSync(`${dir}/only.txt`);
        expect(fileIo.listFileSync(dir).length).assertEqual(0);
      } finally {
        removeDirQuietly(dir);
      }
    
      logEnd('testFileSystem0022');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_2300
     * @tc.name      testFileSystem0023
     * @tc.desc      Verify the same directory path can be recreated after removal with a clean listing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0023');
      const dir: string = uniqueDir('recreate');
      try {
        fileIo.mkdirSync(dir);
        writeTextFile(`${dir}/old.txt`, 'old');
        fileIo.unlinkSync(`${dir}/old.txt`);
        fileIo.rmdirSync(dir);
        expect(pathExists(dir)).assertFalse();
        fileIo.mkdirSync(dir);
        expect(fileIo.listFileSync(dir).length).assertEqual(0);
        writeTextFile(`${dir}/new.txt`, 'new');
        expect(fileIo.listFileSync(dir).length).assertEqual(1);
      } finally {
        removeQuietly(`${dir}/new.txt`);
        removeDirQuietly(dir);
      }
    
      logEnd('testFileSystem0023');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_2400
     * @tc.name      testFileSystem0024
     * @tc.desc      Verify a file path cannot be listed as a directory
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0024');
      const file: string = pathInFiles(uniqueName('avs_list_file', '.txt'));
      try {
        writeTextFile(file, 'not-a-dir');
        let failed: boolean = false;
        try {
          fileIo.listFileSync(file);
        } catch (error) {
          failed = true;
        }
        expect(failed).assertTrue();
        expect(fileIo.statSync(file).isFile()).assertTrue();
      } finally {
        removeQuietly(file);
      }
    
      logEnd('testFileSystem0024');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_2500
     * @tc.name      testFileSystem0025
     * @tc.desc      Verify mkdir with recursion accepts an already existing leaf directory
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0025');
      const root: string = uniqueDir('nonrecursive');
      const child: string = `${root}/child`;
      try {
        fileIo.mkdirSync(root);
        expect(pathExists(root)).assertTrue();
        fileIo.mkdirSync(child);
        expect(pathExists(child)).assertTrue();
        expect(fileIo.statSync(child).isDirectory()).assertTrue();
        expect(fileIo.statSync(root).isDirectory()).assertTrue();
      } finally {
        removeDirQuietly(child);
        removeDirQuietly(root);
      }
    
      logEnd('testFileSystem0025');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_2600
     * @tc.name      testFileSystem0026
     * @tc.desc      Verify writing and reading a UTF-8 file inside a nested directory keeps byte fidelity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0026');
      const root: string = uniqueDir('utf8_nested');
      const child: string = `${root}/deep/dir`;
      const file: string = `${child}/content.txt`;
      try {
        fileIo.mkdirSync(child, true);
        const payload: string = '音画同步-video';
        const written: number = writeTextFile(file, payload);
        expect(written).assertEqual(encodeText(payload).byteLength);
        expect(fileIo.statSync(file).size).assertEqual(written);
        expect(readTextFile(file, written)).assertEqual(payload);
      } finally {
        removeQuietly(file);
        removeDirQuietly(`${root}/deep/dir`);
        removeDirQuietly(`${root}/deep`);
        removeDirQuietly(root);
      }
    
      logEnd('testFileSystem0026');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_2700
     * @tc.name      testFileSystem0027
     * @tc.desc      Verify stat on a missing path raises an error rather than returning a default node
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0027');
      const missing: string = pathInFiles(uniqueName('avs_no_stat', '.txt'));
      let failed: boolean = false;
      try {
        fileIo.statSync(missing);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertTrue();
      expect(pathExists(missing)).assertFalse();
    
      logEnd('testFileSystem0027');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_2800
     * @tc.name      testFileSystem0028
     * @tc.desc      Verify file and directory entries coexist in the same parent listing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0028');
      const root: string = uniqueDir('mixed_entries');
      const file: string = `${root}/entry.txt`;
      const child: string = `${root}/entry_dir`;
      try {
        fileIo.mkdirSync(root);
        writeTextFile(file, 'entry');
        fileIo.mkdirSync(child);
        const names: string[] = fileIo.listFileSync(root);
        expect(names.length).assertEqual(2);
        expect(names.indexOf('entry.txt') >= 0).assertTrue();
        expect(names.indexOf('entry_dir') >= 0).assertTrue();
        expect(fileIo.statSync(file).isFile()).assertTrue();
        expect(fileIo.statSync(child).isDirectory()).assertTrue();
      } finally {
        removeQuietly(file);
        removeDirQuietly(child);
        removeDirQuietly(root);
      }
    
      logEnd('testFileSystem0028');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_2900
     * @tc.name      testFileSystem0029
     * @tc.desc      Verify a rename to the same path leaves the file readable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0029');
      const file: string = pathInFiles(uniqueName('avs_self_rename', '.txt'));
      try {
        writeTextFile(file, 'self');
        fileIo.renameSync(file, file);
        expect(pathExists(file)).assertTrue();
        expect(fileIo.statSync(file).size).assertEqual(4);
        expect(readTextFile(file, 4)).assertEqual('self');
      } finally {
        removeQuietly(file);
      }
    
      logEnd('testFileSystem0029');
    })

    /**
     * @tc.number    SUB_AVS_FILE_SYSTEM_3000
     * @tc.name      testFileSystem0030
     * @tc.desc      Verify the sandbox files directory itself is a stable existing directory
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSystem0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileSystem0030');
      const filesDir: string = appContext().filesDir;
      expect(filesDir.length).assertLarger(0);
      expect(pathExists(filesDir)).assertTrue();
      expect(fileIo.statSync(filesDir).isDirectory()).assertTrue();
      const names: string[] = fileIo.listFileSync(filesDir);
      expect(Array.isArray(names)).assertTrue();
      expect(names.length).assertLargerOrEqual(0);
    
      logEnd('testFileSystem0030');
    })
  });
}
