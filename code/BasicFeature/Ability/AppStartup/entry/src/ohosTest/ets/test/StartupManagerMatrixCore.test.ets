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
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  AUTO_TASK_NAMES, ensureEntryStarted, errorOf, ListenerProbe, listenerConfig, loadEntryModuleContext,
  resetBaseline, resultClass, resultKind, runResult, sleep, TASK_NAMES, taskStates, waitForTask
} from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartup]';
const NOT_FOUND: string = '28800001:startup task or its dependency not found.';

/** 走 run(tasks, context, config) 重载：成功返回 'ok'，失败返回“错误码:错误信息”。 */
async function runWithContext(tasks: string[], context: common.AbilityStageContext): Promise<string> {
  try {
    await startupManager.run(tasks, context, { timeoutMs: 3000 });
    return 'ok';
  } catch (error) {
    return `${(error as BusinessError).code}:${(error as BusinessError).message}`;
  }
}

export default function startupManagerMatrixCoreTest(): void {
  describe('AppStartupStartupManagerMatrixCoreTest', () => {
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
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0001
     * @tc.name      testStartupManagerMatrix0001
     * @tc.desc      基线下 ImageKnifeTask（主线程、excludeFromAutoStart 的手动任务）初始化状态为 false，结果为 401，重复查询结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupManagerMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0001 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(false);
      const actual2: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(false);
      const actual3: string = resultKind('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0001 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0002
     * @tc.name      testStartupManagerMatrix0002
     * @tc.desc      基线下 ResourceManagerTask（主线程、不等待的资源任务）初始化状态为 true，结果为 undefined，重复查询结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupManagerMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0002 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(true);
      const actual2: boolean = startupManager.isStartupTaskInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(true);
      const actual3: string = resultKind('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0002 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0003
     * @tc.name      testStartupManagerMatrix0003
     * @tc.desc      基线下 FileTask（taskPool 中执行的文件任务）初始化状态为 true，结果为 undefined，重复查询结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0003 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(true);
      const actual2: boolean = startupManager.isStartupTaskInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(true);
      const actual3: string = resultKind('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0003 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0004
     * @tc.name      testStartupManagerMatrix0004
     * @tc.desc      基线下 KVStoreTask（依赖 KvManagerUtilTask 的键值库任务）初始化状态为 true，结果为 undefined，重复查询结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0004 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(true);
      const actual2: boolean = startupManager.isStartupTaskInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(true);
      const actual3: string = resultKind('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0004 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0005
     * @tc.name      testStartupManagerMatrix0005
     * @tc.desc      基线下 RdbStoreTask（主线程、等待完成的关系型库任务）初始化状态为 true，结果为 undefined，重复查询结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0005 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(true);
      const actual2: boolean = startupManager.isStartupTaskInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(true);
      const actual3: string = resultKind('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0005 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0006
     * @tc.name      testStartupManagerMatrix0006
     * @tc.desc      基线下 KvManagerUtilTask（主线程、返回 KVManager 的任务）初始化状态为 true，结果为 object，重复查询结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0006 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(true);
      const actual2: boolean = startupManager.isStartupTaskInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(true);
      const actual3: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('object');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0006 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0007
     * @tc.name      testStartupManagerMatrix0007
     * @tc.desc      移除 ImageKnifeTask 的结果后它变为未初始化、取结果抛 401，其余五个任务不受影响
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0007 begin');
      await resetBaseline();
      const actual1: string = await runResult(['ImageKnifeTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult('ImageKnifeTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      const actual4: string = resultKind('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('401');
      const actual5: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('false,true,true,true,true,true');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0007 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0008
     * @tc.name      testStartupManagerMatrix0008
     * @tc.desc      移除 ResourceManagerTask 的结果后它变为未初始化、取结果抛 401，其余五个任务不受影响
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0008 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('ResourceManagerTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = resultKind('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,false,true,true,true,true');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0008 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0009
     * @tc.name      testStartupManagerMatrix0009
     * @tc.desc      移除 FileTask 的结果后它变为未初始化、取结果抛 401，其余五个任务不受影响
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0009 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('FileTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = resultKind('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,false,true,true,true');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0009 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0010
     * @tc.name      testStartupManagerMatrix0010
     * @tc.desc      移除 KVStoreTask 的结果后它变为未初始化、取结果抛 401，其余五个任务不受影响
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0010 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('KVStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = resultKind('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,false,true,true');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0010 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0011
     * @tc.name      testStartupManagerMatrix0011
     * @tc.desc      移除 RdbStoreTask 的结果后它变为未初始化、取结果抛 401，其余五个任务不受影响
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0011 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('RdbStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = resultKind('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,false,true');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0011 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0012
     * @tc.name      testStartupManagerMatrix0012
     * @tc.desc      移除 KvManagerUtilTask 的结果后它变为未初始化、取结果抛 401，其余五个任务不受影响
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0012 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('KvManagerUtilTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,false');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0012 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0013
     * @tc.name      testStartupManagerMatrix0013
     * @tc.desc      ImageKnifeTask 已经是未初始化状态时再次移除抛 401（Failed to remove result.），状态保持 false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0013 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult('ImageKnifeTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      const actual4: string = resultKind('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('401');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0013 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0014
     * @tc.name      testStartupManagerMatrix0014
     * @tc.desc      ResourceManagerTask 已经是未初始化状态时再次移除抛 401（Failed to remove result.），状态保持 false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0014 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('ResourceManagerTask');
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('ResourceManagerTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: boolean = startupManager.isStartupTaskInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = resultKind('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0014 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0015
     * @tc.name      testStartupManagerMatrix0015
     * @tc.desc      FileTask 已经是未初始化状态时再次移除抛 401（Failed to remove result.），状态保持 false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0015 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('FileTask');
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('FileTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: boolean = startupManager.isStartupTaskInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = resultKind('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0015 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0016
     * @tc.name      testStartupManagerMatrix0016
     * @tc.desc      KVStoreTask 已经是未初始化状态时再次移除抛 401（Failed to remove result.），状态保持 false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0016 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KVStoreTask');
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('KVStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = resultKind('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0016 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0017
     * @tc.name      testStartupManagerMatrix0017
     * @tc.desc      RdbStoreTask 已经是未初始化状态时再次移除抛 401（Failed to remove result.），状态保持 false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0017 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('RdbStoreTask');
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('RdbStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: boolean = startupManager.isStartupTaskInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = resultKind('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0017 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0018
     * @tc.name      testStartupManagerMatrix0018
     * @tc.desc      KvManagerUtilTask 已经是未初始化状态时再次移除抛 401（Failed to remove result.），状态保持 false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0018 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KvManagerUtilTask');
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('KvManagerUtilTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0018 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0019
     * @tc.name      testStartupManagerMatrix0019
     * @tc.desc      ImageKnifeTask 未初始化时单独 run [ImageKnifeTask] 成功，状态恢复为 true，结果为 object
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupManagerMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0019 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: string = await runResult(['ImageKnifeTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: string = resultKind('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0019 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0020
     * @tc.name      testStartupManagerMatrix0020
     * @tc.desc      ResourceManagerTask 未初始化时单独 run [ResourceManagerTask] 成功，状态恢复为 true，结果为 undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0020 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('ResourceManagerTask');
      const actual1: string = await runResult(['ResourceManagerTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0020 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0021
     * @tc.name      testStartupManagerMatrix0021
     * @tc.desc      KVStoreTask 未初始化时单独 run [KVStoreTask] 成功，状态恢复为 true，结果为 undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0021 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KVStoreTask');
      const actual1: string = await runResult(['KVStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0021 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0022
     * @tc.name      testStartupManagerMatrix0022
     * @tc.desc      RdbStoreTask 未初始化时单独 run [RdbStoreTask] 成功，状态恢复为 true，结果为 undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0022 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('RdbStoreTask');
      const actual1: string = await runResult(['RdbStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0022 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0023
     * @tc.name      testStartupManagerMatrix0023
     * @tc.desc      KvManagerUtilTask 未初始化时单独 run [KvManagerUtilTask] 成功，状态恢复为 true，结果为 object
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0023 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KvManagerUtilTask');
      const actual1: string = await runResult(['KvManagerUtilTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('object');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0023 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0024
     * @tc.name      testStartupManagerMatrix0024
     * @tc.desc      FileTask 被移除后单独 run [FileTask] 返回成功，taskPool 任务在 run 返回后稍晚重新登记为已初始化
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0024 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('FileTask');
      const actual1: string = await runResult(['FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = await waitForTask('FileTask', 3000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0024 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0025
     * @tc.name      testStartupManagerMatrix0025
     * @tc.desc      FileTask 被移除后与其余自动任务一起 run，同样在 run 返回后稍晚登记为已初始化，回到基线
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0025 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('FileTask');
      const actual1: string = await runResult(AUTO_TASK_NAMES);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = await waitForTask('FileTask', 3000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0025 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0026
     * @tc.name      testStartupManagerMatrix0026
     * @tc.desc      ResourceManagerTask 已初始化时再 run [ResourceManagerTask] 成功且不改变任何任务状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0026 begin');
      await resetBaseline();
      const actual1: string = await runResult(['ResourceManagerTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0026 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0027
     * @tc.name      testStartupManagerMatrix0027
     * @tc.desc      FileTask 已初始化时再 run [FileTask] 成功且不改变任何任务状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0027 begin');
      await resetBaseline();
      const actual1: string = await runResult(['FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0027 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0028
     * @tc.name      testStartupManagerMatrix0028
     * @tc.desc      KVStoreTask 已初始化时再 run [KVStoreTask] 成功且不改变任何任务状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0028 begin');
      await resetBaseline();
      const actual1: string = await runResult(['KVStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0028 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0029
     * @tc.name      testStartupManagerMatrix0029
     * @tc.desc      RdbStoreTask 已初始化时再 run [RdbStoreTask] 成功且不改变任何任务状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0029 begin');
      await resetBaseline();
      const actual1: string = await runResult(['RdbStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0029 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0030
     * @tc.name      testStartupManagerMatrix0030
     * @tc.desc      KvManagerUtilTask 已初始化时再 run [KvManagerUtilTask] 成功且不改变任何任务状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0030 begin');
      await resetBaseline();
      const actual1: string = await runResult(['KvManagerUtilTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('object');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0030 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0031
     * @tc.name      testStartupManagerMatrix0031
     * @tc.desc      任务列表里 ImageKnifeTask 重复两次时 run 照常成功
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0031 begin');
      await resetBaseline();
      const actual1: string = await runResult(['ImageKnifeTask', 'ImageKnifeTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await runResult(['ImageKnifeTask', 'ImageKnifeTask', 'ImageKnifeTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: string = resultKind('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('object');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0031 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0032
     * @tc.name      testStartupManagerMatrix0032
     * @tc.desc      任务列表里 ResourceManagerTask 重复两次时 run 照常成功
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0032 begin');
      await resetBaseline();
      const actual1: string = await runResult(['ResourceManagerTask', 'ResourceManagerTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await runResult(['ResourceManagerTask', 'ResourceManagerTask', 'ResourceManagerTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: string = resultKind('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0032 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0033
     * @tc.name      testStartupManagerMatrix0033
     * @tc.desc      任务列表里 FileTask 重复两次时 run 照常成功
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0033 begin');
      await resetBaseline();
      const actual1: string = await runResult(['FileTask', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await runResult(['FileTask', 'FileTask', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: string = resultKind('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0033 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0034
     * @tc.name      testStartupManagerMatrix0034
     * @tc.desc      任务列表里 KVStoreTask 重复两次时 run 照常成功
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0034 begin');
      await resetBaseline();
      const actual1: string = await runResult(['KVStoreTask', 'KVStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await runResult(['KVStoreTask', 'KVStoreTask', 'KVStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: string = resultKind('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0034 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0035
     * @tc.name      testStartupManagerMatrix0035
     * @tc.desc      任务列表里 RdbStoreTask 重复两次时 run 照常成功
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0035 begin');
      await resetBaseline();
      const actual1: string = await runResult(['RdbStoreTask', 'RdbStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await runResult(['RdbStoreTask', 'RdbStoreTask', 'RdbStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: string = resultKind('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0035 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0036
     * @tc.name      testStartupManagerMatrix0036
     * @tc.desc      任务列表里 KvManagerUtilTask 重复两次时 run 照常成功
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0036 begin');
      await resetBaseline();
      const actual1: string = await runResult(['KvManagerUtilTask', 'KvManagerUtilTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await runResult(['KvManagerUtilTask', 'KvManagerUtilTask', 'KvManagerUtilTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('object');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0036 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0037
     * @tc.name      testStartupManagerMatrix0037
     * @tc.desc      移除 ImageKnifeTask 后带 timeoutMs=1 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0037 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: string = await runResult(['ImageKnifeTask'], { timeoutMs: 1 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: string = resultKind('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0037 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0038
     * @tc.name      testStartupManagerMatrix0038
     * @tc.desc      移除 ResourceManagerTask 后带 timeoutMs=1 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0038 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('ResourceManagerTask');
      const actual1: string = await runResult(['ResourceManagerTask'], { timeoutMs: 1 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0038 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0039
     * @tc.name      testStartupManagerMatrix0039
     * @tc.desc      移除 KVStoreTask 后带 timeoutMs=1 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0039 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KVStoreTask');
      const actual1: string = await runResult(['KVStoreTask'], { timeoutMs: 1 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0039 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0040
     * @tc.name      testStartupManagerMatrix0040
     * @tc.desc      移除 RdbStoreTask 后带 timeoutMs=1 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0040 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('RdbStoreTask');
      const actual1: string = await runResult(['RdbStoreTask'], { timeoutMs: 1 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0040 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0041
     * @tc.name      testStartupManagerMatrix0041
     * @tc.desc      移除 KvManagerUtilTask 后带 timeoutMs=1 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0041 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KvManagerUtilTask');
      const actual1: string = await runResult(['KvManagerUtilTask'], { timeoutMs: 1 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('object');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0041 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0042
     * @tc.name      testStartupManagerMatrix0042
     * @tc.desc      移除 ImageKnifeTask 后带 timeoutMs=100 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0042 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: string = await runResult(['ImageKnifeTask'], { timeoutMs: 100 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: string = resultKind('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0042 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0043
     * @tc.name      testStartupManagerMatrix0043
     * @tc.desc      移除 ResourceManagerTask 后带 timeoutMs=100 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0043 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('ResourceManagerTask');
      const actual1: string = await runResult(['ResourceManagerTask'], { timeoutMs: 100 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0043 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0044
     * @tc.name      testStartupManagerMatrix0044
     * @tc.desc      移除 KVStoreTask 后带 timeoutMs=100 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0044 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KVStoreTask');
      const actual1: string = await runResult(['KVStoreTask'], { timeoutMs: 100 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0044 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0045
     * @tc.name      testStartupManagerMatrix0045
     * @tc.desc      移除 RdbStoreTask 后带 timeoutMs=100 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0045 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('RdbStoreTask');
      const actual1: string = await runResult(['RdbStoreTask'], { timeoutMs: 100 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0045 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0046
     * @tc.name      testStartupManagerMatrix0046
     * @tc.desc      移除 KvManagerUtilTask 后带 timeoutMs=100 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0046 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KvManagerUtilTask');
      const actual1: string = await runResult(['KvManagerUtilTask'], { timeoutMs: 100 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('object');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0046 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0047
     * @tc.name      testStartupManagerMatrix0047
     * @tc.desc      移除 ImageKnifeTask 后带 timeoutMs=3000 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0047 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: string = await runResult(['ImageKnifeTask'], { timeoutMs: 3000 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: string = resultKind('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0047 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0048
     * @tc.name      testStartupManagerMatrix0048
     * @tc.desc      移除 ResourceManagerTask 后带 timeoutMs=3000 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0048 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('ResourceManagerTask');
      const actual1: string = await runResult(['ResourceManagerTask'], { timeoutMs: 3000 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0048 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0049
     * @tc.name      testStartupManagerMatrix0049
     * @tc.desc      移除 KVStoreTask 后带 timeoutMs=3000 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0049 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KVStoreTask');
      const actual1: string = await runResult(['KVStoreTask'], { timeoutMs: 3000 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0049 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0050
     * @tc.name      testStartupManagerMatrix0050
     * @tc.desc      移除 RdbStoreTask 后带 timeoutMs=3000 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0050 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('RdbStoreTask');
      const actual1: string = await runResult(['RdbStoreTask'], { timeoutMs: 3000 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0050 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0051
     * @tc.name      testStartupManagerMatrix0051
     * @tc.desc      移除 KvManagerUtilTask 后带 timeoutMs=3000 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0051 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KvManagerUtilTask');
      const actual1: string = await runResult(['KvManagerUtilTask'], { timeoutMs: 3000 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('object');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0051 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0052
     * @tc.name      testStartupManagerMatrix0052
     * @tc.desc      移除 ImageKnifeTask 后带 timeoutMs=10000 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0052 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: string = await runResult(['ImageKnifeTask'], { timeoutMs: 10000 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: string = resultKind('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0052 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0053
     * @tc.name      testStartupManagerMatrix0053
     * @tc.desc      移除 ResourceManagerTask 后带 timeoutMs=10000 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0053 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('ResourceManagerTask');
      const actual1: string = await runResult(['ResourceManagerTask'], { timeoutMs: 10000 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0053 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0054
     * @tc.name      testStartupManagerMatrix0054
     * @tc.desc      移除 KVStoreTask 后带 timeoutMs=10000 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0054 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KVStoreTask');
      const actual1: string = await runResult(['KVStoreTask'], { timeoutMs: 10000 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0054 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0055
     * @tc.name      testStartupManagerMatrix0055
     * @tc.desc      移除 RdbStoreTask 后带 timeoutMs=10000 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0055 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('RdbStoreTask');
      const actual1: string = await runResult(['RdbStoreTask'], { timeoutMs: 10000 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0055 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0056
     * @tc.name      testStartupManagerMatrix0056
     * @tc.desc      移除 KvManagerUtilTask 后带 timeoutMs=10000 单独 run 仍成功恢复（任务很快完成，不触发超时）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0056 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KvManagerUtilTask');
      const actual1: string = await runResult(['KvManagerUtilTask'], { timeoutMs: 10000 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('object');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0056 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0057
     * @tc.name      testStartupManagerMatrix0057
     * @tc.desc      移除 ImageKnifeTask 后带 startupListener run，await 返回时 onCompleted 已以成功回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0057 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const probe: ListenerProbe = new ListenerProbe();
      const actual2: string = await runResult(['ImageKnifeTask'], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(1);
      const actual5: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0057 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0058
     * @tc.name      testStartupManagerMatrix0058
     * @tc.desc      移除 ResourceManagerTask 后带 startupListener run，await 返回时 onCompleted 已以成功回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0058 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('ResourceManagerTask');
      const probe: ListenerProbe = new ListenerProbe();
      const actual1: string = await runResult(['ResourceManagerTask'], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(1);
      const actual4: boolean = startupManager.isStartupTaskInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0058 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0059
     * @tc.name      testStartupManagerMatrix0059
     * @tc.desc      移除 KVStoreTask 后带 startupListener run，await 返回时 onCompleted 已以成功回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0059 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KVStoreTask');
      const probe: ListenerProbe = new ListenerProbe();
      const actual1: string = await runResult(['KVStoreTask'], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(1);
      const actual4: boolean = startupManager.isStartupTaskInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0059 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0060
     * @tc.name      testStartupManagerMatrix0060
     * @tc.desc      移除 RdbStoreTask 后带 startupListener run，await 返回时 onCompleted 已以成功回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0060 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('RdbStoreTask');
      const probe: ListenerProbe = new ListenerProbe();
      const actual1: string = await runResult(['RdbStoreTask'], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(1);
      const actual4: boolean = startupManager.isStartupTaskInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0060 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0061
     * @tc.name      testStartupManagerMatrix0061
     * @tc.desc      移除 KvManagerUtilTask 后带 startupListener run，await 返回时 onCompleted 已以成功回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0061 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KvManagerUtilTask');
      const probe: ListenerProbe = new ListenerProbe();
      const actual1: string = await runResult(['KvManagerUtilTask'], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(1);
      const actual4: boolean = startupManager.isStartupTaskInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0061 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0062
     * @tc.name      testStartupManagerMatrix0062
     * @tc.desc      ResourceManagerTask 已初始化时带 startupListener 再 run，监听同样以成功回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0062 begin');
      await resetBaseline();
      const probe: ListenerProbe = new ListenerProbe();
      const actual1: string = await runResult(['ResourceManagerTask'], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0062 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0063
     * @tc.name      testStartupManagerMatrix0063
     * @tc.desc      FileTask 已初始化时带 startupListener 再 run，监听同样以成功回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0063 begin');
      await resetBaseline();
      const probe: ListenerProbe = new ListenerProbe();
      const actual1: string = await runResult(['FileTask'], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0063 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0064
     * @tc.name      testStartupManagerMatrix0064
     * @tc.desc      KVStoreTask 已初始化时带 startupListener 再 run，监听同样以成功回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0064 begin');
      await resetBaseline();
      const probe: ListenerProbe = new ListenerProbe();
      const actual1: string = await runResult(['KVStoreTask'], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0064 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0065
     * @tc.name      testStartupManagerMatrix0065
     * @tc.desc      RdbStoreTask 已初始化时带 startupListener 再 run，监听同样以成功回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0065 begin');
      await resetBaseline();
      const probe: ListenerProbe = new ListenerProbe();
      const actual1: string = await runResult(['RdbStoreTask'], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0065 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0066
     * @tc.name      testStartupManagerMatrix0066
     * @tc.desc      KvManagerUtilTask 已初始化时带 startupListener 再 run，监听同样以成功回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0066 begin');
      await resetBaseline();
      const probe: ListenerProbe = new ListenerProbe();
      const actual1: string = await runResult(['KvManagerUtilTask'], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0066 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0067
     * @tc.name      testStartupManagerMatrix0067
     * @tc.desc      不存在的任务名 "NoSuchTask" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0067 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('NoSuchTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('NoSuchTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('NoSuchTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0067 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0068
     * @tc.name      testStartupManagerMatrix0068
     * @tc.desc      空串 空串 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0068 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(''));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult(''));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0068 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0069
     * @tc.name      testStartupManagerMatrix0069
     * @tc.desc      全小写的 FileTask "filetask" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0069 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('filetask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('filetask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('filetask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0069 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0070
     * @tc.name      testStartupManagerMatrix0070
     * @tc.desc      全大写的 FileTask "FILETASK" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0070 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('FILETASK'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('FILETASK');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('FILETASK'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0070 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0071
     * @tc.name      testStartupManagerMatrix0071
     * @tc.desc      带尾随空格的 FileTask "FileTask " 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0071 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('FileTask '));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('FileTask ');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('FileTask '));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0071 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0072
     * @tc.name      testStartupManagerMatrix0072
     * @tc.desc      带前导空格的 FileTask " FileTask" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0072 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(' FileTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind(' FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult(' FileTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0072 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0073
     * @tc.name      testStartupManagerMatrix0073
     * @tc.desc      中间带空格的 FileTask "File Task" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0073 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('File Task'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('File Task');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('File Task'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0073 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0074
     * @tc.name      testStartupManagerMatrix0074
     * @tc.desc      大小写错位的 KVStoreTask "KvStoreTask" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0074 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('KvStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('KvStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('KvStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0074 end');
    })
  })
}
