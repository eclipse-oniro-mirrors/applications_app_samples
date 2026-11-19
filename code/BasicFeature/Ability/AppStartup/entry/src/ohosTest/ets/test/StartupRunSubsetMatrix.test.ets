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
import { ensureEntryStarted, resetBaseline, runResult, taskStates } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartup]';
const ALL_TRUE: string = 'true,true,true,true,true,true';
const BASELINE: string = 'false,true,true,true,true,true';

export default function startupRunSubsetMatrixTest(): void {
  describe('AppStartupStartupRunSubsetMatrixTest', () => {
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
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0001
     * @tc.name      testStartupRunSubsetMatrix0001
     * @tc.desc      run [ImageKnifeTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0001 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0001 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0002
     * @tc.name      testStartupRunSubsetMatrix0002
     * @tc.desc      run [ResourceManagerTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0002 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0002 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0003
     * @tc.name      testStartupRunSubsetMatrix0003
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0003 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0003 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0004
     * @tc.name      testStartupRunSubsetMatrix0004
     * @tc.desc      run [FileTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0004 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0004 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0005
     * @tc.name      testStartupRunSubsetMatrix0005
     * @tc.desc      run [ImageKnifeTask, FileTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0005 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0005 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0006
     * @tc.name      testStartupRunSubsetMatrix0006
     * @tc.desc      run [ResourceManagerTask, FileTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0006 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0006 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0007
     * @tc.name      testStartupRunSubsetMatrix0007
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, FileTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0007 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0007 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0008
     * @tc.name      testStartupRunSubsetMatrix0008
     * @tc.desc      run [KVStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0008 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KVStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0008 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0009
     * @tc.name      testStartupRunSubsetMatrix0009
     * @tc.desc      run [ImageKnifeTask, KVStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0009 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0009 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0010
     * @tc.name      testStartupRunSubsetMatrix0010
     * @tc.desc      run [ResourceManagerTask, KVStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0010 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0010 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0011
     * @tc.name      testStartupRunSubsetMatrix0011
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, KVStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0011 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0011 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0012
     * @tc.name      testStartupRunSubsetMatrix0012
     * @tc.desc      run [FileTask, KVStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0012 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0012 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0013
     * @tc.name      testStartupRunSubsetMatrix0013
     * @tc.desc      run [ImageKnifeTask, FileTask, KVStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0013 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0013 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0014
     * @tc.name      testStartupRunSubsetMatrix0014
     * @tc.desc      run [ResourceManagerTask, FileTask, KVStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0014 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0014 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0015
     * @tc.name      testStartupRunSubsetMatrix0015
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, FileTask, KVStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0015 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0015 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0016
     * @tc.name      testStartupRunSubsetMatrix0016
     * @tc.desc      run [RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0016 begin');
      await resetBaseline();
      const tasks: string[] = [
        'RdbStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0016 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0017
     * @tc.name      testStartupRunSubsetMatrix0017
     * @tc.desc      run [ImageKnifeTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0017 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0017 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0018
     * @tc.name      testStartupRunSubsetMatrix0018
     * @tc.desc      run [ResourceManagerTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0018 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0018 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0019
     * @tc.name      testStartupRunSubsetMatrix0019
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0019 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0019 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0020
     * @tc.name      testStartupRunSubsetMatrix0020
     * @tc.desc      run [FileTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0020 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0020 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0021
     * @tc.name      testStartupRunSubsetMatrix0021
     * @tc.desc      run [ImageKnifeTask, FileTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0021 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0021 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0022
     * @tc.name      testStartupRunSubsetMatrix0022
     * @tc.desc      run [ResourceManagerTask, FileTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0022 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0022 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0023
     * @tc.name      testStartupRunSubsetMatrix0023
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, FileTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0023 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0023 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0024
     * @tc.name      testStartupRunSubsetMatrix0024
     * @tc.desc      run [KVStoreTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0024 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0024 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0025
     * @tc.name      testStartupRunSubsetMatrix0025
     * @tc.desc      run [ImageKnifeTask, KVStoreTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0025 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0025 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0026
     * @tc.name      testStartupRunSubsetMatrix0026
     * @tc.desc      run [ResourceManagerTask, KVStoreTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0026 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0026 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0027
     * @tc.name      testStartupRunSubsetMatrix0027
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, KVStoreTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0027 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'ResourceManagerTask',
        'KVStoreTask',
        'RdbStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0027 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0028
     * @tc.name      testStartupRunSubsetMatrix0028
     * @tc.desc      run [FileTask, KVStoreTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0028 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0028 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0029
     * @tc.name      testStartupRunSubsetMatrix0029
     * @tc.desc      run [ImageKnifeTask, FileTask, KVStoreTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0029 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'FileTask',
        'KVStoreTask',
        'RdbStoreTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0029 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0030
     * @tc.name      testStartupRunSubsetMatrix0030
     * @tc.desc      run [ResourceManagerTask, FileTask, KVStoreTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0030 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0030 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0031
     * @tc.name      testStartupRunSubsetMatrix0031
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, FileTask, KVStoreTask, RdbStoreTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0031 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
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
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0031 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0032
     * @tc.name      testStartupRunSubsetMatrix0032
     * @tc.desc      run [KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0032 begin');
      await resetBaseline();
      const tasks: string[] = [
        'KvManagerUtilTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0032 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0033
     * @tc.name      testStartupRunSubsetMatrix0033
     * @tc.desc      run [ImageKnifeTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0033 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0033 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0034
     * @tc.name      testStartupRunSubsetMatrix0034
     * @tc.desc      run [ResourceManagerTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0034 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0034 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0035
     * @tc.name      testStartupRunSubsetMatrix0035
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0035 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0035 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0036
     * @tc.name      testStartupRunSubsetMatrix0036
     * @tc.desc      run [FileTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0036 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0036 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0037
     * @tc.name      testStartupRunSubsetMatrix0037
     * @tc.desc      run [ImageKnifeTask, FileTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0037 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0037 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0038
     * @tc.name      testStartupRunSubsetMatrix0038
     * @tc.desc      run [ResourceManagerTask, FileTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0038 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0038 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0039
     * @tc.name      testStartupRunSubsetMatrix0039
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, FileTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0039 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0039 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0040
     * @tc.name      testStartupRunSubsetMatrix0040
     * @tc.desc      run [KVStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0040 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0040 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0041
     * @tc.name      testStartupRunSubsetMatrix0041
     * @tc.desc      run [ImageKnifeTask, KVStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0041 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0041 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0042
     * @tc.name      testStartupRunSubsetMatrix0042
     * @tc.desc      run [ResourceManagerTask, KVStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0042 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0042 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0043
     * @tc.name      testStartupRunSubsetMatrix0043
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, KVStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0043 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'ResourceManagerTask',
        'KVStoreTask',
        'KvManagerUtilTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0043 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0044
     * @tc.name      testStartupRunSubsetMatrix0044
     * @tc.desc      run [FileTask, KVStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0044 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0044 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0045
     * @tc.name      testStartupRunSubsetMatrix0045
     * @tc.desc      run [ImageKnifeTask, FileTask, KVStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0045 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'FileTask',
        'KVStoreTask',
        'KvManagerUtilTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0045 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0046
     * @tc.name      testStartupRunSubsetMatrix0046
     * @tc.desc      run [ResourceManagerTask, FileTask, KVStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0046 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0046 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0047
     * @tc.name      testStartupRunSubsetMatrix0047
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, FileTask, KVStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0047 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
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
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0047 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0048
     * @tc.name      testStartupRunSubsetMatrix0048
     * @tc.desc      run [RdbStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupRunSubsetMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0048 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0048 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0049
     * @tc.name      testStartupRunSubsetMatrix0049
     * @tc.desc      run [ImageKnifeTask, RdbStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0049 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0049 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0050
     * @tc.name      testStartupRunSubsetMatrix0050
     * @tc.desc      run [ResourceManagerTask, RdbStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0050 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0050 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0051
     * @tc.name      testStartupRunSubsetMatrix0051
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, RdbStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0051 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'ResourceManagerTask',
        'RdbStoreTask',
        'KvManagerUtilTask'
      ];
      const result: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0051 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0052
     * @tc.name      testStartupRunSubsetMatrix0052
     * @tc.desc      run [FileTask, RdbStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0052 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0052 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0053
     * @tc.name      testStartupRunSubsetMatrix0053
     * @tc.desc      run [ImageKnifeTask, FileTask, RdbStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0053 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0053 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0054
     * @tc.name      testStartupRunSubsetMatrix0054
     * @tc.desc      run [ResourceManagerTask, FileTask, RdbStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0054 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0054 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0055
     * @tc.name      testStartupRunSubsetMatrix0055
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, FileTask, RdbStoreTask, KvManagerUtilTask] 成功，
     *               任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0055 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
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
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0055 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0056
     * @tc.name      testStartupRunSubsetMatrix0056
     * @tc.desc      run [KVStoreTask, RdbStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0056 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0056 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0057
     * @tc.name      testStartupRunSubsetMatrix0057
     * @tc.desc      run [ImageKnifeTask, KVStoreTask, RdbStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0057 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0057 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0058
     * @tc.name      testStartupRunSubsetMatrix0058
     * @tc.desc      run [ResourceManagerTask, KVStoreTask, RdbStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0058 begin');
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0058 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0059
     * @tc.name      testStartupRunSubsetMatrix0059
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, KVStoreTask, RdbStoreTask, KvManagerUtilTask] 成功，
     *               任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0059 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
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
      expect(actual2).assertEqual('true,true,true,true,true,true');
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0059 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0060
     * @tc.name      testStartupRunSubsetMatrix0060
     * @tc.desc      run [FileTask, KVStoreTask, RdbStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0060 begin');
      await resetBaseline();
      const tasks: string[] = [
        'FileTask',
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0060 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0061
     * @tc.name      testStartupRunSubsetMatrix0061
     * @tc.desc      run [ImageKnifeTask, FileTask, KVStoreTask, RdbStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0061 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'FileTask',
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0061 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0062
     * @tc.name      testStartupRunSubsetMatrix0062
     * @tc.desc      run [ResourceManagerTask, FileTask, KVStoreTask, RdbStoreTask, KvManagerUtilTask] 成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0062 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ResourceManagerTask',
        'FileTask',
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0062 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_RUN_SUBSET_0063
     * @tc.name      testStartupRunSubsetMatrix0063
     * @tc.desc      run [ImageKnifeTask, ResourceManagerTask, FileTask, KVStoreTask, RdbStoreTask, KvManagerUtilTask]
     *               成功，任务初始化状态与子集一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupRunSubsetMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0063 begin');
      await resetBaseline();
      const tasks: string[] = [
        'ImageKnifeTask',
        'ResourceManagerTask',
        'FileTask',
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
      const imageKnifeInit: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 imageKnifeInit=${imageKnifeInit}`);
      expect(imageKnifeInit).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupRunSubsetMatrix0063 end');
    })
  })
}
