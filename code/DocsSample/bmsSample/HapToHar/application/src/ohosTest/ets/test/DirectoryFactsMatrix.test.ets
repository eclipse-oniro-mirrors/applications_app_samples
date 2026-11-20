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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { entryContext, BUNDLE_NAME, ENTRY_MODULE } from './shared/AppProbe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function directoryFactsMatrixTest() {
  describe('directoryFactsMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0001
   * @tc.name      testDirectoryFacts0001
   * @tc.desc      Context dir filesDir is absolute
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0001', 'filesDir is absolute');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir;
    expect(dir.startsWith('/')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0002
   * @tc.name      testDirectoryFacts0002
   * @tc.desc      Context dir filesDir has no double slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0002', 'filesDir has no double slash');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir;
    expect(dir.indexOf('//')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0003
   * @tc.name      testDirectoryFacts0003
   * @tc.desc      Context dir filesDir no trailing slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0003', 'filesDir no trailing slash');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir;
    expect(dir.endsWith('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0004
   * @tc.name      testDirectoryFacts0004
   * @tc.desc      Context dir filesDir longer than segment
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0004', 'filesDir longer than segment');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir;
    expect(dir.length > 'files'.length + 1).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0005
   * @tc.name      testDirectoryFacts0005
   * @tc.desc      Context dir filesDir stable across two reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0005', 'filesDir stable across two reads');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir;
    expect(context.filesDir).assertEqual(dir);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0006
   * @tc.name      testDirectoryFacts0006
   * @tc.desc      Context dir filesDir as a directory entry
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0006', 'filesDir as a directory entry');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir;
    const name: string = dir.substring(dir.lastIndexOf('/') + 1);
    expect(name.length > 0).assertTrue();
    expect(name.includes('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0007
   * @tc.name      testDirectoryFacts0007
   * @tc.desc      Context dir filesDir parent resolves
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0007', 'filesDir parent resolves');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir;
    const parent: string = dir.substring(0, dir.lastIndexOf('/'));
    expect(parent.length > 0).assertTrue();
    expect(fs.accessSync(parent)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0008
   * @tc.name      testDirectoryFacts0008
   * @tc.desc      Context dir filesDir no spaces in path
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0008', 'filesDir no spaces in path');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir;
    expect(dir.indexOf(' ')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0009
   * @tc.name      testDirectoryFacts0009
   * @tc.desc      Context dir filesDir exists on disk
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0009', 'filesDir exists on disk');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir;
    expect(fs.accessSync(dir)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0010
   * @tc.name      testDirectoryFacts0010
   * @tc.desc      Context dir filesDir is a directory
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0010', 'filesDir is a directory');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir;
    expect(fs.statSync(dir).isDirectory()).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0011
   * @tc.name      testDirectoryFacts0011
   * @tc.desc      Context dir cacheDir is absolute
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0011', 'cacheDir is absolute');
    const context: common.Context = entryContext();
    const dir: string = context.cacheDir;
    expect(dir.startsWith('/')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0012
   * @tc.name      testDirectoryFacts0012
   * @tc.desc      Context dir cacheDir has no double slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0012', 'cacheDir has no double slash');
    const context: common.Context = entryContext();
    const dir: string = context.cacheDir;
    expect(dir.indexOf('//')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0013
   * @tc.name      testDirectoryFacts0013
   * @tc.desc      Context dir cacheDir no trailing slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0013', 'cacheDir no trailing slash');
    const context: common.Context = entryContext();
    const dir: string = context.cacheDir;
    expect(dir.endsWith('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0014
   * @tc.name      testDirectoryFacts0014
   * @tc.desc      Context dir cacheDir longer than segment
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0014', 'cacheDir longer than segment');
    const context: common.Context = entryContext();
    const dir: string = context.cacheDir;
    expect(dir.length > 'cache'.length + 1).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0015
   * @tc.name      testDirectoryFacts0015
   * @tc.desc      Context dir cacheDir stable across two reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0015', 'cacheDir stable across two reads');
    const context: common.Context = entryContext();
    const dir: string = context.cacheDir;
    expect(context.cacheDir).assertEqual(dir);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0016
   * @tc.name      testDirectoryFacts0016
   * @tc.desc      Context dir cacheDir as a directory entry
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0016', 'cacheDir as a directory entry');
    const context: common.Context = entryContext();
    const dir: string = context.cacheDir;
    const name: string = dir.substring(dir.lastIndexOf('/') + 1);
    expect(name.length > 0).assertTrue();
    expect(name.includes('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0017
   * @tc.name      testDirectoryFacts0017
   * @tc.desc      Context dir cacheDir parent resolves
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0017', 'cacheDir parent resolves');
    const context: common.Context = entryContext();
    const dir: string = context.cacheDir;
    const parent: string = dir.substring(0, dir.lastIndexOf('/'));
    expect(parent.length > 0).assertTrue();
    expect(fs.accessSync(parent)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0018
   * @tc.name      testDirectoryFacts0018
   * @tc.desc      Context dir cacheDir no spaces in path
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0018', 'cacheDir no spaces in path');
    const context: common.Context = entryContext();
    const dir: string = context.cacheDir;
    expect(dir.indexOf(' ')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0019
   * @tc.name      testDirectoryFacts0019
   * @tc.desc      Context dir cacheDir exists on disk
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0019', 'cacheDir exists on disk');
    const context: common.Context = entryContext();
    const dir: string = context.cacheDir;
    expect(fs.accessSync(dir)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0020
   * @tc.name      testDirectoryFacts0020
   * @tc.desc      Context dir cacheDir is a directory
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0020', 'cacheDir is a directory');
    const context: common.Context = entryContext();
    const dir: string = context.cacheDir;
    expect(fs.statSync(dir).isDirectory()).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0021
   * @tc.name      testDirectoryFacts0021
   * @tc.desc      Context dir tempDir is absolute
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0021', 'tempDir is absolute');
    const context: common.Context = entryContext();
    const dir: string = context.tempDir;
    expect(dir.startsWith('/')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0022
   * @tc.name      testDirectoryFacts0022
   * @tc.desc      Context dir tempDir has no double slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0022', 'tempDir has no double slash');
    const context: common.Context = entryContext();
    const dir: string = context.tempDir;
    expect(dir.indexOf('//')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0023
   * @tc.name      testDirectoryFacts0023
   * @tc.desc      Context dir tempDir no trailing slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0023', 'tempDir no trailing slash');
    const context: common.Context = entryContext();
    const dir: string = context.tempDir;
    expect(dir.endsWith('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0024
   * @tc.name      testDirectoryFacts0024
   * @tc.desc      Context dir tempDir longer than segment
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0024', 'tempDir longer than segment');
    const context: common.Context = entryContext();
    const dir: string = context.tempDir;
    expect(dir.length > 'temp'.length + 1).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0025
   * @tc.name      testDirectoryFacts0025
   * @tc.desc      Context dir tempDir stable across two reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0025', 'tempDir stable across two reads');
    const context: common.Context = entryContext();
    const dir: string = context.tempDir;
    expect(context.tempDir).assertEqual(dir);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0026
   * @tc.name      testDirectoryFacts0026
   * @tc.desc      Context dir tempDir as a directory entry
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0026', 'tempDir as a directory entry');
    const context: common.Context = entryContext();
    const dir: string = context.tempDir;
    const name: string = dir.substring(dir.lastIndexOf('/') + 1);
    expect(name.length > 0).assertTrue();
    expect(name.includes('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0027
   * @tc.name      testDirectoryFacts0027
   * @tc.desc      Context dir tempDir parent resolves
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0027', 'tempDir parent resolves');
    const context: common.Context = entryContext();
    const dir: string = context.tempDir;
    const parent: string = dir.substring(0, dir.lastIndexOf('/'));
    expect(parent.length > 0).assertTrue();
    expect(fs.accessSync(parent)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0028
   * @tc.name      testDirectoryFacts0028
   * @tc.desc      Context dir tempDir no spaces in path
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0028', 'tempDir no spaces in path');
    const context: common.Context = entryContext();
    const dir: string = context.tempDir;
    expect(dir.indexOf(' ')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0029
   * @tc.name      testDirectoryFacts0029
   * @tc.desc      Context dir tempDir exists on disk
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0029', 'tempDir exists on disk');
    const context: common.Context = entryContext();
    const dir: string = context.tempDir;
    expect(fs.accessSync(dir)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0030
   * @tc.name      testDirectoryFacts0030
   * @tc.desc      Context dir tempDir is a directory
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0030', 'tempDir is a directory');
    const context: common.Context = entryContext();
    const dir: string = context.tempDir;
    expect(fs.statSync(dir).isDirectory()).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0031
   * @tc.name      testDirectoryFacts0031
   * @tc.desc      Context dir databaseDir is absolute
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0031', 'databaseDir is absolute');
    const context: common.Context = entryContext();
    const dir: string = context.databaseDir;
    expect(dir.startsWith('/')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0032
   * @tc.name      testDirectoryFacts0032
   * @tc.desc      Context dir databaseDir has no double slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0032', 'databaseDir has no double slash');
    const context: common.Context = entryContext();
    const dir: string = context.databaseDir;
    expect(dir.indexOf('//')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0033
   * @tc.name      testDirectoryFacts0033
   * @tc.desc      Context dir databaseDir no trailing slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0033', 'databaseDir no trailing slash');
    const context: common.Context = entryContext();
    const dir: string = context.databaseDir;
    expect(dir.endsWith('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0034
   * @tc.name      testDirectoryFacts0034
   * @tc.desc      Context dir databaseDir longer than segment
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0034', 'databaseDir longer than segment');
    const context: common.Context = entryContext();
    const dir: string = context.databaseDir;
    expect(dir.length > 'database'.length + 1).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0035
   * @tc.name      testDirectoryFacts0035
   * @tc.desc      Context dir databaseDir stable across two reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0035', 'databaseDir stable across two reads');
    const context: common.Context = entryContext();
    const dir: string = context.databaseDir;
    expect(context.databaseDir).assertEqual(dir);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0036
   * @tc.name      testDirectoryFacts0036
   * @tc.desc      Context dir databaseDir as a directory entry
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0036', 'databaseDir as a directory entry');
    const context: common.Context = entryContext();
    const dir: string = context.databaseDir;
    const name: string = dir.substring(dir.lastIndexOf('/') + 1);
    expect(name.length > 0).assertTrue();
    expect(name.includes('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0037
   * @tc.name      testDirectoryFacts0037
   * @tc.desc      Context dir databaseDir parent resolves
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0037', 'databaseDir parent resolves');
    const context: common.Context = entryContext();
    const dir: string = context.databaseDir;
    const parent: string = dir.substring(0, dir.lastIndexOf('/'));
    expect(parent.length > 0).assertTrue();
    expect(fs.accessSync(parent)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0038
   * @tc.name      testDirectoryFacts0038
   * @tc.desc      Context dir databaseDir no spaces in path
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0038', 'databaseDir no spaces in path');
    const context: common.Context = entryContext();
    const dir: string = context.databaseDir;
    expect(dir.indexOf(' ')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0039
   * @tc.name      testDirectoryFacts0039
   * @tc.desc      Context dir databaseDir exists on disk
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0039', 'databaseDir exists on disk');
    const context: common.Context = entryContext();
    const dir: string = context.databaseDir;
    expect(fs.accessSync(dir)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0040
   * @tc.name      testDirectoryFacts0040
   * @tc.desc      Context dir databaseDir is a directory
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0040', 'databaseDir is a directory');
    const context: common.Context = entryContext();
    const dir: string = context.databaseDir;
    expect(fs.statSync(dir).isDirectory()).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0041
   * @tc.name      testDirectoryFacts0041
   * @tc.desc      Context dir preferencesDir is absolute
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0041', 'preferencesDir is absolute');
    const context: common.Context = entryContext();
    const dir: string = context.preferencesDir;
    expect(dir.startsWith('/')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0042
   * @tc.name      testDirectoryFacts0042
   * @tc.desc      Context dir preferencesDir has no double slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0042', 'preferencesDir has no double slash');
