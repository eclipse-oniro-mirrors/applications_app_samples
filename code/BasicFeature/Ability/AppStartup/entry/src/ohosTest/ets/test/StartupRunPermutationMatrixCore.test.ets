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

export default function startupRunPermutationMatrixCoreTest(): void {
  describe('AppStartupStartupRunPermutationMatrixCoreTest', () => {
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
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0001
     * @tc.name      testStartupRunPermutationMatrix0001
     * @tc.desc      按 [ImageKnifeTask, ResourceManagerTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0001 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0001 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0002
     * @tc.name      testStartupRunPermutationMatrix0002
     * @tc.desc      按 [ResourceManagerTask, ImageKnifeTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0002 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0002 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0003
     * @tc.name      testStartupRunPermutationMatrix0003
     * @tc.desc      按 [ImageKnifeTask, FileTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0003 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0003 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0004
     * @tc.name      testStartupRunPermutationMatrix0004
     * @tc.desc      按 [FileTask, ImageKnifeTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0004 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0004 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0005
     * @tc.name      testStartupRunPermutationMatrix0005
     * @tc.desc      按 [ImageKnifeTask, KVStoreTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0005 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0005 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0006
     * @tc.name      testStartupRunPermutationMatrix0006
     * @tc.desc      按 [KVStoreTask, ImageKnifeTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0006 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0006 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0007
     * @tc.name      testStartupRunPermutationMatrix0007
     * @tc.desc      按 [ImageKnifeTask, RdbStoreTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0007 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0007 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0008
     * @tc.name      testStartupRunPermutationMatrix0008
     * @tc.desc      按 [RdbStoreTask, ImageKnifeTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0008 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0008 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0009
     * @tc.name      testStartupRunPermutationMatrix0009
     * @tc.desc      按 [ImageKnifeTask, KvManagerUtilTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0009 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0009 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0010
     * @tc.name      testStartupRunPermutationMatrix0010
     * @tc.desc      按 [KvManagerUtilTask, ImageKnifeTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0010 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0010 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0011
     * @tc.name      testStartupRunPermutationMatrix0011
     * @tc.desc      按 [ResourceManagerTask, FileTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0011 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0011 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0012
     * @tc.name      testStartupRunPermutationMatrix0012
     * @tc.desc      按 [FileTask, ResourceManagerTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0012 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0012 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0013
     * @tc.name      testStartupRunPermutationMatrix0013
     * @tc.desc      按 [ResourceManagerTask, KVStoreTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0013 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0013 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0014
     * @tc.name      testStartupRunPermutationMatrix0014
     * @tc.desc      按 [KVStoreTask, ResourceManagerTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0014 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0014 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0015
     * @tc.name      testStartupRunPermutationMatrix0015
     * @tc.desc      按 [ResourceManagerTask, RdbStoreTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0015 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0015 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0016
     * @tc.name      testStartupRunPermutationMatrix0016
     * @tc.desc      按 [RdbStoreTask, ResourceManagerTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0016 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0016 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0017
     * @tc.name      testStartupRunPermutationMatrix0017
     * @tc.desc      按 [ResourceManagerTask, KvManagerUtilTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0017 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0017 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0018
     * @tc.name      testStartupRunPermutationMatrix0018
     * @tc.desc      按 [KvManagerUtilTask, ResourceManagerTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0018 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0018 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0019
     * @tc.name      testStartupRunPermutationMatrix0019
     * @tc.desc      按 [FileTask, KVStoreTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0019 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0019 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0020
     * @tc.name      testStartupRunPermutationMatrix0020
     * @tc.desc      按 [KVStoreTask, FileTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0020 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0020 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0021
     * @tc.name      testStartupRunPermutationMatrix0021
     * @tc.desc      按 [FileTask, RdbStoreTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0021 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0021 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0022
     * @tc.name      testStartupRunPermutationMatrix0022
     * @tc.desc      按 [RdbStoreTask, FileTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0022 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0022 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0023
     * @tc.name      testStartupRunPermutationMatrix0023
     * @tc.desc      按 [FileTask, KvManagerUtilTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0023 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0023 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0024
     * @tc.name      testStartupRunPermutationMatrix0024
     * @tc.desc      按 [KvManagerUtilTask, FileTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0024 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0024 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0025
     * @tc.name      testStartupRunPermutationMatrix0025
     * @tc.desc      按 [KVStoreTask, RdbStoreTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0025 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0025 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0026
     * @tc.name      testStartupRunPermutationMatrix0026
     * @tc.desc      按 [RdbStoreTask, KVStoreTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0026 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0026 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0027
     * @tc.name      testStartupRunPermutationMatrix0027
     * @tc.desc      按 [KVStoreTask, KvManagerUtilTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0027 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0027 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0028
     * @tc.name      testStartupRunPermutationMatrix0028
     * @tc.desc      按 [KvManagerUtilTask, KVStoreTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0028 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0028 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0029
     * @tc.name      testStartupRunPermutationMatrix0029
     * @tc.desc      按 [RdbStoreTask, KvManagerUtilTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0029 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0029 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0030
     * @tc.name      testStartupRunPermutationMatrix0030
     * @tc.desc      按 [KvManagerUtilTask, RdbStoreTask] 顺序 run 2 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0030 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0030 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0031
     * @tc.name      testStartupRunPermutationMatrix0031
     * @tc.desc      按 [ImageKnifeTask, ResourceManagerTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0031 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0031 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0032
     * @tc.name      testStartupRunPermutationMatrix0032
     * @tc.desc      按 [ImageKnifeTask, FileTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0032 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0032 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0033
     * @tc.name      testStartupRunPermutationMatrix0033
     * @tc.desc      按 [ResourceManagerTask, ImageKnifeTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0033 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0033 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0034
     * @tc.name      testStartupRunPermutationMatrix0034
     * @tc.desc      按 [ResourceManagerTask, FileTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0034 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0034 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0035
     * @tc.name      testStartupRunPermutationMatrix0035
     * @tc.desc      按 [FileTask, ImageKnifeTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0035 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0035 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0036
     * @tc.name      testStartupRunPermutationMatrix0036
     * @tc.desc      按 [FileTask, ResourceManagerTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0036 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0036 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0037
     * @tc.name      testStartupRunPermutationMatrix0037
     * @tc.desc      按 [ImageKnifeTask, ResourceManagerTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0037 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0037 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0038
     * @tc.name      testStartupRunPermutationMatrix0038
     * @tc.desc      按 [ImageKnifeTask, KVStoreTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0038 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0038 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0039
     * @tc.name      testStartupRunPermutationMatrix0039
     * @tc.desc      按 [ResourceManagerTask, ImageKnifeTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0039 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0039 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0040
     * @tc.name      testStartupRunPermutationMatrix0040
     * @tc.desc      按 [ResourceManagerTask, KVStoreTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0040 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0040 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0041
     * @tc.name      testStartupRunPermutationMatrix0041
     * @tc.desc      按 [KVStoreTask, ImageKnifeTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0041 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0041 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0042
     * @tc.name      testStartupRunPermutationMatrix0042
     * @tc.desc      按 [KVStoreTask, ResourceManagerTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0042 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0042 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0043
     * @tc.name      testStartupRunPermutationMatrix0043
     * @tc.desc      按 [ImageKnifeTask, ResourceManagerTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0043 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0043 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0044
     * @tc.name      testStartupRunPermutationMatrix0044
     * @tc.desc      按 [ImageKnifeTask, RdbStoreTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0044 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0044 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0045
     * @tc.name      testStartupRunPermutationMatrix0045
     * @tc.desc      按 [ResourceManagerTask, ImageKnifeTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0045 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0045 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0046
     * @tc.name      testStartupRunPermutationMatrix0046
     * @tc.desc      按 [ResourceManagerTask, RdbStoreTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0046 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0046 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0047
     * @tc.name      testStartupRunPermutationMatrix0047
     * @tc.desc      按 [RdbStoreTask, ImageKnifeTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0047 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0047 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0048
     * @tc.name      testStartupRunPermutationMatrix0048
     * @tc.desc      按 [RdbStoreTask, ResourceManagerTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0048 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0048 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0049
     * @tc.name      testStartupRunPermutationMatrix0049
     * @tc.desc      按 [ImageKnifeTask, ResourceManagerTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0049 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0049 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0050
     * @tc.name      testStartupRunPermutationMatrix0050
     * @tc.desc      按 [ImageKnifeTask, KvManagerUtilTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0050 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0050 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0051
     * @tc.name      testStartupRunPermutationMatrix0051
     * @tc.desc      按 [ResourceManagerTask, ImageKnifeTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0051 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0051 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0052
     * @tc.name      testStartupRunPermutationMatrix0052
     * @tc.desc      按 [ResourceManagerTask, KvManagerUtilTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0052 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0052 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0053
     * @tc.name      testStartupRunPermutationMatrix0053
     * @tc.desc      按 [KvManagerUtilTask, ImageKnifeTask, ResourceManagerTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0053 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0053 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0054
     * @tc.name      testStartupRunPermutationMatrix0054
     * @tc.desc      按 [KvManagerUtilTask, ResourceManagerTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0054 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask',
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0054 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0055
     * @tc.name      testStartupRunPermutationMatrix0055
     * @tc.desc      按 [ImageKnifeTask, FileTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0055 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0055 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0056
     * @tc.name      testStartupRunPermutationMatrix0056
     * @tc.desc      按 [ImageKnifeTask, KVStoreTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0056 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0056 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0057
     * @tc.name      testStartupRunPermutationMatrix0057
     * @tc.desc      按 [FileTask, ImageKnifeTask, KVStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0057 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0057 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0058
     * @tc.name      testStartupRunPermutationMatrix0058
     * @tc.desc      按 [FileTask, KVStoreTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0058 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0058 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0059
     * @tc.name      testStartupRunPermutationMatrix0059
     * @tc.desc      按 [KVStoreTask, ImageKnifeTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0059 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0059 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0060
     * @tc.name      testStartupRunPermutationMatrix0060
     * @tc.desc      按 [KVStoreTask, FileTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0060 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0060 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0061
     * @tc.name      testStartupRunPermutationMatrix0061
     * @tc.desc      按 [ImageKnifeTask, FileTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0061 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0061 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0062
     * @tc.name      testStartupRunPermutationMatrix0062
     * @tc.desc      按 [ImageKnifeTask, RdbStoreTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0062 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0062 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0063
     * @tc.name      testStartupRunPermutationMatrix0063
     * @tc.desc      按 [FileTask, ImageKnifeTask, RdbStoreTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0063 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0063 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0064
     * @tc.name      testStartupRunPermutationMatrix0064
     * @tc.desc      按 [FileTask, RdbStoreTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0064 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0064 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0065
     * @tc.name      testStartupRunPermutationMatrix0065
     * @tc.desc      按 [RdbStoreTask, ImageKnifeTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0065 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0065 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0066
     * @tc.name      testStartupRunPermutationMatrix0066
     * @tc.desc      按 [RdbStoreTask, FileTask, ImageKnifeTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0066 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0066 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0067
     * @tc.name      testStartupRunPermutationMatrix0067
     * @tc.desc      按 [ImageKnifeTask, FileTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0067 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0067 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0068
     * @tc.name      testStartupRunPermutationMatrix0068
     * @tc.desc      按 [ImageKnifeTask, KvManagerUtilTask, FileTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0068 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0068 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_PERMUTATION_0069
     * @tc.name      testStartupRunPermutationMatrix0069
     * @tc.desc      按 [FileTask, ImageKnifeTask, KvManagerUtilTask] 顺序 run 3 个任务后任务初始化状态与排列一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunPermutationMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0069 begin');
      await resetBaseline();
      const tasks: string[] = [
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunPermutationMatrix0069 end');
    })
  })
}
