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
import { ScanOptionConstraint, ScanConstraintKind } from '../../../main/ets/scan/model/ScanOptionConstraint';
import { ScanParameterBuilder } from '../../../main/ets/scan/model/ScanParameterBuilder';
import type { ScanNumberCheck } from '../../../main/ets/scan/model/ScanOptionConstraint';
import { scan } from '@kit.BasicServicesKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanConstraintNumberTest() {
  describe('ScanConstraintNumber', () => {

    /**
     * @tc.name   testConstraintNumber0001
     * @tc.number SUB_SCAN_CONSTRAINT_02_0001
     * @tc.desc   checkNumber on int range with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0001 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0001 end');
    });

    /**
     * @tc.name   testConstraintNumber0002
     * @tc.number SUB_SCAN_CONSTRAINT_02_0002
     * @tc.desc   checkNumber on fixed range with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0002 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0002 end');
    });

    /**
     * @tc.name   testConstraintNumber0003
     * @tc.number SUB_SCAN_CONSTRAINT_02_0003
     * @tc.desc   checkNumber on signed range with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0003 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0003 end');
    });

    /**
     * @tc.name   testConstraintNumber0004
     * @tc.number SUB_SCAN_CONSTRAINT_02_0004
     * @tc.desc   checkNumber on inverted range with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0004 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0004 end');
    });

    /**
     * @tc.name   testConstraintNumber0005
     * @tc.number SUB_SCAN_CONSTRAINT_02_0005
     * @tc.desc   checkNumber on zero step range with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0005 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 100, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0005 end');
    });

    /**
     * @tc.name   testConstraintNumber0006
     * @tc.number SUB_SCAN_CONSTRAINT_02_0006
     * @tc.desc   checkNumber on boolean range with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0006 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 0, 0, 1, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0006 end');
    });

    /**
     * @tc.name   testConstraintNumber0007
     * @tc.number SUB_SCAN_CONSTRAINT_02_0007
     * @tc.desc   checkNumber on string range with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0007 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 1, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0007 end');
    });

    /**
     * @tc.name   testConstraintNumber0008
     * @tc.number SUB_SCAN_CONSTRAINT_02_0008
     * @tc.desc   checkNumber on word list with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0008 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0008 end');
    });

    /**
     * @tc.name   testConstraintNumber0009
     * @tc.number SUB_SCAN_CONSTRAINT_02_0009
     * @tc.desc   checkNumber on word list without entries with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0009 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0009 end');
    });

    /**
     * @tc.name   testConstraintNumber0010
     * @tc.number SUB_SCAN_CONSTRAINT_02_0010
     * @tc.desc   checkNumber on fixed word list with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0010 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0010 end');
    });

    /**
     * @tc.name   testConstraintNumber0011
     * @tc.number SUB_SCAN_CONSTRAINT_02_0011
     * @tc.desc   checkNumber on boolean word list with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0011 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0011 end');
    });

    /**
     * @tc.name   testConstraintNumber0012
     * @tc.number SUB_SCAN_CONSTRAINT_02_0012
     * @tc.desc   checkNumber on string list with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0012 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0012 end');
    });

    /**
     * @tc.name   testConstraintNumber0013
     * @tc.number SUB_SCAN_CONSTRAINT_02_0013
     * @tc.desc   checkNumber on free int with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0013 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0013 end');
    });

    /**
     * @tc.name   testConstraintNumber0014
     * @tc.number SUB_SCAN_CONSTRAINT_02_0014
     * @tc.desc   checkNumber on free boolean with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0014 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0014 end');
    });

    /**
     * @tc.name   testConstraintNumber0015
     * @tc.number SUB_SCAN_CONSTRAINT_02_0015
     * @tc.desc   checkNumber on string list with int type with input 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0015 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a']);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 0);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0015 end');
    });

    /**
     * @tc.name   testConstraintNumber0016
     * @tc.number SUB_SCAN_CONSTRAINT_02_0016
     * @tc.desc   checkNumber on int range with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0016 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0016 end');
    });

    /**
     * @tc.name   testConstraintNumber0017
     * @tc.number SUB_SCAN_CONSTRAINT_02_0017
     * @tc.desc   checkNumber on fixed range with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0017 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0017 end');
    });

    /**
     * @tc.name   testConstraintNumber0018
     * @tc.number SUB_SCAN_CONSTRAINT_02_0018
     * @tc.desc   checkNumber on signed range with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0018 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0018 end');
    });

    /**
     * @tc.name   testConstraintNumber0019
     * @tc.number SUB_SCAN_CONSTRAINT_02_0019
     * @tc.desc   checkNumber on inverted range with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0019 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0019 end');
    });

    /**
     * @tc.name   testConstraintNumber0020
     * @tc.number SUB_SCAN_CONSTRAINT_02_0020
     * @tc.desc   checkNumber on zero step range with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0020 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 100, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0020 end');
    });

    /**
     * @tc.name   testConstraintNumber0021
     * @tc.number SUB_SCAN_CONSTRAINT_02_0021
     * @tc.desc   checkNumber on boolean range with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0021 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 0, 0, 1, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0021 end');
    });

    /**
     * @tc.name   testConstraintNumber0022
     * @tc.number SUB_SCAN_CONSTRAINT_02_0022
     * @tc.desc   checkNumber on string range with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0022 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 1, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0022 end');
    });

    /**
     * @tc.name   testConstraintNumber0023
     * @tc.number SUB_SCAN_CONSTRAINT_02_0023
     * @tc.desc   checkNumber on word list with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0023 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0023 end');
    });

    /**
     * @tc.name   testConstraintNumber0024
     * @tc.number SUB_SCAN_CONSTRAINT_02_0024
     * @tc.desc   checkNumber on word list without entries with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0024 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0024 end');
    });

    /**
     * @tc.name   testConstraintNumber0025
     * @tc.number SUB_SCAN_CONSTRAINT_02_0025
     * @tc.desc   checkNumber on fixed word list with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0025 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0025 end');
    });

    /**
     * @tc.name   testConstraintNumber0026
     * @tc.number SUB_SCAN_CONSTRAINT_02_0026
     * @tc.desc   checkNumber on boolean word list with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0026 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0026 end');
    });

    /**
     * @tc.name   testConstraintNumber0027
     * @tc.number SUB_SCAN_CONSTRAINT_02_0027
     * @tc.desc   checkNumber on string list with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0027 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0027 end');
    });

    /**
     * @tc.name   testConstraintNumber0028
     * @tc.number SUB_SCAN_CONSTRAINT_02_0028
     * @tc.desc   checkNumber on free int with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0028 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0028 end');
    });

    /**
     * @tc.name   testConstraintNumber0029
     * @tc.number SUB_SCAN_CONSTRAINT_02_0029
     * @tc.desc   checkNumber on free boolean with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0029 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0029 end');
    });

    /**
     * @tc.name   testConstraintNumber0030
     * @tc.number SUB_SCAN_CONSTRAINT_02_0030
     * @tc.desc   checkNumber on string list with int type with input 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0030 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a']);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0030 end');
    });

    /**
     * @tc.name   testConstraintNumber0031
     * @tc.number SUB_SCAN_CONSTRAINT_02_0031
     * @tc.desc   checkNumber on int range with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0031 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0031 end');
    });

    /**
     * @tc.name   testConstraintNumber0032
     * @tc.number SUB_SCAN_CONSTRAINT_02_0032
     * @tc.desc   checkNumber on fixed range with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0032 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0032 end');
    });

    /**
     * @tc.name   testConstraintNumber0033
     * @tc.number SUB_SCAN_CONSTRAINT_02_0033
     * @tc.desc   checkNumber on signed range with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0033 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0033 end');
    });

    /**
     * @tc.name   testConstraintNumber0034
     * @tc.number SUB_SCAN_CONSTRAINT_02_0034
     * @tc.desc   checkNumber on inverted range with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0034 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0034 end');
    });

    /**
     * @tc.name   testConstraintNumber0035
     * @tc.number SUB_SCAN_CONSTRAINT_02_0035
     * @tc.desc   checkNumber on zero step range with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0035 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 100, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0035 end');
    });

    /**
     * @tc.name   testConstraintNumber0036
     * @tc.number SUB_SCAN_CONSTRAINT_02_0036
     * @tc.desc   checkNumber on boolean range with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0036 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 0, 0, 1, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0036 end');
    });

    /**
     * @tc.name   testConstraintNumber0037
     * @tc.number SUB_SCAN_CONSTRAINT_02_0037
     * @tc.desc   checkNumber on string range with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0037 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 1, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0037 end');
    });

    /**
     * @tc.name   testConstraintNumber0038
     * @tc.number SUB_SCAN_CONSTRAINT_02_0038
     * @tc.desc   checkNumber on word list with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0038 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0038 end');
    });

    /**
     * @tc.name   testConstraintNumber0039
     * @tc.number SUB_SCAN_CONSTRAINT_02_0039
     * @tc.desc   checkNumber on word list without entries with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0039 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0039 end');
    });

    /**
     * @tc.name   testConstraintNumber0040
     * @tc.number SUB_SCAN_CONSTRAINT_02_0040
     * @tc.desc   checkNumber on fixed word list with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0040 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0040 end');
    });

    /**
     * @tc.name   testConstraintNumber0041
     * @tc.number SUB_SCAN_CONSTRAINT_02_0041
     * @tc.desc   checkNumber on boolean word list with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0041 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0041 end');
    });

    /**
     * @tc.name   testConstraintNumber0042
     * @tc.number SUB_SCAN_CONSTRAINT_02_0042
     * @tc.desc   checkNumber on string list with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0042 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0042 end');
    });

    /**
     * @tc.name   testConstraintNumber0043
     * @tc.number SUB_SCAN_CONSTRAINT_02_0043
     * @tc.desc   checkNumber on free int with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0043 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0043 end');
    });

    /**
     * @tc.name   testConstraintNumber0044
     * @tc.number SUB_SCAN_CONSTRAINT_02_0044
     * @tc.desc   checkNumber on free boolean with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0044 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0044 end');
    });

    /**
     * @tc.name   testConstraintNumber0045
     * @tc.number SUB_SCAN_CONSTRAINT_02_0045
     * @tc.desc   checkNumber on string list with int type with input 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0045 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a']);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 5);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0045 end');
    });

    /**
     * @tc.name   testConstraintNumber0046
     * @tc.number SUB_SCAN_CONSTRAINT_02_0046
     * @tc.desc   checkNumber on int range with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0046 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0046 end');
    });

    /**
     * @tc.name   testConstraintNumber0047
     * @tc.number SUB_SCAN_CONSTRAINT_02_0047
     * @tc.desc   checkNumber on fixed range with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0047 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0047 end');
    });

    /**
     * @tc.name   testConstraintNumber0048
     * @tc.number SUB_SCAN_CONSTRAINT_02_0048
     * @tc.desc   checkNumber on signed range with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0048 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0048 end');
    });

    /**
     * @tc.name   testConstraintNumber0049
     * @tc.number SUB_SCAN_CONSTRAINT_02_0049
     * @tc.desc   checkNumber on inverted range with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0049 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0049 end');
    });

    /**
     * @tc.name   testConstraintNumber0050
     * @tc.number SUB_SCAN_CONSTRAINT_02_0050
     * @tc.desc   checkNumber on zero step range with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0050 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 100, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0050 end');
    });

    /**
     * @tc.name   testConstraintNumber0051
     * @tc.number SUB_SCAN_CONSTRAINT_02_0051
     * @tc.desc   checkNumber on boolean range with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0051 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 0, 0, 1, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0051 end');
    });

    /**
     * @tc.name   testConstraintNumber0052
     * @tc.number SUB_SCAN_CONSTRAINT_02_0052
     * @tc.desc   checkNumber on string range with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0052 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 1, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0052 end');
    });

    /**
     * @tc.name   testConstraintNumber0053
     * @tc.number SUB_SCAN_CONSTRAINT_02_0053
     * @tc.desc   checkNumber on word list with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0053 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0053 end');
    });

    /**
     * @tc.name   testConstraintNumber0054
     * @tc.number SUB_SCAN_CONSTRAINT_02_0054
     * @tc.desc   checkNumber on word list without entries with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0054 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0054 end');
    });

    /**
     * @tc.name   testConstraintNumber0055
     * @tc.number SUB_SCAN_CONSTRAINT_02_0055
     * @tc.desc   checkNumber on fixed word list with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0055 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0055 end');
    });

    /**
     * @tc.name   testConstraintNumber0056
     * @tc.number SUB_SCAN_CONSTRAINT_02_0056
     * @tc.desc   checkNumber on boolean word list with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0056 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0056 end');
    });

    /**
     * @tc.name   testConstraintNumber0057
     * @tc.number SUB_SCAN_CONSTRAINT_02_0057
     * @tc.desc   checkNumber on string list with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0057 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0057 end');
    });

    /**
     * @tc.name   testConstraintNumber0058
     * @tc.number SUB_SCAN_CONSTRAINT_02_0058
     * @tc.desc   checkNumber on free int with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0058 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0058 end');
    });

    /**
     * @tc.name   testConstraintNumber0059
     * @tc.number SUB_SCAN_CONSTRAINT_02_0059
     * @tc.desc   checkNumber on free boolean with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0059 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0059 end');
    });

    /**
     * @tc.name   testConstraintNumber0060
     * @tc.number SUB_SCAN_CONSTRAINT_02_0060
     * @tc.desc   checkNumber on string list with int type with input -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0060 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a']);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, -1);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0060 end');
    });

    /**
     * @tc.name   testConstraintNumber0061
     * @tc.number SUB_SCAN_CONSTRAINT_02_0061
     * @tc.desc   checkNumber on int range with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0061 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0061 end');
    });

    /**
     * @tc.name   testConstraintNumber0062
     * @tc.number SUB_SCAN_CONSTRAINT_02_0062
     * @tc.desc   checkNumber on fixed range with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0062 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0062 end');
    });

    /**
     * @tc.name   testConstraintNumber0063
     * @tc.number SUB_SCAN_CONSTRAINT_02_0063
     * @tc.desc   checkNumber on signed range with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0063 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0063 end');
    });

    /**
     * @tc.name   testConstraintNumber0064
     * @tc.number SUB_SCAN_CONSTRAINT_02_0064
     * @tc.desc   checkNumber on inverted range with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0064 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0064 end');
    });

    /**
     * @tc.name   testConstraintNumber0065
     * @tc.number SUB_SCAN_CONSTRAINT_02_0065
     * @tc.desc   checkNumber on zero step range with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0065 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 100, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0065 end');
    });

    /**
     * @tc.name   testConstraintNumber0066
     * @tc.number SUB_SCAN_CONSTRAINT_02_0066
     * @tc.desc   checkNumber on boolean range with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0066 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 0, 0, 1, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0066 end');
    });

    /**
     * @tc.name   testConstraintNumber0067
     * @tc.number SUB_SCAN_CONSTRAINT_02_0067
     * @tc.desc   checkNumber on string range with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0067 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 1, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0067 end');
    });

    /**
     * @tc.name   testConstraintNumber0068
     * @tc.number SUB_SCAN_CONSTRAINT_02_0068
     * @tc.desc   checkNumber on word list with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0068 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0068 end');
    });

    /**
     * @tc.name   testConstraintNumber0069
     * @tc.number SUB_SCAN_CONSTRAINT_02_0069
     * @tc.desc   checkNumber on word list without entries with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0069 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0069 end');
    });

    /**
     * @tc.name   testConstraintNumber0070
     * @tc.number SUB_SCAN_CONSTRAINT_02_0070
     * @tc.desc   checkNumber on fixed word list with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0070 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0070 end');
    });

    /**
     * @tc.name   testConstraintNumber0071
     * @tc.number SUB_SCAN_CONSTRAINT_02_0071
     * @tc.desc   checkNumber on boolean word list with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0071 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0071 end');
    });

    /**
     * @tc.name   testConstraintNumber0072
     * @tc.number SUB_SCAN_CONSTRAINT_02_0072
     * @tc.desc   checkNumber on string list with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0072 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0072 end');
    });

    /**
     * @tc.name   testConstraintNumber0073
     * @tc.number SUB_SCAN_CONSTRAINT_02_0073
     * @tc.desc   checkNumber on free int with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0073 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0073 end');
    });

    /**
     * @tc.name   testConstraintNumber0074
     * @tc.number SUB_SCAN_CONSTRAINT_02_0074
     * @tc.desc   checkNumber on free boolean with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0074 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0074 end');
    });

    /**
     * @tc.name   testConstraintNumber0075
     * @tc.number SUB_SCAN_CONSTRAINT_02_0075
     * @tc.desc   checkNumber on string list with int type with input 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0075 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a']);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 300);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0075 end');
    });

    /**
     * @tc.name   testConstraintNumber0076
     * @tc.number SUB_SCAN_CONSTRAINT_02_0076
     * @tc.desc   checkNumber on int range with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0076 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0076 end');
    });

    /**
     * @tc.name   testConstraintNumber0077
     * @tc.number SUB_SCAN_CONSTRAINT_02_0077
     * @tc.desc   checkNumber on fixed range with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0077 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0077 end');
    });

    /**
     * @tc.name   testConstraintNumber0078
     * @tc.number SUB_SCAN_CONSTRAINT_02_0078
     * @tc.desc   checkNumber on signed range with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0078 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0078 end');
    });

    /**
     * @tc.name   testConstraintNumber0079
     * @tc.number SUB_SCAN_CONSTRAINT_02_0079
     * @tc.desc   checkNumber on inverted range with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0079 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0079 end');
    });

    /**
     * @tc.name   testConstraintNumber0080
     * @tc.number SUB_SCAN_CONSTRAINT_02_0080
     * @tc.desc   checkNumber on zero step range with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0080 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 100, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OUT_OF_RANGE);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0080 end');
    });

    /**
     * @tc.name   testConstraintNumber0081
     * @tc.number SUB_SCAN_CONSTRAINT_02_0081
     * @tc.desc   checkNumber on boolean range with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0081 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 0, 0, 1, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0081 end');
    });

    /**
     * @tc.name   testConstraintNumber0082
     * @tc.number SUB_SCAN_CONSTRAINT_02_0082
     * @tc.desc   checkNumber on string range with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0082 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 1, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0082 end');
    });

    /**
     * @tc.name   testConstraintNumber0083
     * @tc.number SUB_SCAN_CONSTRAINT_02_0083
     * @tc.desc   checkNumber on word list with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0083 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0083 end');
    });

    /**
     * @tc.name   testConstraintNumber0084
     * @tc.number SUB_SCAN_CONSTRAINT_02_0084
     * @tc.desc   checkNumber on word list without entries with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0084 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0084 end');
    });

    /**
     * @tc.name   testConstraintNumber0085
     * @tc.number SUB_SCAN_CONSTRAINT_02_0085
     * @tc.desc   checkNumber on fixed word list with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0085 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0085 end');
    });

    /**
     * @tc.name   testConstraintNumber0086
     * @tc.number SUB_SCAN_CONSTRAINT_02_0086
     * @tc.desc   checkNumber on boolean word list with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0086 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0086 end');
    });

    /**
     * @tc.name   testConstraintNumber0087
     * @tc.number SUB_SCAN_CONSTRAINT_02_0087
     * @tc.desc   checkNumber on string list with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0087 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0087 end');
    });

    /**
     * @tc.name   testConstraintNumber0088
     * @tc.number SUB_SCAN_CONSTRAINT_02_0088
     * @tc.desc   checkNumber on free int with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0088 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0088 end');
    });

    /**
     * @tc.name   testConstraintNumber0089
     * @tc.number SUB_SCAN_CONSTRAINT_02_0089
     * @tc.desc   checkNumber on free boolean with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0089 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0089 end');
    });

    /**
     * @tc.name   testConstraintNumber0090
     * @tc.number SUB_SCAN_CONSTRAINT_02_0090
     * @tc.desc   checkNumber on string list with int type with input 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintNumber0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0090 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a']);
      const result: ScanNumberCheck = ScanOptionConstraint.checkNumber(p, 301);
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintNumber0090 end');
    });

  });
}
