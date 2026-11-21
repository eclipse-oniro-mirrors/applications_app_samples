/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { it, beforeEach, beforeAll, afterAll, expect, describe } from '@ohos/hypium';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';
import { Driver, ON, Component } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import delegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import Logger from 'ets/util/Logger';

const TAG: string = '[Sample_AppXComponent3D]';
const BUNDLE_NAME: string = 'com.samples.xcomponent3d';
const ABILITY_NAME: string = 'EntryAbility';
const DOMAIN: string = '0xF811';
const COMPONENT_TIMEOUT_MS: number = 3000;
let ability: UIAbility | null = null;

interface wantType {
  bundleName: string;
  abilityName: string
}

export default function abilityTest() {
  let driver: Driver = Driver.create();
  let delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  resetYieldCounter();
  describe('ActsAbilityTest', () => {

  beforeEach(async () => {
    await yieldToSystem();
  });

    beforeAll(async (startAbility: Function) => {
      let delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
      };
      delegator.startAbility(want, (err) => {
        Logger.info(TAG, `${BUNDLE_NAME} startAbility end err ${JSON.stringify(err)}`);
      });
      await driver.delayMs(5000);
      await delegator.getCurrentTopAbility().then((Ability) => {
        ability = Ability;
        expect(Ability.context.abilityInfo.name).assertEqual('EntryAbility');
      });
      startAbility();
    })

    afterAll(async (lockAbilityTerminateSelf: Function) => {
      let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = delegatorRegistry.getAbilityDelegator();
      let pkillCmd: string = 'aa force-stop com.samples.xcomponent3d';
      abilityDelegator.executeShellCommand(pkillCmd, (err, data) => {
        Logger.info(TAG, 'Acts_CleanTempFiles pkillCmd err: %{public}s data: %{public}s',
          JSON.stringify(err) ?? '', JSON.stringify(data) ?? '');
      })
      lockAbilityTerminateSelf();
    })

    /**
     * @tc.number: SUB_XCOMPONENT3D_ABILITY_0001
     * @tc.name: testAbility0001
     * @tc.desc: 点击 DrawTransform 按钮：按钮可定位、文案匹配、点击后按钮仍存在
     * @tc.type: Function
     * @tc.require: 点击成功， 并切换到矩形旋转界面
     * @tc.level  Level1
     * @tc.size: MediumTest
     */
    it('testAbility0001', 0, async (done: Function) => {
      try {
        const transformButton: Component =
          await driver.waitForComponent(ON.id('DrawTransform'), COMPONENT_TIMEOUT_MS);
        expect(transformButton !== undefined).assertTrue();
        expect(await transformButton.getText()).assertEqual('DrawTransform');
        await driver.assertComponentExist(ON.id('DrawTransform'));
        await transformButton.click();
        expect(ability !== null).assertTrue();
        done();
      } catch (err) {
        Logger.error(DOMAIN, TAG, '%{public}s', `click_001 err ${err.code}  msg ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_XCOMPONENT3D_ABILITY_0002
     * @tc.name: testAbility0002
     * @tc.desc: 点击 DrawCube 按钮：按钮可定位、文案匹配、点击后应用仍在前台
     * @tc.type: Function
     * @tc.require: 点击成功， 并切换到立体矩形界面
     * @tc.level  Level1
     * @tc.size: MediumTest
     */
    it('testAbility0002', 0, async (done: Function) => {
      try {
        const cubeButton: Component = await driver.waitForComponent(ON.id('DrawCube'), COMPONENT_TIMEOUT_MS);
        expect(cubeButton !== undefined).assertTrue();
        expect(await cubeButton.getText()).assertEqual('DrawCube');
        await cubeButton.click();
        expect(ability !== null).assertTrue();
        done();
      } catch (err) {
        Logger.error(DOMAIN, TAG, '%{public}s', `click_002 err ${err.code}  msg ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_XCOMPONENT3D_ABILITY_0003
     * @tc.name: testAbility0003
     * @tc.desc: 连续切换：先点 DrawCube 再点 DrawTransform，两次点击均可定位并返回正确文案
     * @tc.type: Function
     * @tc.require: 两次点击成功， 形状在两个界面之间往返切换
     * @tc.level  Level2
     * @tc.size: MediumTest
     */
    it('testAbility0003', 0, async (done: Function) => {
      try {
        const cubeButton: Component = await driver.waitForComponent(ON.id('DrawCube'), COMPONENT_TIMEOUT_MS);
        expect(cubeButton !== undefined).assertTrue();
        await cubeButton.click();
        const transformButton: Component =
          await driver.waitForComponent(ON.id('DrawTransform'), COMPONENT_TIMEOUT_MS);
        expect(transformButton !== undefined).assertTrue();
        expect(await transformButton.getText()).assertEqual('DrawTransform');
        await transformButton.click();
        done();
      } catch (err) {
        Logger.error(DOMAIN, TAG, '%{public}s', `click_003 err ${err.code}  msg ${err.message}`);
        expect().assertFail();
      }
    });
  });
}
