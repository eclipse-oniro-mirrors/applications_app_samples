/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { common, contextConstant } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getAppContext } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';

function appContext(): common.ApplicationContext {
  return getAppContext().getApplicationContext();
}

export default function applicationContextExtendedTest(): void {
  describe('AbilityRuntimeApplicationContextExtendedTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0001
     * @tc.name      testAppContextExtended0001
     * @tc.desc      createModuleContext("entry") 返回模块级 Context 且包名一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppContextExtended0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0001 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      const mod: common.Context = ctx.createModuleContext('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 mod.applicationInfo.name=${mod.applicationInfo.name}`);
      expect(mod.applicationInfo.name).assertEqual('com.samples.abilityruntime');
      const actual2: boolean = mod.resourceManager !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 mod.area=${mod.area}`);
      expect(mod.area).assertEqual(contextConstant.AreaMode.EL2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0002
     * @tc.name      testAppContextExtended0002
     * @tc.desc      createModuleContext("entry_test") 返回模块级 Context 且包名一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppContextExtended0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0002 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      const mod: common.Context = ctx.createModuleContext('entry_test');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 mod.applicationInfo.name=${mod.applicationInfo.name}`);
      expect(mod.applicationInfo.name).assertEqual('com.samples.abilityruntime');
      const actual2: boolean = mod.resourceManager !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 mod.area=${mod.area}`);
      expect(mod.area).assertEqual(contextConstant.AreaMode.EL2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0003
     * @tc.name      testAppContextExtended0003
     * @tc.desc      createModuleContext("noSuchModule") 抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextExtended0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0003 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      let code: number = 0;
      let thrown: boolean = false;
      try {
        ctx.createModuleContext('noSuchModule');
      } catch (error) {
        thrown = true;
        code = (error as BusinessError).code;
        expect(code).assertEqual(401);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0004
     * @tc.name      testAppContextExtended0004
     * @tc.desc      createModuleContext(空串) 抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextExtended0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0004 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      let code: number = 0;
      let thrown: boolean = false;
      try {
        ctx.createModuleContext('');
      } catch (error) {
        thrown = true;
        code = (error as BusinessError).code;
        expect(code).assertEqual(401);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0005
     * @tc.name      testAppContextExtended0005
     * @tc.desc      createModuleContext("ENTRY") 抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextExtended0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0005 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      let code: number = 0;
      let thrown: boolean = false;
      try {
        ctx.createModuleContext('ENTRY');
      } catch (error) {
        thrown = true;
        code = (error as BusinessError).code;
        expect(code).assertEqual(401);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0006
     * @tc.name      testAppContextExtended0006
     * @tc.desc      createAreaModeContext(EL1) 返回的 Context area 为 EL1，filesDir 指向 el1 目录
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextExtended0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0006 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      const modeCtx: common.Context = ctx.createAreaModeContext(contextConstant.AreaMode.EL1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 modeCtx.area=${modeCtx.area}`);
      expect(modeCtx.area).assertEqual(contextConstant.AreaMode.EL1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 modeCtx.filesDir=${modeCtx.filesDir}`);
      expect(modeCtx.filesDir).assertEqual('/data/storage/el1/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 modeCtx.applicationInfo.name=${modeCtx.applicationInfo.name}`);
      expect(modeCtx.applicationInfo.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0007
     * @tc.name      testAppContextExtended0007
     * @tc.desc      createAreaModeContext(EL2) 返回的 Context area 为 EL2，filesDir 指向 el2 目录
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextExtended0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0007 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      const modeCtx: common.Context = ctx.createAreaModeContext(contextConstant.AreaMode.EL2);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 modeCtx.area=${modeCtx.area}`);
      expect(modeCtx.area).assertEqual(contextConstant.AreaMode.EL2);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 modeCtx.filesDir=${modeCtx.filesDir}`);
      expect(modeCtx.filesDir).assertEqual('/data/storage/el2/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 modeCtx.applicationInfo.name=${modeCtx.applicationInfo.name}`);
      expect(modeCtx.applicationInfo.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0008
     * @tc.name      testAppContextExtended0008
     * @tc.desc      isContextOf 判定 ApplicationContext 为应用级 Context，而不是 UIAbility Context
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextExtended0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0008 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      const actual1: boolean = ctx.isContextOf(contextConstant.ContextType.APPLICATION_CONTEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = ctx.isContextOf(contextConstant.ContextType.UIABILITY_CONTEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof ctx.isContextOf(contextConstant.ContextType.APPLICATION_CONTEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0009
     * @tc.name      testAppContextExtended0009
     * @tc.desc      ApplicationContext.processName 为应用进程名且包含包名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0009 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      const actual1: boolean = ctx.processName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = ctx.processName.indexOf('abilityruntime') >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = typeof ctx.processName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0010
     * @tc.name      testAppContextExtended0010
     * @tc.desc      ApplicationContext area 切到 EL1 后 filesDir 为 /data/storage/el1/base/files，切回 EL2 后为
     *               /data/storage/el2/base/files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextExtended0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0010 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.filesDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.filesDir=${ctx.filesDir}`);
      expect(ctx.filesDir).assertEqual('/data/storage/el2/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0011
     * @tc.name      testAppContextExtended0011
     * @tc.desc      ApplicationContext area 切到 EL1 后 cacheDir 为 /data/storage/el1/base/cache，切回 EL2 后为
     *               /data/storage/el2/base/cache
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextExtended0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0011 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.cacheDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.cacheDir=${ctx.cacheDir}`);
      expect(ctx.cacheDir).assertEqual('/data/storage/el2/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0012
     * @tc.name      testAppContextExtended0012
     * @tc.desc      ApplicationContext area 切到 EL1 后 tempDir 为 /data/storage/el1/base/temp，切回 EL2 后为
     *               /data/storage/el2/base/temp
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0012 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.tempDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/base/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.tempDir=${ctx.tempDir}`);
      expect(ctx.tempDir).assertEqual('/data/storage/el2/base/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0013
     * @tc.name      testAppContextExtended0013
     * @tc.desc      ApplicationContext area 切到 EL1 后 preferencesDir 为 /data/storage/el1/base/preferences，切回 EL2 后为
     *               /data/storage/el2/base/preferences
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0013 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.preferencesDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/base/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(34);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.preferencesDir=${ctx.preferencesDir}`);
      expect(ctx.preferencesDir).assertEqual('/data/storage/el2/base/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0014
     * @tc.name      testAppContextExtended0014
     * @tc.desc      ApplicationContext area 切到 EL1 后 databaseDir 为 /data/storage/el1/database，切回 EL2 后为
     *               /data/storage/el2/database
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0014 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.databaseDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/database');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.databaseDir=${ctx.databaseDir}`);
      expect(ctx.databaseDir).assertEqual('/data/storage/el2/database');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0015
     * @tc.name      testAppContextExtended0015
     * @tc.desc      ApplicationContext area 切到 EL1 后 distributedFilesDir 为 /data/storage/el1/distributedfiles，切回 EL2
     *               后为 /data/storage/el2/distributedfiles
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0015 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.distributedFilesDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/distributedfiles');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(34);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.distributedFilesDir=${ctx.distributedFilesDir}`);
      expect(ctx.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0016
     * @tc.name      testAppContextExtended0016
     * @tc.desc      ApplicationContext area 切到 EL1 后 bundleCodeDir 为 /data/storage/el1/bundle，切回 EL2 后为
     *               /data/storage/el1/bundle
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0016 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.bundleCodeDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/bundle');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.bundleCodeDir=${ctx.bundleCodeDir}`);
      expect(ctx.bundleCodeDir).assertEqual('/data/storage/el1/bundle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0017
     * @tc.name      testAppContextExtended0017
     * @tc.desc      ApplicationContext area 切到 EL3 后 filesDir 为 /data/storage/el3/base/files，切回 EL2 后为
     *               /data/storage/el2/base/files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextExtended0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0017 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.filesDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el3/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.filesDir=${ctx.filesDir}`);
      expect(ctx.filesDir).assertEqual('/data/storage/el2/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0018
     * @tc.name      testAppContextExtended0018
     * @tc.desc      ApplicationContext area 切到 EL3 后 cacheDir 为 /data/storage/el3/base/cache，切回 EL2 后为
     *               /data/storage/el2/base/cache
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextExtended0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0018 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.cacheDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el3/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.cacheDir=${ctx.cacheDir}`);
      expect(ctx.cacheDir).assertEqual('/data/storage/el2/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0019
     * @tc.name      testAppContextExtended0019
     * @tc.desc      ApplicationContext area 切到 EL3 后 tempDir 为 /data/storage/el3/base/temp，切回 EL2 后为
     *               /data/storage/el2/base/temp
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0019 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.tempDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el3/base/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.tempDir=${ctx.tempDir}`);
      expect(ctx.tempDir).assertEqual('/data/storage/el2/base/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0020
     * @tc.name      testAppContextExtended0020
     * @tc.desc      ApplicationContext area 切到 EL3 后 preferencesDir 为 /data/storage/el3/base/preferences，切回 EL2 后为
     *               /data/storage/el2/base/preferences
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0020 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.preferencesDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el3/base/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(34);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.preferencesDir=${ctx.preferencesDir}`);
      expect(ctx.preferencesDir).assertEqual('/data/storage/el2/base/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0021
     * @tc.name      testAppContextExtended0021
     * @tc.desc      ApplicationContext area 切到 EL3 后 databaseDir 为 /data/storage/el3/database，切回 EL2 后为
     *               /data/storage/el2/database
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0021 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.databaseDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el3/database');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.databaseDir=${ctx.databaseDir}`);
      expect(ctx.databaseDir).assertEqual('/data/storage/el2/database');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0022
     * @tc.name      testAppContextExtended0022
     * @tc.desc      ApplicationContext area 切到 EL3 后 distributedFilesDir 为 /data/storage/el2/distributedfiles，切回 EL2
     *               后为 /data/storage/el2/distributedfiles
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0022 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.distributedFilesDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el2/distributedfiles');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(34);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.distributedFilesDir=${ctx.distributedFilesDir}`);
      expect(ctx.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0023
     * @tc.name      testAppContextExtended0023
     * @tc.desc      ApplicationContext area 切到 EL3 后 bundleCodeDir 为 /data/storage/el1/bundle，切回 EL2 后为
     *               /data/storage/el1/bundle
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0023 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.bundleCodeDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/bundle');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.bundleCodeDir=${ctx.bundleCodeDir}`);
      expect(ctx.bundleCodeDir).assertEqual('/data/storage/el1/bundle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0024
     * @tc.name      testAppContextExtended0024
     * @tc.desc      ApplicationContext area 切到 EL4 后 filesDir 为 /data/storage/el4/base/files，切回 EL2 后为
     *               /data/storage/el2/base/files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextExtended0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0024 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.filesDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el4/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.filesDir=${ctx.filesDir}`);
      expect(ctx.filesDir).assertEqual('/data/storage/el2/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0025
     * @tc.name      testAppContextExtended0025
     * @tc.desc      ApplicationContext area 切到 EL4 后 cacheDir 为 /data/storage/el4/base/cache，切回 EL2 后为
     *               /data/storage/el2/base/cache
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextExtended0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0025 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.cacheDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el4/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.cacheDir=${ctx.cacheDir}`);
      expect(ctx.cacheDir).assertEqual('/data/storage/el2/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0026
     * @tc.name      testAppContextExtended0026
     * @tc.desc      ApplicationContext area 切到 EL4 后 tempDir 为 /data/storage/el4/base/temp，切回 EL2 后为
     *               /data/storage/el2/base/temp
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0026 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.tempDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el4/base/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.tempDir=${ctx.tempDir}`);
      expect(ctx.tempDir).assertEqual('/data/storage/el2/base/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0027
     * @tc.name      testAppContextExtended0027
     * @tc.desc      ApplicationContext area 切到 EL4 后 preferencesDir 为 /data/storage/el4/base/preferences，切回 EL2 后为
     *               /data/storage/el2/base/preferences
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0027 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.preferencesDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el4/base/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(34);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.preferencesDir=${ctx.preferencesDir}`);
      expect(ctx.preferencesDir).assertEqual('/data/storage/el2/base/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0028
     * @tc.name      testAppContextExtended0028
     * @tc.desc      ApplicationContext area 切到 EL4 后 databaseDir 为 /data/storage/el4/database，切回 EL2 后为
     *               /data/storage/el2/database
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0028 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.databaseDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el4/database');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.databaseDir=${ctx.databaseDir}`);
      expect(ctx.databaseDir).assertEqual('/data/storage/el2/database');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0029
     * @tc.name      testAppContextExtended0029
     * @tc.desc      ApplicationContext area 切到 EL4 后 distributedFilesDir 为 /data/storage/el2/distributedfiles，切回 EL2
     *               后为 /data/storage/el2/distributedfiles
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0029 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.distributedFilesDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el2/distributedfiles');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(34);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.distributedFilesDir=${ctx.distributedFilesDir}`);
      expect(ctx.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0030
     * @tc.name      testAppContextExtended0030
     * @tc.desc      ApplicationContext area 切到 EL4 后 bundleCodeDir 为 /data/storage/el1/bundle，切回 EL2 后为
     *               /data/storage/el1/bundle
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0030 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.bundleCodeDir;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/bundle');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.bundleCodeDir=${ctx.bundleCodeDir}`);
      expect(ctx.bundleCodeDir).assertEqual('/data/storage/el1/bundle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0031
     * @tc.name      testAppContextExtended0031
     * @tc.desc      eventHub.off 指定未注册的回调不抛异常，事件仍能被 emit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextExtended0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0031 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      const hub: common.EventHub = ctx.eventHub;
      let count: number = 0;
      const handler = (): void => { count++; };
      const other = (): void => { count += 10; };
      hub.on('ar_off_missing', handler);
      hub.off('ar_off_missing', other);
      hub.emit('ar_off_missing');
      hub.off('ar_off_missing', handler);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 count=${count}`);
      expect(count).assertEqual(1);
      const actual2: boolean = count > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: number = count % 10;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0032
     * @tc.name      testAppContextExtended0032
     * @tc.desc      eventHub.on 同一个回调多次注册，emit 一次只触发一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0032 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      const hub: common.EventHub = ctx.eventHub;
      let count: number = 0;
      const handler = (): void => { count++; };
      hub.on('ar_dup', handler);
      hub.on('ar_dup', handler);
      hub.emit('ar_dup');
      hub.off('ar_dup', handler);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 count=${count}`);
      expect(count).assertEqual(1);
      const actual2: boolean = count < 2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = count >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_EXTENDED_0033
     * @tc.name      testAppContextExtended0033
     * @tc.desc      eventHub.emit 不带参数时回调收到 undefined 参数
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextExtended0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0033 begin');
      const ctx: common.ApplicationContext = getAppContext().getApplicationContext();
      const hub: common.EventHub = ctx.eventHub;
      let args: number = 0;
      const handler = (a: object): void => { args = a === undefined ? 1 : 2; };
      hub.on('ar_no_arg', handler);
      hub.emit('ar_no_arg');
      hub.off('ar_no_arg', handler);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 args=${args}`);
      expect(args).assertEqual(1);
      const actual2: boolean = args >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = args !== 2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextExtended0033 end');
    })
  })
}
