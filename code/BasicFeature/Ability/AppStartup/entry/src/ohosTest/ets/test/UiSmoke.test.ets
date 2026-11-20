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
import { startupManager, UIAbility } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Component } from '@kit.TestKit';
import {
  BASELINE_STATES, EmployeeRow, ensureEntryStarted, FILE_CONTENT, getAbilityName, KV_VALUE, queryEmployees,
  resetBaseline, resultClass, runResult, taskStates, waitForTopAbility
} from './TestHelper';
import {
  allTexts, backToHome, clickManualMode, countType, exists, findText, MANUAL_MODE, relaunchEntry, textContaining,
  topName
} from './UiHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartup]';

export default function uiSmokeTest(): void {
  describe('AppStartupUiSmokeTest', () => {
    beforeAll(async (done: Function) => {
      await ensureEntryStarted();
      await resetBaseline();
      await relaunchEntry();
      await backToHome();
      done();
    })

    afterAll(async (done: Function) => {
      await resetBaseline();
      done();
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0001
     * @tc.name      testUiSmoke0001
     * @tc.desc      首页依次显示 FileTask 写的文件内容、KVStoreTask 写的键值、RdbStoreTask 插入的 Lisa 行
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUiSmoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0001 begin');
      await backToHome();
      const texts: string[] = await allTexts();
      const actual1: string | number | boolean = texts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(FILE_CONTENT);
      const actual2: string | number | boolean = texts[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(KV_VALUE);
      const actual3: boolean = new RegExp('^id=\\d+, name=Lisa, age=18, salary=100\\.5$').test(texts[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0001 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0002
     * @tc.name      testUiSmoke0002
     * @tc.desc      首页的 Lisa 行显示的是 EMPLOYEE 表里最后一行（循环覆盖），ID 与库里末行一致
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUiSmoke0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0002 begin');
      await backToHome();
      const rows: EmployeeRow[] = await queryEmployees();
      const last: EmployeeRow = rows[rows.length - 1];
      const actual1: string = await textContaining('name=Lisa');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(`id=${last.id}, name=Lisa, age=18, salary=100.5`);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 last.age=${last.age}`);
      expect(last.age).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 last.salary=${last.salary}`);
      expect(last.salary).assertEqual(100.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0002 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0003
     * @tc.name      testUiSmoke0003
     * @tc.desc      首页三个占位初值 fileStr、kvStoreStr、rdbStoreStr 都已被真实数据替换
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0003 begin');
      await backToHome();
      const actual1: boolean = await exists('fileStr');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: boolean = await exists('kvStoreStr');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: boolean = await exists('rdbStoreStr');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      const actual4: boolean = await exists(FILE_CONTENT);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0003 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0004
     * @tc.name      testUiSmoke0004
     * @tc.desc      首页只有一个按钮，文案为 base 资源里的“手动模式”，可点击
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUiSmoke0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0004 begin');
      await backToHome();
      const actual1: number = await countType('Button');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const button: Component = await findText(MANUAL_MODE);
      const actual2: string | number | boolean = await button.getText();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(MANUAL_MODE);
      const actual3: boolean = await button.isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0004 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0005
     * @tc.name      testUiSmoke0005
     * @tc.desc      首页栈顶是 EntryAbility，此时 ImageKnifeTask 未初始化，其余任务都已初始化
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0005 begin');
      await backToHome();
      const actual1: string = await topName();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('EntryAbility');
      const actual2: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string | number | boolean = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(BASELINE_STATES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0005 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0006
     * @tc.name      testUiSmoke0006
     * @tc.desc      ImageKnifeTask 未初始化时点击“手动模式”：先 run 该任务，成功后跳到 ImageKnife 页
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUiSmoke0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0006 begin');
      await backToHome();
      const actual1: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      await clickManualMode();
      const actual2: boolean = await exists(MANUAL_MODE);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: string = resultClass('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('ImageKnifeGlobal');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0006 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0007
     * @tc.name      testUiSmoke0007
     * @tc.desc      ImageKnife 页是同一个 EntryAbility 里的路由页，含一个 RelativeContainer 与 ImageKnife 的 Canvas
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0007 begin');
      const actual1: string = await topName();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('EntryAbility');
      const actual2: number = await countType('RelativeContainer');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: number = await countType('Canvas');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const actual4: boolean = await exists(FILE_CONTENT);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0007 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0008
     * @tc.name      testUiSmoke0008
     * @tc.desc      从 ImageKnife 页返回首页，首页数据保持不变，ImageKnifeTask 仍为已初始化
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0008 begin');
      await backToHome();
      const actual1: boolean = await exists(MANUAL_MODE);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string | number | boolean = (await allTexts())[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(FILE_CONTENT);
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: number = await countType('Canvas');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0008 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0009
     * @tc.name      testUiSmoke0009
     * @tc.desc      ImageKnifeTask 已初始化时再点“手动模式”不会跳转，仍停在首页
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUiSmoke0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0009 begin');
      await backToHome();
      const actual1: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      await clickManualMode();
      const actual2: boolean = await exists(MANUAL_MODE);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: number = await countType('Canvas');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      const actual4: string = await topName();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0009 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0010
     * @tc.name      testUiSmoke0010
     * @tc.desc      移除 ImageKnifeTask 的结果后再点“手动模式”，会重新 run 并再次跳转
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0010 begin');
      await backToHome();
      startupManager.removeStartupTaskResult('ImageKnifeTask');
      const actual1: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      await clickManualMode();
      const actual2: boolean = await exists(MANUAL_MODE);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: number = await countType('Canvas');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0010 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0011
     * @tc.name      testUiSmoke0011
     * @tc.desc      连续两次“移除→点击→返回”，每次都跳转一次，返回后首页按钮都在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUiSmoke0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0011 begin');
      await backToHome();
      let jumps: number = 0;
      for (let i = 0; i < 2; i++) {
        startupManager.removeStartupTaskResult('ImageKnifeTask');
        await clickManualMode();
        if (!(await exists(MANUAL_MODE))) {
          jumps++;
        }
        await backToHome();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 jumps=${jumps}`);
      expect(jumps).assertEqual(2);
      const actual2: boolean = await exists(MANUAL_MODE);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0011 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0012
     * @tc.name      testUiSmoke0012
     * @tc.desc      resetBaseline 回到冷启动基线后，点击按钮的行为与首次进入时一致（跳转）
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0012 begin');
      await backToHome();
      const actual1: string = await resetBaseline();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string | number | boolean = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(BASELINE_STATES);
      await clickManualMode();
      const actual3: boolean = await exists(MANUAL_MODE);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      const actual4: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0012 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0013
     * @tc.name      testUiSmoke0013
     * @tc.desc      结束并重新拉起 EntryAbility 得到新实例，同进程内启动任务不重跑，首页重新读到同样的数据
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0013 begin');
      await backToHome();
      const before: UIAbility | undefined = await waitForTopAbility('EntryAbility', 500);
      const statesBefore: string = taskStates();
      const again: UIAbility | undefined = await relaunchEntry();
      const actual1: string = getAbilityName(again);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('EntryAbility');
      const actual2: boolean = again === before;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string | number | boolean = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(statesBefore);
      const actual4: string | number | boolean = (await allTexts())[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(FILE_CONTENT);
      const actual5: boolean = await exists(KV_VALUE);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0013 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0014
     * @tc.name      testUiSmoke0014
     * @tc.desc      重新拉起后首页显示的 Lisa 行仍是库里末行，RdbStoreTask 没有因为重新拉起多插一行
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUiSmoke0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0014 begin');
      await backToHome();
      const count: number = (await queryEmployees()).length;
      const actual1: string = await textContaining('name=Lisa');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(`id=${count}, name=Lisa, age=18, salary=100.5`);
      await relaunchEntry();
      const actual2: number = (await queryEmployees()).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(count);
      const actual3: string = await textContaining('name=Lisa');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(`id=${count}, name=Lisa, age=18, salary=100.5`);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0014 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_UI_SMOKE_0015
     * @tc.name      testUiSmoke0015
     * @tc.desc      重新拉起后 ImageKnifeTask 的初始化状态保留：已初始化时点击按钮仍不跳转
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUiSmoke0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0015 begin');
      await backToHome();
      const actual1: string = await runResult(['ImageKnifeTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      await relaunchEntry();
      const actual2: boolean = startupManager.isStartupTaskInitialized('ImageKnifeTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      await clickManualMode();
      const actual3: boolean = await exists(MANUAL_MODE);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: string = await topName();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0015 end');
    })
  })
}
