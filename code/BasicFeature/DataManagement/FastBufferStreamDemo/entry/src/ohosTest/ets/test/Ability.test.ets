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
 
import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = '[Sample_FastBufferStreamDemo]';
const DOMAIN = 0xF811;
const ABILITY_NAME = 'EntryAbility';

export default function abilityTest() {
  describe('FastBufferStreamAbilityTest', () => {
    /**
     * @tc.number SUB_FASTBUFFER_STREAM_ABILITY_0100
     * @tc.name FastBufferStreamAbility0001
     * @tc.desc Verify that the EntryAbility starts and stays at the top of the ability stack
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('FastBufferStreamAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'SUB_FASTBUFFER_STREAM_ABILITY_0100 begin');
        const delegator = abilityDelegatorRegistry.getAbilityDelegator();
        const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
        const want: Want = {
          bundleName: bundleName,
          abilityName: ABILITY_NAME
        };
        const driver: Driver = Driver.create();
        await delegator.startAbility(want);
        await driver.delayMs(1000);
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual(ABILITY_NAME);
        hilog.info(DOMAIN, TAG, 'SUB_FASTBUFFER_STREAM_ABILITY_0100 end');
        done();
      })
  })
}
