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
import {
  ScanConstraintKind, ScanNumberCheck, ScanOptionConstraint, ScanTextCheck
} from '../../../main/ets/scan/model/ScanOptionConstraint';
import { ScanParameterBuilder } from '../../../main/ets/scan/model/ScanParameterBuilder';
import { scan } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanConstraintRealTest() {
  describe('ScanConstraintReal', () => {
    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0001
     * @tc.name testConstraintReal0001
     * @tc.desc int range exposes lower bound, upper bound and step
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0001 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(0, 300, 1);
      expect(ScanOptionConstraint.getMin(p)).assertEqual(0);
      expect(ScanOptionConstraint.getMax(p)).assertEqual(300);
      expect(ScanOptionConstraint.getStep(p)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0001 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0002
     * @tc.name testConstraintReal0002
     * @tc.desc fixed range keeps signed bounds and quantum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0002 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.fixedRange(-50, 50, 5);
      expect(ScanOptionConstraint.getMin(p)).assertEqual(-50);
      expect(ScanOptionConstraint.getMax(p)).assertEqual(50);
      expect(ScanOptionConstraint.getStep(p)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0002 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0003
     * @tc.name testConstraintReal0003
     * @tc.desc zero quantum falls back to step one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0003 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(0, 100, 0);
      expect(ScanOptionConstraint.hasRange(p)).assertTrue();
      expect(ScanOptionConstraint.getStep(p)).assertEqual(1);
      expect(ScanOptionConstraint.getMax(p)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0003 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0004
     * @tc.name testConstraintReal0004
     * @tc.desc negative quantum also falls back to step one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0004 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(0, 100, -3);
      expect(ScanOptionConstraint.getStep(p)).assertEqual(1);
      expect(ScanOptionConstraint.getMin(p)).assertEqual(0);
      expect(ScanOptionConstraint.getKind(p)).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0004 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0005
     * @tc.name testConstraintReal0005
     * @tc.desc parameter without range reports zero bounds and step one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0005 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.free(ScanParameterBuilder.TYPE_INT);
      expect(ScanOptionConstraint.getMin(p)).assertEqual(0);
      expect(ScanOptionConstraint.getMax(p)).assertEqual(0);
      expect(ScanOptionConstraint.getStep(p)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0005 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0006
     * @tc.name testConstraintReal0006
     * @tc.desc hasRange reports the attached range flag only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0006 begin');
      const ranged: scan.ScannerParameter = ScanParameterBuilder.intRange(0, 300, 1);
      const listed: scan.ScannerParameter = ScanParameterBuilder.numberList([1, 2]);
      expect(ScanOptionConstraint.hasRange(ranged)).assertTrue();
      expect(ScanOptionConstraint.hasRange(listed)).assertFalse();
      expect(ScanOptionConstraint.getKind(listed)).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0006 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0007
     * @tc.name testConstraintReal0007
     * @tc.desc number list constraint carries no range payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0007 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.numberList([1, 3, 5]);
      expect(ScanOptionConstraint.countOptions(p)).assertEqual(3);
      expect(ScanOptionConstraint.getStep(p)).assertEqual(1);
      expect(ScanOptionConstraint.isEditable(p)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0007 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0008
     * @tc.name testConstraintReal0008
     * @tc.desc clamp lifts a value below the lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0008 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(10, 20, 1);
      expect(ScanOptionConstraint.clamp(p, -5)).assertEqual(10);
      expect(ScanOptionConstraint.clamp(p, 9)).assertEqual(10);
      expect(ScanOptionConstraint.clamp(p, 0)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0008 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0009
     * @tc.name testConstraintReal0009
     * @tc.desc clamp caps a value above the upper bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0009 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(10, 20, 1);
      expect(ScanOptionConstraint.clamp(p, 21)).assertEqual(20);
      expect(ScanOptionConstraint.clamp(p, 20)).assertEqual(20);
      expect(ScanOptionConstraint.clamp(p, 1000)).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0009 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0010
     * @tc.name testConstraintReal0010
     * @tc.desc clamp keeps an in-range value untouched
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0010 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(10, 20, 1);
      const inside: number = ScanOptionConstraint.clamp(p, 15);
      expect(inside).assertEqual(15);
      expect(ScanOptionConstraint.getMin(p)).assertEqual(10);
      expect(ScanOptionConstraint.getMax(p)).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0010 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0011
     * @tc.name testConstraintReal0011
     * @tc.desc inverted range degrades to the lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0011 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(300, 0, 1);
      expect(ScanOptionConstraint.clamp(p, 150)).assertEqual(300);
      expect(ScanOptionConstraint.clamp(p, -1)).assertEqual(300);
      expect(ScanOptionConstraint.getMin(p)).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0011 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0012
     * @tc.name testConstraintReal0012
     * @tc.desc alignToStep rounds down inside the step grid
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0012 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(0, 300, 5);
      expect(ScanOptionConstraint.getStep(p)).assertEqual(5);
      expect(ScanOptionConstraint.alignToStep(p, 12)).assertEqual(10);
      expect(ScanOptionConstraint.alignToStep(p, 7)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0012 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0013
     * @tc.name testConstraintReal0013
     * @tc.desc alignToStep rounds up to the next step multiple
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0013 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(0, 300, 5);
      const up: number = ScanOptionConstraint.alignToStep(p, 13);
      expect(up).assertEqual(15);
      expect(ScanOptionConstraint.alignToStep(p, 8)).assertEqual(10);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,300,5]');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0013 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0014
     * @tc.name testConstraintReal0014
     * @tc.desc alignToStep only rounds when the step is one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0014 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(0, 300, 1);
      const rounded: number = ScanOptionConstraint.alignToStep(p, 3);
      expect(rounded).assertEqual(3);
      expect(ScanOptionConstraint.getStep(p)).assertEqual(1);
      expect(ScanOptionConstraint.isEditable(p)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0014 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0015
     * @tc.name testConstraintReal0015
     * @tc.desc alignToStep clamps the aligned result back into the range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0015 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(0, 10, 4);
      const capped: number = ScanOptionConstraint.alignToStep(p, 20);
      expect(capped).assertEqual(10);
      expect(ScanOptionConstraint.getMax(p)).assertEqual(10);
      expect(ScanOptionConstraint.alignToStep(p, 9)).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0015 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0016
     * @tc.name testConstraintReal0016
     * @tc.desc alignToStep offsets the grid from a non-zero lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0016 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(1, 10, 3);
      expect(ScanOptionConstraint.getMin(p)).assertEqual(1);
      expect(ScanOptionConstraint.getMax(p)).assertEqual(10);
      expect(ScanOptionConstraint.alignToStep(p, 9)).assertEqual(10);
      expect(ScanOptionConstraint.alignToStep(p, 8)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0016 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0017
     * @tc.name testConstraintReal0017
     * @tc.desc alignToStep on an inverted range returns the lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0017 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(300, 0, 1);
      expect(ScanOptionConstraint.alignToStep(p, 10)).assertEqual(300);
      expect(ScanOptionConstraint.alignToStep(p, 300)).assertEqual(300);
      expect(ScanOptionConstraint.getStep(p)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0017 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0018
     * @tc.name testConstraintReal0018
     * @tc.desc countOptions counts string entries of a string list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0018 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.stringList(['a', 'b', 'c']);
      expect(ScanOptionConstraint.countOptions(p)).assertEqual(3);
      expect(ScanOptionConstraint.getKind(p)).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[3]');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0018 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0019
     * @tc.name testConstraintReal0019
     * @tc.desc countOptions counts integer entries of a word list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0019 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.numberList([1, 2]);
      expect(ScanOptionConstraint.countOptions(p)).assertEqual(2);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[2]');
      expect(ScanOptionConstraint.isEditable(p)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0019 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0020
     * @tc.name testConstraintReal0020
     * @tc.desc countOptions adds both list kinds when both are attached
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0020 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.stringList(['a', 'b']);
      p.optionConstraintInt = [1, 2, 3];
      expect(ScanOptionConstraint.countOptions(p)).assertEqual(5);
      expect(ScanOptionConstraint.getKind(p)).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[5]');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0020 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0021
     * @tc.name testConstraintReal0021
     * @tc.desc countOptions stays zero when no list is attached
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0021 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.stringList([]);
      expect(ScanOptionConstraint.countOptions(p)).assertEqual(0);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0021 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0022
     * @tc.name testConstraintReal0022
     * @tc.desc unconstrained parameter is not editable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0022 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.free(ScanParameterBuilder.TYPE_STRING);
      expect(ScanOptionConstraint.isEditable(p)).assertFalse();
      expect(ScanOptionConstraint.getKind(p)).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0022 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0023
     * @tc.name testConstraintReal0023
     * @tc.desc word list constraint is editable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0023 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.numberList([4]);
      expect(ScanOptionConstraint.isEditable(p)).assertTrue();
      expect(ScanOptionConstraint.countOptions(p)).assertEqual(1);
      expect(ScanOptionConstraint.hasRange(p)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0023 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0024
     * @tc.name testConstraintReal0024
     * @tc.desc numeric option types cover int and fixed only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0024 begin');
      const intParam: scan.ScannerParameter = ScanParameterBuilder.free(ScanParameterBuilder.TYPE_INT);
      const fixedParam: scan.ScannerParameter = ScanParameterBuilder.free(ScanParameterBuilder.TYPE_FIXED);
      const boolParam: scan.ScannerParameter = ScanParameterBuilder.free(ScanParameterBuilder.TYPE_BOOL);
      const textParam: scan.ScannerParameter = ScanParameterBuilder.free(ScanParameterBuilder.TYPE_STRING);
      expect(ScanOptionConstraint.isNumericType(intParam.optionType)).assertTrue();
      expect(ScanOptionConstraint.isNumericType(fixedParam.optionType)).assertTrue();
      expect(ScanOptionConstraint.isNumericType(boolParam.optionType)).assertFalse();
      expect(ScanOptionConstraint.isNumericType(textParam.optionType)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0024 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0025
     * @tc.name testConstraintReal0025
     * @tc.desc checkNumber reports a type mismatch for NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0025 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(0, 300, 1);
      const check: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, Number.NaN);
      expect(check.valid).assertFalse();
      expect(check.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(Number.isNaN(check.value)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0025 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0026
     * @tc.name testConstraintReal0026
     * @tc.desc out-of-range input is clamped in the returned value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0026 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(0, 300, 1);
      const high: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, Number.MAX_SAFE_INTEGER);
      expect(high.valid).assertFalse();
      expect(high.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(high.value).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0026 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0027
     * @tc.name testConstraintReal0027
     * @tc.desc checkNumber reports empty when the word list holds no entry
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0027 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.build(
        ScanParameterBuilder.CONSTRAINT_WORD_LIST, ScanParameterBuilder.TYPE_INT);
      const check: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 3);
      expect(check.valid).assertFalse();
      expect(check.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(check.value).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0027 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0028
     * @tc.name testConstraintReal0028
     * @tc.desc checkNumber accepts a listed word entry
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0028 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.numberList([1, 3, 5]);
      const check: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(check.valid).assertTrue();
      expect(check.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(check.value).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0028 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0029
     * @tc.name testConstraintReal0029
     * @tc.desc checkNumber rejects a value missing from the word list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0029 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.numberList([1, 3, 5]);
      const check: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 4);
      expect(check.valid).assertFalse();
      expect(check.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(check.value).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0029 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0030
     * @tc.name testConstraintReal0030
     * @tc.desc checkNumber rejects numbers for a string list constraint
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0030 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.build(
        ScanParameterBuilder.CONSTRAINT_STRING_LIST, ScanParameterBuilder.TYPE_INT);
      const check: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 2);
      expect(check.valid).assertFalse();
      expect(check.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(check.value).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0030 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0031
     * @tc.name testConstraintReal0031
     * @tc.desc checkNumber accepts any number for an unconstrained int option
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0031 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.free(ScanParameterBuilder.TYPE_FIXED);
      const low: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, Number.MIN_SAFE_INTEGER);
      const high: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, Number.MAX_SAFE_INTEGER);
      expect(low.valid).assertTrue();
      expect(high.valid).assertTrue();
      expect(low.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(high.value).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0031 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0032
     * @tc.name testConstraintReal0032
     * @tc.desc checkString rejects numeric option types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0032 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.free(ScanParameterBuilder.TYPE_INT);
      const check: ScanTextCheck = ScanOptionConstraint.checkString(p, 'A4');
      expect(check.valid).assertFalse();
      expect(check.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(check.value).assertEqual('A4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0032 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0033
     * @tc.name testConstraintReal0033
     * @tc.desc checkString reports empty text before any list lookup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0033 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.stringList(['a', 'b']);
      const check: ScanTextCheck = ScanOptionConstraint.checkString(p, '');
      expect(check.valid).assertFalse();
      expect(check.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(check.value).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0033 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0034
     * @tc.name testConstraintReal0034
     * @tc.desc checkString reports empty when the string list holds no entry
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0034 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.stringList([]);
      const check: ScanTextCheck = ScanOptionConstraint.checkString(p, 'png');
      expect(check.valid).assertFalse();
      expect(check.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(check.value).assertEqual('png');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0034 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0035
     * @tc.name testConstraintReal0035
     * @tc.desc checkString accepts a listed text entry
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0035 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.stringList(['jpg', 'png']);
      const check: ScanTextCheck = ScanOptionConstraint.checkString(p, 'png');
      expect(check.valid).assertTrue();
      expect(check.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(check.value).assertEqual('png');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0035 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0036
     * @tc.name testConstraintReal0036
     * @tc.desc checkString rejects a text missing from the string list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0036 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.stringList(['jpg', 'png']);
      const check: ScanTextCheck = ScanOptionConstraint.checkString(p, 'pdf');
      expect(check.valid).assertFalse();
      expect(check.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(check.value).assertEqual('pdf');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0036 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0037
     * @tc.name testConstraintReal0037
     * @tc.desc checkString rejects text for a numeric range constraint
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0037 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(
        ScanParameterBuilder.CONSTRAINT_RANGE, ScanParameterBuilder.TYPE_STRING, 0, 10, 1);
      const check: ScanTextCheck = ScanOptionConstraint.checkString(p, '5');
      expect(check.valid).assertFalse();
      expect(check.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(check.value).assertEqual('5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0037 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0038
     * @tc.name testConstraintReal0038
     * @tc.desc checkString accepts any text for an unconstrained option
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0038 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.free(ScanParameterBuilder.TYPE_STRING);
      const first: ScanTextCheck = ScanOptionConstraint.checkString(p, 'plain text');
      const second: ScanTextCheck = ScanOptionConstraint.checkString(p, ' x ');
      expect(first.valid).assertTrue();
      expect(first.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(second.value).assertEqual(' x ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0038 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0039
     * @tc.name testConstraintReal0039
     * @tc.desc describe renders the range triple in fixed order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0039 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.intRange(0, 300, 1);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,300,1]');
      const signed: scan.ScannerParameter = ScanParameterBuilder.fixedRange(-50, 50, 5);
      expect(ScanOptionConstraint.describe(signed)).assertEqual('RANGE[-50,50,5]');
      const zeroStep: scan.ScannerParameter = ScanParameterBuilder.intRange(0, 100, 0);
      expect(ScanOptionConstraint.describe(zeroStep)).assertEqual('RANGE[0,100,1]');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0039 end');
    });

    /**
     * @tc.number SUB_SCAN_CONSTRAINT_04_0040
     * @tc.name testConstraintReal0040
     * @tc.desc describe switches between list sizes and the free form label
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testConstraintReal0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0040 begin');
      const words: scan.ScannerParameter = ScanParameterBuilder.numberList([1, 3, 5, 7]);
      const texts: scan.ScannerParameter = ScanParameterBuilder.stringList(['a']);
      const free: scan.ScannerParameter = ScanParameterBuilder.free(ScanParameterBuilder.TYPE_BOOL);
      expect(ScanOptionConstraint.describe(words)).assertEqual('NUMBER_LIST[4]');
      expect(ScanOptionConstraint.describe(texts)).assertEqual('STRING_LIST[1]');
      expect(ScanOptionConstraint.describe(free)).assertEqual('NONE');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstraintReal0040 end');
    });
  });
}
