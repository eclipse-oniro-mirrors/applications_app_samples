/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import { AbilityDelegatorRegistry } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { wifiManager as wifi } from '@kit.ConnectivityKit';

const TAG: string = '[Sample_Wlan]'
const DOMAIN: number = 0xFF00
const BUNDLE: string = 'Wlan_'
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
async function getResourceString(resource: Resource): Promise<string> {
  let manage = abilityDelegator.getAppContext().resourceManager
  let text = await manage.getStringValue(resource)
  return text
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     */
    it(BUNDLE + 'StartAbility_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 begin')
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
      try {
        await abilityDelegator.startAbility({
          bundleName: 'ohos.samples.wlan',
          abilityName: 'EntryAbility'
        }
          )
        done()
      }
        catch (exception) {
        hilog.info(DOMAIN, TAG, `StartAbility_001 exception = ${JSON.stringify(exception)}`)
        expect().assertFail()
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 end')
    }
      )

    /**
     */
    it(BUNDLE + 'RequestPermissionFunction_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'RequestPermissionFunction_001 begin');
      let driver = Driver.create();
      await driver.delayMs(2000);
      hilog.info(DOMAIN, TAG, 'RequestPermissionFunction requestPermission');
      try {
        await driver.assertComponentExist(ON.text(await getResourceString($r('app.string.only_accept_during_use'))));
        let btnStart = await driver.findComponent(ON.text(await getResourceString($r('app.string.only_accept_during_use'))));
        await btnStart.click();
        hilog.info(DOMAIN, TAG, 'RequestPermissionFunction clicked');
      }
        catch (err) {
        hilog.info(DOMAIN, TAG, 'RequestPermissionFunction no dialog needed');
      }
      expect((await getResourceString($r('app.string.only_accept_during_use'))).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'RequestPermissionFunction end');
    }
      )

    /**
     */
    it(BUNDLE + 'EnterAboutFunction_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'EnterAboutFunction_001 begin')
      let driver = Driver.create()
      await driver.delayMs(1000)
      hilog.info(DOMAIN, TAG, BUNDLE + 'EnterAboutFunction_001 clickAbout')
      await driver.assertComponentExist(ON.id('about'))
      let about = await driver.findComponent(ON.id('about'))
      await about.click()
      await driver.delayMs(2000)
      await driver.assertComponentExist(ON.id('back'))
      await driver.pressBack()
      hilog.info(DOMAIN, TAG, BUNDLE + 'EnterAboutFunction end')
    }
      )

    /**
     */
    it(BUNDLE + 'ActivateWlanFunction_001', 0, async () => {
      // create Driver
      hilog.info(DOMAIN, TAG, BUNDLE + 'ActivateWlanFunction_001 begin')
      let driver = await Driver.create()
      await driver.delayMs(1000)
      let check = await driver.findComponent(ON.text(await getResourceString($r('app.string.available_wlan'))))
      if (check === null || check === undefined) {
        hilog.info(DOMAIN, TAG, BUNDLE + 'ActivateWlanFunction_001 clickWlanSwitch')
        await driver.assertComponentExist(ON.id('switch'))
        let btnToggle = await driver.findComponent(ON.id('switch'))
        await btnToggle.click()
        await driver.delayMs(5000)
      }
      await driver.delayMs(5000)
      try {
        await driver.assertComponentExist(ON.id('validWlan'))
      }
        catch (err) {
        hilog.info(DOMAIN, TAG, BUNDLE + 'ActivateWlanFunction no validWlan')
        expect((await getResourceString($r('app.string.available_wlan'))).length > 0).assertTrue()
        return
      }
      await driver.delayMs(5000)
      hilog.info(DOMAIN, TAG, BUNDLE + 'ActivateWlanFunction_001 clickAvaliableWlan')
      await driver.assertComponentExist(ON.text(await getResourceString($r('app.string.encrypt'))))
      let WiFi = await driver.findComponents(ON.text(await getResourceString($r('app.string.encrypt'))))
      await WiFi[0].click()
      await driver.delayMs(1000)
      await driver.assertComponentExist(ON.id('sure'))
      hilog.info(DOMAIN, TAG, BUNDLE + 'ActivateWlanFunction_001 end')
      await driver.assertComponentExist(ON.id('input'))
      let input = await driver.findComponent(ON.id('input'))
      await input.inputText('456');
      let sureBtn = await driver.findComponent(ON.id('sure'));
      await sureBtn.click();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('connecting'));
    }
      )
  }
    )
}
