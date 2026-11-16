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

export default function startupRunPermutationMatrixMoreTest(): void {
  describe('AppStartupStartupRunPermutationMatrixMoreTest', () => {
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
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0334
     * @tc.name      testStartupRunPermutationMatrix0334
     * @tc.desc      按 [KVStoreTask, FileTask, KvManagerUtilTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0334 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0334 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0335
     * @tc.name      testStartupRunPermutationMatrix0335
     * @tc.desc      按 [KVStoreTask, KvManagerUtilTask, ImageKnifeTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0335 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0335 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0336
     * @tc.name      testStartupRunPermutationMatrix0336
     * @tc.desc      按 [KVStoreTask, KvManagerUtilTask, FileTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0336 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0336 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0337
     * @tc.name      testStartupRunPermutationMatrix0337
     * @tc.desc      按 [KvManagerUtilTask, ImageKnifeTask, FileTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0337 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0337 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0338
     * @tc.name      testStartupRunPermutationMatrix0338
     * @tc.desc      按 [KvManagerUtilTask, ImageKnifeTask, KVStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0338 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0338 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0339
     * @tc.name      testStartupRunPermutationMatrix0339
     * @tc.desc      按 [KvManagerUtilTask, FileTask, ImageKnifeTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0339 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0339 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0340
     * @tc.name      testStartupRunPermutationMatrix0340
     * @tc.desc      按 [KvManagerUtilTask, FileTask, KVStoreTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0340 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0340 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0341
     * @tc.name      testStartupRunPermutationMatrix0341
     * @tc.desc      按 [KvManagerUtilTask, KVStoreTask, ImageKnifeTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0341 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0341 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0342
     * @tc.name      testStartupRunPermutationMatrix0342
     * @tc.desc      按 [KvManagerUtilTask, KVStoreTask, FileTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0342 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0342 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0343
     * @tc.name      testStartupRunPermutationMatrix0343
     * @tc.desc      按 [ImageKnifeTask, FileTask, RdbStoreTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0343 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0343 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0344
     * @tc.name      testStartupRunPermutationMatrix0344
     * @tc.desc      按 [ImageKnifeTask, FileTask, KvManagerUtilTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0344 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0344 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0345
     * @tc.name      testStartupRunPermutationMatrix0345
     * @tc.desc      按 [ImageKnifeTask, RdbStoreTask, FileTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0345 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0345 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0346
     * @tc.name      testStartupRunPermutationMatrix0346
     * @tc.desc      按 [ImageKnifeTask, RdbStoreTask, KvManagerUtilTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0346 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0346 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0347
     * @tc.name      testStartupRunPermutationMatrix0347
     * @tc.desc      按 [ImageKnifeTask, KvManagerUtilTask, FileTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0347 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0347 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0348
     * @tc.name      testStartupRunPermutationMatrix0348
     * @tc.desc      按 [ImageKnifeTask, KvManagerUtilTask, RdbStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0348 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0348 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0349
     * @tc.name      testStartupRunPermutationMatrix0349
     * @tc.desc      按 [FileTask, ImageKnifeTask, RdbStoreTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0349 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0349 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0350
     * @tc.name      testStartupRunPermutationMatrix0350
     * @tc.desc      按 [FileTask, ImageKnifeTask, KvManagerUtilTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0350 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0350 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0351
     * @tc.name      testStartupRunPermutationMatrix0351
     * @tc.desc      按 [FileTask, RdbStoreTask, ImageKnifeTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0351 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0351 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0352
     * @tc.name      testStartupRunPermutationMatrix0352
     * @tc.desc      按 [FileTask, RdbStoreTask, KvManagerUtilTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0352 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0352 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0353
     * @tc.name      testStartupRunPermutationMatrix0353
     * @tc.desc      按 [FileTask, KvManagerUtilTask, ImageKnifeTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0353 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0353 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0354
     * @tc.name      testStartupRunPermutationMatrix0354
     * @tc.desc      按 [FileTask, KvManagerUtilTask, RdbStoreTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0354 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0354 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0355
     * @tc.name      testStartupRunPermutationMatrix0355
     * @tc.desc      按 [RdbStoreTask, ImageKnifeTask, FileTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0355 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'ImageKnifeTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0355 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0356
     * @tc.name      testStartupRunPermutationMatrix0356
     * @tc.desc      按 [RdbStoreTask, ImageKnifeTask, KvManagerUtilTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0356 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'ImageKnifeTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0356 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0357
     * @tc.name      testStartupRunPermutationMatrix0357
     * @tc.desc      按 [RdbStoreTask, FileTask, ImageKnifeTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0357 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0357 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0358
     * @tc.name      testStartupRunPermutationMatrix0358
     * @tc.desc      按 [RdbStoreTask, FileTask, KvManagerUtilTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0358 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0358 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0359
     * @tc.name      testStartupRunPermutationMatrix0359
     * @tc.desc      按 [RdbStoreTask, KvManagerUtilTask, ImageKnifeTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0359 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0359 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0360
     * @tc.name      testStartupRunPermutationMatrix0360
     * @tc.desc      按 [RdbStoreTask, KvManagerUtilTask, FileTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0360 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0360 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0361
     * @tc.name      testStartupRunPermutationMatrix0361
     * @tc.desc      按 [KvManagerUtilTask, ImageKnifeTask, FileTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0361 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0361 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0362
     * @tc.name      testStartupRunPermutationMatrix0362
     * @tc.desc      按 [KvManagerUtilTask, ImageKnifeTask, RdbStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0362 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0362 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0363
     * @tc.name      testStartupRunPermutationMatrix0363
     * @tc.desc      按 [KvManagerUtilTask, FileTask, ImageKnifeTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0363 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0363 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0364
     * @tc.name      testStartupRunPermutationMatrix0364
     * @tc.desc      按 [KvManagerUtilTask, FileTask, RdbStoreTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0364 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0364 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0365
     * @tc.name      testStartupRunPermutationMatrix0365
     * @tc.desc      按 [KvManagerUtilTask, RdbStoreTask, ImageKnifeTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0365 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0365 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0366
     * @tc.name      testStartupRunPermutationMatrix0366
     * @tc.desc      按 [KvManagerUtilTask, RdbStoreTask, FileTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0366 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0366 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0367
     * @tc.name      testStartupRunPermutationMatrix0367
     * @tc.desc      按 [ImageKnifeTask, KVStoreTask, RdbStoreTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0367 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0367 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0368
     * @tc.name      testStartupRunPermutationMatrix0368
     * @tc.desc      按 [ImageKnifeTask, KVStoreTask, KvManagerUtilTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0368 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0368 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0369
     * @tc.name      testStartupRunPermutationMatrix0369
     * @tc.desc      按 [ImageKnifeTask, RdbStoreTask, KVStoreTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0369 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0369 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0370
     * @tc.name      testStartupRunPermutationMatrix0370
     * @tc.desc      按 [ImageKnifeTask, RdbStoreTask, KvManagerUtilTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0370 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0370 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0371
     * @tc.name      testStartupRunPermutationMatrix0371
     * @tc.desc      按 [ImageKnifeTask, KvManagerUtilTask, KVStoreTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0371 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0371 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0372
     * @tc.name      testStartupRunPermutationMatrix0372
     * @tc.desc      按 [ImageKnifeTask, KvManagerUtilTask, RdbStoreTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0372 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0372 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0373
     * @tc.name      testStartupRunPermutationMatrix0373
     * @tc.desc      按 [KVStoreTask, ImageKnifeTask, RdbStoreTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0373 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0373 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0374
     * @tc.name      testStartupRunPermutationMatrix0374
     * @tc.desc      按 [KVStoreTask, ImageKnifeTask, KvManagerUtilTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0374 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0374 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0375
     * @tc.name      testStartupRunPermutationMatrix0375
     * @tc.desc      按 [KVStoreTask, RdbStoreTask, ImageKnifeTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0375 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0375 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0376
     * @tc.name      testStartupRunPermutationMatrix0376
     * @tc.desc      按 [KVStoreTask, RdbStoreTask, KvManagerUtilTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0376 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0376 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0377
     * @tc.name      testStartupRunPermutationMatrix0377
     * @tc.desc      按 [KVStoreTask, KvManagerUtilTask, ImageKnifeTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0377 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0377 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0378
     * @tc.name      testStartupRunPermutationMatrix0378
     * @tc.desc      按 [KVStoreTask, KvManagerUtilTask, RdbStoreTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0378 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0378 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0379
     * @tc.name      testStartupRunPermutationMatrix0379
     * @tc.desc      按 [RdbStoreTask, ImageKnifeTask, KVStoreTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0379 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0379 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0380
     * @tc.name      testStartupRunPermutationMatrix0380
     * @tc.desc      按 [RdbStoreTask, ImageKnifeTask, KvManagerUtilTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0380 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0380 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0381
     * @tc.name      testStartupRunPermutationMatrix0381
     * @tc.desc      按 [RdbStoreTask, KVStoreTask, ImageKnifeTask, KvManagerUtilTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0381 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0381 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0382
     * @tc.name      testStartupRunPermutationMatrix0382
     * @tc.desc      按 [RdbStoreTask, KVStoreTask, KvManagerUtilTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0382 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0382 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0383
     * @tc.name      testStartupRunPermutationMatrix0383
     * @tc.desc      按 [RdbStoreTask, KvManagerUtilTask, ImageKnifeTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0383 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0383 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0384
     * @tc.name      testStartupRunPermutationMatrix0384
     * @tc.desc      按 [RdbStoreTask, KvManagerUtilTask, KVStoreTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0384 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0384 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0385
     * @tc.name      testStartupRunPermutationMatrix0385
     * @tc.desc      按 [KvManagerUtilTask, ImageKnifeTask, KVStoreTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0385 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0385 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0386
     * @tc.name      testStartupRunPermutationMatrix0386
     * @tc.desc      按 [KvManagerUtilTask, ImageKnifeTask, RdbStoreTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0386 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0386 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0387
     * @tc.name      testStartupRunPermutationMatrix0387
     * @tc.desc      按 [KvManagerUtilTask, KVStoreTask, ImageKnifeTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0387 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0387 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0388
     * @tc.name      testStartupRunPermutationMatrix0388
     * @tc.desc      按 [KvManagerUtilTask, KVStoreTask, RdbStoreTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0388 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0388 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0389
     * @tc.name      testStartupRunPermutationMatrix0389
     * @tc.desc      按 [KvManagerUtilTask, RdbStoreTask, ImageKnifeTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0389 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0389 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0390
     * @tc.name      testStartupRunPermutationMatrix0390
     * @tc.desc      按 [KvManagerUtilTask, RdbStoreTask, KVStoreTask, ImageKnifeTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0390 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0390 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0391
     * @tc.name      testStartupRunPermutationMatrix0391
     * @tc.desc      按 [ResourceManagerTask, FileTask, KVStoreTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0391 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0391 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0392
     * @tc.name      testStartupRunPermutationMatrix0392
     * @tc.desc      按 [ResourceManagerTask, FileTask, RdbStoreTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0392 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0392 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0393
     * @tc.name      testStartupRunPermutationMatrix0393
     * @tc.desc      按 [ResourceManagerTask, KVStoreTask, FileTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0393 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0393 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0394
     * @tc.name      testStartupRunPermutationMatrix0394
     * @tc.desc      按 [ResourceManagerTask, KVStoreTask, RdbStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0394 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0394 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0395
     * @tc.name      testStartupRunPermutationMatrix0395
     * @tc.desc      按 [ResourceManagerTask, RdbStoreTask, FileTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0395 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0395 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0396
     * @tc.name      testStartupRunPermutationMatrix0396
     * @tc.desc      按 [ResourceManagerTask, RdbStoreTask, KVStoreTask, FileTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0396 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0396 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0397
     * @tc.name      testStartupRunPermutationMatrix0397
     * @tc.desc      按 [FileTask, ResourceManagerTask, KVStoreTask, RdbStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0397 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0397 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0398
     * @tc.name      testStartupRunPermutationMatrix0398
     * @tc.desc      按 [FileTask, ResourceManagerTask, RdbStoreTask, KVStoreTask] 顺序 run 4 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunPermutationMatrix0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0398 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0398 end');
    })
  })
}
