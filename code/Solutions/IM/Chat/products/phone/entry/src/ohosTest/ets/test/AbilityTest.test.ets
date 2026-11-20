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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import Logger from '../util/Logger';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

const BUNDLE: string = 'Chat_';
const TAG = '[Sample_Chat_Test]';
const DOMAIN: number = 0xF811;
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
// 设置图片数组的索引值
const imageIndex = 1;

// 资源本地化
async function getResourceString<T extends Resource>(resource: T): Promise<string> {
  let manage = delegator.getAppContext().resourceManager
  let text = await manage.getStringValue(resource)
  return text
}

// 回到首页并选中"聊天"Tab，避免上一个用例遗留页面状态
async function ensureHomeAndChatTab(driver: Driver): Promise<void> {
  for (let wait: number = 0; wait < 20; wait++) {
    try {
      await driver.findComponent(ON.text('聊天'))
      break
    } catch (error) {
      await driver.delayMs(1000)
    }
  }
  for (let attempt: number = 0; attempt < 5; attempt++) {
    try {
      await driver.findComponent(ON.text('聊天'))
      break
    } catch (error) {
      await driver.pressBack()
      await driver.delayMs(800)
    }
  }
  // 兜底：应用可能已被返回键退出，重新拉起（不能 force-stop，测试与应用同进程）
  try {
    let relaunchWant: Want = { bundleName: 'com.samples.chat', moduleName: 'entry', abilityName: 'EntryAbility' }
    delegator.startAbility(relaunchWant, () => {})
    await driver.delayMs(2500)
  } catch (error) {
    Logger.info(TAG, 'relaunch app failed')
  }
  try {
    const tabs = await driver.findComponents(ON.text('聊天'))
    if (tabs.length > 0) {
      await tabs[0].click()
      await driver.delayMs(800)
    }
  } catch (error) {
    Logger.info(TAG, 'ensureHomeAndChatTab click tab failed')
  }
}

// 先等待数据渲染，再滚动查找；避免数据未到时把首屏控件滚出视野
async function clickByIdWithScroll(driver: Driver, id: string, maxScrolls: number = 5): Promise<boolean> {
  for (let wait: number = 0; wait < 12; wait++) {
    try {
      const component = await driver.findComponent(ON.id(id))
      if (component) {
        await component.click()
        await driver.delayMs(1000)
        return true
      }
    } catch (error) {
      Logger.info(TAG, 'find component failed while waiting, id=' + id)
    }
    await driver.delayMs(500)
  }
  for (let attempt: number = 0; attempt < maxScrolls; attempt++) {
    await driver.swipe(360, 1000, 360, 300, 600)
    await driver.delayMs(800)
    try {
      const component = await driver.findComponent(ON.id(id))
      if (component) {
        await component.click()
        await driver.delayMs(1000)
        return true
      }
    } catch (error) {
      Logger.info(TAG, 'find component failed after scroll, id=' + id)
    }
  }
  return false
}


async function yieldThread(): Promise<void> {
  await new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, 0);
  });
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {

    /**
     * @tc.number    SUB_SOLUTION_CHAT_ABILITY_0100
     * @tc.name      startAbility_001
     * @tc.desc      Verify the entry ability starts without error.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'startAbility_001', 0, async (done: Function) => {
      Logger.info(TAG, BUNDLE + 'startAbility_001 start')
      hilog.info(DOMAIN, TAG, BUNDLE + 'startAbility_001, begin');
      await yieldThread();
      let want: Want = {
        bundleName: 'com.samples.chat',
        moduleName: 'entry',
        abilityName: 'EntryAbility'
      }
      let startError: Error | null = null
      await new Promise<void>((resolve) => {
        delegator.startAbility(want, (err) => {
          startError = err ?? null
          resolve()
        })
      })
      Logger.info(TAG, 'StartAbility get err ' + JSON.stringify(startError))
      hilog.info(DOMAIN, TAG, BUNDLE + 'startAbility_001, value:' + JSON.stringify(startError));
      expect(startError).assertNull()
      hilog.info(DOMAIN, TAG, BUNDLE + 'startAbility_001, end');
      Logger.info(TAG, BUNDLE + 'startAbility_001 end')
      done()
    })

    /**
     * @tc.number    SUB_SOLUTION_CHAT_ABILITY_0200
     * @tc.name      SendMessageFunction_001
     * @tc.desc      Verify sending a chat message through the detail page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'SendMessageFunction_001', 0, async (done: Function) => {
      Logger.info(TAG, BUNDLE + 'SendMessageFunction_001 begin')
      hilog.info(DOMAIN, TAG, BUNDLE + 'SendMessageFunction_001, begin');
      await yieldThread();
      let driver = Driver.create()
      await ensureHomeAndChatTab(driver)
      await driver.delayMs(1000)
      Logger.info(TAG, BUNDLE + 'SendMessageFunction_001 clickChatList')
      // 点击聊天列表的首条会话
      await driver.assertComponentExist(ON.text('一日就旧'))
      let chatList = await driver.findComponent(ON.text('一日就旧'))
      await chatList.click()
      await driver.delayMs(1000)
      Logger.info(TAG, BUNDLE + 'SendMessageFunction_001 inputText')
      // 底部输入框内容
      await driver.assertComponentExist(ON.id('bottomTextInput'))
      let bottomTextInput = await driver.findComponent(ON.id('bottomTextInput'))
      await bottomTextInput.inputText('good')
      let inputValue = await bottomTextInput.getText()
      Logger.info(TAG, BUNDLE + 'SendMessageFunction_001 inputValue=' + inputValue)
      hilog.info(DOMAIN, TAG, BUNDLE + 'SendMessageFunction_001, value:' + inputValue);
      expect('good').assertEqual(inputValue)
      await driver.triggerKey(2054)
      await driver.delayMs(1000)
      Logger.info(TAG, BUNDLE + 'SendMessageFunction_001 clickChatExpression')
      // 点亮表情图标
      await driver.assertComponentExist(ON.id('chatExpression'))
      let chatExpression = await driver.findComponent(ON.id('chatExpression'))
      await chatExpression.click()
      await driver.delayMs(1000)
      Logger.info(TAG, BUNDLE + 'SendMessageFunction_001 clickReturnBtn')
      // 点击返回主页
      await driver.assertComponentExist(ON.id('returnBtn'))
      let returnChatListPageBtn = await driver.findComponent(ON.id('returnBtn'))
      await returnChatListPageBtn.click()
      await driver.delayMs(1000)
      Logger.info(TAG, BUNDLE + 'SendMessageFunction_001 existAddBtn')
      await driver.assertComponentExist(ON.id('addBtn'))
      hilog.info(DOMAIN, TAG, BUNDLE + 'SendMessageFunction_001, end');
      Logger.info(TAG, BUNDLE + 'SendMessageFunction_001 end')
      done()
    })

    /**
     * @tc.number    SUB_SOLUTION_CHAT_ABILITY_0300
     * @tc.name      TaskPoolFunction_001
     * @tc.desc      Verify the moments task pool flow renders media.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'TaskPoolFunction_001', 0, async (done: Function) => {
      Logger.info(TAG, `${BUNDLE}TaskPoolFunction_001 begin`);
      hilog.info(DOMAIN, TAG, BUNDLE + 'TaskPoolFunction_001, begin');
      await yieldThread();
      let driver = Driver.create();
      await ensureHomeAndChatTab(driver);
      await driver.delayMs(1000);
      Logger.info(TAG, `${BUNDLE}TaskPoolFunction_001 clickDiscover`);
      // 点击发现
      await driver.assertComponentExist(ON.text(await getResourceString($r('app.string.discovery'))));
      let discover = await driver.findComponent(ON.text(await getResourceString($r('app.string.discovery'))));
      await discover.click();
      await driver.delayMs(1000);
      Logger.info(TAG, `${BUNDLE}TaskPoolFunction_001 clickChatCommunity`);
      // 点击朋友圈
      await driver.assertComponentExist(ON.id('chatCommunity'));
      let chatCommunity = await driver.findComponent(ON.id('chatCommunity'));
      await chatCommunity.click();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text(await getResourceString($r('app.string.circle'))));
      // 朋友圈数据来自远端，固定等待不可靠，改为轮询
      let userImageFound: boolean = false;
      for (let retry: number = 0; retry < 10; retry++) {
        try {
          await driver.findComponent(ON.id('userImage'));
          userImageFound = true;
          break;
        } catch (error) {
          await driver.delayMs(1000);
        }
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'TaskPoolFunction_001, value:' + userImageFound);
      expect(userImageFound).assertTrue();
      await driver.delayMs(1000);
      // 点击单张图片
      Logger.info(TAG, `${BUNDLE}TaskPoolFunction_001 clickSingleImage`);
      let singleClicked: boolean = await clickByIdWithScroll(driver, 'singleImage', 2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'TaskPoolFunction_001, value:' + singleClicked);
      expect(singleClicked).assertTrue();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.id('mediaPage'));
      await driver.pressBack();
      await driver.delayMs(1000);
      // 点击多张图片
      Logger.info(TAG, `${BUNDLE}TaskPoolFunction_001 clickMultipleImage`);
      let multiClicked: boolean = await clickByIdWithScroll(driver, `${imageIndex}`, 6);
      hilog.info(DOMAIN, TAG, BUNDLE + 'TaskPoolFunction_001, value:' + multiClicked);
      expect(multiClicked).assertTrue();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.id('mediaPage'));
      await driver.assertComponentExist(ON.id('swiperImage'));
      await driver.delayMs(1000);
      await driver.swipe(0, 500, 600, 500, 600);
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.id('swiperImage'));
      await driver.swipe(600, 500, 0, 500, 600);
      await driver.delayMs(1000);
      await driver.swipe(600, 500, 0, 500, 600);
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.id('swiperImage'));
      await driver.swipe(600, 500, 0, 500, 600);
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.id('swiperImage'));
      await driver.pressBack();
      await driver.delayMs(1000);
      // 点击视频
      Logger.info(TAG, `${BUNDLE}TaskPoolFunction_001 clickVideoComponent`);
      let videoClicked: boolean = await clickByIdWithScroll(driver, 'videoComponent', 6);
      hilog.info(DOMAIN, TAG, BUNDLE + 'TaskPoolFunction_001, value:' + videoClicked);
      expect(videoClicked).assertTrue();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.id('mediaPage'));
      await driver.pressBack();
      await driver.delayMs(1000);
      // 滑动页面 循环连续向上滑动10次
      for (let index = 0; index < 10; index++) {
        await driver.swipe(0, 1200, 0, 100, 600);
        await driver.delayMs(1000);
        await driver.assertComponentExist(ON.id('userImage'));
      }
      Logger.info(TAG, `${BUNDLE}TaskPoolFunction_001 backToDiscover`);
      await driver.pressBack();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.id('chatCommunity'));
      hilog.info(DOMAIN, TAG, BUNDLE + 'TaskPoolFunction_001, end');
      Logger.info(TAG, `${BUNDLE}TaskPoolFunction_001 end`);
      done();
    })
  })
}