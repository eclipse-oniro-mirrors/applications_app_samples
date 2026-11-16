/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import logger from '../util/Logger';
import { AbilityDelegatorRegistry } from '@kit.AbilityKit';

const TAG: string = '[Sample_CanvasGame]';
const BUNDLE: string = 'canvasGame_';
const DRIVER = Driver.create();
let abilityDelegatorRegistry = AbilityDelegatorRegistry.getAbilityDelegator();

export default function abilityTest() {
  describe('ActsAbilityTest', () => {

    /**
     */
    it(BUNDLE + 'OpenFormList_001', 0, async (done: Function) => {
      let ability = await abilityDelegatorRegistry.getCurrentTopAbility();
      let manager = ability.context.resourceManager;
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      logger.info(TAG, `${BUNDLE}OpenFormList_001 begin`);
      await DRIVER.pressBack();
      await DRIVER.delayMs(500);
      await DRIVER.assertComponentExist(ON.text(await manager.getStringValue($r('app.string.EntryAbility_label'))));
      let app = await DRIVER.findComponent(ON.text(await manager.getStringValue($r('app.string.EntryAbility_label'))));
      let rect = await app.getBounds();
      let height = rect.bottom - rect.top;
      let point = await app.getBoundsCenter();
      await DRIVER.longClick(point.x, point.y - height);
      await DRIVER.delayMs(500);
      await DRIVER.assertComponentExist(ON.text(await manager.getStringValue($r('app.string.Card_Button'))));
      let formBtn = await DRIVER.findComponent(ON.text(await manager.getStringValue($r('app.string.Card_Button'))));
      await formBtn.click();
      done();
      logger.info(TAG, `${BUNDLE}OpenFormList_001 end`);
    }
      )

    /**
     */
    it(BUNDLE + 'createForm_001', 0, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      logger.info(TAG, `${BUNDLE}createForm_001 begin`);
      let resourceManager = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      await DRIVER.delayMs(500);
      await DRIVER.assertComponentExist(ON.text(await resourceManager.getStringValue($r('app.string.AddForm'))));
      let addToDesk = await DRIVER.findComponent(ON.text(await resourceManager.getStringValue($r('app.string.AddForm'))));
      await addToDesk.click();
      await DRIVER.delayMs(500);
      await DRIVER.assertComponentExist(ON.text(await resourceManager.getStringValue($r('app.string.EntryAbility_label'))));
      let resultArray = await DRIVER.findComponents(ON.text(await resourceManager.getStringValue($r('app.string.EntryAbility_label'))));
      expect(resultArray.length).assertEqual(2);
      done();
      logger.info(TAG, `${BUNDLE}createForm_001 end`);
    }
      )
  }
    )
}
