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

export default function startupManagerMatrixTailTest(): void {
  describe('AppStartupStartupManagerMatrixTailTest', () => {
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
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0075
     * @tc.name      testStartupManagerMatrix0075
     * @tc.desc      大小写错位的 KvManagerUtilTask "KVManagerUtilTask" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0075 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('KVManagerUtilTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('KVManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('KVManagerUtilTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0075 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0076
     * @tc.name      testStartupManagerMatrix0076
     * @tc.desc      首字母小写的 RdbStoreTask "rdbStoreTask" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0076 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('rdbStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('rdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('rdbStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0076 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0077
     * @tc.name      testStartupManagerMatrix0077
     * @tc.desc      首字母小写的 ImageKnifeTask "imageKnifeTask" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0077 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('imageKnifeTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('imageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('imageKnifeTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0077 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0078
     * @tc.name      testStartupManagerMatrix0078
     * @tc.desc      去掉 Task 后缀的 ResourceManagerTask "ResourceManager" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0078 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('ResourceManager'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('ResourceManager');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('ResourceManager'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0078 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0079
     * @tc.name      testStartupManagerMatrix0079
     * @tc.desc      启动配置入口的扩展名 "StartupConfig" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0079 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('StartupConfig'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('StartupConfig');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('StartupConfig'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0079 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0080
     * @tc.name      testStartupManagerMatrix0080
     * @tc.desc      UIAbility 名 "EntryAbility" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0080 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('EntryAbility'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('EntryAbility'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0080 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0081
     * @tc.name      testStartupManagerMatrix0081
     * @tc.desc      测试 Ability 名 "TestAbility" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0081 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('TestAbility'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('TestAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('TestAbility'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0081 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0082
     * @tc.name      testStartupManagerMatrix0082
     * @tc.desc      带扩展名的任务文件名 "FileTask.ets" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0082 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('FileTask.ets'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('FileTask.ets');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('FileTask.ets'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0082 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0083
     * @tc.name      testStartupManagerMatrix0083
     * @tc.desc      带目录的任务路径 "startup/FileTask" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0083 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('startup/FileTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('startup/FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('startup/FileTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0083 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0084
     * @tc.name      testStartupManagerMatrix0084
     * @tc.desc      srcEntry 形式的路径 "ets/startup/FileTask.ets" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0084 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('ets/startup/FileTask.ets'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('ets/startup/FileTask.ets');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('ets/startup/FileTask.ets'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0084 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0085
     * @tc.name      testStartupManagerMatrix0085
     * @tc.desc      中文名 "文件任务" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0085 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('文件任务'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('文件任务');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('文件任务'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0085 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0086
     * @tc.name      testStartupManagerMatrix0086
     * @tc.desc      通配符 "*" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0086 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('*'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('*');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('*'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0086 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0087
     * @tc.name      testStartupManagerMatrix0087
     * @tc.desc      字面量 undefined "undefined" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0087 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('undefined'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('undefined');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('undefined'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0087 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0088
     * @tc.name      testStartupManagerMatrix0088
     * @tc.desc      数字串 "0" 未登记：查询初始化状态、取结果、移除结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0088 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('0'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('0');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = errorOf(() => startupManager.removeStartupTaskResult('0'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0088 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0089
     * @tc.name      testStartupManagerMatrix0089
     * @tc.desc      run 含不存在的任务名 "NoSuchTask" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0089 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['NoSuchTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['NoSuchTask', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'NoSuchTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0089 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0090
     * @tc.name      testStartupManagerMatrix0090
     * @tc.desc      run 含空串 空串 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0090 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', '']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0090 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0091
     * @tc.name      testStartupManagerMatrix0091
     * @tc.desc      run 含全小写的 FileTask "filetask" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0091 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['filetask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['filetask', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'filetask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0091 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0092
     * @tc.name      testStartupManagerMatrix0092
     * @tc.desc      run 含全大写的 FileTask "FILETASK" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0092 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['FILETASK']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['FILETASK', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'FILETASK']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0092 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0093
     * @tc.name      testStartupManagerMatrix0093
     * @tc.desc      run 含带尾随空格的 FileTask "FileTask " 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0093 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['FileTask ']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['FileTask ', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'FileTask ']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0093 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0094
     * @tc.name      testStartupManagerMatrix0094
     * @tc.desc      run 含带前导空格的 FileTask " FileTask" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0094 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult([' FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult([' FileTask', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', ' FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0094 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0095
     * @tc.name      testStartupManagerMatrix0095
     * @tc.desc      run 含中间带空格的 FileTask "File Task" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0095 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['File Task']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['File Task', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'File Task']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0095 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0096
     * @tc.name      testStartupManagerMatrix0096
     * @tc.desc      run 含大小写错位的 KVStoreTask "KvStoreTask" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0096 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['KvStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['KvStoreTask', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'KvStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0096 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0097
     * @tc.name      testStartupManagerMatrix0097
     * @tc.desc      run 含大小写错位的 KvManagerUtilTask "KVManagerUtilTask" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0097 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['KVManagerUtilTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['KVManagerUtilTask', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'KVManagerUtilTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0097 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0098
     * @tc.name      testStartupManagerMatrix0098
     * @tc.desc      run 含首字母小写的 RdbStoreTask "rdbStoreTask" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0098 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['rdbStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['rdbStoreTask', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'rdbStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0098 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0099
     * @tc.name      testStartupManagerMatrix0099
     * @tc.desc      run 含首字母小写的 ImageKnifeTask "imageKnifeTask" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0099 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['imageKnifeTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['imageKnifeTask', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'imageKnifeTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0099 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0100
     * @tc.name      testStartupManagerMatrix0100
     * @tc.desc      run 含去掉 Task 后缀的 ResourceManagerTask "ResourceManager" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0100 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['ResourceManager']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['ResourceManager', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'ResourceManager']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0100 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0101
     * @tc.name      testStartupManagerMatrix0101
     * @tc.desc      run 含启动配置入口的扩展名 "StartupConfig" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0101 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['StartupConfig']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['StartupConfig', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'StartupConfig']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0101 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0102
     * @tc.name      testStartupManagerMatrix0102
     * @tc.desc      run 含UIAbility 名 "EntryAbility" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0102 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['EntryAbility']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['EntryAbility', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'EntryAbility']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0102 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0103
     * @tc.name      testStartupManagerMatrix0103
     * @tc.desc      run 含测试 Ability 名 "TestAbility" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0103 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['TestAbility']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['TestAbility', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'TestAbility']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0103 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0104
     * @tc.name      testStartupManagerMatrix0104
     * @tc.desc      run 含带扩展名的任务文件名 "FileTask.ets" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0104 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['FileTask.ets']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['FileTask.ets', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'FileTask.ets']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0104 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0105
     * @tc.name      testStartupManagerMatrix0105
     * @tc.desc      run 含带目录的任务路径 "startup/FileTask" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0105 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['startup/FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['startup/FileTask', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'startup/FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0105 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0106
     * @tc.name      testStartupManagerMatrix0106
     * @tc.desc      run 含srcEntry 形式的路径 "ets/startup/FileTask.ets" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0106 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['ets/startup/FileTask.ets']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['ets/startup/FileTask.ets', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'ets/startup/FileTask.ets']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0106 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0107
     * @tc.name      testStartupManagerMatrix0107
     * @tc.desc      run 含中文名 "文件任务" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0107 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['文件任务']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['文件任务', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', '文件任务']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0107 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0108
     * @tc.name      testStartupManagerMatrix0108
     * @tc.desc      run 含通配符 "*" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0108 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['*']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['*', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', '*']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0108 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0109
     * @tc.name      testStartupManagerMatrix0109
     * @tc.desc      run 含字面量 undefined "undefined" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0109 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['undefined']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['undefined', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', 'undefined']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0109 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0110
     * @tc.name      testStartupManagerMatrix0110
     * @tc.desc      run 含数字串 "0" 的列表返回 28800001，即使同时带上有效任务也整体失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0110 begin');
      await resetBaseline();
      const actual1: string | number | boolean = await runResult(['0']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['0', 'FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string | number | boolean = await runResult(['ImageKnifeTask', '0']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0110 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0111
     * @tc.name      testStartupManagerMatrix0111
     * @tc.desc      run [NoSuchTask] 失败时不回调 startupListener，ImageKnifeTask 也没有被连带执行
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0111 begin');
      await resetBaseline();
      const probe: ListenerProbe = new ListenerProbe();
      const names: string[] = ['ImageKnifeTask', 'NoSuchTask'];
      const actual1: string | number | boolean = await runResult(names, listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      await sleep(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('none');
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0111 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0112
     * @tc.name      testStartupManagerMatrix0112
     * @tc.desc      run [StartupConfig] 失败时不回调 startupListener，ImageKnifeTask 也没有被连带执行
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0112 begin');
      await resetBaseline();
      const probe: ListenerProbe = new ListenerProbe();
      const names: string[] = ['ImageKnifeTask', 'StartupConfig'];
      const actual1: string | number | boolean = await runResult(names, listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      await sleep(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('none');
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0112 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0113
     * @tc.name      testStartupManagerMatrix0113
     * @tc.desc      run [filetask] 失败时不回调 startupListener，ImageKnifeTask 也没有被连带执行
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0113 begin');
      await resetBaseline();
      const probe: ListenerProbe = new ListenerProbe();
      const names: string[] = ['ImageKnifeTask', 'filetask'];
      const actual1: string | number | boolean = await runResult(names, listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      await sleep(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('none');
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0113 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0114
     * @tc.name      testStartupManagerMatrix0114
     * @tc.desc      KVStoreTask 依赖 KvManagerUtilTask：两者都移除后只 run KVStoreTask，依赖会被连带初始化
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupManagerMatrix0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0114 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KVStoreTask');
      startupManager.removeStartupTaskResult('KvManagerUtilTask');
      const actual1: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('false,true,true,false,true,false');
      const actual2: string = await runResult(['KVStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: boolean = startupManager.isStartupTaskInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      const actual5: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0114 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0115
     * @tc.name      testStartupManagerMatrix0115
     * @tc.desc      KvManagerUtilTask 返回的是 KVManager（JsKVManager），重复取结果是同一个对象
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0115 begin');
      await resetBaseline();
      const first: Object = startupManager.getStartupTaskResult('KvManagerUtilTask');
      const actual1: string = resultClass('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('JsKVManager');
      const actual2: boolean = startupManager.getStartupTaskResult('KvManagerUtilTask') === first;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0115 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0116
     * @tc.name      testStartupManagerMatrix0116
     * @tc.desc      KvManagerUtilTask 移除后重跑，业务单例 KvManagerUtil 返回的仍是同一个 KVManager
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0116 begin');
      await resetBaseline();
      const before: Object = startupManager.getStartupTaskResult('KvManagerUtilTask');
      startupManager.removeStartupTaskResult('KvManagerUtilTask');
      const actual1: string = await runResult(['KvManagerUtilTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.getStartupTaskResult('KvManagerUtilTask') === before;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultClass('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('JsKVManager');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0116 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0117
     * @tc.name      testStartupManagerMatrix0117
     * @tc.desc      ImageKnifeTask 初始化后的结果是 ImageKnife.with 返回的 ImageKnifeGlobal，重复取结果是同一个对象
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupManagerMatrix0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0117 begin');
      await resetBaseline();
      const actual1: string = await runResult(['ImageKnifeTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const first: Object = startupManager.getStartupTaskResult('ImageKnifeTask');
      const actual2: string = resultClass('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ImageKnifeGlobal');
      const actual3: boolean = startupManager.getStartupTaskResult('ImageKnifeTask') === first;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0117 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0118
     * @tc.name      testStartupManagerMatrix0118
     * @tc.desc      ImageKnifeTask 移除再重跑，ImageKnife.with 返回的仍是同一个 ImageKnifeGlobal 单例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0118 begin');
      await resetBaseline();
      const actual1: string = await runResult(['ImageKnifeTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const first: Object = startupManager.getStartupTaskResult('ImageKnifeTask');
      startupManager.removeStartupTaskResult('ImageKnifeTask');
      const actual2: string = await runResult(['ImageKnifeTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: boolean = startupManager.getStartupTaskResult('ImageKnifeTask') === first;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: string = resultClass('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('ImageKnifeGlobal');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0118 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0119
     * @tc.name      testStartupManagerMatrix0119
     * @tc.desc      一次 run 多个未初始化任务（ImageKnifeTask 与 ResourceManagerTask）两者都完成初始化
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0119 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('ResourceManagerTask');
      const actual1: string = await runResult(['ImageKnifeTask', 'ResourceManagerTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = startupManager.isStartupTaskInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('true,true,true,true,true,true');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0119 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0120
     * @tc.name      testStartupManagerMatrix0120
     * @tc.desc      run 全部六个任务后六个都已初始化，resetBaseline 后回到只有 ImageKnifeTask 未初始化
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0120 begin');
      await resetBaseline();
      const actual1: string = await runResult(TASK_NAMES);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: string = await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ok');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0120 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0121
     * @tc.name      testStartupManagerMatrix0121
     * @tc.desc      拉起后 run 空任务列表仍返回 16000050 internal error.，不影响已有状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0121 begin');
      await resetBaseline();
      const tasks: string[] = [];
      const actual1: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('16000050:internal error.');
      const actual2: string = await runResult(tasks, { timeoutMs: 3000 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('16000050:internal error.');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0121 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0122
     * @tc.name      testStartupManagerMatrix0122
     * @tc.desc      removeAllStartupTaskResults 后六个任务都变为未初始化，取结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupManagerMatrix0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0122 begin');
      await resetBaseline();
      startupManager.removeAllStartupTaskResults();
      const actual1: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('false,false,false,false,false,false');
      const actual2: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = resultKind('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0122 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0123
     * @tc.name      testStartupManagerMatrix0123
     * @tc.desc      连续两次 removeAllStartupTaskResults 都不抛错，未登记的名字仍抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0123 begin');
      await resetBaseline();
      const actual1: string = errorOf(() => startupManager.removeAllStartupTaskResults());
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = errorOf(() => startupManager.removeAllStartupTaskResults());
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: string = errorOf(() => startupManager.isStartupTaskInitialized('NoSuchTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,false,false,false,false,false');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0123 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0124
     * @tc.name      testStartupManagerMatrix0124
     * @tc.desc      全部移除后 run 五个自动任务即恢复基线（FileTask 稍晚登记），KvManagerUtilTask 结果重新可取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupManagerMatrix0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0124 begin');
      await resetBaseline();
      startupManager.removeAllStartupTaskResults();
      const actual1: string = await runResult(AUTO_TASK_NAMES);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = await waitForTask('FileTask', 3000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('false,true,true,true,true,true');
      const actual4: string = resultClass('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('JsKVManager');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0124 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0125
     * @tc.name      testStartupManagerMatrix0125
     * @tc.desc      全部移除后只 run KVStoreTask，只恢复它和依赖 KvManagerUtilTask，其余仍未初始化
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0125 begin');
      await resetBaseline();
      startupManager.removeAllStartupTaskResults();
      const actual1: string = await runResult(['KVStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,false,false,true,false,true');
      const actual3: string = resultKind('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0125 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0126
     * @tc.name      testStartupManagerMatrix0126
     * @tc.desc      移除 ImageKnifeTask 后用带 Context 的 run 重载（entry 模块 Context）执行，同样恢复为已初始化
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0126 begin');
      await resetBaseline();
      const actual1: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const context: common.AbilityStageContext = (await loadEntryModuleContext()) as common.AbilityStageContext;
      const actual2: string = await runWithContext(['ImageKnifeTask'], context);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: string = resultKind('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0126 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0127
     * @tc.name      testStartupManagerMatrix0127
     * @tc.desc      移除 ResourceManagerTask 后用带 Context 的 run 重载（entry 模块 Context）执行，同样恢复为已初始化
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0127 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('ResourceManagerTask');
      const context: common.AbilityStageContext = (await loadEntryModuleContext()) as common.AbilityStageContext;
      const actual1: string = await runWithContext(['ResourceManagerTask'], context);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0127 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0128
     * @tc.name      testStartupManagerMatrix0128
     * @tc.desc      移除 KVStoreTask 后用带 Context 的 run 重载（entry 模块 Context）执行，同样恢复为已初始化
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0128 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KVStoreTask');
      const context: common.AbilityStageContext = (await loadEntryModuleContext()) as common.AbilityStageContext;
      const actual1: string = await runWithContext(['KVStoreTask'], context);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = startupManager.isStartupTaskInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = resultKind('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('undefined');
      await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0128 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_MANAGER_0129
     * @tc.name      testStartupManagerMatrix0129
     * @tc.desc      带 Context 的 run 重载遇到未登记任务名同样返回 28800001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupManagerMatrix0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0129 begin');
      await resetBaseline();
      const context: common.AbilityStageContext = (await loadEntryModuleContext()) as common.AbilityStageContext;
      const actual1: string | number | boolean = await runWithContext(['NoSuchTask'], context);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runWithContext(['FileTask', 'NoSuchTask'], context);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupManagerMatrix0129 end');
    })
  })
}
