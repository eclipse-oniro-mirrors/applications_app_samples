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
import { startupManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ensureEntryStarted, isInitialized, resetBaseline, runResult, taskStates } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartup]';
const ALL_TRUE: string = 'true,true,true,true,true,true';
const BASELINE: string = 'false,true,true,true,true,true';

export default function startupRunPermutationMatrixAdvancedTest(): void {
  describe('AppStartupStartupRunPermutationMatrixAdvancedTest', () => {
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
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0138
     * @tc.name      testStartupRunPermutationMatrix0138
     * @tc.desc      按 [KvManagerUtilTask, KVStoreTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0138 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'KVStoreTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0138 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0139
     * @tc.name      testStartupRunPermutationMatrix0139
     * @tc.desc      按 [FileTask, RdbStoreTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0139 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'RdbStoreTask',
        'KvManagerUtilTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0139 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0140
     * @tc.name      testStartupRunPermutationMatrix0140
     * @tc.desc      按 [FileTask, KvManagerUtilTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0140 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'KvManagerUtilTask',
        'RdbStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0140 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0141
     * @tc.name      testStartupRunPermutationMatrix0141
     * @tc.desc      按 [RdbStoreTask, FileTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0141 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'FileTask',
        'KvManagerUtilTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0141 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0142
     * @tc.name      testStartupRunPermutationMatrix0142
     * @tc.desc      按 [RdbStoreTask, KvManagerUtilTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0142 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'KvManagerUtilTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0142 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0143
     * @tc.name      testStartupRunPermutationMatrix0143
     * @tc.desc      按 [KvManagerUtilTask, FileTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0143 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'FileTask',
        'RdbStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0143 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0144
     * @tc.name      testStartupRunPermutationMatrix0144
     * @tc.desc      按 [KvManagerUtilTask, RdbStoreTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0144 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'RdbStoreTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0144 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0145
     * @tc.name      testStartupRunPermutationMatrix0145
     * @tc.desc      按 [KVStoreTask, RdbStoreTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0145 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'RdbStoreTask',
        'KvManagerUtilTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0145 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0146
     * @tc.name      testStartupRunPermutationMatrix0146
     * @tc.desc      按 [KVStoreTask, KvManagerUtilTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0146 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'KvManagerUtilTask',
        'RdbStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0146 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0147
     * @tc.name      testStartupRunPermutationMatrix0147
     * @tc.desc      按 [RdbStoreTask, KVStoreTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0147 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'KVStoreTask',
        'KvManagerUtilTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0147 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0148
     * @tc.name      testStartupRunPermutationMatrix0148
     * @tc.desc      按 [RdbStoreTask, KvManagerUtilTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0148 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'KvManagerUtilTask',
        'KVStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0148 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0149
     * @tc.name      testStartupRunPermutationMatrix0149
     * @tc.desc      按 [KvManagerUtilTask, KVStoreTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0149 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'KVStoreTask',
        'RdbStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0149 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0150
     * @tc.name      testStartupRunPermutationMatrix0150
     * @tc.desc      按 [KvManagerUtilTask, RdbStoreTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0150 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'RdbStoreTask',
        'KVStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0150 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0151
     * @tc.name      testStartupRunPermutationMatrix0151
     * @tc.desc      按 [ImageKnifeTask, ResourceManagerTask, FileTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0151 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'ResourceManagerTask',
        'FileTask',
        'KVStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0151 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0152
     * @tc.name      testStartupRunPermutationMatrix0152
     * @tc.desc      按 [ImageKnifeTask, ResourceManagerTask, KVStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0152 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'ResourceManagerTask',
        'KVStoreTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0152 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0153
     * @tc.name      testStartupRunPermutationMatrix0153
     * @tc.desc      按 [ImageKnifeTask, FileTask, ResourceManagerTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0153 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'FileTask',
        'ResourceManagerTask',
        'KVStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0153 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0154
     * @tc.name      testStartupRunPermutationMatrix0154
     * @tc.desc      按 [ImageKnifeTask, FileTask, KVStoreTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0154 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'FileTask',
        'KVStoreTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0154 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0155
     * @tc.name      testStartupRunPermutationMatrix0155
     * @tc.desc      按 [ImageKnifeTask, KVStoreTask, ResourceManagerTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0155 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'KVStoreTask',
        'ResourceManagerTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0155 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0156
     * @tc.name      testStartupRunPermutationMatrix0156
     * @tc.desc      按 [ImageKnifeTask, KVStoreTask, FileTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0156 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'KVStoreTask',
        'FileTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0156 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0157
     * @tc.name      testStartupRunPermutationMatrix0157
     * @tc.desc      按 [ResourceManagerTask, ImageKnifeTask, FileTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0157 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'ImageKnifeTask',
        'FileTask',
        'KVStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0157 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0158
     * @tc.name      testStartupRunPermutationMatrix0158
     * @tc.desc      按 [ResourceManagerTask, ImageKnifeTask, KVStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0158 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'ImageKnifeTask',
        'KVStoreTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0158 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0159
     * @tc.name      testStartupRunPermutationMatrix0159
     * @tc.desc      按 [ResourceManagerTask, FileTask, ImageKnifeTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0159 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'FileTask',
        'ImageKnifeTask',
        'KVStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0159 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0160
     * @tc.name      testStartupRunPermutationMatrix0160
     * @tc.desc      按 [ResourceManagerTask, FileTask, KVStoreTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0160 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'FileTask',
        'KVStoreTask',
        'ImageKnifeTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0160 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0161
     * @tc.name      testStartupRunPermutationMatrix0161
     * @tc.desc      按 [ResourceManagerTask, KVStoreTask, ImageKnifeTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0161 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'KVStoreTask',
        'ImageKnifeTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0161 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0162
     * @tc.name      testStartupRunPermutationMatrix0162
     * @tc.desc      按 [ResourceManagerTask, KVStoreTask, FileTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0162 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'KVStoreTask',
        'FileTask',
        'ImageKnifeTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0162 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0163
     * @tc.name      testStartupRunPermutationMatrix0163
     * @tc.desc      按 [FileTask, ImageKnifeTask, ResourceManagerTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0163 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'ImageKnifeTask',
        'ResourceManagerTask',
        'KVStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0163 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0164
     * @tc.name      testStartupRunPermutationMatrix0164
     * @tc.desc      按 [FileTask, ImageKnifeTask, KVStoreTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0164 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'ImageKnifeTask',
        'KVStoreTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0164 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0165
     * @tc.name      testStartupRunPermutationMatrix0165
     * @tc.desc      按 [FileTask, ResourceManagerTask, ImageKnifeTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0165 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'ResourceManagerTask',
        'ImageKnifeTask',
        'KVStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0165 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0166
     * @tc.name      testStartupRunPermutationMatrix0166
     * @tc.desc      按 [FileTask, ResourceManagerTask, KVStoreTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0166 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'ResourceManagerTask',
        'KVStoreTask',
        'ImageKnifeTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0166 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0167
     * @tc.name      testStartupRunPermutationMatrix0167
     * @tc.desc      按 [FileTask, KVStoreTask, ImageKnifeTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0167 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'KVStoreTask',
        'ImageKnifeTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0167 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0168
     * @tc.name      testStartupRunPermutationMatrix0168
     * @tc.desc      按 [FileTask, KVStoreTask, ResourceManagerTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0168 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'KVStoreTask',
        'ResourceManagerTask',
        'ImageKnifeTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0168 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0169
     * @tc.name      testStartupRunPermutationMatrix0169
     * @tc.desc      按 [KVStoreTask, ImageKnifeTask, ResourceManagerTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0169 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'ImageKnifeTask',
        'ResourceManagerTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0169 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0170
     * @tc.name      testStartupRunPermutationMatrix0170
     * @tc.desc      按 [KVStoreTask, ImageKnifeTask, FileTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0170 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'ImageKnifeTask',
        'FileTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0170 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0171
     * @tc.name      testStartupRunPermutationMatrix0171
     * @tc.desc      按 [KVStoreTask, ResourceManagerTask, ImageKnifeTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0171 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'ResourceManagerTask',
        'ImageKnifeTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0171 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0172
     * @tc.name      testStartupRunPermutationMatrix0172
     * @tc.desc      按 [KVStoreTask, ResourceManagerTask, FileTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0172 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'ResourceManagerTask',
        'FileTask',
        'ImageKnifeTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0172 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0173
     * @tc.name      testStartupRunPermutationMatrix0173
     * @tc.desc      按 [KVStoreTask, FileTask, ImageKnifeTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0173 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'FileTask',
        'ImageKnifeTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0173 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0174
     * @tc.name      testStartupRunPermutationMatrix0174
     * @tc.desc      按 [KVStoreTask, FileTask, ResourceManagerTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0174 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'FileTask',
        'ResourceManagerTask',
        'ImageKnifeTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0174 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0175
     * @tc.name      testStartupRunPermutationMatrix0175
     * @tc.desc      按 [ImageKnifeTask, ResourceManagerTask, FileTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0175 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'ResourceManagerTask',
        'FileTask',
        'RdbStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0175 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0176
     * @tc.name      testStartupRunPermutationMatrix0176
     * @tc.desc      按 [ImageKnifeTask, ResourceManagerTask, RdbStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0176 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'ResourceManagerTask',
        'RdbStoreTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0176 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0177
     * @tc.name      testStartupRunPermutationMatrix0177
     * @tc.desc      按 [ImageKnifeTask, FileTask, ResourceManagerTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0177 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'FileTask',
        'ResourceManagerTask',
        'RdbStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0177 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0178
     * @tc.name      testStartupRunPermutationMatrix0178
     * @tc.desc      按 [ImageKnifeTask, FileTask, RdbStoreTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0178 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'FileTask',
        'RdbStoreTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0178 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0179
     * @tc.name      testStartupRunPermutationMatrix0179
     * @tc.desc      按 [ImageKnifeTask, RdbStoreTask, ResourceManagerTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0179 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'RdbStoreTask',
        'ResourceManagerTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0179 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0180
     * @tc.name      testStartupRunPermutationMatrix0180
     * @tc.desc      按 [ImageKnifeTask, RdbStoreTask, FileTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0180 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'RdbStoreTask',
        'FileTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0180 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0181
     * @tc.name      testStartupRunPermutationMatrix0181
     * @tc.desc      按 [ResourceManagerTask, ImageKnifeTask, FileTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0181 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'ImageKnifeTask',
        'FileTask',
        'RdbStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0181 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0182
     * @tc.name      testStartupRunPermutationMatrix0182
     * @tc.desc      按 [ResourceManagerTask, ImageKnifeTask, RdbStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0182 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'ImageKnifeTask',
        'RdbStoreTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0182 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0183
     * @tc.name      testStartupRunPermutationMatrix0183
     * @tc.desc      按 [ResourceManagerTask, FileTask, ImageKnifeTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0183 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'FileTask',
        'ImageKnifeTask',
        'RdbStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0183 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0184
     * @tc.name      testStartupRunPermutationMatrix0184
     * @tc.desc      按 [ResourceManagerTask, FileTask, RdbStoreTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0184 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'FileTask',
        'RdbStoreTask',
        'ImageKnifeTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0184 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0185
     * @tc.name      testStartupRunPermutationMatrix0185
     * @tc.desc      按 [ResourceManagerTask, RdbStoreTask, ImageKnifeTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0185 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'RdbStoreTask',
        'ImageKnifeTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0185 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0186
     * @tc.name      testStartupRunPermutationMatrix0186
     * @tc.desc      按 [ResourceManagerTask, RdbStoreTask, FileTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0186 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'RdbStoreTask',
        'FileTask',
        'ImageKnifeTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0186 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0187
     * @tc.name      testStartupRunPermutationMatrix0187
     * @tc.desc      按 [FileTask, ImageKnifeTask, ResourceManagerTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0187 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'ImageKnifeTask',
        'ResourceManagerTask',
        'RdbStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0187 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0188
     * @tc.name      testStartupRunPermutationMatrix0188
     * @tc.desc      按 [FileTask, ImageKnifeTask, RdbStoreTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0188 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'ImageKnifeTask',
        'RdbStoreTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0188 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0189
     * @tc.name      testStartupRunPermutationMatrix0189
     * @tc.desc      按 [FileTask, ResourceManagerTask, ImageKnifeTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0189 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'ResourceManagerTask',
        'ImageKnifeTask',
        'RdbStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0189 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0190
     * @tc.name      testStartupRunPermutationMatrix0190
     * @tc.desc      按 [FileTask, ResourceManagerTask, RdbStoreTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0190 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'ResourceManagerTask',
        'RdbStoreTask',
        'ImageKnifeTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0190 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0191
     * @tc.name      testStartupRunPermutationMatrix0191
     * @tc.desc      按 [FileTask, RdbStoreTask, ImageKnifeTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0191 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'RdbStoreTask',
        'ImageKnifeTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0191 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0192
     * @tc.name      testStartupRunPermutationMatrix0192
     * @tc.desc      按 [FileTask, RdbStoreTask, ResourceManagerTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0192 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'RdbStoreTask',
        'ResourceManagerTask',
        'ImageKnifeTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0192 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0193
     * @tc.name      testStartupRunPermutationMatrix0193
     * @tc.desc      按 [RdbStoreTask, ImageKnifeTask, ResourceManagerTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0193 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'ImageKnifeTask',
        'ResourceManagerTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0193 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0194
     * @tc.name      testStartupRunPermutationMatrix0194
     * @tc.desc      按 [RdbStoreTask, ImageKnifeTask, FileTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0194 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'ImageKnifeTask',
        'FileTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0194 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0195
     * @tc.name      testStartupRunPermutationMatrix0195
     * @tc.desc      按 [RdbStoreTask, ResourceManagerTask, ImageKnifeTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0195 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'ResourceManagerTask',
        'ImageKnifeTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0195 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0196
     * @tc.name      testStartupRunPermutationMatrix0196
     * @tc.desc      按 [RdbStoreTask, ResourceManagerTask, FileTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0196 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'ResourceManagerTask',
        'FileTask',
        'ImageKnifeTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0196 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0197
     * @tc.name      testStartupRunPermutationMatrix0197
     * @tc.desc      按 [RdbStoreTask, FileTask, ImageKnifeTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0197 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'FileTask',
        'ImageKnifeTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0197 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0198
     * @tc.name      testStartupRunPermutationMatrix0198
     * @tc.desc      按 [RdbStoreTask, FileTask, ResourceManagerTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0198 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'FileTask',
        'ResourceManagerTask',
        'ImageKnifeTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0198 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0199
     * @tc.name      testStartupRunPermutationMatrix0199
     * @tc.desc      按 [ImageKnifeTask, ResourceManagerTask, FileTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0199 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'ResourceManagerTask',
        'FileTask',
        'KvManagerUtilTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0199 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0200
     * @tc.name      testStartupRunPermutationMatrix0200
     * @tc.desc      按 [ImageKnifeTask, ResourceManagerTask, KvManagerUtilTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0200 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'ResourceManagerTask',
        'KvManagerUtilTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0200 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0201
     * @tc.name      testStartupRunPermutationMatrix0201
     * @tc.desc      按 [ImageKnifeTask, FileTask, ResourceManagerTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0201 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'FileTask',
        'ResourceManagerTask',
        'KvManagerUtilTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0201 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0202
     * @tc.name      testStartupRunPermutationMatrix0202
     * @tc.desc      按 [ImageKnifeTask, FileTask, KvManagerUtilTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0202 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'FileTask',
        'KvManagerUtilTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0202 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0203
     * @tc.name      testStartupRunPermutationMatrix0203
     * @tc.desc      按 [ImageKnifeTask, KvManagerUtilTask, ResourceManagerTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0203 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'KvManagerUtilTask',
        'ResourceManagerTask',
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const actual3: boolean = isInitialized('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0203 end');
    })
  })
}
