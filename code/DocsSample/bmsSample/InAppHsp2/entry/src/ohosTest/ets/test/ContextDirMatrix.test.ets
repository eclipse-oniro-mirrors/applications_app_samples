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
import { common } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { appContext, moduleContext, ENTRY_MODULE, LIB_MODULE } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function contextDirMatrixTest() {
  describe('ContextDirMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0001
     * @tc.name      testContextDir0001
     * @tc.desc      Context filesDir is non empty absolute path
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.filesDir;
      logCase('testContextDir0001', 'filesDir length ' + dir.length);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/')).assertTrue();
      expect(dir.indexOf('//')).assertEqual(-1);
      expect(dir.endsWith('/')).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0002
     * @tc.name      testContextDir0002
     * @tc.desc      Context filesDir carries its segment name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.filesDir;
      logCase('testContextDir0002', 'filesDir length ' + dir.length);
      expect(dir.endsWith('files')).assertTrue();
      expect(dir.includes('storage')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
      expect(dir.indexOf(' ')).assertEqual(-1);
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0003
     * @tc.name      testContextDir0003
     * @tc.desc      Context filesDir is stable between reads
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.filesDir;
      logCase('testContextDir0003', 'filesDir length ' + dir.length);
      const again: string = appContext().filesDir;
      expect(again).assertEqual(dir);
      expect(again.length).assertEqual(dir.length);
      expect(again.startsWith('/')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0004
     * @tc.name      testContextDir0004
     * @tc.desc      Context filesDir stays apart from cacheDir
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.filesDir;
      logCase('testContextDir0004', 'filesDir length ' + dir.length);
      const other: string = appContext().cacheDir;
      expect(dir === other).assertFalse();
      expect(dir.length > 10).assertTrue();
      expect(other.length > 10).assertTrue();
      expect(dir.substring(dir.lastIndexOf('/') + 1).length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0005
     * @tc.name      testContextDir0005
     * @tc.desc      Context filesDir matches entry module context
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.filesDir;
      logCase('testContextDir0005', 'filesDir length ' + dir.length);
      const mod: common.Context = moduleContext(ENTRY_MODULE);
      expect(mod.filesDir).assertEqual(dir);
      expect(mod.filesDir.length).assertEqual(dir.length);
      expect(mod.filesDir.startsWith('/')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0006
     * @tc.name      testContextDir0006
     * @tc.desc      Context filesDir tail segment is readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.filesDir;
      logCase('testContextDir0006', 'filesDir length ' + dir.length);
      const tail: string = dir.substring(dir.lastIndexOf('/') + 1);
      expect(tail.length > 0).assertTrue();
      expect(dir.endsWith(tail)).assertTrue();
      expect(tail.indexOf('/')).assertEqual(-1);
      expect(dir.lastIndexOf('/')).assertEqual(dir.length - tail.length - 1);
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0007
     * @tc.name      testContextDir0007
     * @tc.desc      Context filesDir can be joined with a file name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.filesDir;
      logCase('testContextDir0007', 'filesDir length ' + dir.length);
      const joined: string = dir + '/probe_filesDir.tmp';
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.endsWith('probe_filesDir.tmp')).assertTrue();
      expect(joined.indexOf('//')).assertEqual(-1);
      expect(joined.length).assertEqual(dir.length + 1 + 'probe_filesDir.tmp'.length);
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0008
     * @tc.name      testContextDir0008
     * @tc.desc      Context filesDir survives repeated copy
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.filesDir;
      logCase('testContextDir0008', 'filesDir length ' + dir.length);
      const copy: string = dir;
      const copy2: string = copy;
      expect(copy2).assertEqual(dir);
      expect(copy2 === dir).assertTrue();
      expect(copy2.split('/').length).assertEqual(dir.split('/').length);
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0009
     * @tc.name      testContextDir0009
     * @tc.desc      Context cacheDir is non empty absolute path
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.cacheDir;
      logCase('testContextDir0009', 'cacheDir length ' + dir.length);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/')).assertTrue();
      expect(dir.indexOf('//')).assertEqual(-1);
      expect(dir.endsWith('/')).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0010
     * @tc.name      testContextDir0010
     * @tc.desc      Context cacheDir carries its segment name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.cacheDir;
      logCase('testContextDir0010', 'cacheDir length ' + dir.length);
      expect(dir.endsWith('cache')).assertTrue();
      expect(dir.includes('storage')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
      expect(dir.indexOf(' ')).assertEqual(-1);
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0011
     * @tc.name      testContextDir0011
     * @tc.desc      Context cacheDir is stable between reads
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.cacheDir;
      logCase('testContextDir0011', 'cacheDir length ' + dir.length);
      const again: string = appContext().cacheDir;
      expect(again).assertEqual(dir);
      expect(again.length).assertEqual(dir.length);
      expect(again.startsWith('/')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0012
     * @tc.name      testContextDir0012
     * @tc.desc      Context cacheDir stays apart from tempDir
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.cacheDir;
      logCase('testContextDir0012', 'cacheDir length ' + dir.length);
      const other: string = appContext().tempDir;
      expect(dir === other).assertFalse();
      expect(dir.length > 10).assertTrue();
      expect(other.length > 10).assertTrue();
      expect(dir.substring(dir.lastIndexOf('/') + 1).length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0013
     * @tc.name      testContextDir0013
     * @tc.desc      Context cacheDir matches entry module context
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.cacheDir;
      logCase('testContextDir0013', 'cacheDir length ' + dir.length);
      const mod: common.Context = moduleContext(ENTRY_MODULE);
      expect(mod.cacheDir).assertEqual(dir);
      expect(mod.cacheDir.length).assertEqual(dir.length);
      expect(mod.cacheDir.startsWith('/')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0014
     * @tc.name      testContextDir0014
     * @tc.desc      Context cacheDir tail segment is readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.cacheDir;
      logCase('testContextDir0014', 'cacheDir length ' + dir.length);
      const tail: string = dir.substring(dir.lastIndexOf('/') + 1);
      expect(tail.length > 0).assertTrue();
      expect(dir.endsWith(tail)).assertTrue();
      expect(tail.indexOf('/')).assertEqual(-1);
      expect(dir.lastIndexOf('/')).assertEqual(dir.length - tail.length - 1);
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0015
     * @tc.name      testContextDir0015
     * @tc.desc      Context cacheDir can be joined with a file name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.cacheDir;
      logCase('testContextDir0015', 'cacheDir length ' + dir.length);
      const joined: string = dir + '/probe_cacheDir.tmp';
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.endsWith('probe_cacheDir.tmp')).assertTrue();
      expect(joined.indexOf('//')).assertEqual(-1);
      expect(joined.length).assertEqual(dir.length + 1 + 'probe_cacheDir.tmp'.length);
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0016
     * @tc.name      testContextDir0016
     * @tc.desc      Context cacheDir survives repeated copy
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.cacheDir;
      logCase('testContextDir0016', 'cacheDir length ' + dir.length);
      const copy: string = dir;
      const copy2: string = copy;
      expect(copy2).assertEqual(dir);
      expect(copy2 === dir).assertTrue();
      expect(copy2.split('/').length).assertEqual(dir.split('/').length);
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0017
     * @tc.name      testContextDir0017
     * @tc.desc      Context tempDir is non empty absolute path
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.tempDir;
      logCase('testContextDir0017', 'tempDir length ' + dir.length);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/')).assertTrue();
      expect(dir.indexOf('//')).assertEqual(-1);
      expect(dir.endsWith('/')).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0018
     * @tc.name      testContextDir0018
     * @tc.desc      Context tempDir carries its segment name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.tempDir;
      logCase('testContextDir0018', 'tempDir length ' + dir.length);
      expect(dir.endsWith('temp')).assertTrue();
      expect(dir.includes('storage')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
      expect(dir.indexOf(' ')).assertEqual(-1);
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0019
     * @tc.name      testContextDir0019
     * @tc.desc      Context tempDir is stable between reads
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.tempDir;
      logCase('testContextDir0019', 'tempDir length ' + dir.length);
      const again: string = appContext().tempDir;
      expect(again).assertEqual(dir);
      expect(again.length).assertEqual(dir.length);
      expect(again.startsWith('/')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0020
     * @tc.name      testContextDir0020
     * @tc.desc      Context tempDir stays apart from databaseDir
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.tempDir;
      logCase('testContextDir0020', 'tempDir length ' + dir.length);
      const other: string = appContext().databaseDir;
      expect(dir === other).assertFalse();
      expect(dir.length > 10).assertTrue();
      expect(other.length > 10).assertTrue();
      expect(dir.substring(dir.lastIndexOf('/') + 1).length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0021
     * @tc.name      testContextDir0021
     * @tc.desc      Context tempDir matches entry module context
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.tempDir;
      logCase('testContextDir0021', 'tempDir length ' + dir.length);
      const mod: common.Context = moduleContext(ENTRY_MODULE);
      expect(mod.tempDir).assertEqual(dir);
      expect(mod.tempDir.length).assertEqual(dir.length);
      expect(mod.tempDir.startsWith('/')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0022
     * @tc.name      testContextDir0022
     * @tc.desc      Context tempDir tail segment is readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.tempDir;
      logCase('testContextDir0022', 'tempDir length ' + dir.length);
      const tail: string = dir.substring(dir.lastIndexOf('/') + 1);
      expect(tail.length > 0).assertTrue();
      expect(dir.endsWith(tail)).assertTrue();
      expect(tail.indexOf('/')).assertEqual(-1);
      expect(dir.lastIndexOf('/')).assertEqual(dir.length - tail.length - 1);
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0023
     * @tc.name      testContextDir0023
     * @tc.desc      Context tempDir can be joined with a file name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.tempDir;
      logCase('testContextDir0023', 'tempDir length ' + dir.length);
      const joined: string = dir + '/probe_tempDir.tmp';
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.endsWith('probe_tempDir.tmp')).assertTrue();
      expect(joined.indexOf('//')).assertEqual(-1);
      expect(joined.length).assertEqual(dir.length + 1 + 'probe_tempDir.tmp'.length);
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0024
     * @tc.name      testContextDir0024
     * @tc.desc      Context tempDir survives repeated copy
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.tempDir;
      logCase('testContextDir0024', 'tempDir length ' + dir.length);
      const copy: string = dir;
      const copy2: string = copy;
      expect(copy2).assertEqual(dir);
      expect(copy2 === dir).assertTrue();
      expect(copy2.split('/').length).assertEqual(dir.split('/').length);
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0025
     * @tc.name      testContextDir0025
     * @tc.desc      Context databaseDir is non empty absolute path
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.databaseDir;
      logCase('testContextDir0025', 'databaseDir length ' + dir.length);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/')).assertTrue();
      expect(dir.indexOf('//')).assertEqual(-1);
      expect(dir.endsWith('/')).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0026
     * @tc.name      testContextDir0026
     * @tc.desc      Context databaseDir carries its segment name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.databaseDir;
      logCase('testContextDir0026', 'databaseDir length ' + dir.length);
      expect(dir.endsWith('database')).assertTrue();
      expect(dir.includes('storage')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
      expect(dir.indexOf(' ')).assertEqual(-1);
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0027
     * @tc.name      testContextDir0027
     * @tc.desc      Context databaseDir is stable between reads
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.databaseDir;
      logCase('testContextDir0027', 'databaseDir length ' + dir.length);
      const again: string = appContext().databaseDir;
      expect(again).assertEqual(dir);
      expect(again.length).assertEqual(dir.length);
      expect(again.startsWith('/')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0028
     * @tc.name      testContextDir0028
     * @tc.desc      Context databaseDir stays apart from preferencesDir
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.databaseDir;
      logCase('testContextDir0028', 'databaseDir length ' + dir.length);
      const other: string = appContext().preferencesDir;
      expect(dir === other).assertFalse();
      expect(dir.length > 10).assertTrue();
      expect(other.length > 10).assertTrue();
      expect(dir.substring(dir.lastIndexOf('/') + 1).length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0029
     * @tc.name      testContextDir0029
     * @tc.desc      Context databaseDir matches entry module context
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.databaseDir;
      logCase('testContextDir0029', 'databaseDir length ' + dir.length);
      const mod: common.Context = moduleContext(ENTRY_MODULE);
      expect(mod.databaseDir).assertEqual(dir);
      expect(mod.databaseDir.length).assertEqual(dir.length);
      expect(mod.databaseDir.startsWith('/')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CTX_0030
     * @tc.name      testContextDir0030
     * @tc.desc      Context databaseDir tail segment is readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = ctx.databaseDir;
      logCase('testContextDir0030', 'databaseDir length ' + dir.length);
      const tail: string = dir.substring(dir.lastIndexOf('/') + 1);
      expect(tail.length > 0).assertTrue();
      expect(dir.endsWith(tail)).assertTrue();
      expect(tail.indexOf('/')).assertEqual(-1);
      expect(dir.lastIndexOf('/')).assertEqual(dir.length - tail.length - 1);
    });
;
  });
}
