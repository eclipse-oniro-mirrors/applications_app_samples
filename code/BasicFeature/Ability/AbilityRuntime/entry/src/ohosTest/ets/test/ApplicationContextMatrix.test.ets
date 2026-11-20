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
import {
  AbilityLifecycleCallback,
  appManager,
  ApplicationStateChangeCallback,
  bundleManager,
  common,
  contextConstant,
  EnvironmentCallback
} from '@kit.AbilityKit';
import { process } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getAppContext, settle } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';

function appContext(): common.ApplicationContext {
  return getAppContext().getApplicationContext();
}

function processByCallback(ctx: common.ApplicationContext): Promise<appManager.ProcessInformation[]> {
  return new Promise<appManager.ProcessInformation[]>((resolve: (value: appManager.ProcessInformation[]) => void,
    reject: (reason: BusinessError) => void) => {
    ctx.getRunningProcessInformation((err: BusinessError, data: appManager.ProcessInformation[]) =>
      settle(resolve, reject, err, data));
  });
}

/** 与 AbilityLifecycleAbility 里的回调一样：所有回调都要实现才能注册，这里只记录名字。 */
function newLifecycleCallback(record: string[]): AbilityLifecycleCallback {
  return {
    onAbilityCreate() {
      record.push('create');
    },
    onWindowStageCreate() {
      record.push('windowStageCreate');
    },
    onWindowStageActive() {
      record.push('windowStageActive');
    },
    onWindowStageInactive() {
      record.push('windowStageInactive');
    },
    onWindowStageDestroy() {
      record.push('windowStageDestroy');
    },
    onAbilityDestroy() {
      record.push('destroy');
    },
    onAbilityForeground() {
      record.push('foreground');
    },
    onAbilityBackground() {
      record.push('background');
    },
    onAbilityContinue() {
      record.push('continue');
    }
  };
}

function newEnvironmentCallback(record: string[]): EnvironmentCallback {
  return {
    onConfigurationUpdated() {
      record.push('configuration');
    },
    onMemoryLevel() {
      record.push('memory');
    }
  };
}

export default function applicationContextMatrixTest(): void {
  describe('AbilityRuntimeApplicationContextMatrixTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0001
     * @tc.name      testAppContextMatrix0001
     * @tc.desc      getCurrentAppCloneIndex：主应用（非分身）返回 0，与 applicationInfo.appIndex 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppContextMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0001 begin');
      const ctx: common.ApplicationContext = appContext();
      const index: number = ctx.getCurrentAppCloneIndex();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 index=${index}`);
      expect(index).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 ctx.applicationInfo.appIndex=${ctx.applicationInfo.appIndex}`);
      expect(ctx.applicationInfo.appIndex).assertEqual(0);
      const actual3: string = typeof index;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0002
     * @tc.name      testAppContextMatrix0002
     * @tc.desc      getCurrentAppCloneIndex 连续调用结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0002 begin');
      const ctx: common.ApplicationContext = appContext();
      const actual1: number = ctx.getCurrentAppCloneIndex();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: number = ctx.getCurrentAppCloneIndex();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = appContext().getCurrentAppCloneIndex();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0003
     * @tc.name      testAppContextMatrix0003
     * @tc.desc      应用配置的是 appClone 而非多实例，getCurrentInstanceKey 抛 16000078
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0003 begin');
      const ctx: common.ApplicationContext = appContext();
      const actual1: number = ctx.applicationInfo.multiAppMode.maxCount;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(5);
      let code: number = 0;
      let thrown: boolean = false;
      try {
        ctx.getCurrentInstanceKey();
      } catch (error) {
        thrown = true;
        code = (error as BusinessError).code;
        expect(code).assertEqual(16000078);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 thrown=${thrown}`);
      expect(thrown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 code=${code}`);
      expect(code).assertEqual(16000078);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0004
     * @tc.name      testAppContextMatrix0004
     * @tc.desc      应用配置的是 appClone 而非多实例，getAllRunningInstanceKeys 以 16000078 拒绝
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0004 begin');
      const ctx: common.ApplicationContext = appContext();
      const actual1: string | number | boolean = ctx.applicationInfo.multiAppMode.multiAppModeType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(bundleManager.MultiAppModeType.APP_CLONE);
      let code: number = 0;
      try {
        await ctx.getAllRunningInstanceKeys();
      } catch (error) {
        code = (error as BusinessError).code;
        expect(code).assertEqual(16000078);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(16000078);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0005
     * @tc.name      testAppContextMatrix0005
     * @tc.desc      ApplicationContext 的 applicationInfo 指向本应用，分身配置为 appClone/5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppContextMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0005 begin');
      const ctx: common.ApplicationContext = appContext();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 ctx.applicationInfo.name=${ctx.applicationInfo.name}`);
      expect(ctx.applicationInfo.name).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = ctx.applicationInfo.multiAppMode.multiAppModeType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(bundleManager.MultiAppModeType.APP_CLONE);
      const actual3: number = ctx.applicationInfo.multiAppMode.maxCount;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0006
     * @tc.name      testAppContextMatrix0006
     * @tc.desc      ApplicationContext 再取 getApplicationContext 仍是同一应用，默认加密分区为 EL2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0006 begin');
      const ctx: common.ApplicationContext = appContext();
      const again: common.ApplicationContext = ctx.getApplicationContext();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 again.applicationInfo.name=${again.applicationInfo.name}`);
      expect(again.applicationInfo.name).assertEqual(ctx.applicationInfo.name);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 again.filesDir=${again.filesDir}`);
      expect(again.filesDir).assertEqual(ctx.filesDir);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.area=${ctx.area}`);
      expect(ctx.area).assertEqual(contextConstant.AreaMode.EL2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0007
     * @tc.name      testAppContextMatrix0007
     * @tc.desc      ApplicationContext 的资源管理器能读到 AppScope 的 app_name 与 entry 的 main_title
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0007 begin');
      const ctx: common.ApplicationContext = appContext();
      const actual1: string = ctx.resourceManager.getStringByNameSync('app_name');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('AbilityRuntime');
      const actual2: boolean = ctx.resourceManager.getStringByNameSync('main_title').length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = ctx.resourceManager.getStringByNameSync('EntryAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0008
     * @tc.name      testAppContextMatrix0008
     * @tc.desc      getRunningProcessInformation(promise) 返回本进程，进程名为包名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppContextMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0008 begin');
      const ctx: common.ApplicationContext = appContext();
      const list: appManager.ProcessInformation[] = await ctx.getRunningProcessInformation();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 list.length=${list.length}`);
      expect(list.length).assertEqual(1);
      const actual2: string | number | boolean = list[0].pid;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.pid);
      const actual3: string = list[0].processName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0009
     * @tc.name      testAppContextMatrix0009
     * @tc.desc      getRunningProcessInformation(callback) 与 promise 结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0009 begin');
      const ctx: common.ApplicationContext = appContext();
      const byCallback: appManager.ProcessInformation[] = await processByCallback(ctx);
      const byPromise: appManager.ProcessInformation[] = await ctx.getRunningProcessInformation();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 byCallback.length=${byCallback.length}`);
      expect(byCallback.length).assertEqual(byPromise.length);
      const actual2: string | number | boolean = byCallback[0].pid;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(byPromise[0].pid);
      const actual3: string = byCallback[0].bundleNames.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0010
     * @tc.name      testAppContextMatrix0010
     * @tc.desc      默认 EL2 下 ApplicationContext.filesDir 为 /data/storage/el2/base/files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppContextMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0010 begin');
      const ctx: common.ApplicationContext = appContext();
      const dir: string = ctx.filesDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el2/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(28);
      const actual3: boolean = dir.startsWith('/data/storage/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0011
     * @tc.name      testAppContextMatrix0011
     * @tc.desc      默认 EL2 下 ApplicationContext.cacheDir 为 /data/storage/el2/base/cache
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppContextMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0011 begin');
      const ctx: common.ApplicationContext = appContext();
      const dir: string = ctx.cacheDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el2/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(28);
      const actual3: boolean = dir.startsWith('/data/storage/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0012
     * @tc.name      testAppContextMatrix0012
     * @tc.desc      默认 EL2 下 ApplicationContext.tempDir 为 /data/storage/el2/base/temp
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0012 begin');
      const ctx: common.ApplicationContext = appContext();
      const dir: string = ctx.tempDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el2/base/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(27);
      const actual3: boolean = dir.startsWith('/data/storage/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0013
     * @tc.name      testAppContextMatrix0013
     * @tc.desc      默认 EL2 下 ApplicationContext.preferencesDir 为 /data/storage/el2/base/preferences
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0013 begin');
      const ctx: common.ApplicationContext = appContext();
      const dir: string = ctx.preferencesDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el2/base/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(34);
      const actual3: boolean = dir.startsWith('/data/storage/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0014
     * @tc.name      testAppContextMatrix0014
     * @tc.desc      默认 EL2 下 ApplicationContext.databaseDir 为 /data/storage/el2/database
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0014 begin');
      const ctx: common.ApplicationContext = appContext();
      const dir: string = ctx.databaseDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el2/database');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(26);
      const actual3: boolean = dir.startsWith('/data/storage/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0015
     * @tc.name      testAppContextMatrix0015
     * @tc.desc      默认 EL2 下 ApplicationContext.distributedFilesDir 为 /data/storage/el2/distributedfiles
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0015 begin');
      const ctx: common.ApplicationContext = appContext();
      const dir: string = ctx.distributedFilesDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el2/distributedfiles');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(34);
      const actual3: boolean = dir.startsWith('/data/storage/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0016
     * @tc.name      testAppContextMatrix0016
     * @tc.desc      默认 EL2 下 ApplicationContext.cloudFileDir 为 /data/storage/el2/cloud
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0016 begin');
      const ctx: common.ApplicationContext = appContext();
      const dir: string = ctx.cloudFileDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el2/cloud');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(23);
      const actual3: boolean = dir.startsWith('/data/storage/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0017
     * @tc.name      testAppContextMatrix0017
     * @tc.desc      默认 EL2 下 ApplicationContext.bundleCodeDir 为 /data/storage/el1/bundle
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0017 begin');
      const ctx: common.ApplicationContext = appContext();
      const dir: string = ctx.bundleCodeDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/bundle');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir.length=${dir.length}`);
      expect(dir.length).assertEqual(24);
      const actual3: boolean = dir.startsWith('/data/storage/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0018
     * @tc.name      testAppContextMatrix0018
     * @tc.desc      area 切到 EL1 后 filesDir 为 /data/storage/el1/base/files，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0018 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.filesDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.filesDir=${ctx.filesDir}`);
      expect(ctx.filesDir).assertEqual('/data/storage/el2/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0019
     * @tc.name      testAppContextMatrix0019
     * @tc.desc      area 切到 EL1 后 cacheDir 为 /data/storage/el1/base/cache，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0019 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.cacheDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.cacheDir=${ctx.cacheDir}`);
      expect(ctx.cacheDir).assertEqual('/data/storage/el2/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0020
     * @tc.name      testAppContextMatrix0020
     * @tc.desc      area 切到 EL1 后 tempDir 为 /data/storage/el1/base/temp，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0020 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.tempDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/base/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.tempDir=${ctx.tempDir}`);
      expect(ctx.tempDir).assertEqual('/data/storage/el2/base/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0021
     * @tc.name      testAppContextMatrix0021
     * @tc.desc      area 切到 EL1 后 preferencesDir 为 /data/storage/el1/base/preferences，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0021 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.preferencesDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/base/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.preferencesDir=${ctx.preferencesDir}`);
      expect(ctx.preferencesDir).assertEqual('/data/storage/el2/base/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0022
     * @tc.name      testAppContextMatrix0022
     * @tc.desc      area 切到 EL1 后 databaseDir 为 /data/storage/el1/database，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0022 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.databaseDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/database');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.databaseDir=${ctx.databaseDir}`);
      expect(ctx.databaseDir).assertEqual('/data/storage/el2/database');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0023
     * @tc.name      testAppContextMatrix0023
     * @tc.desc      area 切到 EL1 后 distributedFilesDir 为 /data/storage/el1/distributedfiles，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0023 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.distributedFilesDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/distributedfiles');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.distributedFilesDir=${ctx.distributedFilesDir}`);
      expect(ctx.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0024
     * @tc.name      testAppContextMatrix0024
     * @tc.desc      area 切到 EL1 后 bundleCodeDir 为 /data/storage/el1/bundle，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0024 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL1;
      const dir: string = ctx.bundleCodeDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/bundle');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.bundleCodeDir=${ctx.bundleCodeDir}`);
      expect(ctx.bundleCodeDir).assertEqual('/data/storage/el1/bundle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0025
     * @tc.name      testAppContextMatrix0025
     * @tc.desc      area 切到 EL3 后 filesDir 为 /data/storage/el3/base/files，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0025 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.filesDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL3);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el3/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.filesDir=${ctx.filesDir}`);
      expect(ctx.filesDir).assertEqual('/data/storage/el2/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0026
     * @tc.name      testAppContextMatrix0026
     * @tc.desc      area 切到 EL3 后 cacheDir 为 /data/storage/el3/base/cache，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0026 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.cacheDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL3);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el3/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.cacheDir=${ctx.cacheDir}`);
      expect(ctx.cacheDir).assertEqual('/data/storage/el2/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0027
     * @tc.name      testAppContextMatrix0027
     * @tc.desc      area 切到 EL3 后 tempDir 为 /data/storage/el3/base/temp，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0027 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.tempDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL3);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el3/base/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.tempDir=${ctx.tempDir}`);
      expect(ctx.tempDir).assertEqual('/data/storage/el2/base/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0028
     * @tc.name      testAppContextMatrix0028
     * @tc.desc      area 切到 EL3 后 preferencesDir 为 /data/storage/el3/base/preferences，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0028 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.preferencesDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL3);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el3/base/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.preferencesDir=${ctx.preferencesDir}`);
      expect(ctx.preferencesDir).assertEqual('/data/storage/el2/base/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0029
     * @tc.name      testAppContextMatrix0029
     * @tc.desc      area 切到 EL3 后 databaseDir 为 /data/storage/el3/database，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0029 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.databaseDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL3);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el3/database');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.databaseDir=${ctx.databaseDir}`);
      expect(ctx.databaseDir).assertEqual('/data/storage/el2/database');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0030
     * @tc.name      testAppContextMatrix0030
     * @tc.desc      area 切到 EL3 后 distributedFilesDir 为 /data/storage/el2/distributedfiles，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0030 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.distributedFilesDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL3);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el2/distributedfiles');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.distributedFilesDir=${ctx.distributedFilesDir}`);
      expect(ctx.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0031
     * @tc.name      testAppContextMatrix0031
     * @tc.desc      area 切到 EL3 后 bundleCodeDir 为 /data/storage/el1/bundle，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0031 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL3;
      const dir: string = ctx.bundleCodeDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL3);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/bundle');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.bundleCodeDir=${ctx.bundleCodeDir}`);
      expect(ctx.bundleCodeDir).assertEqual('/data/storage/el1/bundle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0032
     * @tc.name      testAppContextMatrix0032
     * @tc.desc      area 切到 EL4 后 filesDir 为 /data/storage/el4/base/files，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0032 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.filesDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el4/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.filesDir=${ctx.filesDir}`);
      expect(ctx.filesDir).assertEqual('/data/storage/el2/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0033
     * @tc.name      testAppContextMatrix0033
     * @tc.desc      area 切到 EL4 后 cacheDir 为 /data/storage/el4/base/cache，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0033 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.cacheDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el4/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.cacheDir=${ctx.cacheDir}`);
      expect(ctx.cacheDir).assertEqual('/data/storage/el2/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0034
     * @tc.name      testAppContextMatrix0034
     * @tc.desc      area 切到 EL4 后 tempDir 为 /data/storage/el4/base/temp，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0034 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.tempDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el4/base/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.tempDir=${ctx.tempDir}`);
      expect(ctx.tempDir).assertEqual('/data/storage/el2/base/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0035
     * @tc.name      testAppContextMatrix0035
     * @tc.desc      area 切到 EL4 后 preferencesDir 为 /data/storage/el4/base/preferences，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0035 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.preferencesDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el4/base/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.preferencesDir=${ctx.preferencesDir}`);
      expect(ctx.preferencesDir).assertEqual('/data/storage/el2/base/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0036
     * @tc.name      testAppContextMatrix0036
     * @tc.desc      area 切到 EL4 后 databaseDir 为 /data/storage/el4/database，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0036 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.databaseDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el4/database');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.databaseDir=${ctx.databaseDir}`);
      expect(ctx.databaseDir).assertEqual('/data/storage/el2/database');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0037
     * @tc.name      testAppContextMatrix0037
     * @tc.desc      area 切到 EL4 后 distributedFilesDir 为 /data/storage/el2/distributedfiles，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0037 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.distributedFilesDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el2/distributedfiles');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.distributedFilesDir=${ctx.distributedFilesDir}`);
      expect(ctx.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0038
     * @tc.name      testAppContextMatrix0038
     * @tc.desc      area 切到 EL4 后 bundleCodeDir 为 /data/storage/el1/bundle，切回 EL2 后还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0038 begin');
      const ctx: common.ApplicationContext = appContext();
      ctx.area = contextConstant.AreaMode.EL4;
      const dir: string = ctx.bundleCodeDir;
      const area: contextConstant.AreaMode = ctx.area;
      ctx.area = contextConstant.AreaMode.EL2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 area=${area}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 dir=${dir}`);
      expect(dir).assertEqual('/data/storage/el1/bundle');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 ctx.bundleCodeDir=${ctx.bundleCodeDir}`);
      expect(ctx.bundleCodeDir).assertEqual('/data/storage/el1/bundle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0039
     * @tc.name      testAppContextMatrix0039
     * @tc.desc      eventHub.on 注册后 emit 一次，回调收到参数且只调用一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppContextMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0039 begin');
      const ctx: common.ApplicationContext = appContext();
      const hub: common.EventHub = ctx.eventHub;
      const record: string[] = [];
      const handler = (value: string): void => { record.push(value); };
      hub.on('ar_event_once', handler);
      hub.emit('ar_event_once', 'v1');
      hub.off('ar_event_once', handler);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 record.length=${record.length}`);
      expect(record.length).assertEqual(1);
      const actual2: string = record[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('v1');
      const actual3: string = record.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('v1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0040
     * @tc.name      testAppContextMatrix0040
     * @tc.desc      eventHub.off 指定回调后再 emit 不再触发
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0040 begin');
      const ctx: common.ApplicationContext = appContext();
      const hub: common.EventHub = ctx.eventHub;
      const record: string[] = [];
      const handler = (value: string): void => { record.push(value); };
      hub.on('ar_event_off', handler);
      hub.emit('ar_event_off', 'before');
      hub.off('ar_event_off', handler);
      hub.emit('ar_event_off', 'after');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 record.length=${record.length}`);
      expect(record.length).assertEqual(1);
      const actual2: string = record[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('before');
      const actual3: boolean = record.includes('after');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0041
     * @tc.name      testAppContextMatrix0041
     * @tc.desc      同一事件注册两个回调，emit 一次两个都被调用，顺序与注册顺序相同
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0041 begin');
      const ctx: common.ApplicationContext = appContext();
      const hub: common.EventHub = ctx.eventHub;
      const record: string[] = [];
      const first = (value: string): void => { record.push('first:' + value); };
      const second = (value: string): void => { record.push('second:' + value); };
      hub.on('ar_event_two', first);
      hub.on('ar_event_two', second);
      hub.emit('ar_event_two', 'x');
      hub.off('ar_event_two');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 record.length=${record.length}`);
      expect(record.length).assertEqual(2);
      const actual2: string = record[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('first:x');
      const actual3: string = record[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('second:x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0041 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0042
     * @tc.name      testAppContextMatrix0042
     * @tc.desc      eventHub.off 不带回调时注销该事件的全部回调
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0042 begin');
      const ctx: common.ApplicationContext = appContext();
      const hub: common.EventHub = ctx.eventHub;
      let count: number = 0;
      const first = (): void => { count += 1; };
      const second = (): void => { count += 10; };
      hub.on('ar_event_all', first);
      hub.on('ar_event_all', second);
      hub.emit('ar_event_all');
      hub.off('ar_event_all');
      hub.emit('ar_event_all');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 count=${count}`);
      expect(count).assertEqual(11);
      const actual2: number = count % 10;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: number = Math.floor(count / 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0042 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0043
     * @tc.name      testAppContextMatrix0043
     * @tc.desc      emit 多个参数时回调按顺序收到全部参数
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0043 begin');
      const ctx: common.ApplicationContext = appContext();
      const hub: common.EventHub = ctx.eventHub;
      const record: string[] = [];
      const handler = (a: string, b: number, c: boolean): void => {
        record.push(a);
        record.push(String(b));
        record.push(String(c));
      };
      hub.on('ar_event_args', handler);
      hub.emit('ar_event_args', 'a', 2, true);
      hub.off('ar_event_args', handler);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 record.length=${record.length}`);
      expect(record.length).assertEqual(3);
      const actual2: string = record.join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('a|2|true');
      const actual3: string = record[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0043 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0044
     * @tc.name      testAppContextMatrix0044
     * @tc.desc      没有回调的事件 emit 不抛异常，不同事件名互不影响
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0044 begin');
      const ctx: common.ApplicationContext = appContext();
      const hub: common.EventHub = ctx.eventHub;
      const record: string[] = [];
      const handler = (value: string): void => { record.push(value); };
      hub.on('ar_event_a', handler);
      hub.emit('ar_event_nobody', 'ignored');
      hub.emit('ar_event_a', 'mine');
      hub.off('ar_event_a', handler);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 record.length=${record.length}`);
      expect(record.length).assertEqual(1);
      const actual2: string = record[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('mine');
      const actual3: boolean = record.includes('ignored');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0044 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0045
     * @tc.name      testAppContextMatrix0045
     * @tc.desc      同一事件连续 emit 三次，回调累计三次且顺序正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppContextMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0045 begin');
      const ctx: common.ApplicationContext = appContext();
      const hub: common.EventHub = ctx.eventHub;
      const record: number[] = [];
      const handler = (value: number): void => { record.push(value); };
      hub.on('ar_event_many', handler);
      hub.emit('ar_event_many', 1);
      hub.emit('ar_event_many', 2);
      hub.emit('ar_event_many', 3);
      hub.off('ar_event_many', handler);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 record.length=${record.length}`);
      expect(record.length).assertEqual(3);
      const actual2: string = record.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('1,2,3');
      const actual3: number = record[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0045 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0046
     * @tc.name      testAppContextMatrix0046
     * @tc.desc      on('abilityLifecycle') 返回非负整数 id，off(promise) 注销成功
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppContextMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0046 begin');
      const ctx: common.ApplicationContext = appContext();
      const id: number = ctx.on('abilityLifecycle', newLifecycleCallback([]));
      const actual1: boolean = Number.isInteger(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = id >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      let code: number = 0;
      try {
        await ctx.off('abilityLifecycle', id);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 code=${code}`);
      expect(code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0046 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0047
     * @tc.name      testAppContextMatrix0047
     * @tc.desc      连续两次 on('abilityLifecycle') 得到不同 id，后注册的 id 更大
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0047 begin');
      const ctx: common.ApplicationContext = appContext();
      const first: number = ctx.on('abilityLifecycle', newLifecycleCallback([]));
      const second: number = ctx.on('abilityLifecycle', newLifecycleCallback([]));
      await ctx.off('abilityLifecycle', first);
      await ctx.off('abilityLifecycle', second);
      const actual1: boolean = first === second;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: boolean = second > first;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = first >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0047 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0048
     * @tc.name      testAppContextMatrix0048
     * @tc.desc      off('abilityLifecycle', id, callback) 注销成功，回调里没有错误
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0048 begin');
      const ctx: common.ApplicationContext = appContext();
      const id: number = ctx.on('abilityLifecycle', newLifecycleCallback([]));
      const code: number = await new Promise<number>((resolve: (value: number) => void) => {
        ctx.off('abilityLifecycle', id, (err: BusinessError) => resolve(err ? err.code : 0));
      });
      const actual1: boolean = id >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(0);
      const actual3: boolean = Number.isInteger(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0048 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0049
     * @tc.name      testAppContextMatrix0049
     * @tc.desc      on('environment') 返回非负整数 id，off(promise) 注销成功
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppContextMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0049 begin');
      const ctx: common.ApplicationContext = appContext();
      const id: number = ctx.on('environment', newEnvironmentCallback([]));
      const actual1: boolean = Number.isInteger(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = id >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      let code: number = 0;
      try {
        await ctx.off('environment', id);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 code=${code}`);
      expect(code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0049 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0050
     * @tc.name      testAppContextMatrix0050
     * @tc.desc      连续两次 on('environment') 得到不同 id
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0050 begin');
      const ctx: common.ApplicationContext = appContext();
      const first: number = ctx.on('environment', newEnvironmentCallback([]));
      const second: number = ctx.on('environment', newEnvironmentCallback([]));
      await ctx.off('environment', first);
      await ctx.off('environment', second);
      const actual1: boolean = first === second;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: boolean = first >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = second >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0050 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APPLICATION_CONTEXT_0051
     * @tc.name      testAppContextMatrix0051
     * @tc.desc      on/off('applicationStateChange') 注册与注销都不抛异常
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppContextMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0051 begin');
      const ctx: common.ApplicationContext = appContext();
      const record: string[] = [];
      const callback: ApplicationStateChangeCallback = {
        onApplicationForeground() {
          record.push('foreground');
        },
        onApplicationBackground() {
          record.push('background');
        }
      };
      let thrown: boolean = false;
      try {
        ctx.on('applicationStateChange', callback);
        ctx.off('applicationStateChange', callback);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertFalse();
      const actual2: boolean = record.includes('background');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 record.length=${record.length}`);
      expect(record.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppContextMatrix0051 end');
    })
  })
}
