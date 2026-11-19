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

import { afterAll, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { common, startupManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  EmployeeRow, ensureEntryStarted, entryFileSize, getAppContext, getKvString,
  queryEmployees, readEntryFile, resetBaseline
} from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartup]';

export default function startupDataExtendedTest(): void {
  describe('AppStartupStartupDataExtendedTest', () => {
    beforeAll(async (done: Function) => {
      await ensureEntryStarted();
      await resetBaseline();
      done();
    })

    afterAll(async (done: Function) => {
      await resetBaseline();
      done();
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_EXTENDED_0001
     * @tc.name      testStartupDataExtended0001
     * @tc.desc      应用级 nativeLibraryPath 为 /data/storage/el1/bundle/libs/arm
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupDataExtended0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0001 begin');
      const appPath: string = getAppContext().applicationInfo.nativeLibraryPath;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 appPath=${appPath}`);
      expect(appPath).assertEqual('/data/storage/el1/bundle/libs/arm');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 appPath.length=${appPath.length}`);
      expect(appPath.length).assertEqual(33);
      const actual3: boolean = appPath.endsWith('/arm');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0001 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_EXTENDED_0002
     * @tc.name      testStartupDataExtended0002
     * @tc.desc      EntryAbility Context 的 nativeLibraryPath 与应用级一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataExtended0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0002 begin');
      const ctx: common.UIAbilityContext = await ensureEntryStarted();
      const entryPath: string = ctx.applicationInfo.nativeLibraryPath;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 entryPath=${entryPath}`);
      expect(entryPath).assertEqual('/data/storage/el1/bundle/libs/arm');
      const appCtxPath: string = ctx.getApplicationContext().applicationInfo.nativeLibraryPath;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 appCtxPath=${appCtxPath}`);
      expect(appCtxPath).assertEqual(entryPath);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.abilityInfo.moduleName=${ctx.abilityInfo.moduleName}`);
      expect(ctx.abilityInfo.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0002 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_EXTENDED_0003
     * @tc.name      testStartupDataExtended0003
     * @tc.desc      EMPLOYEE 表至少包含 Lisa 这一行，且 id 自增大于 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataExtended0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0003 begin');
      const rows: EmployeeRow[] = await queryEmployees();
      const actual1: boolean = rows.length >= 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = rows[rows.length - 1].id > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = rows[rows.length - 1].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('Lisa');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0003 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_EXTENDED_0004
     * @tc.name      testStartupDataExtended0004
     * @tc.desc      读取键 空串 按业务规则返回业务值或 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataExtended0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0004 begin');
      const value: string = await getKvString('');
      const actual1: string = typeof value;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = value === 'string:value_test_string' || value.startsWith('code:');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = value.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0004 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_EXTENDED_0005
     * @tc.name      testStartupDataExtended0005
     * @tc.desc      读取键 "KEY_TEST_STRING" 按业务规则返回业务值或 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataExtended0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0005 begin');
      const value: string = await getKvString('KEY_TEST_STRING');
      const actual1: string = typeof value;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = value === 'string:value_test_string' || value.startsWith('code:');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = value.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0005 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_EXTENDED_0006
     * @tc.name      testStartupDataExtended0006
     * @tc.desc      读取键 "value_test_string" 按业务规则返回业务值或 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataExtended0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0006 begin');
      const value: string = await getKvString('value_test_string');
      const actual1: string = typeof value;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = value === 'string:value_test_string' || value.startsWith('code:');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = value.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0006 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_EXTENDED_0007
     * @tc.name      testStartupDataExtended0007
     * @tc.desc      读取键 "key_test" 按业务规则返回业务值或 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataExtended0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0007 begin');
      const value: string = await getKvString('key_test');
      const actual1: string = typeof value;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = value === 'string:value_test_string' || value.startsWith('code:');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = value.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0007 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_EXTENDED_0008
     * @tc.name      testStartupDataExtended0008
     * @tc.desc      读取键 "no_such" 按业务规则返回业务值或 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataExtended0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0008 begin');
      const value: string = await getKvString('no_such');
      const actual1: string = typeof value;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = value === 'string:value_test_string' || value.startsWith('code:');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = value.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0008 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_EXTENDED_0009
     * @tc.name      testStartupDataExtended0009
     * @tc.desc      读取键 "key_test_string　" 按业务规则返回业务值或 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataExtended0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0009 begin');
      const value: string = await getKvString('key_test_string　');
      const actual1: string = typeof value;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = value === 'string:value_test_string' || value.startsWith('code:');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = value.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0009 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_EXTENDED_0010
     * @tc.name      testStartupDataExtended0010
     * @tc.desc      EntryAbility filesDir 下 test.txt 与 destFile.txt 大小相同且等于 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataExtended0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0010 begin');
      const actual1: number = entryFileSize('test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(36);
      const actual2: number = entryFileSize('destFile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(36);
      const actual3: string | number | boolean = entryFileSize('test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(entryFileSize('destFile.txt'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0010 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_EXTENDED_0011
     * @tc.name      testStartupDataExtended0011
     * @tc.desc      读取文件全部内容后其长度等于 FILE_CONTENT 长度
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataExtended0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0011 begin');
      const content: string = readEntryFile('test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 content=${content}`);
      expect(content).assertEqual('test StartupTask_003 file write data');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 content.length=${content.length}`);
      expect(content.length).assertEqual(36);
      const actual3: string | number | boolean = readEntryFile('destFile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataExtended0011 end');
    })
  })
}
