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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver, ON } from '@kit.TestKit';
import {
  getDriver,
  waitForUiReady,
  collabComponentCount,
  checkTextContent,
  checkComponentExists,
  clickButtonByText,
  readInputText,
  getCurrentFocusIndex,
  checkFocusState,
  pressAndWait,
  triggerSerializedKey,
  simulateTouch,
  serializedDelay,
  findComponentsByType,
  runSerializedUiOperation,
  KEY_UP,
  KEY_DOWN,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  KEY_HOME,
  TIMEOUT_UI_RENDER,
  TIMEOUT_CONNECT,
  TIMEOUT_STATE_CHANGE,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_OPERATION,
  TOLERANCE_COMPONENT_COUNT,
  STRESS_ROUNDS_NAVIGATION,
  STABLE_ROUNDS,
  PAGE_TITLE,
  BUTTON_CONNECT,
  BUTTON_SEND_MESSAGE,
  BUTTON_SEND_DATA,
  BUTTON_DISCONNECT,
  BUTTON_DESTROY_SESSION,
  MESSAGE_INPUT_ID,
  launchSampleApp,
  MockCollabBridge,
  buildPeerInfo,
  buildConnectOptions,
  COLLAB_SESSION_NAME,
} from '../Shared/CollabTestDriver';


// 页面按钮名枚举：与 Index.ets 的按钮一一对应
enum PageButton {
  CONNECT = 'Connect',
  SEND_MESSAGE = 'Send Message',
  SEND_DATA = 'Send Data',
  DISCONNECT = 'Disconnect',
  DESTROY_SESSION = 'Destroy Session'
}

// 页面元素统计：描述主页面关键组件数量
interface PageElementStats {
  buttonCount: number;
  textCount: number;
  inputCount: number;
  totalCount: number;
}

// 页面元素统计器：聚合主页面组件统计
class PageElementCounter {
  public summarize(buttonCount: number, textCount: number, inputCount: number): PageElementStats {
    return {
      buttonCount: buttonCount,
      textCount: textCount,
      inputCount: inputCount,
      totalCount: buttonCount + textCount + inputCount
    };
  }
}
export default function themeVariationTest() {
  describe('ThemeVariation_Test', () => {
    it('case_ui_render_0', 0, async () => {
      const d0 = getDriver();
      await waitForUiReady(d0, TIMEOUT_UI_RENDER);
      const cnt0 = await collabComponentCount(d0);
      expect(cnt0).assertLargerOrEqual(1);
    });

    it('case_ui_render_1', 0, async () => {
      const d1 = getDriver();
      await waitForUiReady(d1, TIMEOUT_UI_RENDER);
      const cnt1 = await collabComponentCount(d1);
      expect(cnt1).assertLargerOrEqual(1);
    });

    it('case_ui_render_2', 0, async () => {
      const d2 = getDriver();
      await waitForUiReady(d2, TIMEOUT_UI_RENDER);
      const cnt2 = await collabComponentCount(d2);
      expect(cnt2).assertLargerOrEqual(1);
    });

    it('case_ui_render_3', 0, async () => {
      const d3 = getDriver();
      await waitForUiReady(d3, TIMEOUT_UI_RENDER);
      const cnt3 = await collabComponentCount(d3);
      expect(cnt3).assertLargerOrEqual(1);
    });

    it('case_ui_render_4', 0, async () => {
      const d4 = getDriver();
      await waitForUiReady(d4, TIMEOUT_UI_RENDER);
      const cnt4 = await collabComponentCount(d4);
      expect(cnt4).assertLargerOrEqual(1);
    });

    it('case_ui_render_5', 0, async () => {
      const d5 = getDriver();
      await waitForUiReady(d5, TIMEOUT_UI_RENDER);
      const cnt5 = await collabComponentCount(d5);
      expect(cnt5).assertLargerOrEqual(1);
    });

    it('case_ui_render_6', 0, async () => {
      const d6 = getDriver();
      await waitForUiReady(d6, TIMEOUT_UI_RENDER);
      const cnt6 = await collabComponentCount(d6);
      expect(cnt6).assertLargerOrEqual(1);
    });

    it('case_ui_render_7', 0, async () => {
      const d7 = getDriver();
      await waitForUiReady(d7, TIMEOUT_UI_RENDER);
      const cnt7 = await collabComponentCount(d7);
      expect(cnt7).assertLargerOrEqual(1);
    });

    it('case_extra_8', 0, async () => {
      const b8 = new MockCollabBridge();
      const p8 = buildPeerInfo('device_8');
      const o8 = buildConnectOptions(true);
      const a8 = b8.createAbilityConnectionSession(COLLAB_SESSION_NAME, p8, o8);
      const c8 = b8.createAbilityConnectionSession(COLLAB_SESSION_NAME, p8, o8);
      expect(a8).assertLargerOrEqual(0);
      expect(c8).assertEqual(a8 + 1);
    });

  });

}
