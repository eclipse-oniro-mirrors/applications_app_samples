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

export default function startupRunPermutationMatrixExtendedTest(): void {
  describe('AppStartupStartupRunPermutationMatrixExtendedTest', () => {
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
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0070
     * @tc.name      testStartupRunPermutationMatrix0070
     * @tc.desc      按 [FileTask, KvManagerUtilTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0070 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0070 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0071
     * @tc.name      testStartupRunPermutationMatrix0071
     * @tc.desc      按 [KvManagerUtilTask, ImageKnifeTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0071 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0071 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0072
     * @tc.name      testStartupRunPermutationMatrix0072
     * @tc.desc      按 [KvManagerUtilTask, FileTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0072 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0072 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0073
     * @tc.name      testStartupRunPermutationMatrix0073
     * @tc.desc      按 [ImageKnifeTask, KVStoreTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0073 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0073 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0074
     * @tc.name      testStartupRunPermutationMatrix0074
     * @tc.desc      按 [ImageKnifeTask, RdbStoreTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0074 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0074 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0075
     * @tc.name      testStartupRunPermutationMatrix0075
     * @tc.desc      按 [KVStoreTask, ImageKnifeTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0075 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0075 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0076
     * @tc.name      testStartupRunPermutationMatrix0076
     * @tc.desc      按 [KVStoreTask, RdbStoreTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0076 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0076 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0077
     * @tc.name      testStartupRunPermutationMatrix0077
     * @tc.desc      按 [RdbStoreTask, ImageKnifeTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0077 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0077 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0078
     * @tc.name      testStartupRunPermutationMatrix0078
     * @tc.desc      按 [RdbStoreTask, KVStoreTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0078 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0078 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0079
     * @tc.name      testStartupRunPermutationMatrix0079
     * @tc.desc      按 [ImageKnifeTask, KVStoreTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0079 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0079 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0080
     * @tc.name      testStartupRunPermutationMatrix0080
     * @tc.desc      按 [ImageKnifeTask, KvManagerUtilTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0080 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0080 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0081
     * @tc.name      testStartupRunPermutationMatrix0081
     * @tc.desc      按 [KVStoreTask, ImageKnifeTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0081 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'ImageKnifeTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0081 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0082
     * @tc.name      testStartupRunPermutationMatrix0082
     * @tc.desc      按 [KVStoreTask, KvManagerUtilTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0082 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0082 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0083
     * @tc.name      testStartupRunPermutationMatrix0083
     * @tc.desc      按 [KvManagerUtilTask, ImageKnifeTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0083 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0083 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0084
     * @tc.name      testStartupRunPermutationMatrix0084
     * @tc.desc      按 [KvManagerUtilTask, KVStoreTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0084 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0084 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0085
     * @tc.name      testStartupRunPermutationMatrix0085
     * @tc.desc      按 [ImageKnifeTask, RdbStoreTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0085 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0085 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0086
     * @tc.name      testStartupRunPermutationMatrix0086
     * @tc.desc      按 [ImageKnifeTask, KvManagerUtilTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0086 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0086 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0087
     * @tc.name      testStartupRunPermutationMatrix0087
     * @tc.desc      按 [RdbStoreTask, ImageKnifeTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0087 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'ImageKnifeTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0087 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0088
     * @tc.name      testStartupRunPermutationMatrix0088
     * @tc.desc      按 [RdbStoreTask, KvManagerUtilTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0088 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0088 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0089
     * @tc.name      testStartupRunPermutationMatrix0089
     * @tc.desc      按 [KvManagerUtilTask, ImageKnifeTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0089 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0089 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0090
     * @tc.name      testStartupRunPermutationMatrix0090
     * @tc.desc      按 [KvManagerUtilTask, RdbStoreTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0090 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0090 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0091
     * @tc.name      testStartupRunPermutationMatrix0091
     * @tc.desc      按 [ResourceManagerTask, FileTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0091 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0091 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0092
     * @tc.name      testStartupRunPermutationMatrix0092
     * @tc.desc      按 [ResourceManagerTask, KVStoreTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0092 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0092 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0093
     * @tc.name      testStartupRunPermutationMatrix0093
     * @tc.desc      按 [FileTask, ResourceManagerTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0093 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0093 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0094
     * @tc.name      testStartupRunPermutationMatrix0094
     * @tc.desc      按 [FileTask, KVStoreTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0094 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0094 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0095
     * @tc.name      testStartupRunPermutationMatrix0095
     * @tc.desc      按 [KVStoreTask, ResourceManagerTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0095 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0095 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0096
     * @tc.name      testStartupRunPermutationMatrix0096
     * @tc.desc      按 [KVStoreTask, FileTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0096 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0096 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0097
     * @tc.name      testStartupRunPermutationMatrix0097
     * @tc.desc      按 [ResourceManagerTask, FileTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0097 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0097 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0098
     * @tc.name      testStartupRunPermutationMatrix0098
     * @tc.desc      按 [ResourceManagerTask, RdbStoreTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0098 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0098 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0099
     * @tc.name      testStartupRunPermutationMatrix0099
     * @tc.desc      按 [FileTask, ResourceManagerTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0099 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0099 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0100
     * @tc.name      testStartupRunPermutationMatrix0100
     * @tc.desc      按 [FileTask, RdbStoreTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0100 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0100 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0101
     * @tc.name      testStartupRunPermutationMatrix0101
     * @tc.desc      按 [RdbStoreTask, ResourceManagerTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0101 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0101 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0102
     * @tc.name      testStartupRunPermutationMatrix0102
     * @tc.desc      按 [RdbStoreTask, FileTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0102 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0102 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0103
     * @tc.name      testStartupRunPermutationMatrix0103
     * @tc.desc      按 [ResourceManagerTask, FileTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0103 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0103 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0104
     * @tc.name      testStartupRunPermutationMatrix0104
     * @tc.desc      按 [ResourceManagerTask, KvManagerUtilTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0104 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0104 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0105
     * @tc.name      testStartupRunPermutationMatrix0105
     * @tc.desc      按 [FileTask, ResourceManagerTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0105 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0105 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0106
     * @tc.name      testStartupRunPermutationMatrix0106
     * @tc.desc      按 [FileTask, KvManagerUtilTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0106 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0106 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0107
     * @tc.name      testStartupRunPermutationMatrix0107
     * @tc.desc      按 [KvManagerUtilTask, ResourceManagerTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0107 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0107 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0108
     * @tc.name      testStartupRunPermutationMatrix0108
     * @tc.desc      按 [KvManagerUtilTask, FileTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0108 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0108 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0109
     * @tc.name      testStartupRunPermutationMatrix0109
     * @tc.desc      按 [ResourceManagerTask, KVStoreTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0109 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0109 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0110
     * @tc.name      testStartupRunPermutationMatrix0110
     * @tc.desc      按 [ResourceManagerTask, RdbStoreTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0110 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0110 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0111
     * @tc.name      testStartupRunPermutationMatrix0111
     * @tc.desc      按 [KVStoreTask, ResourceManagerTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0111 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0111 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0112
     * @tc.name      testStartupRunPermutationMatrix0112
     * @tc.desc      按 [KVStoreTask, RdbStoreTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0112 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0112 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0113
     * @tc.name      testStartupRunPermutationMatrix0113
     * @tc.desc      按 [RdbStoreTask, ResourceManagerTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0113 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0113 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0114
     * @tc.name      testStartupRunPermutationMatrix0114
     * @tc.desc      按 [RdbStoreTask, KVStoreTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0114 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0114 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0115
     * @tc.name      testStartupRunPermutationMatrix0115
     * @tc.desc      按 [ResourceManagerTask, KVStoreTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0115 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0115 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0116
     * @tc.name      testStartupRunPermutationMatrix0116
     * @tc.desc      按 [ResourceManagerTask, KvManagerUtilTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0116 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0116 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0117
     * @tc.name      testStartupRunPermutationMatrix0117
     * @tc.desc      按 [KVStoreTask, ResourceManagerTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0117 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0117 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0118
     * @tc.name      testStartupRunPermutationMatrix0118
     * @tc.desc      按 [KVStoreTask, KvManagerUtilTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0118 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0118 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0119
     * @tc.name      testStartupRunPermutationMatrix0119
     * @tc.desc      按 [KvManagerUtilTask, ResourceManagerTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0119 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0119 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0120
     * @tc.name      testStartupRunPermutationMatrix0120
     * @tc.desc      按 [KvManagerUtilTask, KVStoreTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0120 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0120 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0121
     * @tc.name      testStartupRunPermutationMatrix0121
     * @tc.desc      按 [ResourceManagerTask, RdbStoreTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0121 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0121 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0122
     * @tc.name      testStartupRunPermutationMatrix0122
     * @tc.desc      按 [ResourceManagerTask, KvManagerUtilTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0122 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0122 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0123
     * @tc.name      testStartupRunPermutationMatrix0123
     * @tc.desc      按 [RdbStoreTask, ResourceManagerTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0123 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0123 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0124
     * @tc.name      testStartupRunPermutationMatrix0124
     * @tc.desc      按 [RdbStoreTask, KvManagerUtilTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0124 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0124 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0125
     * @tc.name      testStartupRunPermutationMatrix0125
     * @tc.desc      按 [KvManagerUtilTask, ResourceManagerTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0125 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0125 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0126
     * @tc.name      testStartupRunPermutationMatrix0126
     * @tc.desc      按 [KvManagerUtilTask, RdbStoreTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0126 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0126 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0127
     * @tc.name      testStartupRunPermutationMatrix0127
     * @tc.desc      按 [FileTask, KVStoreTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0127 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0127 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0128
     * @tc.name      testStartupRunPermutationMatrix0128
     * @tc.desc      按 [FileTask, RdbStoreTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0128 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0128 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0129
     * @tc.name      testStartupRunPermutationMatrix0129
     * @tc.desc      按 [KVStoreTask, FileTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0129 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0129 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0130
     * @tc.name      testStartupRunPermutationMatrix0130
     * @tc.desc      按 [KVStoreTask, RdbStoreTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0130 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0130 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0131
     * @tc.name      testStartupRunPermutationMatrix0131
     * @tc.desc      按 [RdbStoreTask, FileTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0131 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0131 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0132
     * @tc.name      testStartupRunPermutationMatrix0132
     * @tc.desc      按 [RdbStoreTask, KVStoreTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0132 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0132 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0133
     * @tc.name      testStartupRunPermutationMatrix0133
     * @tc.desc      按 [FileTask, KVStoreTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0133 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0133 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0134
     * @tc.name      testStartupRunPermutationMatrix0134
     * @tc.desc      按 [FileTask, KvManagerUtilTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0134 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0134 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0135
     * @tc.name      testStartupRunPermutationMatrix0135
     * @tc.desc      按 [KVStoreTask, FileTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0135 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0135 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0136
     * @tc.name      testStartupRunPermutationMatrix0136
     * @tc.desc      按 [KVStoreTask, KvManagerUtilTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0136 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0136 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0137
     * @tc.name      testStartupRunPermutationMatrix0137
     * @tc.desc      按 [KvManagerUtilTask, FileTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0137 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0137 end');
    })
  })
}
