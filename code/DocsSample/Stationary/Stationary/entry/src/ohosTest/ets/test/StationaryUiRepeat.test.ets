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
import { Driver } from '@kit.TestKit';
import {
  getDriver,
  startApp,
  repeatClick,
  repeatAlternate
} from './StationaryUiSupport';

/**
 * 页面动作的重复与交替稳定性
 *
 * 覆盖同一动作多次点击、单动作高频点击，以及两个动作多轮交替点击。
 * 每轮结束都校验状态文本稳定等于最后一个动作对应的文本（不支持
 * stationary 时则保持原文本），用来验证重复操作不会让页面状态漂移。
 */
export default function StationaryUiRepeatTest() {
  describe('StationaryUiRepeatTest', () => {
    beforeAll(async () => {
      await startApp();
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0100
     * @tc.name testRepeatSingle1
     * @tc.desc Verify clicking subscribe three times keeps the status text stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await repeatClick(driver, 'button1', 3)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0200
     * @tc.name testRepeatSingle2
     * @tc.desc Verify clicking unsubscribe three times keeps the status text stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await repeatClick(driver, 'button2', 3)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0300
     * @tc.name testRepeatSingle3
     * @tc.desc Verify clicking the one-shot query three times keeps the status text stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await repeatClick(driver, 'button3', 3)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0400
     * @tc.name testRepeatEightClicks
     * @tc.desc Verify eight clicks on subscribe keep the status text stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatEightClicks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await repeatClick(driver, 'button1', 8)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0500
     * @tc.name testRepeatAlternate12
     * @tc.desc Verify alternating subscribe/unsubscribe five rounds ends on unsubscribe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await repeatAlternate(driver, 'button1', 'button2', 5)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0600
     * @tc.name testRepeatAlternate21
     * @tc.desc Verify alternating unsubscribe/subscribe five rounds ends on subscribe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await repeatAlternate(driver, 'button2', 'button1', 5)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0700
     * @tc.name testRepeatAlternate13
     * @tc.desc Verify alternating subscribe/query five rounds ends on query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await repeatAlternate(driver, 'button1', 'button3', 5)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0800
     * @tc.name testRepeatAlternate31
     * @tc.desc Verify alternating query/subscribe five rounds ends on subscribe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await repeatAlternate(driver, 'button3', 'button1', 5)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0900
     * @tc.name testRepeatAlternate23
     * @tc.desc Verify alternating unsubscribe/query five rounds ends on query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await repeatAlternate(driver, 'button2', 'button3', 5)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_1000
     * @tc.name testRepeatAlternate32
     * @tc.desc Verify alternating query/unsubscribe five rounds ends on unsubscribe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await repeatAlternate(driver, 'button3', 'button2', 5)).assertTrue();
    });
  });
}
