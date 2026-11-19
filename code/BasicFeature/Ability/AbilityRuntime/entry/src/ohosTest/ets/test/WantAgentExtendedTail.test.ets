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

export default function wantAgentExtendedTailTest(): void {
  describe('AbilityRuntimeWantAgentExtendedTailTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0080
     * @tc.name      testWantAgentExtended0080
     * @tc.desc      扩展：SEND_COMMON_EVENT+UPDATE_PRESENT_FLAG+requestCode 2147483647，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0080 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG, 2147483647));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0080 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0081
     * @tc.name      testWantAgentExtended0081
     * @tc.desc      扩展：SEND_COMMON_EVENT+CANCEL_PRESENT_FLAG+requestCode -1，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0081 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, -1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0081 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0082
     * @tc.name      testWantAgentExtended0082
     * @tc.desc      扩展：SEND_COMMON_EVENT+CANCEL_PRESENT_FLAG+requestCode 0，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0082 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0082 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0083
     * @tc.name      testWantAgentExtended0083
     * @tc.desc      扩展：SEND_COMMON_EVENT+CANCEL_PRESENT_FLAG+requestCode 1，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0083 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0083 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0084
     * @tc.name      testWantAgentExtended0084
     * @tc.desc      扩展：SEND_COMMON_EVENT+CANCEL_PRESENT_FLAG+requestCode 7，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0084 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0084 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0085
     * @tc.name      testWantAgentExtended0085
     * @tc.desc      扩展：SEND_COMMON_EVENT+CANCEL_PRESENT_FLAG+requestCode 99，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0085 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 99));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0085 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0086
     * @tc.name      testWantAgentExtended0086
     * @tc.desc      扩展：SEND_COMMON_EVENT+CANCEL_PRESENT_FLAG+requestCode 1000，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0086 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 1000));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0086 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0087
     * @tc.name      testWantAgentExtended0087
     * @tc.desc      扩展：SEND_COMMON_EVENT+CANCEL_PRESENT_FLAG+requestCode 65535，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0087 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 65535));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0087 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0088
     * @tc.name      testWantAgentExtended0088
     * @tc.desc      扩展：SEND_COMMON_EVENT+CANCEL_PRESENT_FLAG+requestCode 2147483647，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0088 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG, 2147483647));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0088 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0089
     * @tc.name      testWantAgentExtended0089
     * @tc.desc      扩展：SEND_COMMON_EVENT+CONSTANT_FLAG+requestCode -1，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0089 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CONSTANT_FLAG, -1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0089 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0090
     * @tc.name      testWantAgentExtended0090
     * @tc.desc      扩展：SEND_COMMON_EVENT+CONSTANT_FLAG+requestCode 0，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0090 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0090 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0091
     * @tc.name      testWantAgentExtended0091
     * @tc.desc      扩展：SEND_COMMON_EVENT+CONSTANT_FLAG+requestCode 1，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantAgentExtended0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0091 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CONSTANT_FLAG, 1));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0091 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0092
     * @tc.name      testWantAgentExtended0092
     * @tc.desc      扩展：SEND_COMMON_EVENT+CONSTANT_FLAG+requestCode 7，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0092 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0092 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0093
     * @tc.name      testWantAgentExtended0093
     * @tc.desc      扩展：SEND_COMMON_EVENT+CONSTANT_FLAG+requestCode 99，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0093 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CONSTANT_FLAG, 99));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0093 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0094
     * @tc.name      testWantAgentExtended0094
     * @tc.desc      扩展：SEND_COMMON_EVENT+CONSTANT_FLAG+requestCode 1000，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0094 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CONSTANT_FLAG, 1000));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0094 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0095
     * @tc.name      testWantAgentExtended0095
     * @tc.desc      扩展：SEND_COMMON_EVENT+CONSTANT_FLAG+requestCode 65535，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0095 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CONSTANT_FLAG, 65535));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0095 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0096
     * @tc.name      testWantAgentExtended0096
     * @tc.desc      扩展：SEND_COMMON_EVENT+CONSTANT_FLAG+requestCode 2147483647，包名与操作类型一致，公共事件 uid 为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0096 begin');
      const agent: WantAgent = await wantAgent.getWantAgent(infoOf(eventWants(),
        wantAgent.OperationType.SEND_COMMON_EVENT, wantAgent.WantAgentFlags.CONSTANT_FLAG, 2147483647));
      const actual1: string = await wantAgent.getBundleName(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('com.samples.abilityruntime');
      const actual2: number = await wantAgent.getUid(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: string | number | boolean = await wantAgent.getOperationType(agent);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0096 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0097
     * @tc.name      testWantAgentExtended0097
     * @tc.desc      getWantAgent wants 空 wants 数组 时抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0097 begin');
      const rawWants: ESObject = [];
      let code: number = 0;
      try {
        await wantAgent.getWantAgent({ wants: rawWants as Want[],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0, actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG] });
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(401);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0097 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0098
     * @tc.name      testWantAgentExtended0098
     * @tc.desc      getWantAgent wants 空 Want 对象 时抛 16000151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0098 begin');
      const rawWants: ESObject = [{} as Want];
      let code: number = 0;
      try {
        await wantAgent.getWantAgent({ wants: rawWants as Want[],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0, actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG] });
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(16000151);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0098 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0099
     * @tc.name      testWantAgentExtended0099
     * @tc.desc      getWantAgent wants wants 为 undefined 时抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0099 begin');
      const rawWants: ESObject = undefined;
      let code: number = 0;
      try {
        await wantAgent.getWantAgent({ wants: rawWants as Want[],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0, actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG] });
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(401);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0099 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_WANT_AGENT_EXTENDED_0100
     * @tc.name      testWantAgentExtended0100
     * @tc.desc      getWantAgent wants wants 为 null 时抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantAgentExtended0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0100 begin');
      const rawWants: ESObject = null;
      let code: number = 0;
      try {
        await wantAgent.getWantAgent({ wants: rawWants as Want[],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0, actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG] });
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(401);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgentExtended0100 end');
    })
  })
}
