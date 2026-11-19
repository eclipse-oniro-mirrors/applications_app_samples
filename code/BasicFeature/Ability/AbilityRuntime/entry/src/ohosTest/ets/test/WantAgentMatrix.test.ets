/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Want, WantAgent, wantAgent } from '@kit.AbilityKit';
import { process } from '@kit.ArkTS';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getSelfBundleInfo, settle } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';
const BUNDLE: string = 'com.samples.abilityruntime';

function entryWants(): Want[] {
  return [{ bundleName: BUNDLE, abilityName: 'EntryAbility' }];
}

function lifecycleWants(): Want[] {
  return [{ bundleName: BUNDLE, abilityName: 'AbilityLifecycleAbility' }];
}

function bothWants(): Want[] {
  return [{ bundleName: BUNDLE, abilityName: 'EntryAbility' },
    { bundleName: BUNDLE, abilityName: 'AbilityLifecycleAbility' }];
}

function eventWants(): Want[] {
  return [{ action: 'com.samples.abilityruntime.action.TEST' }];
}

function infoOf(wants: Want[], type: wantAgent.OperationType, flag: wantAgent.WantAgentFlags,
  requestCode: number): wantAgent.WantAgentInfo {
  return { wants: wants, actionType: type, requestCode: requestCode, actionFlags: [flag] };
}

/** WantAgent 页写死的 wantAgentInfo。 */
function pageInfo(): wantAgent.WantAgentInfo {
  return infoOf(entryWants(), wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 0);
}

/** WantAgent 页 trigger 按钮写死的 triggerInfo。 */
function pageTriggerInfo(): wantAgent.TriggerInfo {
  return {
    code: 0,
    want: { bundleName: BUNDLE, abilityName: 'EntryAbility' },
    permission: '',
    extraInfo: { 'test': 'this is a test value' }
  };
}

function bundleNameByCallback(agent: WantAgent): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void, reject: (reason: BusinessError) => void) => {
    wantAgent.getBundleName(agent, (err: BusinessError, data: string) => settle(resolve, reject, err, data));
  });
}

function uidByCallback(agent: WantAgent): Promise<number> {
  return new Promise<number>((resolve: (value: number) => void, reject: (reason: BusinessError) => void) => {
    wantAgent.getUid(agent, (err: BusinessError, data: number) => settle(resolve, reject, err, data));
  });
}

function operationTypeByCallback(agent: WantAgent): Promise<number> {
  return new Promise<number>((resolve: (value: number) => void, reject: (reason: BusinessError) => void) => {
    wantAgent.getOperationType(agent, (err: BusinessError, data: number) => settle(resolve, reject, err, data));
  });
}

function equalByCallback(first: WantAgent, second: WantAgent): Promise<boolean> {
  return new Promise<boolean>((resolve: (value: boolean) => void, reject: (reason: BusinessError) => void) => {
    wantAgent.equal(first, second, (err: BusinessError, data: boolean) => settle(resolve, reject, err, data));
  });
}

function cancelByCallback(agent: WantAgent): Promise<number> {
  return new Promise<number>((resolve: (value: number) => void) => {
    wantAgent.cancel(agent, (err: BusinessError) => resolve(err ? err.code : 0));
  });
}

function triggerAndWait(agent: WantAgent, info: wantAgent.TriggerInfo): Promise<wantAgent.CompleteData> {
  return new Promise<wantAgent.CompleteData>((resolve: (value: wantAgent.CompleteData) => void,
    reject: (reason: BusinessError) => void) => {
    wantAgent.trigger(agent, info, (err: BusinessError, data: wantAgent.CompleteData) =>
      settle(resolve, reject, err, data));
  });
}

function waitForEvent(subscriber: commonEventManager.CommonEventSubscriber):
  Promise<commonEventManager.CommonEventData> {
  return new Promise<commonEventManager.CommonEventData>((resolve: (value: commonEventManager.CommonEventData) =>
    void, reject: (reason: BusinessError) => void) => {
    commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) =>
      settle(resolve, reject, err, data));
  });
}

export default function wantAgentMatrixTest(): void {
  describe('AbilityRuntimeWantAgentMatrixTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0001
     * @tc.name      testWantAgentMatrix0001
     * @tc.desc      START_ABILITY（拉起 EntryAbility）+ ONE_TIME_FLAG + requestCode 0：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0001 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 0));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0002
     * @tc.name      testWantAgentMatrix0002
     * @tc.desc      START_ABILITY（拉起 EntryAbility）+ ONE_TIME_FLAG + requestCode 7：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0002 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 7));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0003
     * @tc.name      testWantAgentMatrix0003
     * @tc.desc      START_ABILITY（拉起 EntryAbility）+ UPDATE_PRESENT_FLAG + requestCode 0：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantAgentMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0003 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 0));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0004
     * @tc.name      testWantAgentMatrix0004
     * @tc.desc      START_ABILITY（拉起 EntryAbility）+ UPDATE_PRESENT_FLAG + requestCode 7：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0004 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 7));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0005
     * @tc.name      testWantAgentMatrix0005
     * @tc.desc      START_ABILITY（拉起 EntryAbility）+ CANCEL_PRESENT_FLAG + requestCode 0：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0005 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 0));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0006
     * @tc.name      testWantAgentMatrix0006
     * @tc.desc      START_ABILITY（拉起 EntryAbility）+ CANCEL_PRESENT_FLAG + requestCode 7：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0006 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 7));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0007
     * @tc.name      testWantAgentMatrix0007
     * @tc.desc      START_ABILITY（拉起 EntryAbility）+ CONSTANT_FLAG + requestCode 0：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0007 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CONSTANT_FLAG, 0));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0008
     * @tc.name      testWantAgentMatrix0008
     * @tc.desc      START_ABILITY（拉起 EntryAbility）+ CONSTANT_FLAG + requestCode 7：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0008 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CONSTANT_FLAG, 7));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0009
     * @tc.name      testWantAgentMatrix0009
     * @tc.desc      START_ABILITIES（同时拉起两个 UIAbility）+ ONE_TIME_FLAG + requestCode 0：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0009 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 0));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0010
     * @tc.name      testWantAgentMatrix0010
     * @tc.desc      START_ABILITIES（同时拉起两个 UIAbility）+ ONE_TIME_FLAG + requestCode 7：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0010 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 7));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0011
     * @tc.name      testWantAgentMatrix0011
     * @tc.desc      START_ABILITIES（同时拉起两个 UIAbility）+ UPDATE_PRESENT_FLAG + requestCode 0：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0011 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 0));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0012
     * @tc.name      testWantAgentMatrix0012
     * @tc.desc      START_ABILITIES（同时拉起两个 UIAbility）+ UPDATE_PRESENT_FLAG + requestCode 7：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0012 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 7));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0013
     * @tc.name      testWantAgentMatrix0013
     * @tc.desc      START_ABILITIES（同时拉起两个 UIAbility）+ CANCEL_PRESENT_FLAG + requestCode 0：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0013 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 0));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0014
     * @tc.name      testWantAgentMatrix0014
     * @tc.desc      START_ABILITIES（同时拉起两个 UIAbility）+ CANCEL_PRESENT_FLAG + requestCode 7：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0014 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 7));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0015
     * @tc.name      testWantAgentMatrix0015
     * @tc.desc      START_ABILITIES（同时拉起两个 UIAbility）+ CONSTANT_FLAG + requestCode 0：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0015 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CONSTANT_FLAG, 0));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0016
     * @tc.name      testWantAgentMatrix0016
     * @tc.desc      START_ABILITIES（同时拉起两个 UIAbility）+ CONSTANT_FLAG + requestCode 7：包名与操作类型与入参一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0016 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CONSTANT_FLAG, 7));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0017
     * @tc.name      testWantAgentMatrix0017
     * @tc.desc      SEND_COMMON_EVENT（发送公共事件）+ ONE_TIME_FLAG + requestCode 0：包名与操作类型与入参一致，公共事件类 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0017 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 0));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0018
     * @tc.name      testWantAgentMatrix0018
     * @tc.desc      SEND_COMMON_EVENT（发送公共事件）+ ONE_TIME_FLAG + requestCode 7：包名与操作类型与入参一致，公共事件类 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0018 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 7));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0019
     * @tc.name      testWantAgentMatrix0019
     * @tc.desc      SEND_COMMON_EVENT（发送公共事件）+ UPDATE_PRESENT_FLAG + requestCode 0：包名与操作类型与入参一致，公共事件类 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0019 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 0));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0020
     * @tc.name      testWantAgentMatrix0020
     * @tc.desc      SEND_COMMON_EVENT（发送公共事件）+ UPDATE_PRESENT_FLAG + requestCode 7：包名与操作类型与入参一致，公共事件类 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0020 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 7));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0021
     * @tc.name      testWantAgentMatrix0021
     * @tc.desc      SEND_COMMON_EVENT（发送公共事件）+ CANCEL_PRESENT_FLAG + requestCode 0：包名与操作类型与入参一致，公共事件类 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0021 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 0));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0022
     * @tc.name      testWantAgentMatrix0022
     * @tc.desc      SEND_COMMON_EVENT（发送公共事件）+ CANCEL_PRESENT_FLAG + requestCode 7：包名与操作类型与入参一致，公共事件类 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0022 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 7));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0023
     * @tc.name      testWantAgentMatrix0023
     * @tc.desc      SEND_COMMON_EVENT（发送公共事件）+ CONSTANT_FLAG + requestCode 0：包名与操作类型与入参一致，公共事件类 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0023 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CONSTANT_FLAG, 0));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0024
     * @tc.name      testWantAgentMatrix0024
     * @tc.desc      SEND_COMMON_EVENT（发送公共事件）+ CONSTANT_FLAG + requestCode 7：包名与操作类型与入参一致，公共事件类 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0024 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CONSTANT_FLAG, 7));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0025
     * @tc.name      testWantAgentMatrix0025
     * @tc.desc      页面 getBundleName(callback) 按钮：回调返回本应用包名，与 promise 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantAgentMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0025 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(pageInfo());
      const byCallback: string = await bundleNameByCallback(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 byCallback=${byCallback}`);
      expect(byCallback).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(byCallback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 byCallback.length=${byCallback.length}`);
      expect(byCallback.length).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0026
     * @tc.name      testWantAgentMatrix0026
     * @tc.desc      页面 getBundleName(promise) 按钮：返回本应用包名，与 BundleInfo 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantAgentMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0026 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(pageInfo());
      const name: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 name=${name}`);
      expect(name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 name=${name}`);
      expect(name).assertEqual(getSelfBundleInfo().name);
      const actual3: boolean = name.startsWith('com.samples.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0027
     * @tc.name      testWantAgentMatrix0027
     * @tc.desc      页面 getUid(callback) 按钮：回调返回当前进程 uid，与 promise 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantAgentMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0027 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(pageInfo());
      const byCallback: number = await uidByCallback(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 byCallback=${byCallback}`);
      expect(byCallback).assertEqual(process.uid);
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(byCallback);
      const actual3: boolean = Number.isInteger(byCallback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0028
     * @tc.name      testWantAgentMatrix0028
     * @tc.desc      页面 getUid(promise) 按钮：返回当前进程 uid，与 applicationInfo.uid 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantAgentMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0028 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(pageInfo());
      const uid: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uid=${uid}`);
      expect(uid).assertEqual(process.uid);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 uid=${uid}`);
      expect(uid).assertEqual(getSelfBundleInfo().appInfo.uid);
      const actual3: number = Math.floor(uid / 200000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0029
     * @tc.name      testWantAgentMatrix0029
     * @tc.desc      页面 getOperationType(callback) 按钮：回调返回 START_ABILITY，与 promise 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantAgentMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0029 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(pageInfo());
      const byCallback: number = await operationTypeByCallback(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 byCallback=${byCallback}`);
      expect(byCallback).assertEqual(wantAgent.OperationType.START_ABILITY);
      const actual2: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(byCallback);
      const actual3: boolean = byCallback === wantAgent.OperationType.SEND_COMMON_EVENT;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0030
     * @tc.name      testWantAgentMatrix0030
     * @tc.desc      页面 getOperationType(promise) 按钮：返回 START_ABILITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantAgentMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0030 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(pageInfo());
      const type: number = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 type=${type}`);
      expect(type).assertEqual(wantAgent.OperationType.START_ABILITY);
      const actual2: boolean = type === wantAgent.OperationType.UNKNOWN_TYPE;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: boolean = type === wantAgent.OperationType.START_ABILITIES;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0031
     * @tc.name      testWantAgentMatrix0031
     * @tc.desc      页面 equal(callback) 按钮：同一个 WantAgent 与自身比较为 true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantAgentMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0031 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(pageInfo());
      const byCallback: boolean = await equalByCallback(agent, agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 byCallback=${byCallback}`);
      expect(byCallback).assertTrue();
      const actual2: string | number | boolean = await wantAgent.equal(agent, agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(byCallback);
      const actual3: string = typeof byCallback;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0032
     * @tc.name      testWantAgentMatrix0032
     * @tc.desc      页面 equal(promise) 按钮：同一个 WantAgent 与自身比较为 true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantAgentMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0032 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(pageInfo());
      const same: boolean = await wantAgent.equal(agent, agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 same=${same}`);
      expect(same).assertTrue();
      const actual2: string = typeof same;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('boolean');
      const actual3: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0033
     * @tc.name      testWantAgentMatrix0033
     * @tc.desc      页面 cancel(callback) 按钮：回调没有错误，之后重新获取的 WantAgent 仍可查询
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantAgentMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0033 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(pageInfo());
      const code: number = await cancelByCallback(agent);
      const again: WantAgent = await wantAgent.getWantAgent(pageInfo());
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(0);
      const actual2: string = await wantAgent.getBundleName(again);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.samples.abilityruntime');
      const actual3: string | number | boolean = await wantAgent.getOperationType(again);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0034
     * @tc.name      testWantAgentMatrix0034
     * @tc.desc      页面 cancel(promise) 按钮：promise 正常完成，之后重新获取的 WantAgent 仍可查询
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantAgentMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0034 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(pageInfo());
      let code: number = 0;
      try {
        await wantAgent.cancel(agent);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      const again: WantAgent = await wantAgent.getWantAgent(pageInfo());
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(0);
      const actual2: string | number | boolean = await wantAgent.getUid(again);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: boolean = await wantAgent.equal(again, again);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0035
     * @tc.name      testWantAgentMatrix0035
     * @tc.desc      相同的 WantAgentInfo 获取两次，两个 WantAgent equal 为 true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0035 begin');
      const first: WantAgent = await wantAgent.getWantAgent(pageInfo());
      const second: WantAgent = await wantAgent.getWantAgent(pageInfo());
      const actual1: boolean = await wantAgent.equal(first, second);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await wantAgent.equal(second, first);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string | number | boolean = await wantAgent.getUid(first);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(await wantAgent.getUid(second));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0036
     * @tc.name      testWantAgentMatrix0036
     * @tc.desc      requestCode 不同的两个 WantAgent equal 为 false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0036 begin');
      const first: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 0));
      const second: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 1));
      const actual1: boolean = await wantAgent.equal(first, second);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: boolean = await wantAgent.equal(first, first);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await wantAgent.equal(second, second);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0037
     * @tc.name      testWantAgentMatrix0037
     * @tc.desc      目标 Ability 不同的两个 WantAgent equal 为 false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0037 begin');
      const first: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 3));
      const second: WantAgent = await wantAgent.getWantAgent(infoOf(lifecycleWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 3));
      const actual1: boolean = await wantAgent.equal(first, second);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: string = await wantAgent.getBundleName(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.samples.abilityruntime');
      const actual3: string | number | boolean = await wantAgent.getOperationType(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0038
     * @tc.name      testWantAgentMatrix0038
     * @tc.desc      操作类型不同（拉起 Ability 与发公共事件）的两个 WantAgent equal 为 false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0038 begin');
      const first: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 4));
      const second: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 4));
      const actual1: boolean = await wantAgent.equal(first, second);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: string | number | boolean = await wantAgent.getOperationType(first);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(wantAgent.OperationType.START_ABILITY);
      const actual3: string | number | boolean = await wantAgent.getOperationType(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0039
     * @tc.name      testWantAgentMatrix0039
     * @tc.desc      SEND_COMMON_EVENT 类型的 WantAgent 被 trigger 后，本应用订阅者收到该事件与 code，事件不带发送方包名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0039 begin');
      const subscriber: commonEventManager.CommonEventSubscriber =
        await commonEventManager.createSubscriber({ events: ['com.samples.abilityruntime.action.TEST'] });
      const received: Promise<commonEventManager.CommonEventData> = waitForEvent(subscriber);
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 5));
      await triggerAndWait(agent, { code: 9 });
      const data: commonEventManager.CommonEventData = await received;
      await commonEventManager.unsubscribe(subscriber);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 data.event=${data.event}`);
      expect(data.event).assertEqual('com.samples.abilityruntime.action.TEST');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 data.code=${data.code}`);
      expect(data.code).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 data.bundleName=${data.bundleName}`);
      expect(data.bundleName).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0040
     * @tc.name      testWantAgentMatrix0040
     * @tc.desc      页面 trigger 按钮：用页面的 triggerInfo 触发，回调返回 WantAgent 与指向 EntryAbility 的 want
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantAgentMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0040 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(pageInfo());
      const data: wantAgent.CompleteData = await triggerAndWait(agent, pageTriggerInfo());
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 data.finalCode=${data.finalCode}`);
      expect(data.finalCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 data.want.bundleName=${data.want.bundleName}`);
      expect(data.want.bundleName).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 data.want.abilityName=${data.want.abilityName}`);
      expect(data.want.abilityName).assertEqual('EntryAbility');
      const actual4: boolean = data.info === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_0041
     * @tc.name      testWantAgentMatrix0041
     * @tc.desc      trigger 回调里的 info 与触发用的 WantAgent equal 为 true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0041 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(pageInfo());
      const data: wantAgent.CompleteData = await triggerAndWait(agent, pageTriggerInfo());
      const actual1: boolean = await wantAgent.equal(data.info, agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = await wantAgent.getBundleName(data.info);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 data.finalCode=${data.finalCode}`);
      expect(data.finalCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentMatrix0041 end');
    })
  })
}
