/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DOMAIN = 0xF811;
const TAG = '[Sample_jsAdaptiveCapabilities]';
const BUNDLE = 'jsAdaptiveCapabilities_';

const CLICK_DELAY = 600;
const NAV_DELAY = 300;
const SWIPE_SETTLE = 300;
const WAIT_TIMEOUT = 3000;

let driver = Driver.create();

const HOME_TEXT = '资源限定词';

// 轮询等待组件出现，避免页面切换动画未结束导致的偶现找不到组件
async function waitComponentByText(text, timeout = WAIT_TIMEOUT) {
  const deadline = Date.now() + timeout;
  while (Date.now() < deadline) {
    const component = await driver.findComponent(ON.text(text));
    if (component) {
      return component;
    }
    await driver.delayMs(100);
  }
  return undefined;
}

// 通过 text 验证有没有这个组件 有的话点击一下
async function checkButtonAndClickWithText(text) {
  let textName = text;
  let button = await waitComponentByText(textName);
  if (!button) {
    await driver.assertComponentExist(ON.text(textName));
    button = await driver.findComponent(ON.text(textName));
  }
  await button.click();
  await driver.delayMs(CLICK_DELAY);
}

// 回到首页，保证各用例互不影响
async function ensureHome() {
  for (let i = 0; i < 6; i++) {
    if (await driver.findComponent(ON.text(HOME_TEXT))) {
      return;
    }
    await driver.pressBack();
    await driver.delayMs(NAV_DELAY);
  }
}

async function backToIndex() {
  await driver.pressBack();
  await driver.delayMs(NAV_DELAY);
}

// 进入二级页面后等待路由动画完成再返回
// （无滑动交互的页面需要更长的稳定时间）
async function clickAndReturn(text) {
  await checkButtonAndClickWithText(text);
  await driver.delayMs(400);
  await driver.pressBack();
  await driver.delayMs(500);
}

export default function abilityTest() {
  describe('ActsAbilityTest', function () {
    /**
     * 拉起应用
     */
    it('StartAbility_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 begin');
      let abilityDelegatorRegistry = AbilityDelegatorRegistry.getAbilityDelegator();
      try {
        await abilityDelegatorRegistry.startAbility({
          bundleName: 'ohos.samples.jsadaptivecapabilities',
          abilityName: 'com.example.entry.MainAbility'
        });
      } catch (err) {
        expect(0).assertEqual(err.code);
      }
      await driver.delayMs(CLICK_DELAY);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 end');
    })

    /**
     * 资源限定词
     */
    it(BUNDLE + 'clickResourceFunction_001', 0, async function () {
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickResourceFunction_001 begin');
      let driver = Driver.create();
      await ensureHome();
      // fa模型不支持资源本地化，故用中文
      await checkButtonAndClickWithText('资源限定词');
      // 跳转资源限定词页面
      await driver.assertComponentExist(ON.id('clockFace'));
      // 返回首页
      await backToIndex();
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickResourceFunction_001 end');
    })

    /**
     * 原子布局能力：拉伸能力1、拉伸能力2
     */
    it(BUNDLE + 'clickAtomCapabilitiesFunction_001', 0, async function () {
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAtomCapabilitiesFunction_001 begin');
      let driver = Driver.create();
      await ensureHome();
      await checkButtonAndClickWithText('原子布局能力');
      // 拉伸能力1
      await checkButtonAndClickWithText('拉伸能力1');
      await driver.swipe(547, 1063, 360, 1065, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await backToIndex();
      // 拉伸能力2
      await checkButtonAndClickWithText('拉伸能力2');
      await driver.assertComponentExist(ON.type('switch'));
      let swit = await driver.findComponent(ON.type('switch'));
      await swit.click();
      await driver.delayMs(CLICK_DELAY);
      await driver.swipe(561, 1013, 360, 1013, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await backToIndex();
      await backToIndex();
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAtomCapabilitiesFunction_001 end');
    })

    /**
     * 原子布局能力：缩放能力、隐藏能力
     */
    it(BUNDLE + 'clickAtomCapabilitiesFunction_002', 0, async function () {
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAtomCapabilitiesFunction_002 begin');
      let driver = Driver.create();
      await ensureHome();
      await checkButtonAndClickWithText('原子布局能力');
      // 缩放能力
      await checkButtonAndClickWithText('缩放能力');
      await driver.swipe(507, 1025, 360, 1025, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await driver.swipe(507, 1085, 360, 1085, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await backToIndex();
      // 隐藏能力
      await checkButtonAndClickWithText('隐藏能力');
      await driver.swipe(547, 1011, 360, 1011, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await backToIndex();
      await backToIndex();
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAtomCapabilitiesFunction_002 end');
    })

    /**
     * 原子布局能力：折行能力、均分能力
     */
    it(BUNDLE + 'clickAtomCapabilitiesFunction_003', 0, async function () {
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAtomCapabilitiesFunction_003 begin');
      let driver = Driver.create();
      await ensureHome();
      await checkButtonAndClickWithText('原子布局能力');
      // 折行能力
      await checkButtonAndClickWithText('折行能力');
      await driver.swipe(547, 1063, 360, 1065, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await backToIndex();
      // 均分能力
      await checkButtonAndClickWithText('均分能力');
      await driver.swipe(557, 1009, 360, 1009, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await backToIndex();
      await backToIndex();
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAtomCapabilitiesFunction_003 end');
    })

    /**
     * 原子布局能力：占比能力
     */
    it(BUNDLE + 'clickAtomCapabilitiesFunction_004', 0, async function () {
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAtomCapabilitiesFunction_004 begin');
      let driver = Driver.create();
      await ensureHome();
      await checkButtonAndClickWithText('原子布局能力');
      // 占比能力
      await checkButtonAndClickWithText('占比能力');
      await driver.swipe(553, 1015, 360, 1015, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await backToIndex();
      await backToIndex();
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAtomCapabilitiesFunction_004 end');
    })

    /**
     * 原子布局能力：延伸能力1
     */
    it(BUNDLE + 'clickAtomCapabilitiesFunction_005', 0, async function () {
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAtomCapabilitiesFunction_005 begin');
      let driver = Driver.create();
      await ensureHome();
      await checkButtonAndClickWithText('原子布局能力');
      // 延伸能力1
      await checkButtonAndClickWithText('延伸能力1');
      await driver.swipe(360, 639, 0, 639, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await driver.swipe(410, 1017, 360, 1017, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await backToIndex();
      await backToIndex();
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAtomCapabilitiesFunction_005 end');
    })

    /**
     * 原子布局能力：延伸能力2
     */
    it(BUNDLE + 'clickAtomCapabilitiesFunction_006', 0, async function () {
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAtomCapabilitiesFunction_006 begin');
      let driver = Driver.create();
      await ensureHome();
      await checkButtonAndClickWithText('原子布局能力');
      // 延伸能力2
      await checkButtonAndClickWithText('延伸能力2');
      await driver.swipe(360, 639, 0, 639, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await driver.swipe(410, 1017, 360, 1017, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await backToIndex();
      await backToIndex();
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAtomCapabilitiesFunction_006 end');
    })

    /**
     * 响应式布局：栅格布局、媒体查询
     */
    it(BUNDLE + 'clicAdaptiveCapabilitiesFunction_001', 0, async function () {
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAdaptiveCapabilitiesFunction_001 begin');
      let driver = Driver.create();
      await ensureHome();
      // 点击响应式布局
      await checkButtonAndClickWithText('响应式布局');
      // 跳转响应式布局页面
      await clickAndReturn('栅格布局');
      // 点击媒体查询
      await clickAndReturn('媒体查询');
      // 回到首页
      await backToIndex();
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAdaptiveCapabilitiesFunction_001 end');
    })

    /**
     * 响应式布局：典型场景
     */
    it(BUNDLE + 'clicAdaptiveCapabilitiesFunction_002', 0, async function () {
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAdaptiveCapabilitiesFunction_002 begin');
      let driver = Driver.create();
      await ensureHome();
      // 点击响应式布局
      await checkButtonAndClickWithText('响应式布局');
      // 点击典型场景
      await checkButtonAndClickWithText('典型场景');
      // 跳转典型场景页面
      await clickAndReturn('挪移布局');
      // 点击缩进布局
      await clickAndReturn('缩进布局');
      // 点击重复布局
      await clickAndReturn('重复布局');
      // 回到响应式布局页面
      await backToIndex();
      // 回到首页
      await backToIndex();
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAdaptiveCapabilitiesFunction_002 end');
    })
  })
}
