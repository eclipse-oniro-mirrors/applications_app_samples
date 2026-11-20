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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';

import {
  getDriver,
  startApp,
  repeatClick,
  repeatAlternate
} from './StationaryUiSupport';

const DOMAIN: number = 0xF812;
const TAG: string = 'Sample_Stationary';

/**
 * 页面动作的重复与交替稳定性
 *
 * 覆盖同一动作多次点击、单动作高频点击，以及两个动作多轮交替点击。
 * 每轮结束都校验状态文本稳定等于最后一个动作对应的文本（不支持
 * stationary 时则保持原文本），用来验证重复操作不会让页面状态漂移。
 */

function caseEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

function caseBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

export default function StationaryUiRepeatTest() {
  describe('StationaryUiRepeatTest', () => {
    beforeAll(async () => {
      await startApp();
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0100
     * @tc.name testRepeatSingle0001
     * @tc.desc Verify clicking subscribe three times keeps the status text stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testRepeatSingle0001');
      const driver: Driver = getDriver();
      expect(await repeatClick(driver, 'button1', 3)).assertTrue();
      caseEnd('testRepeatSingle0001');
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0200
     * @tc.name testRepeatSingle0002
     * @tc.desc Verify clicking unsubscribe three times keeps the status text stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testRepeatSingle0002');
      const driver: Driver = getDriver();
      expect(await repeatClick(driver, 'button2', 3)).assertTrue();
      caseEnd('testRepeatSingle0002');
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0300
     * @tc.name testRepeatSingle0003
     * @tc.desc Verify clicking the one-shot query three times keeps the status text stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testRepeatSingle0003');
      const driver: Driver = getDriver();
      expect(await repeatClick(driver, 'button3', 3)).assertTrue();
      caseEnd('testRepeatSingle0003');
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0400
     * @tc.name testRepeatEightClicks0004
     * @tc.desc Verify eight clicks on subscribe keep the status text stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatEightClicks0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testRepeatEightClicks0004');
      const driver: Driver = getDriver();
      expect(await repeatClick(driver, 'button1', 8)).assertTrue();
      caseEnd('testRepeatEightClicks0004');
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0500
     * @tc.name testRepeatAlternate0005
     * @tc.desc Verify alternating subscribe/unsubscribe five rounds ends on unsubscribe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testRepeatAlternate0005');
      const driver: Driver = getDriver();
      expect(await repeatAlternate(driver, 'button1', 'button2', 5)).assertTrue();
      caseEnd('testRepeatAlternate0005');
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0600
     * @tc.name testRepeatAlternate0006
     * @tc.desc Verify alternating unsubscribe/subscribe five rounds ends on subscribe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testRepeatAlternate0006');
      const driver: Driver = getDriver();
      expect(await repeatAlternate(driver, 'button2', 'button1', 5)).assertTrue();
      caseEnd('testRepeatAlternate0006');
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0700
     * @tc.name testRepeatAlternate0007
     * @tc.desc Verify alternating subscribe/query five rounds ends on query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testRepeatAlternate0007');
      const driver: Driver = getDriver();
      expect(await repeatAlternate(driver, 'button1', 'button3', 5)).assertTrue();
      caseEnd('testRepeatAlternate0007');
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0800
     * @tc.name testRepeatAlternate0008
     * @tc.desc Verify alternating query/subscribe five rounds ends on subscribe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testRepeatAlternate0008');
      const driver: Driver = getDriver();
      expect(await repeatAlternate(driver, 'button3', 'button1', 5)).assertTrue();
      caseEnd('testRepeatAlternate0008');
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_0900
     * @tc.name testRepeatAlternate0009
     * @tc.desc Verify alternating unsubscribe/query five rounds ends on query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testRepeatAlternate0009');
      const driver: Driver = getDriver();
      expect(await repeatAlternate(driver, 'button2', 'button3', 5)).assertTrue();
      caseEnd('testRepeatAlternate0009');
    });

    /**
     * @tc.number SUB_STATIONARY_REPEAT_1000
     * @tc.name testRepeatAlternate0010
     * @tc.desc Verify alternating query/unsubscribe five rounds ends on unsubscribe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testRepeatAlternate0010');
      const driver: Driver = getDriver();
      expect(await repeatAlternate(driver, 'button3', 'button2', 5)).assertTrue();
      caseEnd('testRepeatAlternate0010');
    });
  });
}
