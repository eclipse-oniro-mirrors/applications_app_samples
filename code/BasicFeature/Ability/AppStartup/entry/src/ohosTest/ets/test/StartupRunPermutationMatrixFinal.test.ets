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

export default function startupRunPermutationMatrixFinalTest(): void {
  describe('AppStartupStartupRunPermutationMatrixFinalTest', () => {
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
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0399
     * @tc.name      testStartupRunPermutationMatrix0399
     * @tc.desc      按 [FileTask, KVStoreTask, ResourceManagerTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0399 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'KVStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0399 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0400
     * @tc.name      testStartupRunPermutationMatrix0400
     * @tc.desc      按 [FileTask, KVStoreTask, RdbStoreTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0400 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'KVStoreTask',
        'RdbStoreTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0400 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0401
     * @tc.name      testStartupRunPermutationMatrix0401
     * @tc.desc      按 [FileTask, RdbStoreTask, ResourceManagerTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0401 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'RdbStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0401 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0402
     * @tc.name      testStartupRunPermutationMatrix0402
     * @tc.desc      按 [FileTask, RdbStoreTask, KVStoreTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0402 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'RdbStoreTask',
        'KVStoreTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0402 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0403
     * @tc.name      testStartupRunPermutationMatrix0403
     * @tc.desc      按 [KVStoreTask, ResourceManagerTask, FileTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0403 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0403 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0404
     * @tc.name      testStartupRunPermutationMatrix0404
     * @tc.desc      按 [KVStoreTask, ResourceManagerTask, RdbStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0404 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0404 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0405
     * @tc.name      testStartupRunPermutationMatrix0405
     * @tc.desc      按 [KVStoreTask, FileTask, ResourceManagerTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0405 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'FileTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0405 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0406
     * @tc.name      testStartupRunPermutationMatrix0406
     * @tc.desc      按 [KVStoreTask, FileTask, RdbStoreTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0406 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'FileTask',
        'RdbStoreTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0406 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0407
     * @tc.name      testStartupRunPermutationMatrix0407
     * @tc.desc      按 [KVStoreTask, RdbStoreTask, ResourceManagerTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0407 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'RdbStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0407 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0408
     * @tc.name      testStartupRunPermutationMatrix0408
     * @tc.desc      按 [KVStoreTask, RdbStoreTask, FileTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0408 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'RdbStoreTask',
        'FileTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0408 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0409
     * @tc.name      testStartupRunPermutationMatrix0409
     * @tc.desc      按 [RdbStoreTask, ResourceManagerTask, FileTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0409 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'ResourceManagerTask',
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0409 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0410
     * @tc.name      testStartupRunPermutationMatrix0410
     * @tc.desc      按 [RdbStoreTask, ResourceManagerTask, KVStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0410 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0410 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0411
     * @tc.name      testStartupRunPermutationMatrix0411
     * @tc.desc      按 [RdbStoreTask, FileTask, ResourceManagerTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0411 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'FileTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0411 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0412
     * @tc.name      testStartupRunPermutationMatrix0412
     * @tc.desc      按 [RdbStoreTask, FileTask, KVStoreTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0412 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'FileTask',
        'KVStoreTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0412 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0413
     * @tc.name      testStartupRunPermutationMatrix0413
     * @tc.desc      按 [RdbStoreTask, KVStoreTask, ResourceManagerTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0413 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'KVStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0413 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0414
     * @tc.name      testStartupRunPermutationMatrix0414
     * @tc.desc      按 [RdbStoreTask, KVStoreTask, FileTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0414 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'KVStoreTask',
        'FileTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0414 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0415
     * @tc.name      testStartupRunPermutationMatrix0415
     * @tc.desc      按 [ResourceManagerTask, FileTask, KVStoreTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0415 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0415 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0416
     * @tc.name      testStartupRunPermutationMatrix0416
     * @tc.desc      按 [ResourceManagerTask, FileTask, KvManagerUtilTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0416 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0416 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0417
     * @tc.name      testStartupRunPermutationMatrix0417
     * @tc.desc      按 [ResourceManagerTask, KVStoreTask, FileTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0417 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0417 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0418
     * @tc.name      testStartupRunPermutationMatrix0418
     * @tc.desc      按 [ResourceManagerTask, KVStoreTask, KvManagerUtilTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0418 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0418 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0419
     * @tc.name      testStartupRunPermutationMatrix0419
     * @tc.desc      按 [ResourceManagerTask, KvManagerUtilTask, FileTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0419 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'KvManagerUtilTask',
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0419 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0420
     * @tc.name      testStartupRunPermutationMatrix0420
     * @tc.desc      按 [ResourceManagerTask, KvManagerUtilTask, KVStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0420 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0420 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0421
     * @tc.name      testStartupRunPermutationMatrix0421
     * @tc.desc      按 [FileTask, ResourceManagerTask, KVStoreTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0421 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0421 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0422
     * @tc.name      testStartupRunPermutationMatrix0422
     * @tc.desc      按 [FileTask, ResourceManagerTask, KvManagerUtilTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0422 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0422 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0423
     * @tc.name      testStartupRunPermutationMatrix0423
     * @tc.desc      按 [FileTask, KVStoreTask, ResourceManagerTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0423 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'KVStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0423 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0424
     * @tc.name      testStartupRunPermutationMatrix0424
     * @tc.desc      按 [FileTask, KVStoreTask, KvManagerUtilTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0424 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'KVStoreTask',
        'KvManagerUtilTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0424 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0425
     * @tc.name      testStartupRunPermutationMatrix0425
     * @tc.desc      按 [FileTask, KvManagerUtilTask, ResourceManagerTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0425 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'KvManagerUtilTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0425 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0426
     * @tc.name      testStartupRunPermutationMatrix0426
     * @tc.desc      按 [FileTask, KvManagerUtilTask, KVStoreTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0426 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'KvManagerUtilTask',
        'KVStoreTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0426 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0427
     * @tc.name      testStartupRunPermutationMatrix0427
     * @tc.desc      按 [KVStoreTask, ResourceManagerTask, FileTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0427 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0427 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0428
     * @tc.name      testStartupRunPermutationMatrix0428
     * @tc.desc      按 [KVStoreTask, ResourceManagerTask, KvManagerUtilTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0428 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0428 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0429
     * @tc.name      testStartupRunPermutationMatrix0429
     * @tc.desc      按 [KVStoreTask, FileTask, ResourceManagerTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0429 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'FileTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0429 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0430
     * @tc.name      testStartupRunPermutationMatrix0430
     * @tc.desc      按 [KVStoreTask, FileTask, KvManagerUtilTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0430 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'FileTask',
        'KvManagerUtilTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0430 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0431
     * @tc.name      testStartupRunPermutationMatrix0431
     * @tc.desc      按 [KVStoreTask, KvManagerUtilTask, ResourceManagerTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0431 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'KvManagerUtilTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0431 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0432
     * @tc.name      testStartupRunPermutationMatrix0432
     * @tc.desc      按 [KVStoreTask, KvManagerUtilTask, FileTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0432 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'KvManagerUtilTask',
        'FileTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0432 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0433
     * @tc.name      testStartupRunPermutationMatrix0433
     * @tc.desc      按 [KvManagerUtilTask, ResourceManagerTask, FileTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0433 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'ResourceManagerTask',
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0433 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0434
     * @tc.name      testStartupRunPermutationMatrix0434
     * @tc.desc      按 [KvManagerUtilTask, ResourceManagerTask, KVStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0434 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0434 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0435
     * @tc.name      testStartupRunPermutationMatrix0435
     * @tc.desc      按 [KvManagerUtilTask, FileTask, ResourceManagerTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0435 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'FileTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0435 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0436
     * @tc.name      testStartupRunPermutationMatrix0436
     * @tc.desc      按 [KvManagerUtilTask, FileTask, KVStoreTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0436 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'FileTask',
        'KVStoreTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0436 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0437
     * @tc.name      testStartupRunPermutationMatrix0437
     * @tc.desc      按 [KvManagerUtilTask, KVStoreTask, ResourceManagerTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0437 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'KVStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0437 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0438
     * @tc.name      testStartupRunPermutationMatrix0438
     * @tc.desc      按 [KvManagerUtilTask, KVStoreTask, FileTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0438 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'KVStoreTask',
        'FileTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0438 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0439
     * @tc.name      testStartupRunPermutationMatrix0439
     * @tc.desc      按 [ResourceManagerTask, FileTask, RdbStoreTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0439 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0439 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0440
     * @tc.name      testStartupRunPermutationMatrix0440
     * @tc.desc      按 [ResourceManagerTask, FileTask, KvManagerUtilTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0440 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0440 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0441
     * @tc.name      testStartupRunPermutationMatrix0441
     * @tc.desc      按 [ResourceManagerTask, RdbStoreTask, FileTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0441 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0441 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0442
     * @tc.name      testStartupRunPermutationMatrix0442
     * @tc.desc      按 [ResourceManagerTask, RdbStoreTask, KvManagerUtilTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0442 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0442 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0443
     * @tc.name      testStartupRunPermutationMatrix0443
     * @tc.desc      按 [ResourceManagerTask, KvManagerUtilTask, FileTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0443 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0443 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0444
     * @tc.name      testStartupRunPermutationMatrix0444
     * @tc.desc      按 [ResourceManagerTask, KvManagerUtilTask, RdbStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0444 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0444 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0445
     * @tc.name      testStartupRunPermutationMatrix0445
     * @tc.desc      按 [FileTask, ResourceManagerTask, RdbStoreTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0445 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0445 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0446
     * @tc.name      testStartupRunPermutationMatrix0446
     * @tc.desc      按 [FileTask, ResourceManagerTask, KvManagerUtilTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0446 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0446 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0447
     * @tc.name      testStartupRunPermutationMatrix0447
     * @tc.desc      按 [FileTask, RdbStoreTask, ResourceManagerTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0447 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'RdbStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0447 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0448
     * @tc.name      testStartupRunPermutationMatrix0448
     * @tc.desc      按 [FileTask, RdbStoreTask, KvManagerUtilTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0448 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'RdbStoreTask',
        'KvManagerUtilTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0448 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0449
     * @tc.name      testStartupRunPermutationMatrix0449
     * @tc.desc      按 [FileTask, KvManagerUtilTask, ResourceManagerTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0449 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'KvManagerUtilTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0449 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0450
     * @tc.name      testStartupRunPermutationMatrix0450
     * @tc.desc      按 [FileTask, KvManagerUtilTask, RdbStoreTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0450 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'KvManagerUtilTask',
        'RdbStoreTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0450 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0451
     * @tc.name      testStartupRunPermutationMatrix0451
     * @tc.desc      按 [RdbStoreTask, ResourceManagerTask, FileTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0451 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0451 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0452
     * @tc.name      testStartupRunPermutationMatrix0452
     * @tc.desc      按 [RdbStoreTask, ResourceManagerTask, KvManagerUtilTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0452 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0452 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0453
     * @tc.name      testStartupRunPermutationMatrix0453
     * @tc.desc      按 [RdbStoreTask, FileTask, ResourceManagerTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0453 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'FileTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0453 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0454
     * @tc.name      testStartupRunPermutationMatrix0454
     * @tc.desc      按 [RdbStoreTask, FileTask, KvManagerUtilTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0454 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'FileTask',
        'KvManagerUtilTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0454 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0455
     * @tc.name      testStartupRunPermutationMatrix0455
     * @tc.desc      按 [RdbStoreTask, KvManagerUtilTask, ResourceManagerTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0455 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'KvManagerUtilTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0455 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0456
     * @tc.name      testStartupRunPermutationMatrix0456
     * @tc.desc      按 [RdbStoreTask, KvManagerUtilTask, FileTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0456 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'KvManagerUtilTask',
        'FileTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0456 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0457
     * @tc.name      testStartupRunPermutationMatrix0457
     * @tc.desc      按 [KvManagerUtilTask, ResourceManagerTask, FileTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0457 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0457 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0458
     * @tc.name      testStartupRunPermutationMatrix0458
     * @tc.desc      按 [KvManagerUtilTask, ResourceManagerTask, RdbStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0458 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0458 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0459
     * @tc.name      testStartupRunPermutationMatrix0459
     * @tc.desc      按 [KvManagerUtilTask, FileTask, ResourceManagerTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0459 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'FileTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0459 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0460
     * @tc.name      testStartupRunPermutationMatrix0460
     * @tc.desc      按 [KvManagerUtilTask, FileTask, RdbStoreTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0460 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'FileTask',
        'RdbStoreTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0460 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0461
     * @tc.name      testStartupRunPermutationMatrix0461
     * @tc.desc      按 [KvManagerUtilTask, RdbStoreTask, ResourceManagerTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0461 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'RdbStoreTask',
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0461 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0462
     * @tc.name      testStartupRunPermutationMatrix0462
     * @tc.desc      按 [KvManagerUtilTask, RdbStoreTask, FileTask, ResourceManagerTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0462 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
        'RdbStoreTask',
        'FileTask',
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: boolean = isInitialized('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0462 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0463
     * @tc.name      testStartupRunPermutationMatrix0463
     * @tc.desc      按 [ResourceManagerTask, KVStoreTask, RdbStoreTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0463 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0463 end');
    })
  })
}
