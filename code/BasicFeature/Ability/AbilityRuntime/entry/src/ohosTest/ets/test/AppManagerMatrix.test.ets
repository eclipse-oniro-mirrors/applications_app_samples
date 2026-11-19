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
import { appManager, bundleManager } from '@kit.AbilityKit';
import { process } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getAppContext, settle } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';

function requireSelf(list: appManager.ProcessInformation[]): appManager.ProcessInformation {
  const self: appManager.ProcessInformation | undefined = list.find(
    (p: appManager.ProcessInformation) => p.pid === process.pid);
  if (self === undefined) {
    throw new Error('current process is not in the list');
  }
  return self;
}

function stabilityByCallback(): Promise<boolean> {
  return new Promise<boolean>((resolve: (value: boolean) => void, reject: (reason: BusinessError) => void) => {
    appManager.isRunningInStabilityTest((err: BusinessError, data: boolean) => settle(resolve, reject, err, data));
  });
}

function ramConstrainedByCallback(): Promise<boolean> {
  return new Promise<boolean>((resolve: (value: boolean) => void, reject: (reason: BusinessError) => void) => {
    appManager.isRamConstrainedDevice((err: BusinessError, data: boolean) => settle(resolve, reject, err, data));
  });
}

function memorySizeByCallback(): Promise<number> {
  return new Promise<number>((resolve: (value: number) => void, reject: (reason: BusinessError) => void) => {
    appManager.getAppMemorySize((err: BusinessError, data: number) => settle(resolve, reject, err, data));
  });
}

function processByCallback(): Promise<appManager.ProcessInformation[]> {
  return new Promise<appManager.ProcessInformation[]>((resolve: (value: appManager.ProcessInformation[]) => void,
    reject: (reason: BusinessError) => void) => {
    appManager.getRunningProcessInformation((err: BusinessError, data: appManager.ProcessInformation[]) =>
      settle(resolve, reject, err, data));
  });
}

export default function appManagerMatrixTest(): void {
  describe('AbilityRuntimeAppManagerMatrixTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0001
     * @tc.name      testAppManagerMatrix0001
     * @tc.desc      isRunningInStabilityTest(promise) 在测试框架下返回 false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppManagerMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0001 begin');
      const value: boolean = await appManager.isRunningInStabilityTest();
      const actual1: string = typeof value;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value=${value}`);
      expect(value).assertFalse();
      const actual3: string | number | boolean = await appManager.isRunningInStabilityTest();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(value);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0002
     * @tc.name      testAppManagerMatrix0002
     * @tc.desc      isRunningInStabilityTest(callback) 与 promise 结果相同
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppManagerMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0002 begin');
      const byCallback: boolean = await stabilityByCallback();
      const byPromise: boolean = await appManager.isRunningInStabilityTest();
      const actual1: string = typeof byCallback;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 byCallback=${byCallback}`);
      expect(byCallback).assertEqual(byPromise);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 byCallback=${byCallback}`);
      expect(byCallback).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0003
     * @tc.name      testAppManagerMatrix0003
     * @tc.desc      isRamConstrainedDevice(promise) 在测试机上返回 false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppManagerMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0003 begin');
      const value: boolean = await appManager.isRamConstrainedDevice();
      const actual1: string = typeof value;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value=${value}`);
      expect(value).assertFalse();
      const actual3: string | number | boolean = await appManager.isRamConstrainedDevice();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(value);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0004
     * @tc.name      testAppManagerMatrix0004
     * @tc.desc      isRamConstrainedDevice(callback) 与 promise 结果相同
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppManagerMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0004 begin');
      const byCallback: boolean = await ramConstrainedByCallback();
      const byPromise: boolean = await appManager.isRamConstrainedDevice();
      const actual1: string = typeof byCallback;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 byCallback=${byCallback}`);
      expect(byCallback).assertEqual(byPromise);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 byCallback=${byCallback}`);
      expect(byCallback).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0005
     * @tc.name      testAppManagerMatrix0005
     * @tc.desc      getAppMemorySize(promise) 返回正整数（单位 MB）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppManagerMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0005 begin');
      const size: number = await appManager.getAppMemorySize();
      const actual1: string = typeof size;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: boolean = Number.isInteger(size);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = size > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0006
     * @tc.name      testAppManagerMatrix0006
     * @tc.desc      getAppMemorySize(callback) 与 promise 结果相同
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppManagerMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0006 begin');
      const byCallback: number = await memorySizeByCallback();
      const byPromise: number = await appManager.getAppMemorySize();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 byCallback=${byCallback}`);
      expect(byCallback).assertEqual(byPromise);
      const actual2: boolean = Number.isInteger(byCallback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = byCallback > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0007
     * @tc.name      testAppManagerMatrix0007
     * @tc.desc      getAppMemorySize 连续调用三次结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppManagerMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0007 begin');
      const first: number = await appManager.getAppMemorySize();
      const second: number = await appManager.getAppMemorySize();
      const third: number = await appManager.getAppMemorySize();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 second=${second}`);
      expect(second).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 third=${third}`);
      expect(third).assertEqual(first);
      const actual3: boolean = first > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0008
     * @tc.name      testAppManagerMatrix0008
     * @tc.desc      getRunningProcessInformation(promise) 里能找到本进程，进程名等于包名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppManagerMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0008 begin');
      const list: appManager.ProcessInformation[] = await appManager.getRunningProcessInformation();
      const self: appManager.ProcessInformation = requireSelf(list);
      const actual1: boolean = list.length >= 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 self.pid=${self.pid}`);
      expect(self.pid).assertEqual(process.pid);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 self.processName=${self.processName}`);
      expect(self.processName).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0009
     * @tc.name      testAppManagerMatrix0009
     * @tc.desc      本进程信息的 uid 与当前进程相同，包名列表只有本应用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppManagerMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0009 begin');
      const list: appManager.ProcessInformation[] = await appManager.getRunningProcessInformation();
      const self: appManager.ProcessInformation = requireSelf(list);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 self.uid=${self.uid}`);
      expect(self.uid).assertEqual(process.uid);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 self.bundleNames.length=${self.bundleNames.length}`);
      expect(self.bundleNames.length).assertEqual(1);
      const actual3: string = self.bundleNames[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0010
     * @tc.name      testAppManagerMatrix0010
     * @tc.desc      本进程是普通应用进程，分身索引为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppManagerMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0010 begin');
      const list: appManager.ProcessInformation[] = await appManager.getRunningProcessInformation();
      const self: appManager.ProcessInformation = requireSelf(list);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 self.bundleType=${self.bundleType}`);
      expect(self.bundleType).assertEqual(bundleManager.BundleType.APP);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 self.appCloneIndex=${self.appCloneIndex}`);
      expect(self.appCloneIndex).assertEqual(0);
      const actual3: boolean = self.bundleNames.includes('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0011
     * @tc.name      testAppManagerMatrix0011
     * @tc.desc      测试运行时本进程持有前台获焦窗口，处于 STATE_ACTIVE 状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppManagerMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0011 begin');
      const list: appManager.ProcessInformation[] = await appManager.getRunningProcessInformation();
      const self: appManager.ProcessInformation = requireSelf(list);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 self.state=${self.state}`);
      expect(self.state).assertEqual(appManager.ProcessState.STATE_ACTIVE);
      const actual2: boolean = self.state === appManager.ProcessState.STATE_DESTROY;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: boolean = self.state === appManager.ProcessState.STATE_BACKGROUND;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0012
     * @tc.name      testAppManagerMatrix0012
     * @tc.desc      三方应用只能看到自己的进程：列表里每一项的 uid 都是本应用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppManagerMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0012 begin');
      const list: appManager.ProcessInformation[] = await appManager.getRunningProcessInformation();
      const self: appManager.ProcessInformation = requireSelf(list);
      const others: appManager.ProcessInformation[] = list.filter(
        (p: appManager.ProcessInformation) => p.uid !== process.uid);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 others.length=${others.length}`);
      expect(others.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 list.length=${list.length}`);
      expect(list.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 self.uid=${self.uid}`);
      expect(self.uid).assertEqual(process.uid);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0013
     * @tc.name      testAppManagerMatrix0013
     * @tc.desc      getRunningProcessInformation(callback) 与 promise 返回同一个进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppManagerMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0013 begin');
      const byCallback: appManager.ProcessInformation[] = await processByCallback();
      const byPromise: appManager.ProcessInformation[] = await appManager.getRunningProcessInformation();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 byCallback.length=${byCallback.length}`);
      expect(byCallback.length).assertEqual(byPromise.length);
      const actual2: string | number | boolean = requireSelf(byCallback).pid;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(requireSelf(byPromise).pid);
      const actual3: string | number | boolean = requireSelf(byCallback).processName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(requireSelf(byPromise).processName);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0014
     * @tc.name      testAppManagerMatrix0014
     * @tc.desc      appManager 与 ApplicationContext 的 getRunningProcessInformation 结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppManagerMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0014 begin');
      const fromManager: appManager.ProcessInformation[] = await appManager.getRunningProcessInformation();
      const fromContext: appManager.ProcessInformation[] =
        await getAppContext().getApplicationContext().getRunningProcessInformation();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 fromContext.length=${fromContext.length}`);
      expect(fromContext.length).assertEqual(fromManager.length);
      const actual2: string | number | boolean = requireSelf(fromContext).pid;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(requireSelf(fromManager).pid);
      const actual3: string | number | boolean = requireSelf(fromContext).uid;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(requireSelf(fromManager).uid);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0015
     * @tc.name      testAppManagerMatrix0015
     * @tc.desc      连续两次查询，本进程 pid 与进程名都不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppManagerMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0015 begin');
      const first: appManager.ProcessInformation = requireSelf(await appManager.getRunningProcessInformation());
      const second: appManager.ProcessInformation = requireSelf(await appManager.getRunningProcessInformation());
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 second.pid=${second.pid}`);
      expect(second.pid).assertEqual(first.pid);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 second.processName=${second.processName}`);
      expect(second.processName).assertEqual(first.processName);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 second.uid=${second.uid}`);
      expect(second.uid).assertEqual(first.uid);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_APP_MANAGER_0016
     * @tc.name      testAppManagerMatrix0016
     * @tc.desc      本进程信息的 pid、uid 都是正整数，uid 属于 100 号用户
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppManagerMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0016 begin');
      const list: appManager.ProcessInformation[] = await appManager.getRunningProcessInformation();
      const self: appManager.ProcessInformation = requireSelf(list);
      const actual1: boolean = self.pid > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = Number.isInteger(self.uid);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: number = Math.floor(self.uid / 200000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppManagerMatrix0016 end');
    })
  })
}
