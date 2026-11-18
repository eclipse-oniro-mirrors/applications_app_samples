/*
 * Copyright (c) 2023-2023 Huawei Device Co., Ltd.
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

import { beforeEachIt, describe, it, expect } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import Logger from '../../util/Logger';

const BUNDLE = 'OAID';
const TAG = '[Sample_OAID_Test]';
const delegator = abilityDelegatorRegistry.getAbilityDelegator();

// 资源本地化
async function getResourceString<T extends Resource>(resource: T): Promise<string> {
  let manage = delegator.getAppContext().resourceManager
  let text = await manage.getStringValue(resource)
  return text
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * 打开应用
     */
    it(BUNDLE + '_startAbility', 0, async (done: Function) => {
      Logger.info(TAG, BUNDLE + '_startAbility start')
      let want: Want = {
        bundleName: 'com.samples.oaid',
        abilityName: 'EntryAbility'
      }
      delegator.startAbility(want, (err, data) => {
        Logger.info(TAG, 'StartAbility get err ' + JSON.stringify(err))
        expect(err).assertNull()
      })
      Logger.info(TAG, BUNDLE + '_startAbility end')
      done()
    })

    /**
     * OAID测试
     */
    it(BUNDLE + '_OAIDFunction_001', 0, async (done: Function) => {
      Logger.info(TAG, BUNDLE + '_OAIDFunction_001 begin')
      let driver = Driver.create()
      await driver.delayMs(2000);
      // 获取OAID按钮，Promise方式
      await driver.assertComponentExist(ON.text(await getResourceString($r('app.string.oaid_btn_promise'))))
      let getOaidByPromise = await driver.findComponent(ON.text(await getResourceString($r('app.string.oaid_btn_promise'))))
      await getOaidByPromise.click()
      await driver.delayMs(2000);
      let oaidTextArea = await driver.findComponent(ON.id('hiad_demo_oaid_textArea'))
      let oaid = await oaidTextArea.getText();
      Logger.info(TAG, 'OAIDFunction_001 promise oaid: %{public}s', oaid)
      expect(oaid.length > 0).assertEqual(true)
      await driver.delayMs(1000)
      // 获取OAID按钮，Async Callback方式
      await driver.assertComponentExist(ON.text(await getResourceString($r('app.string.oaid_btn_asynccallback'))))
      let getOaidByAsyncCallback = await driver.findComponent(ON.text(await getResourceString($r('app.string.oaid_btn_asynccallback'))))
      await getOaidByAsyncCallback.click()
      await driver.delayMs(2000);
      oaid = await oaidTextArea.getText();
      Logger.info(TAG, 'OAIDFunction_001 asyncCallback oaid: %{public}s', oaid)
      expect(oaid.length > 0).assertEqual(true)
      // 重置OAID按钮
      await driver.assertComponentExist(ON.text(await getResourceString($r('app.string.oaid_btn_reset'))))
      let resetOaid = await driver.findComponent(ON.text(await getResourceString($r('app.string.oaid_btn_reset'))))
      await resetOaid.click()
      oaid = await oaidTextArea.getText();
      Logger.info(TAG, 'OAIDFunction_001 reset oaid: %{public}s', oaid)
      expect(oaid.length > 0).assertEqual(true)
      Logger.info(TAG, BUNDLE + '_OAIDFunction_001 clickOAIDShowPage end')
      done()
    })
  })
}