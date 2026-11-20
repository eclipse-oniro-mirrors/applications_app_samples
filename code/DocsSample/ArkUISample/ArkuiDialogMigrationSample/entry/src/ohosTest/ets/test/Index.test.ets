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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import resource from '../../../main/ets/common/resource';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let want: Want;
const ONE_SECONDS_TIME = 1000;

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

export default function IndexTest() {

  describe('IndexTest', () => {

    beforeAll(async () => {
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await sleep(ONE_SECONDS_TIME);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      console.info('get top ability');
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    })

    it('testOpenCustomDialogList', 0, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      expect(button_list === null).assertFalse();
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testCustomDialogList', 0, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.CustomDialog1')),
        MatchPattern.CONTAINS));
      expect(button_list === null).assertFalse();
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testPageLevelDialog', 0, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.CustomDialog1')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_pageLevel = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.CustomDialog_page_level')),
        MatchPattern.CONTAINS));
      await button_pageLevel.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testPageLevelDialogInNavigation', 0, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.CustomDialog1')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_nav = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.CustomDialog_page_level_navigation')),
        MatchPattern.CONTAINS));
      await button_nav.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })
  })
}
