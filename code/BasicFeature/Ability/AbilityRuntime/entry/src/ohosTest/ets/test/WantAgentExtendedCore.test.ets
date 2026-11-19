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
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';
const BUNDLE: string = 'com.samples.abilityruntime';

function entryWants(): Want[] {
  return [{ bundleName: BUNDLE, abilityName: 'EntryAbility' }];
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

export default function wantAgentExtendedCoreTest(): void {
  describe('AbilityRuntimeWantAgentExtendedCoreTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0001
     * @tc.name      testWantAgentExtended0001
     * @tc.desc      扩展：START_ABILITY+ONE_TIME_FLAG+requestCode -1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0001 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.ONE_TIME_FLAG, -1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0002
     * @tc.name      testWantAgentExtended0002
     * @tc.desc      扩展：START_ABILITY+ONE_TIME_FLAG+requestCode 0，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0002 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0003
     * @tc.name      testWantAgentExtended0003
     * @tc.desc      扩展：START_ABILITY+ONE_TIME_FLAG+requestCode 1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0003 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0004
     * @tc.name      testWantAgentExtended0004
     * @tc.desc      扩展：START_ABILITY+ONE_TIME_FLAG+requestCode 7，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0004 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0005
     * @tc.name      testWantAgentExtended0005
     * @tc.desc      扩展：START_ABILITY+ONE_TIME_FLAG+requestCode 99，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0005 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 99));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0006
     * @tc.name      testWantAgentExtended0006
     * @tc.desc      扩展：START_ABILITY+ONE_TIME_FLAG+requestCode 1000，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0006 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 1000));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0007
     * @tc.name      testWantAgentExtended0007
     * @tc.desc      扩展：START_ABILITY+ONE_TIME_FLAG+requestCode 65535，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0007 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 65535));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0008
     * @tc.name      testWantAgentExtended0008
     * @tc.desc      扩展：START_ABILITY+ONE_TIME_FLAG+requestCode 2147483647，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0008 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 2147483647));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0009
     * @tc.name      testWantAgentExtended0009
     * @tc.desc      扩展：START_ABILITY+UPDATE_PRESENT_FLAG+requestCode -1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0009 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, -1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0010
     * @tc.name      testWantAgentExtended0010
     * @tc.desc      扩展：START_ABILITY+UPDATE_PRESENT_FLAG+requestCode 0，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0010 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0011
     * @tc.name      testWantAgentExtended0011
     * @tc.desc      扩展：START_ABILITY+UPDATE_PRESENT_FLAG+requestCode 1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0011 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0012
     * @tc.name      testWantAgentExtended0012
     * @tc.desc      扩展：START_ABILITY+UPDATE_PRESENT_FLAG+requestCode 7，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0012 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0013
     * @tc.name      testWantAgentExtended0013
     * @tc.desc      扩展：START_ABILITY+UPDATE_PRESENT_FLAG+requestCode 99，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0013 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 99));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0014
     * @tc.name      testWantAgentExtended0014
     * @tc.desc      扩展：START_ABILITY+UPDATE_PRESENT_FLAG+requestCode 1000，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0014 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 1000));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0015
     * @tc.name      testWantAgentExtended0015
     * @tc.desc      扩展：START_ABILITY+UPDATE_PRESENT_FLAG+requestCode 65535，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0015 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 65535));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0016
     * @tc.name      testWantAgentExtended0016
     * @tc.desc      扩展：START_ABILITY+UPDATE_PRESENT_FLAG+requestCode 2147483647，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0016 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 2147483647));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0017
     * @tc.name      testWantAgentExtended0017
     * @tc.desc      扩展：START_ABILITY+CANCEL_PRESENT_FLAG+requestCode -1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0017 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, -1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0018
     * @tc.name      testWantAgentExtended0018
     * @tc.desc      扩展：START_ABILITY+CANCEL_PRESENT_FLAG+requestCode 0，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0018 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0019
     * @tc.name      testWantAgentExtended0019
     * @tc.desc      扩展：START_ABILITY+CANCEL_PRESENT_FLAG+requestCode 1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0019 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0020
     * @tc.name      testWantAgentExtended0020
     * @tc.desc      扩展：START_ABILITY+CANCEL_PRESENT_FLAG+requestCode 7，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0020 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0021
     * @tc.name      testWantAgentExtended0021
     * @tc.desc      扩展：START_ABILITY+CANCEL_PRESENT_FLAG+requestCode 99，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0021 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 99));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0022
     * @tc.name      testWantAgentExtended0022
     * @tc.desc      扩展：START_ABILITY+CANCEL_PRESENT_FLAG+requestCode 1000，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0022 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 1000));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0023
     * @tc.name      testWantAgentExtended0023
     * @tc.desc      扩展：START_ABILITY+CANCEL_PRESENT_FLAG+requestCode 65535，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0023 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 65535));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0024
     * @tc.name      testWantAgentExtended0024
     * @tc.desc      扩展：START_ABILITY+CANCEL_PRESENT_FLAG+requestCode 2147483647，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0024 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 2147483647));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0025
     * @tc.name      testWantAgentExtended0025
     * @tc.desc      扩展：START_ABILITY+CONSTANT_FLAG+requestCode -1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0025 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CONSTANT_FLAG, -1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0026
     * @tc.name      testWantAgentExtended0026
     * @tc.desc      扩展：START_ABILITY+CONSTANT_FLAG+requestCode 0，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0026 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0027
     * @tc.name      testWantAgentExtended0027
     * @tc.desc      扩展：START_ABILITY+CONSTANT_FLAG+requestCode 1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0027 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CONSTANT_FLAG, 1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0028
     * @tc.name      testWantAgentExtended0028
     * @tc.desc      扩展：START_ABILITY+CONSTANT_FLAG+requestCode 7，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0028 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0029
     * @tc.name      testWantAgentExtended0029
     * @tc.desc      扩展：START_ABILITY+CONSTANT_FLAG+requestCode 99，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0029 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CONSTANT_FLAG, 99));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0030
     * @tc.name      testWantAgentExtended0030
     * @tc.desc      扩展：START_ABILITY+CONSTANT_FLAG+requestCode 1000，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0030 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CONSTANT_FLAG, 1000));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0031
     * @tc.name      testWantAgentExtended0031
     * @tc.desc      扩展：START_ABILITY+CONSTANT_FLAG+requestCode 65535，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0031 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CONSTANT_FLAG, 65535));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0032
     * @tc.name      testWantAgentExtended0032
     * @tc.desc      扩展：START_ABILITY+CONSTANT_FLAG+requestCode 2147483647，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0032 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(entryWants(),
        wantAgent.OperationType.START_ABILITY, wantAgent.WantAgentFlags.CONSTANT_FLAG, 2147483647));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0033
     * @tc.name      testWantAgentExtended0033
     * @tc.desc      扩展：START_ABILITIES+ONE_TIME_FLAG+requestCode -1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0033 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.ONE_TIME_FLAG, -1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0034
     * @tc.name      testWantAgentExtended0034
     * @tc.desc      扩展：START_ABILITIES+ONE_TIME_FLAG+requestCode 0，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0034 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0035
     * @tc.name      testWantAgentExtended0035
     * @tc.desc      扩展：START_ABILITIES+ONE_TIME_FLAG+requestCode 1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0035 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0036
     * @tc.name      testWantAgentExtended0036
     * @tc.desc      扩展：START_ABILITIES+ONE_TIME_FLAG+requestCode 7，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0036 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0037
     * @tc.name      testWantAgentExtended0037
     * @tc.desc      扩展：START_ABILITIES+ONE_TIME_FLAG+requestCode 99，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0037 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 99));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0038
     * @tc.name      testWantAgentExtended0038
     * @tc.desc      扩展：START_ABILITIES+ONE_TIME_FLAG+requestCode 1000，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0038 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 1000));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0039
     * @tc.name      testWantAgentExtended0039
     * @tc.desc      扩展：START_ABILITIES+ONE_TIME_FLAG+requestCode 65535，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0039 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 65535));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0040
     * @tc.name      testWantAgentExtended0040
     * @tc.desc      扩展：START_ABILITIES+ONE_TIME_FLAG+requestCode 2147483647，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0040 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 2147483647));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0041
     * @tc.name      testWantAgentExtended0041
     * @tc.desc      扩展：START_ABILITIES+UPDATE_PRESENT_FLAG+requestCode -1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0041 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, -1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0041 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0042
     * @tc.name      testWantAgentExtended0042
     * @tc.desc      扩展：START_ABILITIES+UPDATE_PRESENT_FLAG+requestCode 0，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0042 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0042 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0043
     * @tc.name      testWantAgentExtended0043
     * @tc.desc      扩展：START_ABILITIES+UPDATE_PRESENT_FLAG+requestCode 1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0043 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0043 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0044
     * @tc.name      testWantAgentExtended0044
     * @tc.desc      扩展：START_ABILITIES+UPDATE_PRESENT_FLAG+requestCode 7，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0044 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0044 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0045
     * @tc.name      testWantAgentExtended0045
     * @tc.desc      扩展：START_ABILITIES+UPDATE_PRESENT_FLAG+requestCode 99，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0045 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 99));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0045 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0046
     * @tc.name      testWantAgentExtended0046
     * @tc.desc      扩展：START_ABILITIES+UPDATE_PRESENT_FLAG+requestCode 1000，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0046 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 1000));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0046 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0047
     * @tc.name      testWantAgentExtended0047
     * @tc.desc      扩展：START_ABILITIES+UPDATE_PRESENT_FLAG+requestCode 65535，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0047 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 65535));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0047 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0048
     * @tc.name      testWantAgentExtended0048
     * @tc.desc      扩展：START_ABILITIES+UPDATE_PRESENT_FLAG+requestCode 2147483647，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0048 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 2147483647));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0048 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0049
     * @tc.name      testWantAgentExtended0049
     * @tc.desc      扩展：START_ABILITIES+CANCEL_PRESENT_FLAG+requestCode -1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0049 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, -1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0049 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0050
     * @tc.name      testWantAgentExtended0050
     * @tc.desc      扩展：START_ABILITIES+CANCEL_PRESENT_FLAG+requestCode 0，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0050 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0050 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0051
     * @tc.name      testWantAgentExtended0051
     * @tc.desc      扩展：START_ABILITIES+CANCEL_PRESENT_FLAG+requestCode 1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0051 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0051 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0052
     * @tc.name      testWantAgentExtended0052
     * @tc.desc      扩展：START_ABILITIES+CANCEL_PRESENT_FLAG+requestCode 7，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0052 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0052 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0053
     * @tc.name      testWantAgentExtended0053
     * @tc.desc      扩展：START_ABILITIES+CANCEL_PRESENT_FLAG+requestCode 99，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0053 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 99));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0053 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0054
     * @tc.name      testWantAgentExtended0054
     * @tc.desc      扩展：START_ABILITIES+CANCEL_PRESENT_FLAG+requestCode 1000，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0054 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 1000));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0054 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0055
     * @tc.name      testWantAgentExtended0055
     * @tc.desc      扩展：START_ABILITIES+CANCEL_PRESENT_FLAG+requestCode 65535，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0055 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 65535));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0055 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0056
     * @tc.name      testWantAgentExtended0056
     * @tc.desc      扩展：START_ABILITIES+CANCEL_PRESENT_FLAG+requestCode 2147483647，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0056 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 2147483647));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0056 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0057
     * @tc.name      testWantAgentExtended0057
     * @tc.desc      扩展：START_ABILITIES+CONSTANT_FLAG+requestCode -1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0057 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CONSTANT_FLAG, -1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0057 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0058
     * @tc.name      testWantAgentExtended0058
     * @tc.desc      扩展：START_ABILITIES+CONSTANT_FLAG+requestCode 0，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0058 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0058 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0059
     * @tc.name      testWantAgentExtended0059
     * @tc.desc      扩展：START_ABILITIES+CONSTANT_FLAG+requestCode 1，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0059 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CONSTANT_FLAG, 1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0059 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0060
     * @tc.name      testWantAgentExtended0060
     * @tc.desc      扩展：START_ABILITIES+CONSTANT_FLAG+requestCode 7，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0060 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0060 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0061
     * @tc.name      testWantAgentExtended0061
     * @tc.desc      扩展：START_ABILITIES+CONSTANT_FLAG+requestCode 99，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0061 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CONSTANT_FLAG, 99));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0061 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0062
     * @tc.name      testWantAgentExtended0062
     * @tc.desc      扩展：START_ABILITIES+CONSTANT_FLAG+requestCode 1000，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0062 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CONSTANT_FLAG, 1000));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0062 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0063
     * @tc.name      testWantAgentExtended0063
     * @tc.desc      扩展：START_ABILITIES+CONSTANT_FLAG+requestCode 65535，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0063 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CONSTANT_FLAG, 65535));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0063 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0064
     * @tc.name      testWantAgentExtended0064
     * @tc.desc      扩展：START_ABILITIES+CONSTANT_FLAG+requestCode 2147483647，包名与操作类型一致，uid 为本进程
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0064 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(bothWants(),
        wantAgent.OperationType.START_ABILITIES, wantAgent.WantAgentFlags.CONSTANT_FLAG, 2147483647));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: string | number | boolean = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(process.uid);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.START_ABILITIES);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0064 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0065
     * @tc.name      testWantAgentExtended0065
     * @tc.desc      扩展：SEND_COMMON_EVENT+ONE_TIME_FLAG+requestCode -1，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0065 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.ONE_TIME_FLAG, -1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0065 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0066
     * @tc.name      testWantAgentExtended0066
     * @tc.desc      扩展：SEND_COMMON_EVENT+ONE_TIME_FLAG+requestCode 0，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0066 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0066 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0067
     * @tc.name      testWantAgentExtended0067
     * @tc.desc      扩展：SEND_COMMON_EVENT+ONE_TIME_FLAG+requestCode 1，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0067 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0067 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0068
     * @tc.name      testWantAgentExtended0068
     * @tc.desc      扩展：SEND_COMMON_EVENT+ONE_TIME_FLAG+requestCode 7，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0068 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0068 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0069
     * @tc.name      testWantAgentExtended0069
     * @tc.desc      扩展：SEND_COMMON_EVENT+ONE_TIME_FLAG+requestCode 99，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0069 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 99));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0069 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0070
     * @tc.name      testWantAgentExtended0070
     * @tc.desc      扩展：SEND_COMMON_EVENT+ONE_TIME_FLAG+requestCode 1000，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0070 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 1000));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0070 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0071
     * @tc.name      testWantAgentExtended0071
     * @tc.desc      扩展：SEND_COMMON_EVENT+ONE_TIME_FLAG+requestCode 65535，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0071 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 65535));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0071 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0072
     * @tc.name      testWantAgentExtended0072
     * @tc.desc      扩展：SEND_COMMON_EVENT+ONE_TIME_FLAG+requestCode 2147483647，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0072 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.ONE_TIME_FLAG, 2147483647));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0072 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0073
     * @tc.name      testWantAgentExtended0073
     * @tc.desc      扩展：SEND_COMMON_EVENT+UPDATE_PRESENT_FLAG+requestCode -1，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0073 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, -1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0073 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0074
     * @tc.name      testWantAgentExtended0074
     * @tc.desc      扩展：SEND_COMMON_EVENT+UPDATE_PRESENT_FLAG+requestCode 0，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0074 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0074 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0075
     * @tc.name      testWantAgentExtended0075
     * @tc.desc      扩展：SEND_COMMON_EVENT+UPDATE_PRESENT_FLAG+requestCode 1，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0075 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0075 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0076
     * @tc.name      testWantAgentExtended0076
     * @tc.desc      扩展：SEND_COMMON_EVENT+UPDATE_PRESENT_FLAG+requestCode 7，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0076 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0076 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0077
     * @tc.name      testWantAgentExtended0077
     * @tc.desc      扩展：SEND_COMMON_EVENT+UPDATE_PRESENT_FLAG+requestCode 99，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0077 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 99));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0077 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0078
     * @tc.name      testWantAgentExtended0078
     * @tc.desc      扩展：SEND_COMMON_EVENT+UPDATE_PRESENT_FLAG+requestCode 1000，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0078 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 1000));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0078 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0079
     * @tc.name      testWantAgentExtended0079
     * @tc.desc      扩展：SEND_COMMON_EVENT+UPDATE_PRESENT_FLAG+requestCode 65535，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0079 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 65535));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0079 end');
    })
  })
}
