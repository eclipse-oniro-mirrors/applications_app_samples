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
import { ensureEntryStarted, ListenerProbe, listenerConfig, resetBaseline, runResult } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartup]';
const NOT_FOUND: string = '28800001:startup task or its dependency not found.';

export default function startupListenerMatrixTest(): void {
  describe('AppStartupStartupListenerMatrixTest', () => {
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
     * @tc.number    SUB_APP_STARTUP_STARTUP_LISTENER_0001
     * @tc.name      testStartupListenerMatrix0001
     * @tc.desc      ImageKnifeTask 移除后用 startupListener 运行，probe 状态为 ok 且只回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupListenerMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0001 begin');
      await resetBaseline();
      const actual1: string = await runResult(['ImageKnifeTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const probe: ListenerProbe = new ListenerProbe();
      const actual2: string = await runResult(['ImageKnifeTask'], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0001 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_LISTENER_0002
     * @tc.name      testStartupListenerMatrix0002
     * @tc.desc      ResourceManagerTask 移除后用 startupListener 运行，probe 状态为 ok 且只回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupListenerMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0002 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0002 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_LISTENER_0003
     * @tc.name      testStartupListenerMatrix0003
     * @tc.desc      KVStoreTask 移除后用 startupListener 运行，probe 状态为 ok 且只回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupListenerMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0003 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0003 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_LISTENER_0004
     * @tc.name      testStartupListenerMatrix0004
     * @tc.desc      RdbStoreTask 移除后用 startupListener 运行，probe 状态为 ok 且只回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupListenerMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0004 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0004 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_LISTENER_0005
     * @tc.name      testStartupListenerMatrix0005
     * @tc.desc      KvManagerUtilTask 移除后用 startupListener 运行，probe 状态为 ok 且只回调一次
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupListenerMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0005 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0005 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_LISTENER_0006
     * @tc.name      testStartupListenerMatrix0006
     * @tc.desc      run 空任务列表时 startupListener 不会被调用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupListenerMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0006 begin');
      await resetBaseline();
      const probe: ListenerProbe = new ListenerProbe();
      const actual1: string = await runResult([], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('16000050:internal error.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('none');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0006 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_LISTENER_0007
     * @tc.name      testStartupListenerMatrix0007
     * @tc.desc      run 含非法任务名时 startupListener 不会被调用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupListenerMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0007 begin');
      await resetBaseline();
      const probe: ListenerProbe = new ListenerProbe();
      const actual1: string | number | boolean = await runResult(['NoSuchTask'], listenerConfig(probe, 3000));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(NOT_FOUND);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 probe.state=${probe.state}`);
      expect(probe.state).assertEqual('none');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 probe.calls=${probe.calls}`);
      expect(probe.calls).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupListenerMatrix0007 end');
    })
  })
}
