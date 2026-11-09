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
  clickAndExpectLast
} from './StationaryUiSupport';

/**
 * 页面动作序列矩阵（UiTest）
 *
 * 枚举三个按钮的所有两连、三连序列，以及“回到起点”的四连序列。每个用例
 * 依次点击后校验最终文案等于序列最后一个动作对应的文本（设备不支持
 * stationary 时则保持操作前的文本），验证页面“最后一次动作生效”的语义。
 */
export default function StationaryUiSequenceMatrixTest() {
  describe('StationaryUiSequenceMatrixTest', () => {
    beforeAll(async () => {
      await startApp();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0100
     * @tc.name testSeqPair11
     * @tc.desc Verify sequence button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0200
     * @tc.name testSeqPair12
     * @tc.desc Verify sequence button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0300
     * @tc.name testSeqPair13
     * @tc.desc Verify sequence button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0400
     * @tc.name testSeqPair21
     * @tc.desc Verify sequence button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0500
     * @tc.name testSeqPair22
     * @tc.desc Verify sequence button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0600
     * @tc.name testSeqPair23
     * @tc.desc Verify sequence button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0700
     * @tc.name testSeqPair31
     * @tc.desc Verify sequence button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0800
     * @tc.name testSeqPair32
     * @tc.desc Verify sequence button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0900
     * @tc.name testSeqPair33
     * @tc.desc Verify sequence button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1000
     * @tc.name testSeqTriple111
     * @tc.desc Verify sequence button1->button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1100
     * @tc.name testSeqTriple112
     * @tc.desc Verify sequence button1->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1200
     * @tc.name testSeqTriple113
     * @tc.desc Verify sequence button1->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1300
     * @tc.name testSeqTriple121
     * @tc.desc Verify sequence button1->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1400
     * @tc.name testSeqTriple122
     * @tc.desc Verify sequence button1->button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1500
     * @tc.name testSeqTriple123
     * @tc.desc Verify sequence button1->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1600
     * @tc.name testSeqTriple131
     * @tc.desc Verify sequence button1->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1700
     * @tc.name testSeqTriple132
     * @tc.desc Verify sequence button1->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1800
     * @tc.name testSeqTriple133
     * @tc.desc Verify sequence button1->button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1900
     * @tc.name testSeqTriple211
     * @tc.desc Verify sequence button2->button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2000
     * @tc.name testSeqTriple212
     * @tc.desc Verify sequence button2->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2100
     * @tc.name testSeqTriple213
     * @tc.desc Verify sequence button2->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2200
     * @tc.name testSeqTriple221
     * @tc.desc Verify sequence button2->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2300
     * @tc.name testSeqTriple222
     * @tc.desc Verify sequence button2->button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2400
     * @tc.name testSeqTriple223
     * @tc.desc Verify sequence button2->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2500
     * @tc.name testSeqTriple231
     * @tc.desc Verify sequence button2->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2600
     * @tc.name testSeqTriple232
     * @tc.desc Verify sequence button2->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2700
     * @tc.name testSeqTriple233
     * @tc.desc Verify sequence button2->button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2800
     * @tc.name testSeqTriple311
     * @tc.desc Verify sequence button3->button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2900
     * @tc.name testSeqTriple312
     * @tc.desc Verify sequence button3->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3000
     * @tc.name testSeqTriple313
     * @tc.desc Verify sequence button3->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3100
     * @tc.name testSeqTriple321
     * @tc.desc Verify sequence button3->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3200
     * @tc.name testSeqTriple322
     * @tc.desc Verify sequence button3->button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3300
     * @tc.name testSeqTriple323
     * @tc.desc Verify sequence button3->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3400
     * @tc.name testSeqTriple331
     * @tc.desc Verify sequence button3->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3500
     * @tc.name testSeqTriple332
     * @tc.desc Verify sequence button3->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3600
     * @tc.name testSeqTriple333
     * @tc.desc Verify sequence button3->button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3700
     * @tc.name testSeqQuad1111
     * @tc.desc Verify sequence button1->button1->button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad1111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1', 'button1', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3800
     * @tc.name testSeqQuad1121
     * @tc.desc Verify sequence button1->button1->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad1121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1', 'button2', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3900
     * @tc.name testSeqQuad1131
     * @tc.desc Verify sequence button1->button1->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad1131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1', 'button3', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4000
     * @tc.name testSeqQuad1211
     * @tc.desc Verify sequence button1->button2->button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad1211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2', 'button1', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4100
     * @tc.name testSeqQuad1221
     * @tc.desc Verify sequence button1->button2->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad1221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2', 'button2', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4200
     * @tc.name testSeqQuad1231
     * @tc.desc Verify sequence button1->button2->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad1231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2', 'button3', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4300
     * @tc.name testSeqQuad1311
     * @tc.desc Verify sequence button1->button3->button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad1311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3', 'button1', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4400
     * @tc.name testSeqQuad1321
     * @tc.desc Verify sequence button1->button3->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad1321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3', 'button2', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4500
     * @tc.name testSeqQuad1331
     * @tc.desc Verify sequence button1->button3->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad1331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3', 'button3', 'button1'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4600
     * @tc.name testSeqQuad2112
     * @tc.desc Verify sequence button2->button1->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad2112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1', 'button1', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4700
     * @tc.name testSeqQuad2122
     * @tc.desc Verify sequence button2->button1->button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad2122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1', 'button2', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4800
     * @tc.name testSeqQuad2132
     * @tc.desc Verify sequence button2->button1->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad2132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1', 'button3', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4900
     * @tc.name testSeqQuad2212
     * @tc.desc Verify sequence button2->button2->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad2212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2', 'button1', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5000
     * @tc.name testSeqQuad2222
     * @tc.desc Verify sequence button2->button2->button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad2222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2', 'button2', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5100
     * @tc.name testSeqQuad2232
     * @tc.desc Verify sequence button2->button2->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad2232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2', 'button3', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5200
     * @tc.name testSeqQuad2312
     * @tc.desc Verify sequence button2->button3->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad2312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3', 'button1', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5300
     * @tc.name testSeqQuad2322
     * @tc.desc Verify sequence button2->button3->button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad2322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3', 'button2', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5400
     * @tc.name testSeqQuad2332
     * @tc.desc Verify sequence button2->button3->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad2332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3', 'button3', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5500
     * @tc.name testSeqQuad3113
     * @tc.desc Verify sequence button3->button1->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad3113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1', 'button1', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5600
     * @tc.name testSeqQuad3123
     * @tc.desc Verify sequence button3->button1->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad3123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1', 'button2', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5700
     * @tc.name testSeqQuad3133
     * @tc.desc Verify sequence button3->button1->button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad3133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1', 'button3', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5800
     * @tc.name testSeqQuad3213
     * @tc.desc Verify sequence button3->button2->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad3213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2', 'button1', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5900
     * @tc.name testSeqQuad3223
     * @tc.desc Verify sequence button3->button2->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad3223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2', 'button2', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_6000
     * @tc.name testSeqQuad3233
     * @tc.desc Verify sequence button3->button2->button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad3233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2', 'button3', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_6100
     * @tc.name testSeqQuad3313
     * @tc.desc Verify sequence button3->button3->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad3313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3', 'button1', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_6200
     * @tc.name testSeqQuad3323
     * @tc.desc Verify sequence button3->button3->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad3323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3', 'button2', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_6300
     * @tc.name testSeqQuad3333
     * @tc.desc Verify sequence button3->button3->button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad3333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3', 'button3', 'button3'])).assertTrue();
    });
  });
}
