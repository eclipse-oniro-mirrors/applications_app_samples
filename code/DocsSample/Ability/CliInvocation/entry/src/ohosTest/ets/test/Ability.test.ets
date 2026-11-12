/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CliInvocation]';
const BUNDLE: string = 'CliInvocation_';
const ONE_SECOND: number = 1000;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('CliInvocationTest', () => {
    /**
     * 启动应用，校验EntryAbility正常拉起
     */
    it(BUNDLE + 'StartAbility_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, begin');
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await sleep(ONE_SECOND);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      // 校验当前Ability名称
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, ability name: ' + ability.context.abilityInfo.name);
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, end');
      done();
    });

    /**
     * 点击"启动目标应用"按钮，校验按钮存在并通过forkAndExecute调用ohos-aa
     */
    it(BUNDLE + 'StartTargetApp_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartTargetApp_001, begin');
      const driver = Driver.create();
      await driver.delayMs(ONE_SECOND);
      const startButton = await driver.findComponent(ON.id('button_start_target_app'));
      // 校验启动按钮存在
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartTargetApp_001, assert start button exists');
      expect(startButton !== null).assertTrue();
      await startButton!.click();
      await driver.delayMs(ONE_SECOND);
      // 点击后message文案更新为启动结果，校验Text组件存在
      const messageText = await driver.findComponent(ON.id('text_message'));
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartTargetApp_001, assert message text exists');
      expect(messageText !== null).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartTargetApp_001, end');
      done();
    });
  });
}
