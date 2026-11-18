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
  clickAndExpectLast
} from './StationaryUiSupport';

const DOMAIN: number = 0xF812;
const TAG: string = 'Sample_Stationary';

/**
 * 页面动作序列矩阵（UiTest）
 *
 * 枚举三个按钮的所有两连、三连序列，以及“回到起点”的四连序列。每个用例
 * 依次点击后校验最终文案等于序列最后一个动作对应的文本（设备不支持
 * stationary 时则保持操作前的文本），验证页面“最后一次动作生效”的语义。
 */

function caseEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

function caseBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

export default function StationaryUiSequenceMatrixTest() {
  describe('StationaryUiSequenceMatrixTest', () => {
    beforeAll(async () => {
      await startApp();
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0100
     * @tc.name testSeqPair0001
     * @tc.desc Verify sequence button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqPair0001');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1'])).assertTrue();
      caseEnd('testSeqPair0001');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0200
     * @tc.name testSeqPair0002
     * @tc.desc Verify sequence button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqPair0002');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2'])).assertTrue();
      caseEnd('testSeqPair0002');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0300
     * @tc.name testSeqPair0003
     * @tc.desc Verify sequence button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqPair0003');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3'])).assertTrue();
      caseEnd('testSeqPair0003');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0400
     * @tc.name testSeqPair0004
     * @tc.desc Verify sequence button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqPair0004');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1'])).assertTrue();
      caseEnd('testSeqPair0004');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0500
     * @tc.name testSeqPair0005
     * @tc.desc Verify sequence button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqPair0005');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2'])).assertTrue();
      caseEnd('testSeqPair0005');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0600
     * @tc.name testSeqPair0006
     * @tc.desc Verify sequence button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqPair0006');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3'])).assertTrue();
      caseEnd('testSeqPair0006');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0700
     * @tc.name testSeqPair0007
     * @tc.desc Verify sequence button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqPair0007');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1'])).assertTrue();
      caseEnd('testSeqPair0007');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0800
     * @tc.name testSeqPair0008
     * @tc.desc Verify sequence button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqPair0008');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2'])).assertTrue();
      caseEnd('testSeqPair0008');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_0900
     * @tc.name testSeqPair0009
     * @tc.desc Verify sequence button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqPair0009');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3'])).assertTrue();
      caseEnd('testSeqPair0009');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1000
     * @tc.name testSeqTriple0010
     * @tc.desc Verify sequence button1->button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0010');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1', 'button1'])).assertTrue();
      caseEnd('testSeqTriple0010');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1100
     * @tc.name testSeqTriple0011
     * @tc.desc Verify sequence button1->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0011');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1', 'button2'])).assertTrue();
      caseEnd('testSeqTriple0011');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1200
     * @tc.name testSeqTriple0012
     * @tc.desc Verify sequence button1->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0012');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1', 'button3'])).assertTrue();
      caseEnd('testSeqTriple0012');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1300
     * @tc.name testSeqTriple0013
     * @tc.desc Verify sequence button1->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0013');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2', 'button1'])).assertTrue();
      caseEnd('testSeqTriple0013');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1400
     * @tc.name testSeqTriple0014
     * @tc.desc Verify sequence button1->button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0014');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2', 'button2'])).assertTrue();
      caseEnd('testSeqTriple0014');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1500
     * @tc.name testSeqTriple0015
     * @tc.desc Verify sequence button1->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0015');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2', 'button3'])).assertTrue();
      caseEnd('testSeqTriple0015');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1600
     * @tc.name testSeqTriple0016
     * @tc.desc Verify sequence button1->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0016');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3', 'button1'])).assertTrue();
      caseEnd('testSeqTriple0016');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1700
     * @tc.name testSeqTriple0017
     * @tc.desc Verify sequence button1->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0017');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3', 'button2'])).assertTrue();
      caseEnd('testSeqTriple0017');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1800
     * @tc.name testSeqTriple0018
     * @tc.desc Verify sequence button1->button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0018');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3', 'button3'])).assertTrue();
      caseEnd('testSeqTriple0018');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_1900
     * @tc.name testSeqTriple0019
     * @tc.desc Verify sequence button2->button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0019');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1', 'button1'])).assertTrue();
      caseEnd('testSeqTriple0019');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2000
     * @tc.name testSeqTriple0020
     * @tc.desc Verify sequence button2->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0020');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1', 'button2'])).assertTrue();
      caseEnd('testSeqTriple0020');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2100
     * @tc.name testSeqTriple0021
     * @tc.desc Verify sequence button2->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0021');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1', 'button3'])).assertTrue();
      caseEnd('testSeqTriple0021');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2200
     * @tc.name testSeqTriple0022
     * @tc.desc Verify sequence button2->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0022');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2', 'button1'])).assertTrue();
      caseEnd('testSeqTriple0022');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2300
     * @tc.name testSeqTriple0023
     * @tc.desc Verify sequence button2->button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0023');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2', 'button2'])).assertTrue();
      caseEnd('testSeqTriple0023');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2400
     * @tc.name testSeqTriple0024
     * @tc.desc Verify sequence button2->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0024');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2', 'button3'])).assertTrue();
      caseEnd('testSeqTriple0024');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2500
     * @tc.name testSeqTriple0025
     * @tc.desc Verify sequence button2->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0025');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3', 'button1'])).assertTrue();
      caseEnd('testSeqTriple0025');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2600
     * @tc.name testSeqTriple0026
     * @tc.desc Verify sequence button2->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0026');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3', 'button2'])).assertTrue();
      caseEnd('testSeqTriple0026');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2700
     * @tc.name testSeqTriple0027
     * @tc.desc Verify sequence button2->button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0027');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3', 'button3'])).assertTrue();
      caseEnd('testSeqTriple0027');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2800
     * @tc.name testSeqTriple0028
     * @tc.desc Verify sequence button3->button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0028');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1', 'button1'])).assertTrue();
      caseEnd('testSeqTriple0028');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_2900
     * @tc.name testSeqTriple0029
     * @tc.desc Verify sequence button3->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0029');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1', 'button2'])).assertTrue();
      caseEnd('testSeqTriple0029');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3000
     * @tc.name testSeqTriple0030
     * @tc.desc Verify sequence button3->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0030');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1', 'button3'])).assertTrue();
      caseEnd('testSeqTriple0030');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3100
     * @tc.name testSeqTriple0031
     * @tc.desc Verify sequence button3->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0031');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2', 'button1'])).assertTrue();
      caseEnd('testSeqTriple0031');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3200
     * @tc.name testSeqTriple0032
     * @tc.desc Verify sequence button3->button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0032');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2', 'button2'])).assertTrue();
      caseEnd('testSeqTriple0032');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3300
     * @tc.name testSeqTriple0033
     * @tc.desc Verify sequence button3->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0033');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2', 'button3'])).assertTrue();
      caseEnd('testSeqTriple0033');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3400
     * @tc.name testSeqTriple0034
     * @tc.desc Verify sequence button3->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0034');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3', 'button1'])).assertTrue();
      caseEnd('testSeqTriple0034');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3500
     * @tc.name testSeqTriple0035
     * @tc.desc Verify sequence button3->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0035');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3', 'button2'])).assertTrue();
      caseEnd('testSeqTriple0035');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3600
     * @tc.name testSeqTriple0036
     * @tc.desc Verify sequence button3->button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqTriple0036');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3', 'button3'])).assertTrue();
      caseEnd('testSeqTriple0036');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3700
     * @tc.name testSeqQuad0037
     * @tc.desc Verify sequence button1->button1->button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0037');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1', 'button1', 'button1'])).assertTrue();
      caseEnd('testSeqQuad0037');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3800
     * @tc.name testSeqQuad0038
     * @tc.desc Verify sequence button1->button1->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0038');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1', 'button2', 'button1'])).assertTrue();
      caseEnd('testSeqQuad0038');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_3900
     * @tc.name testSeqQuad0039
     * @tc.desc Verify sequence button1->button1->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0039');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button1', 'button3', 'button1'])).assertTrue();
      caseEnd('testSeqQuad0039');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4000
     * @tc.name testSeqQuad0040
     * @tc.desc Verify sequence button1->button2->button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0040');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2', 'button1', 'button1'])).assertTrue();
      caseEnd('testSeqQuad0040');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4100
     * @tc.name testSeqQuad0041
     * @tc.desc Verify sequence button1->button2->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0041');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2', 'button2', 'button1'])).assertTrue();
      caseEnd('testSeqQuad0041');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4200
     * @tc.name testSeqQuad0042
     * @tc.desc Verify sequence button1->button2->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0042');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2', 'button3', 'button1'])).assertTrue();
      caseEnd('testSeqQuad0042');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4300
     * @tc.name testSeqQuad0043
     * @tc.desc Verify sequence button1->button3->button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0043');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3', 'button1', 'button1'])).assertTrue();
      caseEnd('testSeqQuad0043');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4400
     * @tc.name testSeqQuad0044
     * @tc.desc Verify sequence button1->button3->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0044');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3', 'button2', 'button1'])).assertTrue();
      caseEnd('testSeqQuad0044');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4500
     * @tc.name testSeqQuad0045
     * @tc.desc Verify sequence button1->button3->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0045');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button3', 'button3', 'button1'])).assertTrue();
      caseEnd('testSeqQuad0045');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4600
     * @tc.name testSeqQuad0046
     * @tc.desc Verify sequence button2->button1->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0046');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1', 'button1', 'button2'])).assertTrue();
      caseEnd('testSeqQuad0046');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4700
     * @tc.name testSeqQuad0047
     * @tc.desc Verify sequence button2->button1->button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0047');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1', 'button2', 'button2'])).assertTrue();
      caseEnd('testSeqQuad0047');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4800
     * @tc.name testSeqQuad0048
     * @tc.desc Verify sequence button2->button1->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0048');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button1', 'button3', 'button2'])).assertTrue();
      caseEnd('testSeqQuad0048');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_4900
     * @tc.name testSeqQuad0049
     * @tc.desc Verify sequence button2->button2->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0049');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2', 'button1', 'button2'])).assertTrue();
      caseEnd('testSeqQuad0049');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5000
     * @tc.name testSeqQuad0050
     * @tc.desc Verify sequence button2->button2->button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0050');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2', 'button2', 'button2'])).assertTrue();
      caseEnd('testSeqQuad0050');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5100
     * @tc.name testSeqQuad0051
     * @tc.desc Verify sequence button2->button2->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0051');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button2', 'button3', 'button2'])).assertTrue();
      caseEnd('testSeqQuad0051');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5200
     * @tc.name testSeqQuad0052
     * @tc.desc Verify sequence button2->button3->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0052');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3', 'button1', 'button2'])).assertTrue();
      caseEnd('testSeqQuad0052');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5300
     * @tc.name testSeqQuad0053
     * @tc.desc Verify sequence button2->button3->button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0053');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3', 'button2', 'button2'])).assertTrue();
      caseEnd('testSeqQuad0053');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5400
     * @tc.name testSeqQuad0054
     * @tc.desc Verify sequence button2->button3->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0054');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3', 'button3', 'button2'])).assertTrue();
      caseEnd('testSeqQuad0054');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5500
     * @tc.name testSeqQuad0055
     * @tc.desc Verify sequence button3->button1->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0055');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1', 'button1', 'button3'])).assertTrue();
      caseEnd('testSeqQuad0055');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5600
     * @tc.name testSeqQuad0056
     * @tc.desc Verify sequence button3->button1->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0056');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1', 'button2', 'button3'])).assertTrue();
      caseEnd('testSeqQuad0056');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5700
     * @tc.name testSeqQuad0057
     * @tc.desc Verify sequence button3->button1->button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0057');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button1', 'button3', 'button3'])).assertTrue();
      caseEnd('testSeqQuad0057');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5800
     * @tc.name testSeqQuad0058
     * @tc.desc Verify sequence button3->button2->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0058');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2', 'button1', 'button3'])).assertTrue();
      caseEnd('testSeqQuad0058');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_5900
     * @tc.name testSeqQuad0059
     * @tc.desc Verify sequence button3->button2->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0059');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2', 'button2', 'button3'])).assertTrue();
      caseEnd('testSeqQuad0059');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_6000
     * @tc.name testSeqQuad0060
     * @tc.desc Verify sequence button3->button2->button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0060');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button2', 'button3', 'button3'])).assertTrue();
      caseEnd('testSeqQuad0060');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_6100
     * @tc.name testSeqQuad0061
     * @tc.desc Verify sequence button3->button3->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0061');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3', 'button1', 'button3'])).assertTrue();
      caseEnd('testSeqQuad0061');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_6200
     * @tc.name testSeqQuad0062
     * @tc.desc Verify sequence button3->button3->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0062');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3', 'button2', 'button3'])).assertTrue();
      caseEnd('testSeqQuad0062');
    });

    /**
     * @tc.number SUB_STATIONARY_SEQ_6300
     * @tc.name testSeqQuad0063
     * @tc.desc Verify sequence button3->button3->button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqQuad0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testSeqQuad0063');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button3', 'button3', 'button3', 'button3'])).assertTrue();
      caseEnd('testSeqQuad0063');
    });
  });
}
