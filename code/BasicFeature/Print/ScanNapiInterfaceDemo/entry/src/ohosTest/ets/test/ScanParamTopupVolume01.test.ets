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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { scan } from '@kit.BasicServicesKit';
import { ScanParameterBuilder } from '../../../main/ets/scan/model/ScanParameterBuilder';
import { ScanConstraintKind, ScanOptionConstraint } from '../../../main/ets/scan/model/ScanOptionConstraint';
import { ScanOptionModel } from '../../../main/ets/scan/model/ScanOptionViewModel';
import { ScanOptionValueParser } from '../../../main/ets/scan/model/ScanOptionValueParser';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanParamTopupVolume01Test() {
  describe('ScanParamTopup', () => {

    /**
     * @tc.name   testParam040001
     * @tc.number SUB_SCAN_PARAM_05_0001
     * @tc.desc   param shape ct=0 ot=0 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040001 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'opt', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=0 type=0 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040001 end');
    });

    /**
     * @tc.name   testParam040002
     * @tc.number SUB_SCAN_PARAM_05_0002
     * @tc.desc   param shape ct=0 ot=3 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040002 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(1, 'opt', 't', 'd', 0, 0, 3);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=0 type=3 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040002 end');
    });

    /**
     * @tc.name   testParam040003
     * @tc.number SUB_SCAN_PARAM_05_0003
     * @tc.desc   param shape ct=1 ot=0 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040003 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(2, 'opt', 't', 'd', 0, 1, 0);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=1 type=0 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040003 end');
    });

    /**
     * @tc.name   testParam040004
     * @tc.number SUB_SCAN_PARAM_05_0004
     * @tc.desc   param shape ct=1 ot=1 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040004 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(3, 'opt', 't', 'd', 0, 1, 1);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=1 type=1 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040004 end');
    });

    /**
     * @tc.name   testParam040005
     * @tc.number SUB_SCAN_PARAM_05_0005
     * @tc.desc   param shape ct=1 ot=2 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040005 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(4, 'opt', 't', 'd', 0, 1, 2);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=1 type=2 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040005 end');
    });

    /**
     * @tc.name   testParam040006
     * @tc.number SUB_SCAN_PARAM_05_0006
     * @tc.desc   param shape ct=2 ot=1 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040006 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(5, 'opt', 't', 'd', 0, 2, 1);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=2 type=1 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040006 end');
    });

    /**
     * @tc.name   testParam040007
     * @tc.number SUB_SCAN_PARAM_05_0007
     * @tc.desc   param shape ct=2 ot=3 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040007 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(6, 'opt', 't', 'd', 0, 2, 3);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=2 type=3 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040007 end');
    });

    /**
     * @tc.name   testParam040008
     * @tc.number SUB_SCAN_PARAM_05_0008
     * @tc.desc   param shape ct=3 ot=1 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040008 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(7, 'opt', 't', 'd', 0, 3, 1);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=3 type=1 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040008 end');
    });

    /**
     * @tc.name   testParam040009
     * @tc.number SUB_SCAN_PARAM_05_0009
     * @tc.desc   param shape ct=3 ot=3 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040009 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(8, 'opt', 't', 'd', 0, 3, 3);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=3 type=3 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040009 end');
    });

    /**
     * @tc.name   testParam040010
     * @tc.number SUB_SCAN_PARAM_05_0010
     * @tc.desc   param shape ct=2 ot=2 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040010 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(9, 'opt', 't', 'd', 0, 2, 2);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=2 type=2 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040010 end');
    });

    /**
     * @tc.name   testParam040011
     * @tc.number SUB_SCAN_PARAM_05_0011
     * @tc.desc   param shape ct=0 ot=1 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040011 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(10, 'opt', 't', 'd', 0, 0, 1);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=0 type=1 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040011 end');
    });

    /**
     * @tc.name   testParam040012
     * @tc.number SUB_SCAN_PARAM_05_0012
     * @tc.desc   param shape ct=1 ot=3 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040012 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(11, 'opt', 't', 'd', 0, 1, 3);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=1 type=3 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040012 end');
    });

    /**
     * @tc.name   testParam040013
     * @tc.number SUB_SCAN_PARAM_05_0013
     * @tc.desc   param shape ct=4 ot=4 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040013 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(12, 'opt', 't', 'd', 0, 4, 4);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=0 type=0 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040013 end');
    });

    /**
     * @tc.name   testParam040014
     * @tc.number SUB_SCAN_PARAM_05_0014
     * @tc.desc   param shape ct=3 ot=0 prints the frozen describe text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040014 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(13, 'opt', 't', 'd', 0, 3, 0);
      expect(ScanParameterBuilder.describe(result)).assertEqual('constraint=3 type=0 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(result)).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.isEditable(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040014 end');
    });

    /**
     * @tc.name   testParam040015
     * @tc.number SUB_SCAN_PARAM_05_0015
     * @tc.desc   range ct=1 0..100/1 describes the mounted bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040015 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 1, 0, 100, 1))
      ).assertEqual('constraint=1 type=1 range=0..100/1 texts=0 ints=0');
      expect(ScanParameterBuilder.range(1, 1, 0, 100, 1).optionConstraintRange === undefined).assertEqual(false);
      expect(ScanOptionConstraint.clamp(ScanParameterBuilder.range(1, 1, 0, 100, 1), 7)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040015 end');
    });

    /**
     * @tc.name   testParam040016
     * @tc.number SUB_SCAN_PARAM_05_0016
     * @tc.desc   range ct=1 -50..50/5 describes the mounted bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040016 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 1, -50, 50, 5))
      ).assertEqual('constraint=1 type=1 range=-50..50/5 texts=0 ints=0');
      expect(ScanParameterBuilder.range(1, 1, -50, 50, 5).optionConstraintRange === undefined).assertEqual(false);
      expect(ScanOptionConstraint.clamp(ScanParameterBuilder.range(1, 1, -50, 50, 5), 7)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040016 end');
    });

    /**
     * @tc.name   testParam040017
     * @tc.number SUB_SCAN_PARAM_05_0017
     * @tc.desc   range ct=1 5..5/5 describes the mounted bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040017 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 1, 5, 5, 5))
      ).assertEqual('constraint=1 type=1 range=5..5/5 texts=0 ints=0');
      expect(ScanParameterBuilder.range(1, 1, 5, 5, 5).optionConstraintRange === undefined).assertEqual(false);
      expect(ScanOptionConstraint.clamp(ScanParameterBuilder.range(1, 1, 5, 5, 5), 7)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040017 end');
    });

    /**
     * @tc.name   testParam040018
     * @tc.number SUB_SCAN_PARAM_05_0018
     * @tc.desc   range ct=1 10..0/2 describes the mounted bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040018 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 1, 10, 0, 2))
      ).assertEqual('constraint=1 type=1 range=10..0/2 texts=0 ints=0');
      expect(ScanParameterBuilder.range(1, 1, 10, 0, 2).optionConstraintRange === undefined).assertEqual(false);
      expect(ScanOptionConstraint.clamp(ScanParameterBuilder.range(1, 1, 10, 0, 2), 7)).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040018 end');
    });

    /**
     * @tc.name   testParam040019
     * @tc.number SUB_SCAN_PARAM_05_0019
     * @tc.desc   range ct=1 0..0/0 describes the mounted bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040019 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 1, 0, 0, 0))
      ).assertEqual('constraint=1 type=1 range=0..0/0 texts=0 ints=0');
      expect(ScanParameterBuilder.range(1, 1, 0, 0, 0).optionConstraintRange === undefined).assertEqual(false);
      expect(ScanOptionConstraint.clamp(ScanParameterBuilder.range(1, 1, 0, 0, 0), 7)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040019 end');
    });

    /**
     * @tc.name   testParam040020
     * @tc.number SUB_SCAN_PARAM_05_0020
     * @tc.desc   range ct=1 1..1/1 describes the mounted bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040020 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 1, 1, 1, 1))
      ).assertEqual('constraint=1 type=1 range=1..1/1 texts=0 ints=0');
      expect(ScanParameterBuilder.range(1, 1, 1, 1, 1).optionConstraintRange === undefined).assertEqual(false);
      expect(ScanOptionConstraint.clamp(ScanParameterBuilder.range(1, 1, 1, 1, 1), 7)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040020 end');
    });

    /**
     * @tc.name   testParam040021
     * @tc.number SUB_SCAN_PARAM_05_0021
     * @tc.desc   range ct=1 -3..-2/3 describes the mounted bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040021 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 1, -3, -2, 3))
      ).assertEqual('constraint=1 type=1 range=-3..-2/3 texts=0 ints=0');
      expect(ScanParameterBuilder.range(1, 1, -3, -2, 3).optionConstraintRange === undefined).assertEqual(false);
      expect(ScanOptionConstraint.clamp(ScanParameterBuilder.range(1, 1, -3, -2, 3), 7)).assertEqual(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040021 end');
    });

    /**
     * @tc.name   testParam040022
     * @tc.number SUB_SCAN_PARAM_05_0022
     * @tc.desc   range ct=1 100..100/100 describes the mounted bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040022 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 1, 100, 100, 100))
      ).assertEqual('constraint=1 type=1 range=100..100/100 texts=0 ints=0');
      expect(ScanParameterBuilder.range(1, 1, 100, 100, 100).optionConstraintRange === undefined).assertEqual(false);
      expect(ScanOptionConstraint.clamp(ScanParameterBuilder.range(1, 1, 100, 100, 100), 7)).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040022 end');
    });

    /**
     * @tc.name   testParam040023
     * @tc.number SUB_SCAN_PARAM_05_0023
     * @tc.desc   range ct=0 0..9/1 describes the mounted bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040023 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(0, 1, 0, 9, 1))
      ).assertEqual('constraint=0 type=1 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(0, 1, 0, 9, 1).optionConstraintRange === undefined).assertEqual(true);
      expect(ScanOptionConstraint.clamp(ScanParameterBuilder.range(0, 1, 0, 9, 1), 7)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040023 end');
    });

    /**
     * @tc.name   testParam040024
     * @tc.number SUB_SCAN_PARAM_05_0024
     * @tc.desc   range ct=2 0..9/1 describes the mounted bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040024 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(2, 1, 0, 9, 1))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(2, 1, 0, 9, 1).optionConstraintRange === undefined).assertEqual(true);
      expect(ScanOptionConstraint.clamp(ScanParameterBuilder.range(2, 1, 0, 9, 1), 7)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040024 end');
    });

    /**
     * @tc.name   testParam040025
     * @tc.number SUB_SCAN_PARAM_05_0025
     * @tc.desc   range ct=3 0..9/1 describes the mounted bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040025 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(3, 1, 0, 9, 1))
      ).assertEqual('constraint=3 type=1 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(3, 1, 0, 9, 1).optionConstraintRange === undefined).assertEqual(true);
      expect(ScanOptionConstraint.clamp(ScanParameterBuilder.range(3, 1, 0, 9, 1), 7)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040025 end');
    });

    /**
     * @tc.name   testParam040026
     * @tc.number SUB_SCAN_PARAM_05_0026
     * @tc.desc   range ct=5 0..9/1 describes the mounted bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040026 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(5, 1, 0, 9, 1))
      ).assertEqual('constraint=0 type=1 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(5, 1, 0, 9, 1).optionConstraintRange === undefined).assertEqual(true);
      expect(ScanOptionConstraint.clamp(ScanParameterBuilder.range(5, 1, 0, 9, 1), 7)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040026 end');
    });

    /**
     * @tc.name   testParam040027
     * @tc.number SUB_SCAN_PARAM_05_0027
     * @tc.desc   numberList of 0 entries mounts ints and counts options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040027 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([]))).assertEqual(0);
      expect(ScanParameterBuilder.numberList([]).optionConstraintInt === undefined).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040027 end');
    });

    /**
     * @tc.name   testParam040028
     * @tc.number SUB_SCAN_PARAM_05_0028
     * @tc.desc   numberList of 1 entries mounts ints and counts options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040028 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(1, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([7]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=1');
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([7]))).assertEqual(1);
      expect(ScanParameterBuilder.numberList([7]).optionConstraintInt === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040028 end');
    });

    /**
     * @tc.name   testParam040029
     * @tc.number SUB_SCAN_PARAM_05_0029
     * @tc.desc   numberList of 2 entries mounts ints and counts options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040029 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(2, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([7, 9]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=2');
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([7, 9]))).assertEqual(2);
      expect(ScanParameterBuilder.numberList([7, 9]).optionConstraintInt === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040029 end');
    });

    /**
     * @tc.name   testParam040030
     * @tc.number SUB_SCAN_PARAM_05_0030
     * @tc.desc   numberList of 3 entries mounts ints and counts options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040030 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(3, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([7, 9, 11]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=3');
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([7, 9, 11]))).assertEqual(3);
      expect(ScanParameterBuilder.numberList([7, 9, 11]).optionConstraintInt === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040030 end');
    });

    /**
     * @tc.name   testParam040031
     * @tc.number SUB_SCAN_PARAM_05_0031
     * @tc.desc   numberList of 5 entries mounts ints and counts options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040031 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(4, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([1, 3, 5, 7, 9]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=5');
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([1, 3, 5, 7, 9]))).assertEqual(5);
      expect(ScanParameterBuilder.numberList([1, 3, 5, 7, 9]).optionConstraintInt === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040031 end');
    });

    /**
     * @tc.name   testParam040032
     * @tc.number SUB_SCAN_PARAM_05_0032
     * @tc.desc   numberList of 10 entries mounts ints and counts options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040032 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(5, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=10');
      expect(
        ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]))
      ).assertEqual(10);
      expect(
        ScanParameterBuilder.numberList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]).optionConstraintInt === undefined
      ).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040032 end');
    });

    /**
     * @tc.name   testParam040033
     * @tc.number SUB_SCAN_PARAM_05_0033
     * @tc.desc   stringList of 0 entries mounts texts and counts options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040033 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList([]))
      ).assertEqual('constraint=3 type=3 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList([]))).assertEqual(0);
      expect(ScanParameterBuilder.stringList([]).optionConstraintString === undefined).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040033 end');
    });

    /**
     * @tc.name   testParam040034
     * @tc.number SUB_SCAN_PARAM_05_0034
     * @tc.desc   stringList of 1 entries mounts texts and counts options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040034 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(1, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(['a']))
      ).assertEqual('constraint=3 type=3 range=- texts=1 ints=0');
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList(['a']))).assertEqual(1);
      expect(ScanParameterBuilder.stringList(['a']).optionConstraintString === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040034 end');
    });

    /**
     * @tc.name   testParam040035
     * @tc.number SUB_SCAN_PARAM_05_0035
     * @tc.desc   stringList of 2 entries mounts texts and counts options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040035 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(2, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(['a', 'b']))
      ).assertEqual('constraint=3 type=3 range=- texts=2 ints=0');
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList(['a', 'b']))).assertEqual(2);
      expect(ScanParameterBuilder.stringList(['a', 'b']).optionConstraintString === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040035 end');
    });

    /**
     * @tc.name   testParam040036
     * @tc.number SUB_SCAN_PARAM_05_0036
     * @tc.desc   stringList of 3 entries mounts texts and counts options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040036 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(3, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(['a', 'b', 'c']))
      ).assertEqual('constraint=3 type=3 range=- texts=3 ints=0');
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList(['a', 'b', 'c']))).assertEqual(3);
      expect(ScanParameterBuilder.stringList(['a', 'b', 'c']).optionConstraintString === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040036 end');
    });

    /**
     * @tc.name   testParam040037
     * @tc.number SUB_SCAN_PARAM_05_0037
     * @tc.desc   stringList of 5 entries mounts texts and counts options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040037 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(4, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(['p', 'q', 'r', 's', 't']))
      ).assertEqual('constraint=3 type=3 range=- texts=5 ints=0');
      expect(
        ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList(['p', 'q', 'r', 's', 't']))
      ).assertEqual(5);
      expect(
        ScanParameterBuilder.stringList(['p', 'q', 'r', 's', 't']).optionConstraintString === undefined
      ).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040037 end');
    });

    /**
     * @tc.name   testParam040038
     * @tc.number SUB_SCAN_PARAM_05_0038
     * @tc.desc   stringList of 8 entries mounts texts and counts options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040038 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(5, 'n', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(['s0', 's1', 's2', 's3', 's4', 's5', 's6', 's7']))
      ).assertEqual('constraint=3 type=3 range=- texts=8 ints=0');
      expect(
        ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList(
                ['s0', 's1', 's2', 's3', 's4', 's5', 's6', 's7'])
                )
      ).assertEqual(8);
      expect(
        ScanParameterBuilder.stringList(
                ['s0', 's1', 's2', 's3', 's4', 's5', 's6', 's7'])
                .optionConstraintString === undefined
      ).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040038 end');
    });

    /**
     * @tc.name   testParam040039
     * @tc.number SUB_SCAN_PARAM_05_0039
     * @tc.desc   bareOptionValue raw 0 degrades to the frozen fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040039 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.bareOptionValue(0).valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanOptionModel.formatValue(ScanParameterBuilder.bareOptionValue(0))).assertEqual('false');
      expect(ScanOptionValueParser.asNumber(ScanParameterBuilder.bareOptionValue(0))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040039 end');
    });

    /**
     * @tc.name   testParam040040
     * @tc.number SUB_SCAN_PARAM_05_0040
     * @tc.desc   bareOptionValue raw 1 degrades to the frozen fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040040 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(1, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.bareOptionValue(1).valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      expect(ScanOptionModel.formatValue(ScanParameterBuilder.bareOptionValue(1))).assertEqual('');
      expect(ScanOptionValueParser.asNumber(ScanParameterBuilder.bareOptionValue(1))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040040 end');
    });

    /**
     * @tc.name   testParam040041
     * @tc.number SUB_SCAN_PARAM_05_0041
     * @tc.desc   bareOptionValue raw 2 degrades to the frozen fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040041 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(2, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.bareOptionValue(2).valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanOptionModel.formatValue(ScanParameterBuilder.bareOptionValue(2))).assertEqual('');
      expect(ScanOptionValueParser.asNumber(ScanParameterBuilder.bareOptionValue(2))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040041 end');
    });

    /**
     * @tc.name   testParam040042
     * @tc.number SUB_SCAN_PARAM_05_0042
     * @tc.desc   bareOptionValue raw 3 degrades to the frozen fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040042 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(3, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.bareOptionValue(3).valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      expect(ScanOptionModel.formatValue(ScanParameterBuilder.bareOptionValue(3))).assertEqual('');
      expect(ScanOptionValueParser.asNumber(ScanParameterBuilder.bareOptionValue(3))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040042 end');
    });

    /**
     * @tc.name   testParam040043
     * @tc.number SUB_SCAN_PARAM_05_0043
     * @tc.desc   bareOptionValue raw 5 degrades to the frozen fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040043 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(5, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.bareOptionValue(5).valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanOptionModel.formatValue(ScanParameterBuilder.bareOptionValue(5))).assertEqual('false');
      expect(ScanOptionValueParser.asNumber(ScanParameterBuilder.bareOptionValue(5))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040043 end');
    });

    /**
     * @tc.name   testParam040044
     * @tc.number SUB_SCAN_PARAM_05_0044
     * @tc.desc   bareOptionValue raw -1 degrades to the frozen fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040044 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(-1, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.bareOptionValue(-1).valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanOptionModel.formatValue(ScanParameterBuilder.bareOptionValue(-1))).assertEqual('false');
      expect(ScanOptionValueParser.asNumber(ScanParameterBuilder.bareOptionValue(-1))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040044 end');
    });

    /**
     * @tc.name   testParam040045
     * @tc.number SUB_SCAN_PARAM_05_0045
     * @tc.desc   bareOptionValue raw 100 degrades to the frozen fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040045 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(100, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.bareOptionValue(100).valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanOptionModel.formatValue(ScanParameterBuilder.bareOptionValue(100))).assertEqual('false');
      expect(ScanOptionValueParser.asNumber(ScanParameterBuilder.bareOptionValue(100))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040045 end');
    });

    /**
     * @tc.name   testParam040046
     * @tc.number SUB_SCAN_PARAM_05_0046
     * @tc.desc   bareOptionValue raw 4 degrades to the frozen fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040046 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(4, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.bareOptionValue(4).valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanOptionModel.formatValue(ScanParameterBuilder.bareOptionValue(4))).assertEqual('false');
      expect(ScanOptionValueParser.asNumber(ScanParameterBuilder.bareOptionValue(4))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040046 end');
    });

    /**
     * @tc.name   testParam040047
     * @tc.number SUB_SCAN_PARAM_05_0047
     * @tc.desc   optionValue mounts only the field of type 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040047 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.optionValue(1, 7, 'x', true).numValue === undefined).assertEqual(false);
      expect(ScanParameterBuilder.optionValue(1, 7, 'x', true).strValue === undefined).assertEqual(true);
      expect(ScanParameterBuilder.optionValue(1, 7, 'x', true).boolValue === undefined).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040047 end');
    });

    /**
     * @tc.name   testParam040048
     * @tc.number SUB_SCAN_PARAM_05_0048
     * @tc.desc   optionValue mounts only the field of type 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040048 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.optionValue(3, 9, 'x', true).numValue === undefined).assertEqual(true);
      expect(ScanParameterBuilder.optionValue(3, 9, 'x', true).strValue === undefined).assertEqual(false);
      expect(ScanParameterBuilder.optionValue(3, 9, 'x', true).boolValue === undefined).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040048 end');
    });

    /**
     * @tc.name   testParam040049
     * @tc.number SUB_SCAN_PARAM_05_0049
     * @tc.desc   optionValue mounts only the field of type 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040049 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.optionValue(0, 5, 'x', true).numValue === undefined).assertEqual(true);
      expect(ScanParameterBuilder.optionValue(0, 5, 'x', true).strValue === undefined).assertEqual(true);
      expect(ScanParameterBuilder.optionValue(0, 5, 'x', true).boolValue === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040049 end');
    });

    /**
     * @tc.name   testParam040050
     * @tc.number SUB_SCAN_PARAM_05_0050
     * @tc.desc   optionValue mounts only the field of type 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040050 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.optionValue(2, 11, 'x', true).numValue === undefined).assertEqual(false);
      expect(ScanParameterBuilder.optionValue(2, 11, 'x', true).strValue === undefined).assertEqual(true);
      expect(ScanParameterBuilder.optionValue(2, 11, 'x', true).boolValue === undefined).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040050 end');
    });

    /**
     * @tc.name   testParam040051
     * @tc.number SUB_SCAN_PARAM_05_0051
     * @tc.desc   unit(0) maps into the frozen enum ladder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040051 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.unit(0)).assertEqual(ScanParameterBuilder.units()[0]);
      expect(ScanParameterBuilder.unit(0) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(true);
      expect(ScanParameterBuilder.units().length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040051 end');
    });

    /**
     * @tc.name   testParam040052
     * @tc.number SUB_SCAN_PARAM_05_0052
     * @tc.desc   unit(1) maps into the frozen enum ladder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040052 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(1, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.unit(1)).assertEqual(ScanParameterBuilder.units()[1]);
      expect(ScanParameterBuilder.unit(1) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(false);
      expect(ScanParameterBuilder.units().length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040052 end');
    });

    /**
     * @tc.name   testParam040053
     * @tc.number SUB_SCAN_PARAM_05_0053
     * @tc.desc   unit(2) maps into the frozen enum ladder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040053 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(2, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.unit(2)).assertEqual(ScanParameterBuilder.units()[2]);
      expect(ScanParameterBuilder.unit(2) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(false);
      expect(ScanParameterBuilder.units().length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040053 end');
    });

    /**
     * @tc.name   testParam040054
     * @tc.number SUB_SCAN_PARAM_05_0054
     * @tc.desc   unit(3) maps into the frozen enum ladder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040054 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(3, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.unit(3)).assertEqual(ScanParameterBuilder.units()[3]);
      expect(ScanParameterBuilder.unit(3) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(false);
      expect(ScanParameterBuilder.units().length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040054 end');
    });

    /**
     * @tc.name   testParam040055
     * @tc.number SUB_SCAN_PARAM_05_0055
     * @tc.desc   unit(4) maps into the frozen enum ladder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040055 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(4, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.unit(4)).assertEqual(ScanParameterBuilder.units()[4]);
      expect(ScanParameterBuilder.unit(4) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(false);
      expect(ScanParameterBuilder.units().length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040055 end');
    });

    /**
     * @tc.name   testParam040056
     * @tc.number SUB_SCAN_PARAM_05_0056
     * @tc.desc   unit(5) maps into the frozen enum ladder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040056 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(5, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.unit(5)).assertEqual(ScanParameterBuilder.units()[5]);
      expect(ScanParameterBuilder.unit(5) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(false);
      expect(ScanParameterBuilder.units().length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040056 end');
    });

    /**
     * @tc.name   testParam040057
     * @tc.number SUB_SCAN_PARAM_05_0057
     * @tc.desc   unit(6) maps into the frozen enum ladder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040057 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(6, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.unit(6)).assertEqual(ScanParameterBuilder.units()[6]);
      expect(ScanParameterBuilder.unit(6) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(false);
      expect(ScanParameterBuilder.units().length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040057 end');
    });

    /**
     * @tc.name   testParam040058
     * @tc.number SUB_SCAN_PARAM_05_0058
     * @tc.desc   unit(-1) maps into the frozen enum ladder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040058 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(-1, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.unit(-1)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_NONE);
      expect(ScanParameterBuilder.unit(-1) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(true);
      expect(ScanParameterBuilder.units().length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040058 end');
    });

    /**
     * @tc.name   testParam040059
     * @tc.number SUB_SCAN_PARAM_05_0059
     * @tc.desc   unit(7) maps into the frozen enum ladder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040059 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(7, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.unit(7)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_NONE);
      expect(ScanParameterBuilder.unit(7) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(true);
      expect(ScanParameterBuilder.units().length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040059 end');
    });

    /**
     * @tc.name   testParam040060
     * @tc.number SUB_SCAN_PARAM_05_0060
     * @tc.desc   unit(100) maps into the frozen enum ladder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040060 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(100, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.unit(100)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_NONE);
      expect(ScanParameterBuilder.unit(100) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(true);
      expect(ScanParameterBuilder.units().length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040060 end');
    });

    /**
     * @tc.name   testParam040061
     * @tc.number SUB_SCAN_PARAM_05_0061
     * @tc.desc   units ladder slot 0 is the frozen enum entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040061 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.units()[0]).assertEqual(scan.PhysicalUnit.SCAN_UNIT_NONE);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.units()[0])).assertEqual('');
      expect(ScanParameterBuilder.units().length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040061 end');
    });

    /**
     * @tc.name   testParam040062
     * @tc.number SUB_SCAN_PARAM_05_0062
     * @tc.desc   units ladder slot 6 is the frozen enum entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040062 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(6, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.units()[6]).assertEqual(scan.PhysicalUnit.SCAN_UNIT_MICROSECOND);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.units()[6])).assertEqual('us');
      expect(ScanParameterBuilder.units().length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040062 end');
    });

    /**
     * @tc.name   testParam040063
     * @tc.number SUB_SCAN_PARAM_05_0063
     * @tc.desc   discovery and sync map 'USB' to the frozen modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040063 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.discoveryMode('USB')).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      expect(ScanParameterBuilder.syncMode('USB')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.device('1', 'U1', 'A', 'M', 'N', 'USB').discoveryMode
      ).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040063 end');
    });

    /**
     * @tc.name   testParam040064
     * @tc.number SUB_SCAN_PARAM_05_0064
     * @tc.desc   discovery and sync map 'USB' to the frozen modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040064 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(1, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.discoveryMode('USB')).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      expect(ScanParameterBuilder.syncMode('USB')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.device('1', 'U1', 'A', 'M', 'N', 'USB').discoveryMode
      ).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040064 end');
    });

    /**
     * @tc.name   testParam040065
     * @tc.number SUB_SCAN_PARAM_05_0065
     * @tc.desc   discovery and sync map 'TCP' to the frozen modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040065 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(2, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.discoveryMode('TCP')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.syncMode('TCP')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.device('1', 'U1', 'A', 'M', 'N', 'TCP').discoveryMode
      ).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040065 end');
    });

    /**
     * @tc.name   testParam040066
     * @tc.number SUB_SCAN_PARAM_05_0066
     * @tc.desc   discovery and sync map 'tcp' to the frozen modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040066 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(3, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.discoveryMode('tcp')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.syncMode('tcp')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.device('1', 'U1', 'A', 'M', 'N', 'tcp').discoveryMode
      ).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040066 end');
    });

    /**
     * @tc.name   testParam040067
     * @tc.number SUB_SCAN_PARAM_05_0067
     * @tc.desc   discovery and sync map '' to the frozen modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040067 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(4, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.discoveryMode('')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.syncMode('')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.device('1', 'U1', 'A', 'M', 'N', '').discoveryMode
      ).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040067 end');
    });

    /**
     * @tc.name   testParam040068
     * @tc.number SUB_SCAN_PARAM_05_0068
     * @tc.desc   discovery and sync map 'usb' to the frozen modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040068 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(5, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.discoveryMode('usb')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.syncMode('usb')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.device('1', 'U1', 'A', 'M', 'N', 'usb').discoveryMode
      ).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040068 end');
    });

    /**
     * @tc.name   testParam040069
     * @tc.number SUB_SCAN_PARAM_05_0069
     * @tc.desc   discovery and sync map 'TCP' to the frozen modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040069 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(6, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.discoveryMode('TCP')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.syncMode('TCP')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.device('1', 'U1', 'A', 'M', 'N', 'TCP').discoveryMode
      ).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040069 end');
    });

    /**
     * @tc.name   testParam040070
     * @tc.number SUB_SCAN_PARAM_05_0070
     * @tc.desc   discovery and sync map 'TCP' to the frozen modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040070 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(7, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.discoveryMode('TCP')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.syncMode('TCP')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.device('1', 'U1', 'A', 'M', 'N', 'TCP').discoveryMode
      ).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040070 end');
    });

    /**
     * @tc.name   testParam040071
     * @tc.number SUB_SCAN_PARAM_05_0071
     * @tc.desc   discovery and sync map 'delete' to the frozen modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040071 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(8, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.discoveryMode('delete')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.syncMode('delete')).assertEqual(scan.ScannerSyncMode.DELETE_STR);
      expect(
        ScanParameterBuilder.device('1', 'U1', 'A', 'M', 'N', 'delete').discoveryMode
      ).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040071 end');
    });

    /**
     * @tc.name   testParam040072
     * @tc.number SUB_SCAN_PARAM_05_0072
     * @tc.desc   discovery and sync map 'delete' to the frozen modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040072 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(9, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.discoveryMode('delete')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.syncMode('delete')).assertEqual(scan.ScannerSyncMode.DELETE_STR);
      expect(
        ScanParameterBuilder.device('1', 'U1', 'A', 'M', 'N', 'delete').discoveryMode
      ).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040072 end');
    });

    /**
     * @tc.name   testParam040073
     * @tc.number SUB_SCAN_PARAM_05_0073
     * @tc.desc   discovery and sync map 'update' to the frozen modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040073 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(10, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.discoveryMode('update')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.syncMode('update')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.device('1', 'U1', 'A', 'M', 'N', 'update').discoveryMode
      ).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040073 end');
    });

    /**
     * @tc.name   testParam040074
     * @tc.number SUB_SCAN_PARAM_05_0074
     * @tc.desc   discovery and sync map 'DELETE' to the frozen modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040074 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(11, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.discoveryMode('DELETE')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.syncMode('DELETE')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.device('1', 'U1', 'A', 'M', 'N', 'DELETE').discoveryMode
      ).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040074 end');
    });

    /**
     * @tc.name   testParam040075
     * @tc.number SUB_SCAN_PARAM_05_0075
     * @tc.desc   fillDevices(0) builds the frozen placeholder catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040075 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.fillDevices(0).length).assertEqual(0);
      expect(ScanParameterBuilder.fillDevices(0).length > 0).assertEqual(false);
      expect(ScanParameterBuilder.fillDevices(0)[0] === undefined).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040075 end');
    });

    /**
     * @tc.name   testParam040076
     * @tc.number SUB_SCAN_PARAM_05_0076
     * @tc.desc   fillDevices(1) builds the frozen placeholder catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040076 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(1, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.fillDevices(1).length).assertEqual(1);
      expect(ScanParameterBuilder.fillDevices(1).length > 0).assertEqual(true);
      expect(ScanParameterBuilder.fillDevices(1)[0] === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040076 end');
    });

    /**
     * @tc.name   testParam040077
     * @tc.number SUB_SCAN_PARAM_05_0077
     * @tc.desc   fillDevices(2) builds the frozen placeholder catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040077 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(2, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.fillDevices(2).length).assertEqual(2);
      expect(ScanParameterBuilder.fillDevices(2).length > 0).assertEqual(true);
      expect(ScanParameterBuilder.fillDevices(2)[0] === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040077 end');
    });

    /**
     * @tc.name   testParam040078
     * @tc.number SUB_SCAN_PARAM_05_0078
     * @tc.desc   fillDevices(3) builds the frozen placeholder catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040078 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(3, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.fillDevices(3).length).assertEqual(3);
      expect(ScanParameterBuilder.fillDevices(3).length > 0).assertEqual(true);
      expect(ScanParameterBuilder.fillDevices(3)[0] === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040078 end');
    });

    /**
     * @tc.name   testParam040079
     * @tc.number SUB_SCAN_PARAM_05_0079
     * @tc.desc   fillDevices(5) builds the frozen placeholder catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040079 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(5, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.fillDevices(5).length).assertEqual(5);
      expect(ScanParameterBuilder.fillDevices(5).length > 0).assertEqual(true);
      expect(ScanParameterBuilder.fillDevices(5)[0] === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040079 end');
    });

    /**
     * @tc.name   testParam040080
     * @tc.number SUB_SCAN_PARAM_05_0080
     * @tc.desc   fillDevices(10) builds the frozen placeholder catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040080 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(10, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.fillDevices(10).length).assertEqual(10);
      expect(ScanParameterBuilder.fillDevices(10).length > 0).assertEqual(true);
      expect(ScanParameterBuilder.fillDevices(10)[0] === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040080 end');
    });

    /**
     * @tc.name   testParam040081
     * @tc.number SUB_SCAN_PARAM_05_0081
     * @tc.desc   fillDevices(100) builds the frozen placeholder catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040081 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(100, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.fillDevices(100).length).assertEqual(100);
      expect(ScanParameterBuilder.fillDevices(100).length > 0).assertEqual(true);
      expect(ScanParameterBuilder.fillDevices(100)[0] === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040081 end');
    });

    /**
     * @tc.name   testParam040082
     * @tc.number SUB_SCAN_PARAM_05_0082
     * @tc.desc   fillDevices(250) builds the frozen placeholder catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040082 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(250, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.fillDevices(250).length).assertEqual(250);
      expect(ScanParameterBuilder.fillDevices(250).length > 0).assertEqual(true);
      expect(ScanParameterBuilder.fillDevices(250)[0] === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040082 end');
    });

    /**
     * @tc.name   testParam040083
     * @tc.number SUB_SCAN_PARAM_05_0083
     * @tc.desc   fillDevices(500) builds the frozen placeholder catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040083 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(500, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.fillDevices(500).length).assertEqual(500);
      expect(ScanParameterBuilder.fillDevices(500).length > 0).assertEqual(true);
      expect(ScanParameterBuilder.fillDevices(500)[0] === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040083 end');
    });

    /**
     * @tc.name   testParam040084
     * @tc.number SUB_SCAN_PARAM_05_0084
     * @tc.desc   fillDevices(1000) builds the frozen placeholder catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040084 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(1000, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.fillDevices(1000).length).assertEqual(1000);
      expect(ScanParameterBuilder.fillDevices(1000).length > 0).assertEqual(true);
      expect(ScanParameterBuilder.fillDevices(1000)[0] === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040084 end');
    });

    /**
     * @tc.name   testParam040085
     * @tc.number SUB_SCAN_PARAM_05_0085
     * @tc.desc   sample and empty catalogs keep the frozen shape 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040085 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.sampleDevices().length).assertEqual(3);
      expect(ScanParameterBuilder.devices().length).assertEqual(0);
      expect(ScanParameterBuilder.sampleDevices()[0].scannerId).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040085 end');
    });

    /**
     * @tc.name   testParam040086
     * @tc.number SUB_SCAN_PARAM_05_0086
     * @tc.desc   sample and empty catalogs keep the frozen shape 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040086 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(1, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.sampleDevices().length).assertEqual(3);
      expect(ScanParameterBuilder.devices().length).assertEqual(0);
      expect(ScanParameterBuilder.sampleDevices()[0].scannerId).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040086 end');
    });

    /**
     * @tc.name   testParam040087
     * @tc.number SUB_SCAN_PARAM_05_0087
     * @tc.desc   sample and empty catalogs keep the frozen shape 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040087 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.sampleDevices().length).assertEqual(3);
      expect(ScanParameterBuilder.devices().length).assertEqual(0);
      expect(ScanParameterBuilder.sampleDevices()[1].scannerId).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040087 end');
    });

    /**
     * @tc.name   testParam040088
     * @tc.number SUB_SCAN_PARAM_05_0088
     * @tc.desc   sample and empty catalogs keep the frozen shape 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040088 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(1, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.sampleDevices().length).assertEqual(3);
      expect(ScanParameterBuilder.devices().length).assertEqual(0);
      expect(ScanParameterBuilder.sampleDevices()[1].scannerId).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040088 end');
    });

    /**
     * @tc.name   testParam040089
     * @tc.number SUB_SCAN_PARAM_05_0089
     * @tc.desc   sample and empty catalogs keep the frozen shape 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040089 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.sampleDevices().length).assertEqual(3);
      expect(ScanParameterBuilder.devices().length).assertEqual(0);
      expect(ScanParameterBuilder.sampleDevices()[2].scannerId).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040089 end');
    });

    /**
     * @tc.name   testParam040090
     * @tc.number SUB_SCAN_PARAM_05_0090
     * @tc.desc   sample and empty catalogs keep the frozen shape 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParam040090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040090 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(1, 'n', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.sampleDevices().length).assertEqual(3);
      expect(ScanParameterBuilder.devices().length).assertEqual(0);
      expect(ScanParameterBuilder.sampleDevices()[2].scannerId).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParam040090 end');
    });

  });
}
