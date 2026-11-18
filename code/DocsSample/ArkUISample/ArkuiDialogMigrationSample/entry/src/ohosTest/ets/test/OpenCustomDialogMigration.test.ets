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

export default function OpenCustomDialogMigrationTest() {

  describe('OpenCustomDialogMigrationTest', () => {

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

    it('testOpenDialogAndUpdate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.Customdialog_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_open = await driver.findComponent(ON.text('open dialog and update options', MatchPattern.CONTAINS));
      await button_open.click();
      await sleep(3000);
      await driver.pressBack();
      let button_update_content = await driver.findComponent(ON.text('open dialog and update content', MatchPattern.CONTAINS));
      await button_update_content.click();
      await sleep(3000);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testCustomDialogNewInterface', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.CustomDialogNewInterface_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_present = await driver.findComponent(ON.text('Present custom dialog', MatchPattern.CONTAINS));
      await button_present.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testCustomDialogOldInterface', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.CustomDialogOldInterface_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_open = await driver.findComponent(ON.text('click me', MatchPattern.CONTAINS));
      await button_open.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testOpenCustomDialogWithControllerBeforeMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.OpenCustomDialogWithControllerBeforeMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_open = await driver.findComponent(ON.text('openCustomDialogWithController', MatchPattern.CONTAINS));
      await button_open.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testOpenCustomDialogWithControllerAfterMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.OpenCustomDialogWithControllerAfterMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_present = await driver.findComponent(ON.text('DialogPresenter.present', MatchPattern.CONTAINS));
      await button_present.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testPresentCustomDialogBeforeMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.PresentCustomDialogBeforeMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_open = await driver.findComponent(ON.text('presentCustomDialog', MatchPattern.CONTAINS));
      await button_open.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testPresentCustomDialogAfterMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.PresentCustomDialogAfterMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_present = await driver.findComponent(ON.text('DialogPresenter.present', MatchPattern.CONTAINS));
      await button_present.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testActionMenuBeforeMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.ActionMenuBeforeMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_old = await driver.findComponent(ON.text('showActionMenu', MatchPattern.CONTAINS));
      await button_old.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testActionMenuAfterMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.ActionMenuAfterMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_present = await driver.findComponent(ON.text('DialogPresenter.present', MatchPattern.CONTAINS));
      await button_present.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testShowDialogBeforeMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.ShowDialogBeforeMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_old = await driver.findComponent(ON.text('showDialog', MatchPattern.CONTAINS));
      await button_old.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testShowDialogAfterMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.ShowDialogAfterMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_present = await driver.findComponent(ON.text('DialogPresenter.present', MatchPattern.CONTAINS));
      await button_present.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testActionSheetBeforeMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.ActionSheetBeforeMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_old = await driver.findComponent(ON.text('ActionSheet', MatchPattern.CONTAINS));
      await button_old.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testActionSheetAfterMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.ActionSheetAfterMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_present = await driver.findComponent(ON.text('DialogPresenter.present', MatchPattern.CONTAINS));
      await button_present.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testAlertDialogBeforeMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.AlertDialogBeforeMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_old = await driver.findComponent(ON.text('AlertDialog', MatchPattern.CONTAINS));
      await button_old.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testAlertDialogAfterMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.AlertDialogAfterMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_present = await driver.findComponent(ON.text('DialogPresenter.present', MatchPattern.CONTAINS));
      await button_present.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testCustomDialogBeforeMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.CustomDialogBeforeMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_open = await driver.findComponent(ON.text('打开弹窗', MatchPattern.CONTAINS));
      await button_open.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })

    it('testCustomDialogAfterMigrate', 60000, async (done: Function) => {
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.openCustomDialog')),
        MatchPattern.CONTAINS));
      await button_list.click();
      await sleep(ONE_SECONDS_TIME);
      let button_item = await driver.findComponent(ON.text(resource.resourceToString($r('app.string.CustomDialogAfterMigrate_title')),
        MatchPattern.CONTAINS));
      await button_item.click();
      await sleep(ONE_SECONDS_TIME);
      let button_present = await driver.findComponent(ON.text('DialogPresenter.present', MatchPattern.CONTAINS));
      await button_present.click();
      await sleep(ONE_SECONDS_TIME);
      await driver.pressBack();
      await driver.pressBack();
      await sleep(ONE_SECONDS_TIME);
      done();
    })
  })
}
