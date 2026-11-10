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
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import {
  SHOW_ID,
  BUTTON_IDS,
  BUTTON_LABELS,
  getDriver,
  startApp,
  clickAndExpect,
  labelOf
} from './StationaryUiSupport';

/**
 * 页面文案与可见性契约
 *
 * 校验三个操作按钮都有非空且互不相同的文案、状态文本控件始终可见，并在每次
 * 动作后仍能读到非空状态文本（不依赖具体业务结果）。
 */
export default function StationaryUiLabelTest() {
  describe('StationaryUiLabelTest', () => {
    beforeAll(async () => {
      await startApp();
    });

    /**
     * @tc.number SUB_STATIONARY_LABEL_0100
     * @tc.name testStationaryLabel0001
     * @tc.desc Verify every action button carries a non-empty label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLabel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (const id of BUTTON_IDS) {
        expect((await labelOf(driver, id)).length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STATIONARY_LABEL_0200
     * @tc.name testStationaryLabel0002
     * @tc.desc Verify the three action labels are mutually distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLabel0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      const labels: string[] = [];
      for (const id of BUTTON_IDS) {
        labels.push(await labelOf(driver, id));
      }
      expect(new Set<string>(labels).size).assertEqual(BUTTON_IDS.length);
    });

    /**
     * @tc.number SUB_STATIONARY_LABEL_0300
     * @tc.name testStationaryLabel0003
     * @tc.desc Verify the buttons keep their documented action labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLabel0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let i = 0; i < BUTTON_IDS.length; i++) {
        expect(await labelOf(driver, BUTTON_IDS[i])).assertEqual(BUTTON_LABELS[i]);
      }
    });

    /**
     * @tc.number SUB_STATIONARY_LABEL_0400
     * @tc.name testStationaryLabel0004
     * @tc.desc Verify the status text is visible before and after an action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLabel0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await driver.waitForComponent(ON.id(SHOW_ID), 4000) !== null).assertTrue();
      expect(await clickAndExpect(driver, 0)).assertTrue();
      expect(await driver.waitForComponent(ON.id(SHOW_ID), 4000) !== null).assertTrue();
      expect((await labelOf(driver, SHOW_ID)).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_LABEL_0500
     * @tc.name testStationaryLabel0005
     * @tc.desc Verify the status text stays visible across three different actions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLabel0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let i = 0; i < BUTTON_IDS.length; i++) {
        expect(await clickAndExpect(driver, i)).assertTrue();
        expect(await driver.waitForComponent(ON.id(SHOW_ID), 4000) !== null).assertTrue();
      }
      expect((await labelOf(driver, SHOW_ID)).length > 0).assertTrue();
    });
  });
}
