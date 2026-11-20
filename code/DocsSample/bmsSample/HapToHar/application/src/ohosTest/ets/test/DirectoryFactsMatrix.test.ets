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
    const context: common.Context = entryContext();
    const dir: string = context.preferencesDir;
    expect(dir.indexOf('//')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0043
   * @tc.name      testDirectoryFacts0043
   * @tc.desc      Context dir preferencesDir no trailing slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0043', 'preferencesDir no trailing slash');
    const context: common.Context = entryContext();
    const dir: string = context.preferencesDir;
    expect(dir.endsWith('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0044
   * @tc.name      testDirectoryFacts0044
   * @tc.desc      Context dir preferencesDir longer than segment
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0044', 'preferencesDir longer than segment');
    const context: common.Context = entryContext();
    const dir: string = context.preferencesDir;
    expect(dir.length > 'preferences'.length + 1).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0045
   * @tc.name      testDirectoryFacts0045
   * @tc.desc      Context dir preferencesDir stable across two reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0045', 'preferencesDir stable across two reads');
    const context: common.Context = entryContext();
    const dir: string = context.preferencesDir;
    expect(context.preferencesDir).assertEqual(dir);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0046
   * @tc.name      testDirectoryFacts0046
   * @tc.desc      Context dir preferencesDir as a directory entry
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0046', 'preferencesDir as a directory entry');
    const context: common.Context = entryContext();
    const dir: string = context.preferencesDir;
    const name: string = dir.substring(dir.lastIndexOf('/') + 1);
    expect(name.length > 0).assertTrue();
    expect(name.includes('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0047
   * @tc.name      testDirectoryFacts0047
   * @tc.desc      Context dir preferencesDir parent resolves
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0047', 'preferencesDir parent resolves');
    const context: common.Context = entryContext();
    const dir: string = context.preferencesDir;
    const parent: string = dir.substring(0, dir.lastIndexOf('/'));
    expect(parent.length > 0).assertTrue();
    expect(fs.accessSync(parent)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0048
   * @tc.name      testDirectoryFacts0048
   * @tc.desc      Context dir preferencesDir no spaces in path
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0048', 'preferencesDir no spaces in path');
    const context: common.Context = entryContext();
    const dir: string = context.preferencesDir;
    expect(dir.indexOf(' ')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0049
   * @tc.name      testDirectoryFacts0049
   * @tc.desc      Context dir preferencesDir exists on disk
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0049', 'preferencesDir exists on disk');
    const context: common.Context = entryContext();
    const dir: string = context.preferencesDir;
    expect(fs.accessSync(dir)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0050
   * @tc.name      testDirectoryFacts0050
   * @tc.desc      Context dir preferencesDir is a directory
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0050', 'preferencesDir is a directory');
    const context: common.Context = entryContext();
    const dir: string = context.preferencesDir;
    expect(fs.statSync(dir).isDirectory()).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0051
   * @tc.name      testDirectoryFacts0051
   * @tc.desc      Context dir distributedFilesDir is absolute
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0051', 'distributedFilesDir is absolute');
    const context: common.Context = entryContext();
    const dir: string = context.distributedFilesDir;
    expect(dir.startsWith('/')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0052
   * @tc.name      testDirectoryFacts0052
   * @tc.desc      Context dir distributedFilesDir has no double slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0052', 'distributedFilesDir has no double slash');
    const context: common.Context = entryContext();
    const dir: string = context.distributedFilesDir;
    expect(dir.indexOf('//')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0053
   * @tc.name      testDirectoryFacts0053
   * @tc.desc      Context dir distributedFilesDir no trailing slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0053', 'distributedFilesDir no trailing slash');
    const context: common.Context = entryContext();
    const dir: string = context.distributedFilesDir;
    expect(dir.endsWith('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0054
   * @tc.name      testDirectoryFacts0054
   * @tc.desc      Context dir distributedFilesDir longer than segment
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0054', 'distributedFilesDir longer than segment');
    const context: common.Context = entryContext();
    const dir: string = context.distributedFilesDir;
    expect(dir.length > 'distributedfiles'.length + 1).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0055
   * @tc.name      testDirectoryFacts0055
   * @tc.desc      Context dir distributedFilesDir stable across two reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0055', 'distributedFilesDir stable across two reads');
    const context: common.Context = entryContext();
    const dir: string = context.distributedFilesDir;
    expect(context.distributedFilesDir).assertEqual(dir);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0056
   * @tc.name      testDirectoryFacts0056
   * @tc.desc      Context dir distributedFilesDir as a directory entry
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0056', 'distributedFilesDir as a directory entry');
    const context: common.Context = entryContext();
    const dir: string = context.distributedFilesDir;
    const name: string = dir.substring(dir.lastIndexOf('/') + 1);
    expect(name.length > 0).assertTrue();
    expect(name.includes('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0057
   * @tc.name      testDirectoryFacts0057
   * @tc.desc      Context dir distributedFilesDir parent resolves
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0057', 'distributedFilesDir parent resolves');
    const context: common.Context = entryContext();
    const dir: string = context.distributedFilesDir;
    const parent: string = dir.substring(0, dir.lastIndexOf('/'));
    expect(parent.length > 0).assertTrue();
    expect(fs.accessSync(parent)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0058
   * @tc.name      testDirectoryFacts0058
   * @tc.desc      Context dir distributedFilesDir no spaces in path
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0058', 'distributedFilesDir no spaces in path');
    const context: common.Context = entryContext();
    const dir: string = context.distributedFilesDir;
    expect(dir.indexOf(' ')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0059
   * @tc.name      testDirectoryFacts0059
   * @tc.desc      Context dir distributedFilesDir exists on disk
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0059', 'distributedFilesDir exists on disk');
    const context: common.Context = entryContext();
    const dir: string = context.distributedFilesDir;
    expect(fs.accessSync(dir)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0060
   * @tc.name      testDirectoryFacts0060
   * @tc.desc      Context dir distributedFilesDir is a directory
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0060', 'distributedFilesDir is a directory');
    const context: common.Context = entryContext();
    const dir: string = context.distributedFilesDir;
    expect(fs.statSync(dir).isDirectory()).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0061
   * @tc.name      testDirectoryFacts0061
   * @tc.desc      Context dir cloudFileDir is absolute
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0061', 'cloudFileDir is absolute');
    const context: common.Context = entryContext();
    const dir: string = context.cloudFileDir;
    expect(dir.startsWith('/')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0062
   * @tc.name      testDirectoryFacts0062
   * @tc.desc      Context dir cloudFileDir has no double slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0062', 'cloudFileDir has no double slash');
    const context: common.Context = entryContext();
    const dir: string = context.cloudFileDir;
    expect(dir.indexOf('//')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0063
   * @tc.name      testDirectoryFacts0063
   * @tc.desc      Context dir cloudFileDir no trailing slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0063', 'cloudFileDir no trailing slash');
    const context: common.Context = entryContext();
    const dir: string = context.cloudFileDir;
    expect(dir.endsWith('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0064
   * @tc.name      testDirectoryFacts0064
   * @tc.desc      Context dir cloudFileDir longer than segment
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0064', 'cloudFileDir longer than segment');
    const context: common.Context = entryContext();
    const dir: string = context.cloudFileDir;
    expect(dir.length > 'cloud'.length + 1).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0065
   * @tc.name      testDirectoryFacts0065
   * @tc.desc      Context dir cloudFileDir stable across two reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0065', 'cloudFileDir stable across two reads');
    const context: common.Context = entryContext();
    const dir: string = context.cloudFileDir;
    expect(context.cloudFileDir).assertEqual(dir);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0066
   * @tc.name      testDirectoryFacts0066
   * @tc.desc      Context dir cloudFileDir as a directory entry
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0066', 'cloudFileDir as a directory entry');
    const context: common.Context = entryContext();
    const dir: string = context.cloudFileDir;
    const name: string = dir.substring(dir.lastIndexOf('/') + 1);
    expect(name.length > 0).assertTrue();
    expect(name.includes('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0067
   * @tc.name      testDirectoryFacts0067
   * @tc.desc      Context dir cloudFileDir parent resolves
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0067', 'cloudFileDir parent resolves');
    const context: common.Context = entryContext();
    const dir: string = context.cloudFileDir;
    const parent: string = dir.substring(0, dir.lastIndexOf('/'));
    expect(parent.length > 0).assertTrue();
    expect(fs.accessSync(parent)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0068
   * @tc.name      testDirectoryFacts0068
   * @tc.desc      Context dir cloudFileDir no spaces in path
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0068', 'cloudFileDir no spaces in path');
    const context: common.Context = entryContext();
    const dir: string = context.cloudFileDir;
    expect(dir.indexOf(' ')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0069
   * @tc.name      testDirectoryFacts0069
   * @tc.desc      Context dir bundleCodeDir is absolute
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0069', 'bundleCodeDir is absolute');
    const context: common.Context = entryContext();
    const dir: string = context.bundleCodeDir;
    expect(dir.startsWith('/')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0070
   * @tc.name      testDirectoryFacts0070
   * @tc.desc      Context dir bundleCodeDir has no double slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0070', 'bundleCodeDir has no double slash');
    const context: common.Context = entryContext();
    const dir: string = context.bundleCodeDir;
    expect(dir.indexOf('//')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0071
   * @tc.name      testDirectoryFacts0071
   * @tc.desc      Context dir bundleCodeDir no trailing slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0071', 'bundleCodeDir no trailing slash');
    const context: common.Context = entryContext();
    const dir: string = context.bundleCodeDir;
    expect(dir.endsWith('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0072
   * @tc.name      testDirectoryFacts0072
   * @tc.desc      Context dir bundleCodeDir longer than segment
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0072', 'bundleCodeDir longer than segment');
    const context: common.Context = entryContext();
    const dir: string = context.bundleCodeDir;
    expect(dir.length > 'bundle'.length + 1).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0073
   * @tc.name      testDirectoryFacts0073
   * @tc.desc      Context dir bundleCodeDir stable across two reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0073', 'bundleCodeDir stable across two reads');
    const context: common.Context = entryContext();
    const dir: string = context.bundleCodeDir;
    expect(context.bundleCodeDir).assertEqual(dir);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0074
   * @tc.name      testDirectoryFacts0074
   * @tc.desc      Context dir bundleCodeDir as a directory entry
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDirectoryFacts0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDirectoryFacts0074', 'bundleCodeDir as a directory entry');
    const context: common.Context = entryContext();
    const dir: string = context.bundleCodeDir;
    const name: string = dir.substring(dir.lastIndexOf('/') + 1);
    expect(name.length > 0).assertTrue();
    expect(name.includes('/')).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0075
   * @tc.name      testDirectoryFacts0075
   * @tc.desc      Context dir bundleCodeDir parent resolves
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0075', 'bundleCodeDir parent resolves');
    const context: common.Context = entryContext();
    const dir: string = context.bundleCodeDir;
    const parent: string = dir.substring(0, dir.lastIndexOf('/'));
    expect(parent.length > 0).assertTrue();
    expect(fs.accessSync(parent)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0076
   * @tc.name      testDirectoryFacts0076
   * @tc.desc      Context dir bundleCodeDir no spaces in path
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0076', 'bundleCodeDir no spaces in path');
    const context: common.Context = entryContext();
    const dir: string = context.bundleCodeDir;
    expect(dir.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0078
   * @tc.name      testDirectoryFacts0078
   * @tc.desc      Context dir resourceDir has no double slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0078', 'resourceDir has no double slash');
    const context: common.Context = entryContext();
    const dir: string = context.resourceDir;
    expect(dir.indexOf('//')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0079
   * @tc.name      testDirectoryFacts0079
   * @tc.desc      Context dir resourceDir no trailing slash
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0079', 'resourceDir no trailing slash');
    const context: common.Context = entryContext();
    const dir: string = context.resourceDir;
    expect(dir.endsWith('/')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0081
   * @tc.name      testDirectoryFacts0081
   * @tc.desc      Context dir resourceDir stable across two reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0081', 'resourceDir stable across two reads');
    const context: common.Context = entryContext();
    const dir: string = context.resourceDir;
    expect(context.resourceDir).assertEqual(dir);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0084
   * @tc.name      testDirectoryFacts0084
   * @tc.desc      Context dir resourceDir no spaces in path
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDirectoryFacts0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDirectoryFacts0084', 'resourceDir no spaces in path');
    const context: common.Context = entryContext();
    const dir: string = context.resourceDir;
    expect(dir.indexOf(' ')).assertEqual(-1);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIRF_0085
   * @tc.name      testDirectoryFacts0085
   * @tc.desc      Module context exposes absolute root
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDirectoryFacts0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDirectoryFacts0085', 'context absolute root');
    const context: common.Context = entryContext();
    expect(context.filesDir.startsWith('/data')).assertTrue();
  });
  });
}
