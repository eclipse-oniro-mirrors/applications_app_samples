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
import type { ScanTextCheck } from '../../../main/ets/scan/model/ScanOptionConstraint';
import { scan } from '@kit.BasicServicesKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanConstraintTextTest() {
  describe('ScanConstraintText', () => {

    /**
     * @tc.name   testConstraintText0001
     * @tc.number SUB_SCAN_CONSTRAINT_03_0001
     * @tc.desc   checkString on free text with input ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0001 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0001 end');
    });

    /**
     * @tc.name   testConstraintText0002
     * @tc.number SUB_SCAN_CONSTRAINT_03_0002
     * @tc.desc   checkString on free text with input 'a'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0002 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'a');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0002 end');
    });

    /**
     * @tc.name   testConstraintText0003
     * @tc.number SUB_SCAN_CONSTRAINT_03_0003
     * @tc.desc   checkString on free text with input 'b'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0003 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'b');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0003 end');
    });

    /**
     * @tc.name   testConstraintText0004
     * @tc.number SUB_SCAN_CONSTRAINT_03_0004
     * @tc.desc   checkString on free text with input 'A4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0004 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'A4');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('A4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0004 end');
    });

    /**
     * @tc.name   testConstraintText0005
     * @tc.number SUB_SCAN_CONSTRAINT_03_0005
     * @tc.desc   checkString on free text with input 'letter'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0005 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'letter');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('letter');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0005 end');
    });

    /**
     * @tc.name   testConstraintText0006
     * @tc.number SUB_SCAN_CONSTRAINT_03_0006
     * @tc.desc   checkString on free text with input 'unknown'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0006 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'unknown');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0006 end');
    });

    /**
     * @tc.name   testConstraintText0007
     * @tc.number SUB_SCAN_CONSTRAINT_03_0007
     * @tc.desc   checkString on free text with input 'pdf'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0007 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'pdf');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('pdf');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0007 end');
    });

    /**
     * @tc.name   testConstraintText0008
     * @tc.number SUB_SCAN_CONSTRAINT_03_0008
     * @tc.desc   checkString on free text with input '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0008 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '0');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0008 end');
    });

    /**
     * @tc.name   testConstraintText0009
     * @tc.number SUB_SCAN_CONSTRAINT_03_0009
     * @tc.desc   checkString on free text with input 'x y'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0009 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'x y');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('x y');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0009 end');
    });

    /**
     * @tc.name   testConstraintText0010
     * @tc.number SUB_SCAN_CONSTRAINT_03_0010
     * @tc.desc   checkString on free int with input ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0010 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0010 end');
    });

    /**
     * @tc.name   testConstraintText0011
     * @tc.number SUB_SCAN_CONSTRAINT_03_0011
     * @tc.desc   checkString on free int with input 'a'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0011 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'a');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0011 end');
    });

    /**
     * @tc.name   testConstraintText0012
     * @tc.number SUB_SCAN_CONSTRAINT_03_0012
     * @tc.desc   checkString on free int with input 'b'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0012 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'b');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0012 end');
    });

    /**
     * @tc.name   testConstraintText0013
     * @tc.number SUB_SCAN_CONSTRAINT_03_0013
     * @tc.desc   checkString on free int with input 'A4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0013 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'A4');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('A4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0013 end');
    });

    /**
     * @tc.name   testConstraintText0014
     * @tc.number SUB_SCAN_CONSTRAINT_03_0014
     * @tc.desc   checkString on free int with input 'letter'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0014 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'letter');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('letter');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0014 end');
    });

    /**
     * @tc.name   testConstraintText0015
     * @tc.number SUB_SCAN_CONSTRAINT_03_0015
     * @tc.desc   checkString on free int with input 'unknown'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0015 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'unknown');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0015 end');
    });

    /**
     * @tc.name   testConstraintText0016
     * @tc.number SUB_SCAN_CONSTRAINT_03_0016
     * @tc.desc   checkString on free int with input 'pdf'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0016 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'pdf');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('pdf');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0016 end');
    });

    /**
     * @tc.name   testConstraintText0017
     * @tc.number SUB_SCAN_CONSTRAINT_03_0017
     * @tc.desc   checkString on free int with input '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0017 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '0');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0017 end');
    });

    /**
     * @tc.name   testConstraintText0018
     * @tc.number SUB_SCAN_CONSTRAINT_03_0018
     * @tc.desc   checkString on free int with input 'x y'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0018 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'x y');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('x y');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0018 end');
    });

    /**
     * @tc.name   testConstraintText0019
     * @tc.number SUB_SCAN_CONSTRAINT_03_0019
     * @tc.desc   checkString on free boolean with input ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0019 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0019 end');
    });

    /**
     * @tc.name   testConstraintText0020
     * @tc.number SUB_SCAN_CONSTRAINT_03_0020
     * @tc.desc   checkString on free boolean with input 'a'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0020 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'a');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0020 end');
    });

    /**
     * @tc.name   testConstraintText0021
     * @tc.number SUB_SCAN_CONSTRAINT_03_0021
     * @tc.desc   checkString on free boolean with input 'b'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0021 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'b');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0021 end');
    });

    /**
     * @tc.name   testConstraintText0022
     * @tc.number SUB_SCAN_CONSTRAINT_03_0022
     * @tc.desc   checkString on free boolean with input 'A4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0022 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'A4');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('A4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0022 end');
    });

    /**
     * @tc.name   testConstraintText0023
     * @tc.number SUB_SCAN_CONSTRAINT_03_0023
     * @tc.desc   checkString on free boolean with input 'letter'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0023 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'letter');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('letter');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0023 end');
    });

    /**
     * @tc.name   testConstraintText0024
     * @tc.number SUB_SCAN_CONSTRAINT_03_0024
     * @tc.desc   checkString on free boolean with input 'unknown'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0024 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'unknown');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0024 end');
    });

    /**
     * @tc.name   testConstraintText0025
     * @tc.number SUB_SCAN_CONSTRAINT_03_0025
     * @tc.desc   checkString on free boolean with input 'pdf'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0025 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'pdf');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('pdf');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0025 end');
    });

    /**
     * @tc.name   testConstraintText0026
     * @tc.number SUB_SCAN_CONSTRAINT_03_0026
     * @tc.desc   checkString on free boolean with input '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0026 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '0');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0026 end');
    });

    /**
     * @tc.name   testConstraintText0027
     * @tc.number SUB_SCAN_CONSTRAINT_03_0027
     * @tc.desc   checkString on free boolean with input 'x y'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0027 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'x y');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('x y');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0027 end');
    });

    /**
     * @tc.name   testConstraintText0028
     * @tc.number SUB_SCAN_CONSTRAINT_03_0028
     * @tc.desc   checkString on string list with input ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0028 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0028 end');
    });

    /**
     * @tc.name   testConstraintText0029
     * @tc.number SUB_SCAN_CONSTRAINT_03_0029
     * @tc.desc   checkString on string list with input 'a'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0029 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'a');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0029 end');
    });

    /**
     * @tc.name   testConstraintText0030
     * @tc.number SUB_SCAN_CONSTRAINT_03_0030
     * @tc.desc   checkString on string list with input 'b'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0030 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'b');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_OK);
      expect(result.valid).assertEqual(true);
      expect(result.value).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0030 end');
    });

    /**
     * @tc.name   testConstraintText0031
     * @tc.number SUB_SCAN_CONSTRAINT_03_0031
     * @tc.desc   checkString on string list with input 'A4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0031 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'A4');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('A4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0031 end');
    });

    /**
     * @tc.name   testConstraintText0032
     * @tc.number SUB_SCAN_CONSTRAINT_03_0032
     * @tc.desc   checkString on string list with input 'letter'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0032 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'letter');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('letter');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0032 end');
    });

    /**
     * @tc.name   testConstraintText0033
     * @tc.number SUB_SCAN_CONSTRAINT_03_0033
     * @tc.desc   checkString on string list with input 'unknown'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0033 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'unknown');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0033 end');
    });

    /**
     * @tc.name   testConstraintText0034
     * @tc.number SUB_SCAN_CONSTRAINT_03_0034
     * @tc.desc   checkString on string list with input 'pdf'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0034 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'pdf');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('pdf');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0034 end');
    });

    /**
     * @tc.name   testConstraintText0035
     * @tc.number SUB_SCAN_CONSTRAINT_03_0035
     * @tc.desc   checkString on string list with input '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0035 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '0');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0035 end');
    });

    /**
     * @tc.name   testConstraintText0036
     * @tc.number SUB_SCAN_CONSTRAINT_03_0036
     * @tc.desc   checkString on string list with input 'x y'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0036 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'x y');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_NOT_LISTED);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('x y');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0036 end');
    });

    /**
     * @tc.name   testConstraintText0037
     * @tc.number SUB_SCAN_CONSTRAINT_03_0037
     * @tc.desc   checkString on string list without entries with input ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0037 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0037 end');
    });

    /**
     * @tc.name   testConstraintText0038
     * @tc.number SUB_SCAN_CONSTRAINT_03_0038
     * @tc.desc   checkString on string list without entries with input 'a'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0038 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'a');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0038 end');
    });

    /**
     * @tc.name   testConstraintText0039
     * @tc.number SUB_SCAN_CONSTRAINT_03_0039
     * @tc.desc   checkString on string list without entries with input 'b'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0039 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'b');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0039 end');
    });

    /**
     * @tc.name   testConstraintText0040
     * @tc.number SUB_SCAN_CONSTRAINT_03_0040
     * @tc.desc   checkString on string list without entries with input 'A4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0040 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'A4');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('A4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0040 end');
    });

    /**
     * @tc.name   testConstraintText0041
     * @tc.number SUB_SCAN_CONSTRAINT_03_0041
     * @tc.desc   checkString on string list without entries with input 'letter'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0041 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'letter');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('letter');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0041 end');
    });

    /**
     * @tc.name   testConstraintText0042
     * @tc.number SUB_SCAN_CONSTRAINT_03_0042
     * @tc.desc   checkString on string list without entries with input 'unknown'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0042 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'unknown');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0042 end');
    });

    /**
     * @tc.name   testConstraintText0043
     * @tc.number SUB_SCAN_CONSTRAINT_03_0043
     * @tc.desc   checkString on string list without entries with input 'pdf'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0043 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'pdf');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('pdf');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0043 end');
    });

    /**
     * @tc.name   testConstraintText0044
     * @tc.number SUB_SCAN_CONSTRAINT_03_0044
     * @tc.desc   checkString on string list without entries with input '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0044 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '0');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0044 end');
    });

    /**
     * @tc.name   testConstraintText0045
     * @tc.number SUB_SCAN_CONSTRAINT_03_0045
     * @tc.desc   checkString on string list without entries with input 'x y'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0045 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'x y');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('x y');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0045 end');
    });

    /**
     * @tc.name   testConstraintText0046
     * @tc.number SUB_SCAN_CONSTRAINT_03_0046
     * @tc.desc   checkString on string list with int type with input ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0046 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0046 end');
    });

    /**
     * @tc.name   testConstraintText0047
     * @tc.number SUB_SCAN_CONSTRAINT_03_0047
     * @tc.desc   checkString on string list with int type with input 'a'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0047 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'a');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0047 end');
    });

    /**
     * @tc.name   testConstraintText0048
     * @tc.number SUB_SCAN_CONSTRAINT_03_0048
     * @tc.desc   checkString on string list with int type with input 'b'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0048 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'b');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0048 end');
    });

    /**
     * @tc.name   testConstraintText0049
     * @tc.number SUB_SCAN_CONSTRAINT_03_0049
     * @tc.desc   checkString on string list with int type with input 'A4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0049 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'A4');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('A4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0049 end');
    });

    /**
     * @tc.name   testConstraintText0050
     * @tc.number SUB_SCAN_CONSTRAINT_03_0050
     * @tc.desc   checkString on string list with int type with input 'letter'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0050 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'letter');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('letter');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0050 end');
    });

    /**
     * @tc.name   testConstraintText0051
     * @tc.number SUB_SCAN_CONSTRAINT_03_0051
     * @tc.desc   checkString on string list with int type with input 'unknown'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0051 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'unknown');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0051 end');
    });

    /**
     * @tc.name   testConstraintText0052
     * @tc.number SUB_SCAN_CONSTRAINT_03_0052
     * @tc.desc   checkString on string list with int type with input 'pdf'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0052 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'pdf');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('pdf');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0052 end');
    });

    /**
     * @tc.name   testConstraintText0053
     * @tc.number SUB_SCAN_CONSTRAINT_03_0053
     * @tc.desc   checkString on string list with int type with input '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0053 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '0');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0053 end');
    });

    /**
     * @tc.name   testConstraintText0054
     * @tc.number SUB_SCAN_CONSTRAINT_03_0054
     * @tc.desc   checkString on string list with int type with input 'x y'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0054 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['a', 'b']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'x y');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('x y');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0054 end');
    });

    /**
     * @tc.name   testConstraintText0055
     * @tc.number SUB_SCAN_CONSTRAINT_03_0055
     * @tc.desc   checkString on string list with fixed type with input ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0055 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['x']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0055 end');
    });

    /**
     * @tc.name   testConstraintText0056
     * @tc.number SUB_SCAN_CONSTRAINT_03_0056
     * @tc.desc   checkString on string list with fixed type with input 'a'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0056 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['x']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'a');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0056 end');
    });

    /**
     * @tc.name   testConstraintText0057
     * @tc.number SUB_SCAN_CONSTRAINT_03_0057
     * @tc.desc   checkString on string list with fixed type with input 'b'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0057 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['x']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'b');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0057 end');
    });

    /**
     * @tc.name   testConstraintText0058
     * @tc.number SUB_SCAN_CONSTRAINT_03_0058
     * @tc.desc   checkString on string list with fixed type with input 'A4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0058 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['x']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'A4');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('A4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0058 end');
    });

    /**
     * @tc.name   testConstraintText0059
     * @tc.number SUB_SCAN_CONSTRAINT_03_0059
     * @tc.desc   checkString on string list with fixed type with input 'letter'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0059 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['x']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'letter');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('letter');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0059 end');
    });

    /**
     * @tc.name   testConstraintText0060
     * @tc.number SUB_SCAN_CONSTRAINT_03_0060
     * @tc.desc   checkString on string list with fixed type with input 'unknown'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0060 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['x']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'unknown');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0060 end');
    });

    /**
     * @tc.name   testConstraintText0061
     * @tc.number SUB_SCAN_CONSTRAINT_03_0061
     * @tc.desc   checkString on string list with fixed type with input 'pdf'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0061 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['x']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'pdf');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('pdf');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0061 end');
    });

    /**
     * @tc.name   testConstraintText0062
     * @tc.number SUB_SCAN_CONSTRAINT_03_0062
     * @tc.desc   checkString on string list with fixed type with input '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0062 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['x']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '0');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0062 end');
    });

    /**
     * @tc.name   testConstraintText0063
     * @tc.number SUB_SCAN_CONSTRAINT_03_0063
     * @tc.desc   checkString on string list with fixed type with input 'x y'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0063 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [], ['x']);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'x y');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('x y');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0063 end');
    });

    /**
     * @tc.name   testConstraintText0064
     * @tc.number SUB_SCAN_CONSTRAINT_03_0064
     * @tc.desc   checkString on range with text type with input ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0064 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0064 end');
    });

    /**
     * @tc.name   testConstraintText0065
     * @tc.number SUB_SCAN_CONSTRAINT_03_0065
     * @tc.desc   checkString on range with text type with input 'a'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0065 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'a');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0065 end');
    });

    /**
     * @tc.name   testConstraintText0066
     * @tc.number SUB_SCAN_CONSTRAINT_03_0066
     * @tc.desc   checkString on range with text type with input 'b'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0066 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'b');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0066 end');
    });

    /**
     * @tc.name   testConstraintText0067
     * @tc.number SUB_SCAN_CONSTRAINT_03_0067
     * @tc.desc   checkString on range with text type with input 'A4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0067 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'A4');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('A4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0067 end');
    });

    /**
     * @tc.name   testConstraintText0068
     * @tc.number SUB_SCAN_CONSTRAINT_03_0068
     * @tc.desc   checkString on range with text type with input 'letter'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0068 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'letter');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('letter');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0068 end');
    });

    /**
     * @tc.name   testConstraintText0069
     * @tc.number SUB_SCAN_CONSTRAINT_03_0069
     * @tc.desc   checkString on range with text type with input 'unknown'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0069 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'unknown');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0069 end');
    });

    /**
     * @tc.name   testConstraintText0070
     * @tc.number SUB_SCAN_CONSTRAINT_03_0070
     * @tc.desc   checkString on range with text type with input 'pdf'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0070 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'pdf');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('pdf');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0070 end');
    });

    /**
     * @tc.name   testConstraintText0071
     * @tc.number SUB_SCAN_CONSTRAINT_03_0071
     * @tc.desc   checkString on range with text type with input '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0071 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '0');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0071 end');
    });

    /**
     * @tc.name   testConstraintText0072
     * @tc.number SUB_SCAN_CONSTRAINT_03_0072
     * @tc.desc   checkString on range with text type with input 'x y'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0072 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'x y');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('x y');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0072 end');
    });

    /**
     * @tc.name   testConstraintText0073
     * @tc.number SUB_SCAN_CONSTRAINT_03_0073
     * @tc.desc   checkString on range with int type with input ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0073 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0073 end');
    });

    /**
     * @tc.name   testConstraintText0074
     * @tc.number SUB_SCAN_CONSTRAINT_03_0074
     * @tc.desc   checkString on range with int type with input 'a'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0074 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'a');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0074 end');
    });

    /**
     * @tc.name   testConstraintText0075
     * @tc.number SUB_SCAN_CONSTRAINT_03_0075
     * @tc.desc   checkString on range with int type with input 'b'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0075 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'b');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0075 end');
    });

    /**
     * @tc.name   testConstraintText0076
     * @tc.number SUB_SCAN_CONSTRAINT_03_0076
     * @tc.desc   checkString on range with int type with input 'A4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0076 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'A4');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('A4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0076 end');
    });

    /**
     * @tc.name   testConstraintText0077
     * @tc.number SUB_SCAN_CONSTRAINT_03_0077
     * @tc.desc   checkString on range with int type with input 'letter'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0077 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'letter');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('letter');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0077 end');
    });

    /**
     * @tc.name   testConstraintText0078
     * @tc.number SUB_SCAN_CONSTRAINT_03_0078
     * @tc.desc   checkString on range with int type with input 'unknown'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0078 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'unknown');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0078 end');
    });

    /**
     * @tc.name   testConstraintText0079
     * @tc.number SUB_SCAN_CONSTRAINT_03_0079
     * @tc.desc   checkString on range with int type with input 'pdf'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0079 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'pdf');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('pdf');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0079 end');
    });

    /**
     * @tc.name   testConstraintText0080
     * @tc.number SUB_SCAN_CONSTRAINT_03_0080
     * @tc.desc   checkString on range with int type with input '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0080 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '0');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0080 end');
    });

    /**
     * @tc.name   testConstraintText0081
     * @tc.number SUB_SCAN_CONSTRAINT_03_0081
     * @tc.desc   checkString on range with int type with input 'x y'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0081 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 10, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'x y');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('x y');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0081 end');
    });

    /**
     * @tc.name   testConstraintText0082
     * @tc.number SUB_SCAN_CONSTRAINT_03_0082
     * @tc.desc   checkString on word list with text type with input ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0082 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_EMPTY);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0082 end');
    });

    /**
     * @tc.name   testConstraintText0083
     * @tc.number SUB_SCAN_CONSTRAINT_03_0083
     * @tc.desc   checkString on word list with text type with input 'a'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0083 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'a');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0083 end');
    });

    /**
     * @tc.name   testConstraintText0084
     * @tc.number SUB_SCAN_CONSTRAINT_03_0084
     * @tc.desc   checkString on word list with text type with input 'b'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0084 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'b');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0084 end');
    });

    /**
     * @tc.name   testConstraintText0085
     * @tc.number SUB_SCAN_CONSTRAINT_03_0085
     * @tc.desc   checkString on word list with text type with input 'A4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0085 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'A4');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('A4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0085 end');
    });

    /**
     * @tc.name   testConstraintText0086
     * @tc.number SUB_SCAN_CONSTRAINT_03_0086
     * @tc.desc   checkString on word list with text type with input 'letter'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0086 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'letter');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('letter');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0086 end');
    });

    /**
     * @tc.name   testConstraintText0087
     * @tc.number SUB_SCAN_CONSTRAINT_03_0087
     * @tc.desc   checkString on word list with text type with input 'unknown'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0087 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'unknown');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0087 end');
    });

    /**
     * @tc.name   testConstraintText0088
     * @tc.number SUB_SCAN_CONSTRAINT_03_0088
     * @tc.desc   checkString on word list with text type with input 'pdf'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0088 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'pdf');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('pdf');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0088 end');
    });

    /**
     * @tc.name   testConstraintText0089
     * @tc.number SUB_SCAN_CONSTRAINT_03_0089
     * @tc.desc   checkString on word list with text type with input '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0089 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, '0');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0089 end');
    });

    /**
     * @tc.name   testConstraintText0090
     * @tc.number SUB_SCAN_CONSTRAINT_03_0090
     * @tc.desc   checkString on word list with text type with input 'x y'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintText0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0090 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1], []);
      const result: ScanTextCheck = ScanOptionConstraint.checkString(p, 'x y');
      expect(result.reasonKey).assertEqual(ScanOptionConstraint.REASON_TYPE_MISMATCH);
      expect(result.valid).assertEqual(false);
      expect(result.value).assertEqual('x y');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintText0090 end');
    });

  });
}
