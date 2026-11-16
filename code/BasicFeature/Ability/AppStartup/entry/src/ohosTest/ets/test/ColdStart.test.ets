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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { startupManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  AUTO_TASK_NAMES, ensureEntryStarted, errorOf, ListenerProbe, listenerConfig, resultKind, runResult, sleep,
  TASK_NAMES, taskStates
} from './TestHelper';
import { topName } from './UiHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartup]';
const NOT_FOUND: string = '28800001:startup task or its dependency not found.';

/**
 * 必须在 List 里第一个注册：测试进程由 entry_test 的 TestAbility 拉起，此时 entry 的 AbilityStage
 * 与启动配置还没加载，startupManager 认不出任何任务；最后一条用例才拉起 EntryAbility。
 */

export default function coldStartTest(): void {
  describe('AppStartupColdStartTest', () => {
    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0001
     * @tc.name      testColdStart0001
     * @tc.desc      冷启动未拉起 EntryAbility 时栈顶是 TestAbility，ImageKnifeTask 尚未登记，查询初始化状态与结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testColdStart0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0001 begin');
      const actual1: string = await topName();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('TestAbility');
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('ImageKnifeTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = resultKind('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0001 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0002
     * @tc.name      testColdStart0002
     * @tc.desc      冷启动未拉起 EntryAbility 时栈顶是 TestAbility，ResourceManagerTask 尚未登记，查询初始化状态与结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testColdStart0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0002 begin');
      const actual1: string = await topName();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('TestAbility');
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('ResourceManagerTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = resultKind('ResourceManagerTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0002 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0003
     * @tc.name      testColdStart0003
     * @tc.desc      冷启动未拉起 EntryAbility 时栈顶是 TestAbility，FileTask 尚未登记，查询初始化状态与结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testColdStart0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0003 begin');
      const actual1: string = await topName();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('TestAbility');
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('FileTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = resultKind('FileTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0003 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0004
     * @tc.name      testColdStart0004
     * @tc.desc      冷启动未拉起 EntryAbility 时栈顶是 TestAbility，KVStoreTask 尚未登记，查询初始化状态与结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testColdStart0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0004 begin');
      const actual1: string = await topName();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('TestAbility');
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('KVStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = resultKind('KVStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0004 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0005
     * @tc.name      testColdStart0005
     * @tc.desc      冷启动未拉起 EntryAbility 时栈顶是 TestAbility，RdbStoreTask 尚未登记，查询初始化状态与结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testColdStart0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0005 begin');
      const actual1: string = await topName();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('TestAbility');
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('RdbStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = resultKind('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0005 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0006
     * @tc.name      testColdStart0006
     * @tc.desc      冷启动未拉起 EntryAbility 时栈顶是 TestAbility，KvManagerUtilTask 尚未登记，查询初始化状态与结果都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testColdStart0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0006 begin');
      const actual1: string = await topName();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('TestAbility');
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('KvManagerUtilTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0006 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0007
     * @tc.name      testColdStart0007
     * @tc.desc      冷启动时查询未登记的名字 "NoSuchTask" 同样抛 401，六个任务的状态全部是 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testColdStart0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0007 begin');
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('NoSuchTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('NoSuchTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0007 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0008
     * @tc.name      testColdStart0008
     * @tc.desc      冷启动时查询未登记的名字 空串 同样抛 401，六个任务的状态全部是 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testColdStart0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0008 begin');
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(''));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0008 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0009
     * @tc.name      testColdStart0009
     * @tc.desc      冷启动时查询未登记的名字 "StartupConfig" 同样抛 401，六个任务的状态全部是 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testColdStart0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0009 begin');
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('StartupConfig'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('StartupConfig');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0009 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0010
     * @tc.name      testColdStart0010
     * @tc.desc      冷启动时查询未登记的名字 "EntryAbility" 同样抛 401，六个任务的状态全部是 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testColdStart0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0010 begin');
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('EntryAbility'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0010 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0011
     * @tc.name      testColdStart0011
     * @tc.desc      冷启动时移除 ImageKnifeTask 的结果抛 401，不影响任何任务状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testColdStart0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0011 begin');
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('ImageKnifeTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('ImageKnifeTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0011 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0012
     * @tc.name      testColdStart0012
     * @tc.desc      冷启动时移除 ResourceManagerTask 的结果抛 401，不影响任何任务状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testColdStart0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0012 begin');
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('ResourceManagerTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('ResourceManagerTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0012 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0013
     * @tc.name      testColdStart0013
     * @tc.desc      冷启动时移除 FileTask 的结果抛 401，不影响任何任务状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testColdStart0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0013 begin');
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('FileTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('FileTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0013 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0014
     * @tc.name      testColdStart0014
     * @tc.desc      冷启动时移除 KVStoreTask 的结果抛 401，不影响任何任务状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testColdStart0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0014 begin');
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('KVStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('KVStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0014 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0015
     * @tc.name      testColdStart0015
     * @tc.desc      冷启动时移除 RdbStoreTask 的结果抛 401，不影响任何任务状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testColdStart0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0015 begin');
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('RdbStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('RdbStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0015 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0016
     * @tc.name      testColdStart0016
     * @tc.desc      冷启动时移除 KvManagerUtilTask 的结果抛 401，不影响任何任务状态
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testColdStart0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0016 begin');
      const actual1: string = errorOf(() => startupManager.removeStartupTaskResult('KvManagerUtilTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('KvManagerUtilTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0016 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0017
     * @tc.name      testColdStart0017
     * @tc.desc      冷启动时手动 run [ImageKnifeTask] 返回 28800001（启动配置尚未加载），任务仍未登记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testColdStart0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0017 begin');
      const actual1: string | number | boolean = await runResult(['ImageKnifeTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('ImageKnifeTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0017 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0018
     * @tc.name      testColdStart0018
     * @tc.desc      冷启动时手动 run [ResourceManagerTask] 返回 28800001（启动配置尚未加载），任务仍未登记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testColdStart0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0018 begin');
      const actual1: string | number | boolean = await runResult(['ResourceManagerTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('ResourceManagerTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0018 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0019
     * @tc.name      testColdStart0019
     * @tc.desc      冷启动时手动 run [FileTask] 返回 28800001（启动配置尚未加载），任务仍未登记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testColdStart0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0019 begin');
      const actual1: string | number | boolean = await runResult(['FileTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('FileTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0019 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0020
     * @tc.name      testColdStart0020
     * @tc.desc      冷启动时手动 run [KVStoreTask] 返回 28800001（启动配置尚未加载），任务仍未登记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testColdStart0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0020 begin');
      const actual1: string | number | boolean = await runResult(['KVStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('KVStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0020 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0021
     * @tc.name      testColdStart0021
     * @tc.desc      冷启动时手动 run [RdbStoreTask] 返回 28800001（启动配置尚未加载），任务仍未登记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testColdStart0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0021 begin');
      const actual1: string | number | boolean = await runResult(['RdbStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('RdbStoreTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0021 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0022
     * @tc.name      testColdStart0022
     * @tc.desc      冷启动时手动 run [KvManagerUtilTask] 返回 28800001（启动配置尚未加载），任务仍未登记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testColdStart0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0022 begin');
      const actual1: string | number | boolean = await runResult(['KvManagerUtilTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string = errorOf(() => startupManager.isStartupTaskInitialized('KvManagerUtilTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0022 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0023
     * @tc.name      testColdStart0023
     * @tc.desc      冷启动时 run 一个不存在的任务返回 28800001，错误信息为 startup task or its dependency not found.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testColdStart0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0023 begin');
      const result: string = await runResult(['NoSuchTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 result=${result}`);
      expect(result).assertEqual(NOT_FOUND);
      const actual2: boolean = result.startsWith('28800001:');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0023 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0024
     * @tc.name      testColdStart0024
     * @tc.desc      冷启动时 run 空任务列表返回 16000050 internal error.，与任务名无关
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testColdStart0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0024 begin');
      const tasks: string[] = [];
      const actual1: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('16000050:internal error.');
      const actual2: string = await runResult(tasks);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('16000050:internal error.');
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0024 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0025
     * @tc.name      testColdStart0025
     * @tc.desc      冷启动时一次 run 全部六个任务也返回 28800001，没有任何任务被初始化
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testColdStart0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0025 begin');
      const actual1: string | number | boolean = await runResult(TASK_NAMES);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(AUTO_TASK_NAMES);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0025 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0026
     * @tc.name      testColdStart0026
     * @tc.desc      冷启动时带 timeoutMs 的 run 同样返回 28800001，超时配置不改变结果
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testColdStart0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0026 begin');
      const actual1: string | number | boolean = await runResult(['FileTask'], { timeoutMs: 3000 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      const actual2: string | number | boolean = await runResult(['FileTask'], { timeoutMs: 1 });
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(NOT_FOUND);
      const actual3: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401,401,401,401,401,401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0026 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0027
     * @tc.name      testColdStart0027
     * @tc.desc      冷启动时 run 失败不会回调传入的 startupListener
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testColdStart0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0027 begin');
      const probe: ListenerProbe = new ListenerProbe();
      const actual1: string | number | boolean = await runResult(['FileTask'], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      await sleep(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('none');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0027 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0028
     * @tc.name      testColdStart0028
     * @tc.desc      冷启动时 removeAllStartupTaskResults 不抛错，六个任务仍然未登记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testColdStart0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0028 begin');
      const actual1: string = errorOf(() => startupManager.removeAllStartupTaskResults());
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401,401,401,401,401,401');
      const actual3: string = await topName();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('TestAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0028 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0029
     * @tc.name      testColdStart0029
     * @tc.desc      拉起 EntryAbility 后 entry 的启动配置生效：五个自动任务完成初始化，ImageKnifeTask 仍未初始化
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testColdStart0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0029 begin');
      await ensureEntryStarted();
      const actual1: string = await topName();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('EntryAbility');
      const actual2: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('false,true,true,true,true,true');
      const actual3: string = resultKind('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401');
      const actual4: string = resultKind('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0029 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_COLD_START_0030
     * @tc.name      testColdStart0030
     * @tc.desc      拉起后此前抛 401 的不存在任务名仍抛 401，run 它仍返回 28800001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testColdStart0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0030 begin');
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized('NoSuchTask'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = resultKind('NoSuchTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult(['NoSuchTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColdStart0030 end');
    })
  })
}
