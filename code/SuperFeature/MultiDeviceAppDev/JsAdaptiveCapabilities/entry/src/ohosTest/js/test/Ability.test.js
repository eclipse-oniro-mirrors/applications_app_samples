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
const BUNDLE_NAME = 'ohos.samples.jsadaptivecapabilities';
const MAIN_ABILITY = 'com.example.entry.MainAbility';

const CLICK_DELAY = 600;
const NAV_DELAY = 300;
const SWIPE_SETTLE = 300;
const WAIT_TIMEOUT = 5000;
const HOME_PROBE_TIMEOUT = 800;

let driver = Driver.create();

// FA 模型页面文案随系统语言变化，这里同时给出中英文候选，避免换语言后找不到组件
const TXT_HOME_TITLE = ['页面开发一多能力', 'Page development-Adaptive Capabilities'];
const TXT_RESOURCE = ['资源限定词', 'Resource qualifier'];
const TXT_ATOMIC = ['原子布局能力', 'Atomic layout capability'];
const TXT_RESPONSIVE = ['响应式布局', 'Responsive layout'];
const TXT_FLEX_FIRST = ['拉伸能力1', 'Flexible capability first'];
const TXT_FLEX_SECOND = ['拉伸能力2', 'Flexible capability second'];
const TXT_SCALING = ['缩放能力', 'Scaling capability'];
const TXT_HIDDEN = ['隐藏能力', 'Hidden capability'];
const TXT_WRAP = ['折行能力', 'Wrap capability'];
const TXT_EQUAL = ['均分能力', 'Equally capability'];
const TXT_PERCENT = ['占比能力', 'Percentage capability'];
const TXT_EXTENSION_FIRST = ['延伸能力1', 'Extension capacity first'];
const TXT_EXTENSION_SECOND = ['延伸能力2', 'Extension capacity second'];
const TXT_MEDIA_QUERY = ['媒体查询', 'Media query'];
const TXT_GRID = ['栅格布局', 'Grid layout'];
const TXT_TYPICAL = ['典型场景', 'Typical scenario'];
const TXT_DIVERSION = ['挪移布局', 'Diversion layout'];
const TXT_INDENTATION = ['缩进布局', 'Indentation layout'];
const TXT_REPEAT = ['重复布局', 'Repeat layout'];

// 首页三个入口在列表中的位置，作为文本未命中时的兜底
const INDEX_RESOURCE = 0;
const INDEX_ATOMIC = 1;
const INDEX_RESPONSIVE = 2;

async function startMainAbility() {
  const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  try {
    await delegator.startAbility({
      bundleName: BUNDLE_NAME,
      abilityName: MAIN_ABILITY
    });
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'start ability failed: %{public}s', JSON.stringify(err));
  }
  await driver.delayMs(CLICK_DELAY);
}

// 轮询等待组件出现，避免页面切换动画未结束导致的偶现找不到组件
async function waitComponentByTexts(texts, timeout = WAIT_TIMEOUT) {
  const deadline = Date.now() + timeout;
  while (Date.now() < deadline) {
    for (let i = 0; i < texts.length; i++) {
      const component = await driver.findComponent(ON.text(texts[i]));
      if (component) {
        return component;
      }
    }
    await driver.delayMs(100);
  }
  return undefined;
}

async function waitComponentById(id, timeout = WAIT_TIMEOUT) {
  const deadline = Date.now() + timeout;
  while (Date.now() < deadline) {
    const component = await driver.findComponent(ON.id(id));
    if (component) {
      return component;
    }
    await driver.delayMs(100);
  }
  return undefined;
}

// 先按中英文文案找，再按列表位置兜底，最后才断言失败
async function findIndexItem(index, texts) {
  const byText = await waitComponentByTexts(texts);
  if (byText) {
    return byText;
  }
  try {
    const items = await driver.findComponents(ON.type('list-item'));
    if (items && items.length > index) {
      return items[index];
    }
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'find list item failed: %{public}s', JSON.stringify(err));
  }
  return undefined;
}

async function clickIndexItem(index, texts) {
  const button = await findIndexItem(index, texts);
  if (!button) {
    await driver.assertComponentExist(ON.text(texts[0]));
    return;
  }
  await button.click();
  await driver.delayMs(CLICK_DELAY);
}

async function clickByTexts(texts) {
  const button = await waitComponentByTexts(texts);
  if (!button) {
    await driver.assertComponentExist(ON.text(texts[0]));
    return;
  }
  await button.click();
  await driver.delayMs(CLICK_DELAY);
}

// 回到首页，保证各用例互不影响
async function ensureHome() {
  if (await waitComponentByTexts(TXT_HOME_TITLE, WAIT_TIMEOUT)) {
    return;
  }
  for (let i = 0; i < 6; i++) {
    await driver.pressBack();
    await driver.delayMs(NAV_DELAY);
    if (await waitComponentByTexts(TXT_HOME_TITLE, HOME_PROBE_TIMEOUT)) {
      return;
    }
  }
  // 应用可能已被退出或压到后台，重新拉起后再找首页标题
  await startMainAbility();
  const home = await waitComponentByTexts(TXT_HOME_TITLE, WAIT_TIMEOUT);
  expect(home !== undefined).assertEqual(true);
}

async function backToIndex() {
  await driver.pressBack();
  await driver.delayMs(NAV_DELAY);
}

// 进入二级页面后等待路由动画完成再返回
// （无滑动交互的页面需要更长的稳定时间）
async function clickAndReturn(texts) {
  await clickByTexts(texts);
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
      await startMainAbility();
      const home = await waitComponentByTexts(TXT_HOME_TITLE, WAIT_TIMEOUT);
      expect(home !== undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 end');
    })

    /**
     * 资源限定词
     */
    it(BUNDLE + 'clickResourceFunction_001', 0, async function () {
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickResourceFunction_001 begin');
      await ensureHome();
      await clickIndexItem(INDEX_RESOURCE, TXT_RESOURCE);
      // 跳转资源限定词页面
      const clockFace = await waitComponentById('clockFace');
      expect(clockFace !== undefined).assertEqual(true);
      // 返回首页
      await backToIndex();
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickResourceFunction_001 end');
    })

    /**
     * 原子布局能力：拉伸能力1、拉伸能力2
     */
    it(BUNDLE + 'clickAtomCapabilitiesFunction_001', 0, async function () {
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAtomCapabilitiesFunction_001 begin');
      await ensureHome();
      await clickIndexItem(INDEX_ATOMIC, TXT_ATOMIC);
      // 拉伸能力1
      await clickByTexts(TXT_FLEX_FIRST);
      await driver.swipe(547, 1063, 360, 1065, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await backToIndex();
      // 拉伸能力2
      await clickByTexts(TXT_FLEX_SECOND);
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
      await ensureHome();
      await clickIndexItem(INDEX_ATOMIC, TXT_ATOMIC);
      // 缩放能力
      await clickByTexts(TXT_SCALING);
      await driver.swipe(507, 1025, 360, 1025, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await driver.swipe(507, 1085, 360, 1085, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await backToIndex();
      // 隐藏能力
      await clickByTexts(TXT_HIDDEN);
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
      await ensureHome();
      await clickIndexItem(INDEX_ATOMIC, TXT_ATOMIC);
      // 折行能力
      await clickByTexts(TXT_WRAP);
      await driver.swipe(547, 1063, 360, 1065, 200);
      await driver.delayMs(SWIPE_SETTLE);
      await backToIndex();
      // 均分能力
      await clickByTexts(TXT_EQUAL);
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
      await ensureHome();
      await clickIndexItem(INDEX_ATOMIC, TXT_ATOMIC);
      // 占比能力
      await clickByTexts(TXT_PERCENT);
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
      await ensureHome();
      await clickIndexItem(INDEX_ATOMIC, TXT_ATOMIC);
      // 延伸能力1
      await clickByTexts(TXT_EXTENSION_FIRST);
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
      await ensureHome();
      await clickIndexItem(INDEX_ATOMIC, TXT_ATOMIC);
      // 延伸能力2
      await clickByTexts(TXT_EXTENSION_SECOND);
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
      await ensureHome();
      // 点击响应式布局
      await clickIndexItem(INDEX_RESPONSIVE, TXT_RESPONSIVE);
      // 跳转响应式布局页面
      await clickAndReturn(TXT_GRID);
      // 点击媒体查询
      await clickAndReturn(TXT_MEDIA_QUERY);
      // 回到首页
      await backToIndex();
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAdaptiveCapabilitiesFunction_001 end');
    })

    /**
     * 响应式布局：典型场景
     */
    it(BUNDLE + 'clicAdaptiveCapabilitiesFunction_002', 0, async function () {
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAdaptiveCapabilitiesFunction_002 begin');
      await ensureHome();
      // 点击响应式布局
      await clickIndexItem(INDEX_RESPONSIVE, TXT_RESPONSIVE);
      // 点击典型场景
      await clickByTexts(TXT_TYPICAL);
      // 跳转典型场景页面
      await clickAndReturn(TXT_DIVERSION);
      // 点击缩进布局
      await clickAndReturn(TXT_INDENTATION);
      // 点击重复布局
      await clickAndReturn(TXT_REPEAT);
      // 回到响应式布局页面
      await backToIndex();
      // 回到首页
      await backToIndex();
      hilog.info(DOMAIN, TAG, BUNDLE + 'clickAdaptiveCapabilitiesFunction_002 end');
    })
  })
}
