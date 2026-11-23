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
import { scan } from '@kit.BasicServicesKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanConstraintKindTest() {
  describe('ScanConstraintKind', () => {

    /**
     * @tc.name   testConstraintKind0001
     * @tc.number SUB_SCAN_CONSTRAINT_01_0001
     * @tc.desc   constraint 0 with value type 0 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0001 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0001 end');
    });

    /**
     * @tc.name   testConstraintKind0002
     * @tc.number SUB_SCAN_CONSTRAINT_01_0002
     * @tc.desc   constraint 0 with value type 1 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0002 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0002 end');
    });

    /**
     * @tc.name   testConstraintKind0003
     * @tc.number SUB_SCAN_CONSTRAINT_01_0003
     * @tc.desc   constraint 0 with value type 2 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0003 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 2, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0003 end');
    });

    /**
     * @tc.name   testConstraintKind0004
     * @tc.number SUB_SCAN_CONSTRAINT_01_0004
     * @tc.desc   constraint 0 with value type 3 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0004 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0004 end');
    });

    /**
     * @tc.name   testConstraintKind0005
     * @tc.number SUB_SCAN_CONSTRAINT_01_0005
     * @tc.desc   constraint 1 with value type 0 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0005 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 0, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,300,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0005 end');
    });

    /**
     * @tc.name   testConstraintKind0006
     * @tc.number SUB_SCAN_CONSTRAINT_01_0006
     * @tc.desc   constraint 1 with value type 1 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0006 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,300,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0006 end');
    });

    /**
     * @tc.name   testConstraintKind0007
     * @tc.number SUB_SCAN_CONSTRAINT_01_0007
     * @tc.desc   constraint 1 with value type 2 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0007 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,300,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0007 end');
    });

    /**
     * @tc.name   testConstraintKind0008
     * @tc.number SUB_SCAN_CONSTRAINT_01_0008
     * @tc.desc   constraint 1 with value type 3 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0008 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,300,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0008 end');
    });

    /**
     * @tc.name   testConstraintKind0009
     * @tc.number SUB_SCAN_CONSTRAINT_01_0009
     * @tc.desc   constraint 2 with value type 0 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0009 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 0, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0009 end');
    });

    /**
     * @tc.name   testConstraintKind0010
     * @tc.number SUB_SCAN_CONSTRAINT_01_0010
     * @tc.desc   constraint 2 with value type 1 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0010 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0010 end');
    });

    /**
     * @tc.name   testConstraintKind0011
     * @tc.number SUB_SCAN_CONSTRAINT_01_0011
     * @tc.desc   constraint 2 with value type 2 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0011 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 2, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0011 end');
    });

    /**
     * @tc.name   testConstraintKind0012
     * @tc.number SUB_SCAN_CONSTRAINT_01_0012
     * @tc.desc   constraint 2 with value type 3 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0012 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0012 end');
    });

    /**
     * @tc.name   testConstraintKind0013
     * @tc.number SUB_SCAN_CONSTRAINT_01_0013
     * @tc.desc   constraint 3 with value type 0 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0013 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 0, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0013 end');
    });

    /**
     * @tc.name   testConstraintKind0014
     * @tc.number SUB_SCAN_CONSTRAINT_01_0014
     * @tc.desc   constraint 3 with value type 1 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0014 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0014 end');
    });

    /**
     * @tc.name   testConstraintKind0015
     * @tc.number SUB_SCAN_CONSTRAINT_01_0015
     * @tc.desc   constraint 3 with value type 2 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0015 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0015 end');
    });

    /**
     * @tc.name   testConstraintKind0016
     * @tc.number SUB_SCAN_CONSTRAINT_01_0016
     * @tc.desc   constraint 3 with value type 3 on standard range 0..300 step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0016 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 300, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0016 end');
    });

    /**
     * @tc.name   testConstraintKind0017
     * @tc.number SUB_SCAN_CONSTRAINT_01_0017
     * @tc.desc   constraint 0 with value type 0 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0017 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0017 end');
    });

    /**
     * @tc.name   testConstraintKind0018
     * @tc.number SUB_SCAN_CONSTRAINT_01_0018
     * @tc.desc   constraint 0 with value type 1 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0018 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0018 end');
    });

    /**
     * @tc.name   testConstraintKind0019
     * @tc.number SUB_SCAN_CONSTRAINT_01_0019
     * @tc.desc   constraint 0 with value type 2 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0019 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 2, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0019 end');
    });

    /**
     * @tc.name   testConstraintKind0020
     * @tc.number SUB_SCAN_CONSTRAINT_01_0020
     * @tc.desc   constraint 0 with value type 3 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0020 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0020 end');
    });

    /**
     * @tc.name   testConstraintKind0021
     * @tc.number SUB_SCAN_CONSTRAINT_01_0021
     * @tc.desc   constraint 1 with value type 0 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0021 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 0, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[-50,50,5]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0021 end');
    });

    /**
     * @tc.name   testConstraintKind0022
     * @tc.number SUB_SCAN_CONSTRAINT_01_0022
     * @tc.desc   constraint 1 with value type 1 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0022 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[-50,50,5]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0022 end');
    });

    /**
     * @tc.name   testConstraintKind0023
     * @tc.number SUB_SCAN_CONSTRAINT_01_0023
     * @tc.desc   constraint 1 with value type 2 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0023 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[-50,50,5]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0023 end');
    });

    /**
     * @tc.name   testConstraintKind0024
     * @tc.number SUB_SCAN_CONSTRAINT_01_0024
     * @tc.desc   constraint 1 with value type 3 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0024 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[-50,50,5]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0024 end');
    });

    /**
     * @tc.name   testConstraintKind0025
     * @tc.number SUB_SCAN_CONSTRAINT_01_0025
     * @tc.desc   constraint 2 with value type 0 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0025 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 0, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0025 end');
    });

    /**
     * @tc.name   testConstraintKind0026
     * @tc.number SUB_SCAN_CONSTRAINT_01_0026
     * @tc.desc   constraint 2 with value type 1 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0026 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0026 end');
    });

    /**
     * @tc.name   testConstraintKind0027
     * @tc.number SUB_SCAN_CONSTRAINT_01_0027
     * @tc.desc   constraint 2 with value type 2 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0027 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 2, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0027 end');
    });

    /**
     * @tc.name   testConstraintKind0028
     * @tc.number SUB_SCAN_CONSTRAINT_01_0028
     * @tc.desc   constraint 2 with value type 3 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0028 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0028 end');
    });

    /**
     * @tc.name   testConstraintKind0029
     * @tc.number SUB_SCAN_CONSTRAINT_01_0029
     * @tc.desc   constraint 3 with value type 0 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0029 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 0, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0029 end');
    });

    /**
     * @tc.name   testConstraintKind0030
     * @tc.number SUB_SCAN_CONSTRAINT_01_0030
     * @tc.desc   constraint 3 with value type 1 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0030 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0030 end');
    });

    /**
     * @tc.name   testConstraintKind0031
     * @tc.number SUB_SCAN_CONSTRAINT_01_0031
     * @tc.desc   constraint 3 with value type 2 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0031 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0031 end');
    });

    /**
     * @tc.name   testConstraintKind0032
     * @tc.number SUB_SCAN_CONSTRAINT_01_0032
     * @tc.desc   constraint 3 with value type 3 on signed range -50..50 step 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0032 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, -50, 50, 5);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0032 end');
    });

    /**
     * @tc.name   testConstraintKind0033
     * @tc.number SUB_SCAN_CONSTRAINT_01_0033
     * @tc.desc   constraint 0 with value type 0 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0033 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0033 end');
    });

    /**
     * @tc.name   testConstraintKind0034
     * @tc.number SUB_SCAN_CONSTRAINT_01_0034
     * @tc.desc   constraint 0 with value type 1 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0034 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0034 end');
    });

    /**
     * @tc.name   testConstraintKind0035
     * @tc.number SUB_SCAN_CONSTRAINT_01_0035
     * @tc.desc   constraint 0 with value type 2 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0035 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 2, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0035 end');
    });

    /**
     * @tc.name   testConstraintKind0036
     * @tc.number SUB_SCAN_CONSTRAINT_01_0036
     * @tc.desc   constraint 0 with value type 3 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0036 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0036 end');
    });

    /**
     * @tc.name   testConstraintKind0037
     * @tc.number SUB_SCAN_CONSTRAINT_01_0037
     * @tc.desc   constraint 1 with value type 0 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0037 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 0, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,300,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0037 end');
    });

    /**
     * @tc.name   testConstraintKind0038
     * @tc.number SUB_SCAN_CONSTRAINT_01_0038
     * @tc.desc   constraint 1 with value type 1 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0038 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,300,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0038 end');
    });

    /**
     * @tc.name   testConstraintKind0039
     * @tc.number SUB_SCAN_CONSTRAINT_01_0039
     * @tc.desc   constraint 1 with value type 2 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0039 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,300,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0039 end');
    });

    /**
     * @tc.name   testConstraintKind0040
     * @tc.number SUB_SCAN_CONSTRAINT_01_0040
     * @tc.desc   constraint 1 with value type 3 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0040 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,300,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0040 end');
    });

    /**
     * @tc.name   testConstraintKind0041
     * @tc.number SUB_SCAN_CONSTRAINT_01_0041
     * @tc.desc   constraint 2 with value type 0 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0041 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 0, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0041 end');
    });

    /**
     * @tc.name   testConstraintKind0042
     * @tc.number SUB_SCAN_CONSTRAINT_01_0042
     * @tc.desc   constraint 2 with value type 1 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0042 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0042 end');
    });

    /**
     * @tc.name   testConstraintKind0043
     * @tc.number SUB_SCAN_CONSTRAINT_01_0043
     * @tc.desc   constraint 2 with value type 2 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0043 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 2, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0043 end');
    });

    /**
     * @tc.name   testConstraintKind0044
     * @tc.number SUB_SCAN_CONSTRAINT_01_0044
     * @tc.desc   constraint 2 with value type 3 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0044 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0044 end');
    });

    /**
     * @tc.name   testConstraintKind0045
     * @tc.number SUB_SCAN_CONSTRAINT_01_0045
     * @tc.desc   constraint 3 with value type 0 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0045 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 0, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0045 end');
    });

    /**
     * @tc.name   testConstraintKind0046
     * @tc.number SUB_SCAN_CONSTRAINT_01_0046
     * @tc.desc   constraint 3 with value type 1 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0046 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0046 end');
    });

    /**
     * @tc.name   testConstraintKind0047
     * @tc.number SUB_SCAN_CONSTRAINT_01_0047
     * @tc.desc   constraint 3 with value type 2 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0047 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0047 end');
    });

    /**
     * @tc.name   testConstraintKind0048
     * @tc.number SUB_SCAN_CONSTRAINT_01_0048
     * @tc.desc   constraint 3 with value type 3 on zero quant falls back to step 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0048 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 300, 0);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0048 end');
    });

    /**
     * @tc.name   testConstraintKind0049
     * @tc.number SUB_SCAN_CONSTRAINT_01_0049
     * @tc.desc   constraint 0 with value type 0 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0049 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0049 end');
    });

    /**
     * @tc.name   testConstraintKind0050
     * @tc.number SUB_SCAN_CONSTRAINT_01_0050
     * @tc.desc   constraint 0 with value type 1 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0050 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0050 end');
    });

    /**
     * @tc.name   testConstraintKind0051
     * @tc.number SUB_SCAN_CONSTRAINT_01_0051
     * @tc.desc   constraint 0 with value type 2 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0051 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 2, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0051 end');
    });

    /**
     * @tc.name   testConstraintKind0052
     * @tc.number SUB_SCAN_CONSTRAINT_01_0052
     * @tc.desc   constraint 0 with value type 3 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0052 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0052 end');
    });

    /**
     * @tc.name   testConstraintKind0053
     * @tc.number SUB_SCAN_CONSTRAINT_01_0053
     * @tc.desc   constraint 1 with value type 0 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0053 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 0, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[300,0,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0053 end');
    });

    /**
     * @tc.name   testConstraintKind0054
     * @tc.number SUB_SCAN_CONSTRAINT_01_0054
     * @tc.desc   constraint 1 with value type 1 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0054 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[300,0,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0054 end');
    });

    /**
     * @tc.name   testConstraintKind0055
     * @tc.number SUB_SCAN_CONSTRAINT_01_0055
     * @tc.desc   constraint 1 with value type 2 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0055 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[300,0,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0055 end');
    });

    /**
     * @tc.name   testConstraintKind0056
     * @tc.number SUB_SCAN_CONSTRAINT_01_0056
     * @tc.desc   constraint 1 with value type 3 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0056 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[300,0,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0056 end');
    });

    /**
     * @tc.name   testConstraintKind0057
     * @tc.number SUB_SCAN_CONSTRAINT_01_0057
     * @tc.desc   constraint 2 with value type 0 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0057 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 0, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0057 end');
    });

    /**
     * @tc.name   testConstraintKind0058
     * @tc.number SUB_SCAN_CONSTRAINT_01_0058
     * @tc.desc   constraint 2 with value type 1 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0058 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0058 end');
    });

    /**
     * @tc.name   testConstraintKind0059
     * @tc.number SUB_SCAN_CONSTRAINT_01_0059
     * @tc.desc   constraint 2 with value type 2 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0059 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 2, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0059 end');
    });

    /**
     * @tc.name   testConstraintKind0060
     * @tc.number SUB_SCAN_CONSTRAINT_01_0060
     * @tc.desc   constraint 2 with value type 3 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0060 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0060 end');
    });

    /**
     * @tc.name   testConstraintKind0061
     * @tc.number SUB_SCAN_CONSTRAINT_01_0061
     * @tc.desc   constraint 3 with value type 0 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0061 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 0, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0061 end');
    });

    /**
     * @tc.name   testConstraintKind0062
     * @tc.number SUB_SCAN_CONSTRAINT_01_0062
     * @tc.desc   constraint 3 with value type 1 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0062 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0062 end');
    });

    /**
     * @tc.name   testConstraintKind0063
     * @tc.number SUB_SCAN_CONSTRAINT_01_0063
     * @tc.desc   constraint 3 with value type 2 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0063 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0063 end');
    });

    /**
     * @tc.name   testConstraintKind0064
     * @tc.number SUB_SCAN_CONSTRAINT_01_0064
     * @tc.desc   constraint 3 with value type 3 on inverted range 300..0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0064 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 300, 0, 1);
      ScanParameterBuilder.patchLists(p, [], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[0]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0064 end');
    });

    /**
     * @tc.name   testConstraintKind0065
     * @tc.number SUB_SCAN_CONSTRAINT_01_0065
     * @tc.desc   constraint 0 with value type 0 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0065 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0065 end');
    });

    /**
     * @tc.name   testConstraintKind0066
     * @tc.number SUB_SCAN_CONSTRAINT_01_0066
     * @tc.desc   constraint 0 with value type 1 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0066 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0066 end');
    });

    /**
     * @tc.name   testConstraintKind0067
     * @tc.number SUB_SCAN_CONSTRAINT_01_0067
     * @tc.desc   constraint 0 with value type 2 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0067 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0067 end');
    });

    /**
     * @tc.name   testConstraintKind0068
     * @tc.number SUB_SCAN_CONSTRAINT_01_0068
     * @tc.desc   constraint 0 with value type 3 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0068 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0068 end');
    });

    /**
     * @tc.name   testConstraintKind0069
     * @tc.number SUB_SCAN_CONSTRAINT_01_0069
     * @tc.desc   constraint 1 with value type 0 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0069 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,0,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0069 end');
    });

    /**
     * @tc.name   testConstraintKind0070
     * @tc.number SUB_SCAN_CONSTRAINT_01_0070
     * @tc.desc   constraint 1 with value type 1 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0070 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,0,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0070 end');
    });

    /**
     * @tc.name   testConstraintKind0071
     * @tc.number SUB_SCAN_CONSTRAINT_01_0071
     * @tc.desc   constraint 1 with value type 2 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0071 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,0,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0071 end');
    });

    /**
     * @tc.name   testConstraintKind0072
     * @tc.number SUB_SCAN_CONSTRAINT_01_0072
     * @tc.desc   constraint 1 with value type 3 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0072 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,0,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0072 end');
    });

    /**
     * @tc.name   testConstraintKind0073
     * @tc.number SUB_SCAN_CONSTRAINT_01_0073
     * @tc.desc   constraint 2 with value type 0 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0073 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[3]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0073 end');
    });

    /**
     * @tc.name   testConstraintKind0074
     * @tc.number SUB_SCAN_CONSTRAINT_01_0074
     * @tc.desc   constraint 2 with value type 1 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0074 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[3]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0074 end');
    });

    /**
     * @tc.name   testConstraintKind0075
     * @tc.number SUB_SCAN_CONSTRAINT_01_0075
     * @tc.desc   constraint 2 with value type 2 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0075 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[3]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0075 end');
    });

    /**
     * @tc.name   testConstraintKind0076
     * @tc.number SUB_SCAN_CONSTRAINT_01_0076
     * @tc.desc   constraint 2 with value type 3 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0076 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[3]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0076 end');
    });

    /**
     * @tc.name   testConstraintKind0077
     * @tc.number SUB_SCAN_CONSTRAINT_01_0077
     * @tc.desc   constraint 3 with value type 0 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0077 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[3]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0077 end');
    });

    /**
     * @tc.name   testConstraintKind0078
     * @tc.number SUB_SCAN_CONSTRAINT_01_0078
     * @tc.desc   constraint 3 with value type 1 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0078 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[3]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0078 end');
    });

    /**
     * @tc.name   testConstraintKind0079
     * @tc.number SUB_SCAN_CONSTRAINT_01_0079
     * @tc.desc   constraint 3 with value type 2 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0079 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[3]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0079 end');
    });

    /**
     * @tc.name   testConstraintKind0080
     * @tc.number SUB_SCAN_CONSTRAINT_01_0080
     * @tc.desc   constraint 3 with value type 3 on three word entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0080 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(3, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('STRING_LIST[3]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0080 end');
    });

    /**
     * @tc.name   testConstraintKind0081
     * @tc.number SUB_SCAN_CONSTRAINT_01_0081
     * @tc.desc   constraint 0 with value type 0 on two words and two strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0081 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], ['pdf', 'png']);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0081 end');
    });

    /**
     * @tc.name   testConstraintKind0082
     * @tc.number SUB_SCAN_CONSTRAINT_01_0082
     * @tc.desc   constraint 0 with value type 1 on two words and two strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0082 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], ['pdf', 'png']);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0082 end');
    });

    /**
     * @tc.name   testConstraintKind0083
     * @tc.number SUB_SCAN_CONSTRAINT_01_0083
     * @tc.desc   constraint 0 with value type 2 on two words and two strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0083 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], ['pdf', 'png']);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0083 end');
    });

    /**
     * @tc.name   testConstraintKind0084
     * @tc.number SUB_SCAN_CONSTRAINT_01_0084
     * @tc.desc   constraint 0 with value type 3 on two words and two strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0084 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(0, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], ['pdf', 'png']);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NONE');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0084 end');
    });

    /**
     * @tc.name   testConstraintKind0085
     * @tc.number SUB_SCAN_CONSTRAINT_01_0085
     * @tc.desc   constraint 1 with value type 0 on two words and two strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0085 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], ['pdf', 'png']);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,0,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0085 end');
    });

    /**
     * @tc.name   testConstraintKind0086
     * @tc.number SUB_SCAN_CONSTRAINT_01_0086
     * @tc.desc   constraint 1 with value type 1 on two words and two strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0086 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], ['pdf', 'png']);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,0,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0086 end');
    });

    /**
     * @tc.name   testConstraintKind0087
     * @tc.number SUB_SCAN_CONSTRAINT_01_0087
     * @tc.desc   constraint 1 with value type 2 on two words and two strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0087 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 2, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], ['pdf', 'png']);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,0,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0087 end');
    });

    /**
     * @tc.name   testConstraintKind0088
     * @tc.number SUB_SCAN_CONSTRAINT_01_0088
     * @tc.desc   constraint 1 with value type 3 on two words and two strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0088 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 3, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], ['pdf', 'png']);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanOptionConstraint.describe(p)).assertEqual('RANGE[0,0,1]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0088 end');
    });

    /**
     * @tc.name   testConstraintKind0089
     * @tc.number SUB_SCAN_CONSTRAINT_01_0089
     * @tc.desc   constraint 2 with value type 0 on two words and two strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0089 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 0, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], ['pdf', 'png']);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[4]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0089 end');
    });

    /**
     * @tc.name   testConstraintKind0090
     * @tc.number SUB_SCAN_CONSTRAINT_01_0090
     * @tc.desc   constraint 2 with value type 1 on two words and two strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintKind0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0090 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(2, 1, 0, 0, 1);
      ScanParameterBuilder.patchLists(p, [2, 4], ['pdf', 'png']);
      const result: ScanConstraintKind = ScanOptionConstraint.getKind(p);
      expect(result).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanOptionConstraint.describe(p)).assertEqual('NUMBER_LIST[4]');
      expect(ScanOptionConstraint.isEditable(p)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConstraintKind0090 end');
    });

  });
}
