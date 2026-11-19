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

import { describe, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Component, Driver, ON, Rect } from '@kit.TestKit';
import { launchHome, stopHome } from './shared/AppProbe';
import { paceTurn, sleepMs } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const INITIAL_TEXT: string = 'Hello World';
const CLICKED_TEXT: string = 'Success';
const BUTTON_TEXT: string = '触发HintGC';
const WAIT_SHOW_MS: number = 5000;
const WAIT_ABSENT_MS: number = 1000;
const CLICK_SETTLE_MS: number = 500;

let sharedDriver: Driver | null = null;

function driver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

async function openHome(): Promise<Component | null> {
  await launchHome();
  return await driver().waitForComponent(ON.text(BUTTON_TEXT).type('Button'), WAIT_SHOW_MS);
}

async function clickButton(times: number): Promise<void> {
  for (let i = 0; i < times; i++) {
    const button: Component = await driver().waitForComponent(ON.text(BUTTON_TEXT).type('Button'), WAIT_SHOW_MS);
    await button.click();
    await sleepMs(CLICK_SETTLE_MS);
  }
}

async function shown(content: string, timeoutMs: number): Promise<boolean> {
  const found: Component | null = await driver().waitForComponent(ON.text(content).type('Text'), timeoutMs);
  return found !== null;
}

async function messageBounds(content: string): Promise<Rect> {
  const text: Component = await driver().waitForComponent(ON.text(content).type('Text'), WAIT_SHOW_MS);
  return await text.getBounds();
}

export default function indexUiTest() {
  describe('IndexUiGuard', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(async () => {
      await stopHome();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_INDEXUI_0100
     * @tc.name      testIndexUiInitial0001
     * @tc.desc      Open the home page and check it shows Hello World and the hint GC button but not Success
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIndexUiInitial0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const button: Component | null = await openHome();
      logCase('testIndexUiInitial0001', `buttonFound=${button !== null} initial=${INITIAL_TEXT} ` +
        `absent=${CLICKED_TEXT}`);
      expect(button !== null).assertTrue();
      expect(await shown(INITIAL_TEXT, WAIT_SHOW_MS)).assertTrue();
      expect(await shown(CLICKED_TEXT, WAIT_ABSENT_MS)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_INDEXUI_0200
     * @tc.name      testIndexUiClickSuccess0001
     * @tc.desc      Click the hint GC button once and check the message changes from Hello World to Success
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIndexUiClickSuccess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIndexUiClickSuccess0001', `button=${BUTTON_TEXT} clicks=1 expected=${CLICKED_TEXT} ` +
        `absent=${INITIAL_TEXT}`);
      expect(await openHome() !== null).assertTrue();
      await clickButton(1);
      expect(await shown(CLICKED_TEXT, WAIT_SHOW_MS)).assertTrue();
      expect(await shown(INITIAL_TEXT, WAIT_ABSENT_MS)).assertFalse();
      expect(await driver().waitForComponent(ON.text(BUTTON_TEXT).type('Button'), WAIT_SHOW_MS) !== null).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_INDEXUI_0300
     * @tc.name      testIndexUiRepeatClick0001
     * @tc.desc      Click the hint GC button five times and check the page stays on Success with the button still
     *               present
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexUiRepeatClick0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIndexUiRepeatClick0001', `button=${BUTTON_TEXT} rounds=5 expected=${CLICKED_TEXT} ` +
        `absent=${INITIAL_TEXT}`);
      expect(await openHome() !== null).assertTrue();
      const seen: boolean[] = [];
      for (let round = 0; round < 5; round++) {
        await clickButton(1);
        seen.push(await shown(CLICKED_TEXT, WAIT_SHOW_MS));
      }
      expect(seen.length).assertEqual(5);
      expect(seen.every((value: boolean) => value)).assertTrue();
      expect(await shown(INITIAL_TEXT, WAIT_ABSENT_MS)).assertFalse();
      expect(await driver().waitForComponent(ON.text(BUTTON_TEXT).type('Button'), WAIT_SHOW_MS) !== null).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_INDEXUI_0400
     * @tc.name      testIndexUiButton0001
     * @tc.desc      Check the hint GC button is an enabled clickable Button that sits below the message text
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexUiButton0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const button: Component = (await openHome()) as Component;
      const buttonRect: Rect = await button.getBounds();
      const textRect: Rect = await messageBounds(INITIAL_TEXT);
      logCase('testIndexUiButton0001', `button=${buttonRect.left},${buttonRect.top},${buttonRect.right},` +
        `${buttonRect.bottom} textBottom=${textRect.bottom}`);
      expect(await button.isEnabled()).assertTrue();
      expect(await button.isClickable()).assertTrue();
      expect(buttonRect.top >= textRect.bottom).assertTrue();
      expect(buttonRect.right > buttonRect.left && buttonRect.bottom > buttonRect.top).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_INDEXUI_0500
     * @tc.name      testIndexUiRelaunchReset0001
     * @tc.desc      Switch the message to Success, relaunch EntryAbility and check the page starts again from Hello
     *               World
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndexUiRelaunchReset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIndexUiRelaunchReset0001', `button=${BUTTON_TEXT} clicks=1 relaunchExpected=${INITIAL_TEXT} ` +
        `absent=${CLICKED_TEXT}`);
      expect(await openHome() !== null).assertTrue();
      await clickButton(1);
      const clicked: boolean = await shown(CLICKED_TEXT, WAIT_SHOW_MS);
      expect(await openHome() !== null).assertTrue();
      expect(clicked).assertTrue();
      expect(await shown(INITIAL_TEXT, WAIT_SHOW_MS)).assertTrue();
      expect(await shown(CLICKED_TEXT, WAIT_ABSENT_MS)).assertFalse();
    });
  });
}
