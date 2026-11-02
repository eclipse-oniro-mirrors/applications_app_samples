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
 
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';

const BUNDLE_NAME = 'com.samples.canvasshowcasedemo';
const ABILITY_NAME = 'EntryAbility';
const CLEARED_TITLE = '（已清空，点击按钮开始演示）';
const SCENE1 = '场景1：线性渐变与渐变描边';
const SCENE1_CURRENT = '场景1：线性渐变与渐变描边（当前）';
const SCENE2 = '场景2：图案填充 repeat';
const SCENE2_CURRENT = '场景2：图案填充 repeat（当前）';
const CLEAR_BUTTON = '清空画布与日志';
/** 480x853vp 设备上按钮列表 Scroll 的纵向滑动区间（px） */
const SWIPE_X = 360;
const SWIPE_TOP_Y = 650;
const SWIPE_BOTTOM_Y = 950;

/**
 * 在按钮列表内滑动直至目标文本可见。
 * swipeUp=true 向上滑（找列表底部按钮），false 向下滑（回到列表顶部）。
 */
async function revealButton(driver: Driver, texts: string[], swipeUp: boolean, maxSwipes: number): Promise<Component | null> {
  const findAny = async (): Promise<Component | null> => {
    for (const t of texts) {
      const c: Component | null = await driver.findComponent(ON.text(t));
      if (c !== null) {
        return c;
      }
    }
    return null;
  };
  let found: Component | null = await findAny();
  for (let i = 0; i < maxSwipes && found === null; i++) {
    const fromY: number = swipeUp ? SWIPE_BOTTOM_Y : SWIPE_TOP_Y;
    const toY: number = swipeUp ? SWIPE_TOP_Y : SWIPE_BOTTOM_Y;
    await driver.swipe(SWIPE_X, fromY, SWIPE_X, toY, 2000);
    await driver.delayMs(200);
    found = await findAny();
  }
  return found;
}

/**
 * Index 页面 UI 自动化测试（@ohos.UiTest）
 * 覆盖：场景按钮选中高亮切换、清空二次确认弹框的取消/确认两条路径。
 * 注意：DevEco 默认单用例超时 15s，单例内控制 UiTest 调用次数与等待时长。
 */
export default function indexUiTest() {
  describe('indexUiTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      const delegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      // 不能用 aa force-stop：测试进程与主应用同 bundle，会被一起杀掉
      await delegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      driver = Driver.create();
      await driver.delayMs(3000);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_INDEXUI_0100
     * @tc.name uiInitialHighlight001
     * @tc.desc Verify clicking the first scene highlights only its button with the current marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ui_initialSceneHighlight', 0, async () => {
      // 启动时 onReady 已绘制场景1，按钮可能已是“（当前）”文案，两种都接受
      const scene1: Component | null =
        await revealButton(driver, [SCENE1_CURRENT, SCENE1], false, 4);
      expect(scene1 !== null).assertTrue();
      if (scene1 === null) {
        return;
      }
      await scene1.click();
      await driver.delayMs(600);
      const current: Component | null = await driver.findComponent(ON.text(SCENE1_CURRENT));
      expect(current !== null).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_INDEXUI_0200
     * @tc.name uiSwitchHighlight002
     * @tc.desc Verify clicking another scene moves the highlight marker to that button only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ui_switchHighlight', 0, async () => {
      const scene2: Component | null = await revealButton(driver, [SCENE2], false, 3);
      expect(scene2 !== null).assertTrue();
      if (scene2 === null) {
        return;
      }
      await scene2.click();
      await driver.delayMs(600);
      const newCurrent: Component | null = await driver.findComponent(ON.text(SCENE2_CURRENT));
      expect(newCurrent !== null).assertTrue();
      const oldCurrent: Component | null = await driver.findComponent(ON.text(SCENE1_CURRENT));
      expect(oldCurrent === null).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_INDEXUI_0300
     * @tc.name uiClearConfirmFlow003
     * @tc.desc Verify clear asks for confirmation: cancel keeps content, confirm clears and resets title
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ui_clearConfirmFlow', 0, async () => {
      const clearBtn: Component | null = await revealButton(driver, [CLEAR_BUTTON], true, 4);
      expect(clearBtn !== null).assertTrue();
      if (clearBtn === null) {
        return;
      }

      // 取消路径：“取消”按钮存在即说明弹框已出现；取消后页面不应被清空
      await clearBtn.click();
      await driver.delayMs(700);
      const cancelBtn: Component | null = await driver.findComponent(ON.text('取消'));
      expect(cancelBtn !== null).assertTrue();
      if (cancelBtn !== null) {
        await cancelBtn.click();
      }
      await driver.delayMs(600);
      const keptTitle: Component | null = await driver.findComponent(ON.text(CLEARED_TITLE));
      expect(keptTitle === null).assertTrue();

      // 确认路径：清空画布与日志并复位标题
      const clearBtnAgain: Component | null = await driver.findComponent(ON.text(CLEAR_BUTTON));
      expect(clearBtnAgain !== null).assertTrue();
      if (clearBtnAgain === null) {
        return;
      }
      await clearBtnAgain.click();
      await driver.delayMs(700);
      const confirmBtn: Component | null = await driver.findComponent(ON.text('清空'));
      expect(confirmBtn !== null).assertTrue();
      if (confirmBtn !== null) {
        await confirmBtn.click();
      }
      await driver.delayMs(600);
      const clearedTitle: Component | null = await driver.findComponent(ON.text(CLEARED_TITLE));
      expect(clearedTitle !== null).assertTrue();
    });
  });
}
