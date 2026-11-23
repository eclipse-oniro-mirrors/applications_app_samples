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
import { ScanOptionItem, ScanOptionModel } from '../../../main/ets/scan/model/ScanOptionViewModel';
import { ScanParameterBuilder } from '../../../main/ets/scan/model/ScanParameterBuilder';
import { scan } from '@kit.BasicServicesKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanOptionItemTest() {
  describe('ScanOptionItem', () => {

    /**
     * @tc.name   testOptionItem0001
     * @tc.number SUB_SCAN_OPTION_01_0001
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0001 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(1, 'OPT_A', 'Resolution', 'dots per inch', 0, 0, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0001 end');
    });

    /**
     * @tc.name   testOptionItem0002
     * @tc.number SUB_SCAN_OPTION_01_0002
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0002 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(2, 'OPT_A', 'Resolution', 'dots per inch', 1, 0, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('px');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0002 end');
    });

    /**
     * @tc.name   testOptionItem0003
     * @tc.number SUB_SCAN_OPTION_01_0003
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0003 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(3, 'OPT_A', 'Resolution', 'dots per inch', 2, 0, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('bit');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0003 end');
    });

    /**
     * @tc.name   testOptionItem0004
     * @tc.number SUB_SCAN_OPTION_01_0004
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0004 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(4, 'OPT_A', 'Resolution', 'dots per inch', 3, 0, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('mm');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0004 end');
    });

    /**
     * @tc.name   testOptionItem0005
     * @tc.number SUB_SCAN_OPTION_01_0005
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0005 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(5, 'OPT_A', 'Resolution', 'dots per inch', 4, 0, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('dpi');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0005 end');
    });

    /**
     * @tc.name   testOptionItem0006
     * @tc.number SUB_SCAN_OPTION_01_0006
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0006 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(6, 'OPT_A', 'Resolution', 'dots per inch', 5, 0, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('%');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0006 end');
    });

    /**
     * @tc.name   testOptionItem0007
     * @tc.number SUB_SCAN_OPTION_01_0007
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0007 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(7, 'OPT_A', 'Resolution', 'dots per inch', 6, 0, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('us');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0007 end');
    });

    /**
     * @tc.name   testOptionItem0008
     * @tc.number SUB_SCAN_OPTION_01_0008
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0008 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(8, 'OPT_A', 'Resolution', 'dots per inch', 0, 1, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0008 end');
    });

    /**
     * @tc.name   testOptionItem0009
     * @tc.number SUB_SCAN_OPTION_01_0009
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0009 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(9, 'OPT_A', 'Resolution', 'dots per inch', 1, 1, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('px');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0009 end');
    });

    /**
     * @tc.name   testOptionItem0010
     * @tc.number SUB_SCAN_OPTION_01_0010
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0010 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(10, 'OPT_A', 'Resolution', 'dots per inch', 2, 1, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('bit');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0010 end');
    });

    /**
     * @tc.name   testOptionItem0011
     * @tc.number SUB_SCAN_OPTION_01_0011
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0011 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(11, 'OPT_A', 'Resolution', 'dots per inch', 3, 1, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('mm');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0011 end');
    });

    /**
     * @tc.name   testOptionItem0012
     * @tc.number SUB_SCAN_OPTION_01_0012
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0012 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(12, 'OPT_A', 'Resolution', 'dots per inch', 4, 1, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('dpi');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0012 end');
    });

    /**
     * @tc.name   testOptionItem0013
     * @tc.number SUB_SCAN_OPTION_01_0013
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0013 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(13, 'OPT_A', 'Resolution', 'dots per inch', 5, 1, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('%');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0013 end');
    });

    /**
     * @tc.name   testOptionItem0014
     * @tc.number SUB_SCAN_OPTION_01_0014
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0014 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(14, 'OPT_A', 'Resolution', 'dots per inch', 6, 1, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('us');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0014 end');
    });

    /**
     * @tc.name   testOptionItem0015
     * @tc.number SUB_SCAN_OPTION_01_0015
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0015 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(15, 'OPT_A', 'Resolution', 'dots per inch', 0, 2, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0015 end');
    });

    /**
     * @tc.name   testOptionItem0016
     * @tc.number SUB_SCAN_OPTION_01_0016
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0016 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(16, 'OPT_A', 'Resolution', 'dots per inch', 1, 2, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('px');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0016 end');
    });

    /**
     * @tc.name   testOptionItem0017
     * @tc.number SUB_SCAN_OPTION_01_0017
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0017 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(17, 'OPT_A', 'Resolution', 'dots per inch', 2, 2, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('bit');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0017 end');
    });

    /**
     * @tc.name   testOptionItem0018
     * @tc.number SUB_SCAN_OPTION_01_0018
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0018 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(18, 'OPT_A', 'Resolution', 'dots per inch', 3, 2, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('mm');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0018 end');
    });

    /**
     * @tc.name   testOptionItem0019
     * @tc.number SUB_SCAN_OPTION_01_0019
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0019 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(19, 'OPT_A', 'Resolution', 'dots per inch', 4, 2, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('dpi');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0019 end');
    });

    /**
     * @tc.name   testOptionItem0020
     * @tc.number SUB_SCAN_OPTION_01_0020
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0020 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(20, 'OPT_A', 'Resolution', 'dots per inch', 5, 2, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('%');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0020 end');
    });

    /**
     * @tc.name   testOptionItem0021
     * @tc.number SUB_SCAN_OPTION_01_0021
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0021 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(21, 'OPT_A', 'Resolution', 'dots per inch', 6, 2, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('us');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0021 end');
    });

    /**
     * @tc.name   testOptionItem0022
     * @tc.number SUB_SCAN_OPTION_01_0022
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0022 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(22, 'OPT_A', 'Resolution', 'dots per inch', 0, 3, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0022 end');
    });

    /**
     * @tc.name   testOptionItem0023
     * @tc.number SUB_SCAN_OPTION_01_0023
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0023 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(23, 'OPT_A', 'Resolution', 'dots per inch', 1, 3, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('px');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0023 end');
    });

    /**
     * @tc.name   testOptionItem0024
     * @tc.number SUB_SCAN_OPTION_01_0024
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0024 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(24, 'OPT_A', 'Resolution', 'dots per inch', 2, 3, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('bit');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0024 end');
    });

    /**
     * @tc.name   testOptionItem0025
     * @tc.number SUB_SCAN_OPTION_01_0025
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0025 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(25, 'OPT_A', 'Resolution', 'dots per inch', 3, 3, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('mm');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0025 end');
    });

    /**
     * @tc.name   testOptionItem0026
     * @tc.number SUB_SCAN_OPTION_01_0026
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0026 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(26, 'OPT_A', 'Resolution', 'dots per inch', 4, 3, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('dpi');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0026 end');
    });

    /**
     * @tc.name   testOptionItem0027
     * @tc.number SUB_SCAN_OPTION_01_0027
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0027 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(27, 'OPT_A', 'Resolution', 'dots per inch', 5, 3, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('%');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0027 end');
    });

    /**
     * @tc.name   testOptionItem0028
     * @tc.number SUB_SCAN_OPTION_01_0028
     * @tc.desc   dots per inch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0028 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(28, 'OPT_A', 'Resolution', 'dots per inch', 6, 3, 1);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Resolution');
      expect(result.unitText).assertEqual('us');
      expect(result.detail).assertEqual('dots per inch');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0028 end');
    });

    /**
     * @tc.name   testOptionItem0029
     * @tc.number SUB_SCAN_OPTION_01_0029
     * @tc.desc   ScanOptionItem case 29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0029 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(29, 'OPT_B', '', '', 0, 0, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0029 end');
    });

    /**
     * @tc.name   testOptionItem0030
     * @tc.number SUB_SCAN_OPTION_01_0030
     * @tc.desc   ScanOptionItem case 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0030 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(30, 'OPT_B', '', '', 1, 0, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('px');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0030 end');
    });

    /**
     * @tc.name   testOptionItem0031
     * @tc.number SUB_SCAN_OPTION_01_0031
     * @tc.desc   ScanOptionItem case 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0031 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(31, 'OPT_B', '', '', 2, 0, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('bit');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0031 end');
    });

    /**
     * @tc.name   testOptionItem0032
     * @tc.number SUB_SCAN_OPTION_01_0032
     * @tc.desc   ScanOptionItem case 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0032 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(32, 'OPT_B', '', '', 3, 0, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('mm');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0032 end');
    });

    /**
     * @tc.name   testOptionItem0033
     * @tc.number SUB_SCAN_OPTION_01_0033
     * @tc.desc   ScanOptionItem case 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0033 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(33, 'OPT_B', '', '', 4, 0, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('dpi');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0033 end');
    });

    /**
     * @tc.name   testOptionItem0034
     * @tc.number SUB_SCAN_OPTION_01_0034
     * @tc.desc   ScanOptionItem case 34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0034 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(34, 'OPT_B', '', '', 5, 0, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('%');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0034 end');
    });

    /**
     * @tc.name   testOptionItem0035
     * @tc.number SUB_SCAN_OPTION_01_0035
     * @tc.desc   ScanOptionItem case 35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0035 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(35, 'OPT_B', '', '', 6, 0, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('us');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0035 end');
    });

    /**
     * @tc.name   testOptionItem0036
     * @tc.number SUB_SCAN_OPTION_01_0036
     * @tc.desc   ScanOptionItem case 36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0036 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(36, 'OPT_B', '', '', 0, 1, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0036 end');
    });

    /**
     * @tc.name   testOptionItem0037
     * @tc.number SUB_SCAN_OPTION_01_0037
     * @tc.desc   ScanOptionItem case 37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0037 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(37, 'OPT_B', '', '', 1, 1, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('px');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0037 end');
    });

    /**
     * @tc.name   testOptionItem0038
     * @tc.number SUB_SCAN_OPTION_01_0038
     * @tc.desc   ScanOptionItem case 38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0038 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(38, 'OPT_B', '', '', 2, 1, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('bit');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0038 end');
    });

    /**
     * @tc.name   testOptionItem0039
     * @tc.number SUB_SCAN_OPTION_01_0039
     * @tc.desc   ScanOptionItem case 39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0039 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(39, 'OPT_B', '', '', 3, 1, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('mm');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0039 end');
    });

    /**
     * @tc.name   testOptionItem0040
     * @tc.number SUB_SCAN_OPTION_01_0040
     * @tc.desc   ScanOptionItem case 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0040 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(40, 'OPT_B', '', '', 4, 1, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('dpi');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0040 end');
    });

    /**
     * @tc.name   testOptionItem0041
     * @tc.number SUB_SCAN_OPTION_01_0041
     * @tc.desc   ScanOptionItem case 41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0041 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(41, 'OPT_B', '', '', 5, 1, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('%');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0041 end');
    });

    /**
     * @tc.name   testOptionItem0042
     * @tc.number SUB_SCAN_OPTION_01_0042
     * @tc.desc   ScanOptionItem case 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0042 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(42, 'OPT_B', '', '', 6, 1, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('us');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0042 end');
    });

    /**
     * @tc.name   testOptionItem0043
     * @tc.number SUB_SCAN_OPTION_01_0043
     * @tc.desc   ScanOptionItem case 43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0043 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(43, 'OPT_B', '', '', 0, 2, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0043 end');
    });

    /**
     * @tc.name   testOptionItem0044
     * @tc.number SUB_SCAN_OPTION_01_0044
     * @tc.desc   ScanOptionItem case 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0044 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(44, 'OPT_B', '', '', 1, 2, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('px');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0044 end');
    });

    /**
     * @tc.name   testOptionItem0045
     * @tc.number SUB_SCAN_OPTION_01_0045
     * @tc.desc   ScanOptionItem case 45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0045 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(45, 'OPT_B', '', '', 2, 2, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('bit');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0045 end');
    });

    /**
     * @tc.name   testOptionItem0046
     * @tc.number SUB_SCAN_OPTION_01_0046
     * @tc.desc   ScanOptionItem case 46
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0046 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(46, 'OPT_B', '', '', 3, 2, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('mm');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0046 end');
    });

    /**
     * @tc.name   testOptionItem0047
     * @tc.number SUB_SCAN_OPTION_01_0047
     * @tc.desc   ScanOptionItem case 47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0047 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(47, 'OPT_B', '', '', 4, 2, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('dpi');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0047 end');
    });

    /**
     * @tc.name   testOptionItem0048
     * @tc.number SUB_SCAN_OPTION_01_0048
     * @tc.desc   ScanOptionItem case 48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0048 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(48, 'OPT_B', '', '', 5, 2, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('%');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0048 end');
    });

    /**
     * @tc.name   testOptionItem0049
     * @tc.number SUB_SCAN_OPTION_01_0049
     * @tc.desc   ScanOptionItem case 49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0049 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(49, 'OPT_B', '', '', 6, 2, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('us');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0049 end');
    });

    /**
     * @tc.name   testOptionItem0050
     * @tc.number SUB_SCAN_OPTION_01_0050
     * @tc.desc   ScanOptionItem case 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0050 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(50, 'OPT_B', '', '', 0, 3, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0050 end');
    });

    /**
     * @tc.name   testOptionItem0051
     * @tc.number SUB_SCAN_OPTION_01_0051
     * @tc.desc   ScanOptionItem case 51
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0051 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(51, 'OPT_B', '', '', 1, 3, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('px');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0051 end');
    });

    /**
     * @tc.name   testOptionItem0052
     * @tc.number SUB_SCAN_OPTION_01_0052
     * @tc.desc   ScanOptionItem case 52
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0052 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(52, 'OPT_B', '', '', 2, 3, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('bit');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0052 end');
    });

    /**
     * @tc.name   testOptionItem0053
     * @tc.number SUB_SCAN_OPTION_01_0053
     * @tc.desc   ScanOptionItem case 53
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0053 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(53, 'OPT_B', '', '', 3, 3, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('mm');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0053 end');
    });

    /**
     * @tc.name   testOptionItem0054
     * @tc.number SUB_SCAN_OPTION_01_0054
     * @tc.desc   ScanOptionItem case 54
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0054 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(54, 'OPT_B', '', '', 4, 3, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('dpi');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0054 end');
    });

    /**
     * @tc.name   testOptionItem0055
     * @tc.number SUB_SCAN_OPTION_01_0055
     * @tc.desc   ScanOptionItem case 55
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0055 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(55, 'OPT_B', '', '', 5, 3, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('%');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0055 end');
    });

    /**
     * @tc.name   testOptionItem0056
     * @tc.number SUB_SCAN_OPTION_01_0056
     * @tc.desc   ScanOptionItem case 56
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0056 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(56, 'OPT_B', '', '', 6, 3, 3);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('OPT_B');
      expect(result.unitText).assertEqual('us');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0056 end');
    });

    /**
     * @tc.name   testOptionItem0057
     * @tc.number SUB_SCAN_OPTION_01_0057
     * @tc.desc   ScanOptionItem case 57
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0057 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(57, 'OPT_C', 'Paper size', '', 0, 0, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0057 end');
    });

    /**
     * @tc.name   testOptionItem0058
     * @tc.number SUB_SCAN_OPTION_01_0058
     * @tc.desc   ScanOptionItem case 58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0058 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(58, 'OPT_C', 'Paper size', '', 1, 0, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('px');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0058 end');
    });

    /**
     * @tc.name   testOptionItem0059
     * @tc.number SUB_SCAN_OPTION_01_0059
     * @tc.desc   ScanOptionItem case 59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0059 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(59, 'OPT_C', 'Paper size', '', 2, 0, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('bit');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0059 end');
    });

    /**
     * @tc.name   testOptionItem0060
     * @tc.number SUB_SCAN_OPTION_01_0060
     * @tc.desc   ScanOptionItem case 60
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0060 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(60, 'OPT_C', 'Paper size', '', 3, 0, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('mm');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0060 end');
    });

    /**
     * @tc.name   testOptionItem0061
     * @tc.number SUB_SCAN_OPTION_01_0061
     * @tc.desc   ScanOptionItem case 61
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0061 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(61, 'OPT_C', 'Paper size', '', 4, 0, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('dpi');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0061 end');
    });

    /**
     * @tc.name   testOptionItem0062
     * @tc.number SUB_SCAN_OPTION_01_0062
     * @tc.desc   ScanOptionItem case 62
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0062 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(62, 'OPT_C', 'Paper size', '', 5, 0, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('%');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0062 end');
    });

    /**
     * @tc.name   testOptionItem0063
     * @tc.number SUB_SCAN_OPTION_01_0063
     * @tc.desc   ScanOptionItem case 63
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0063 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(63, 'OPT_C', 'Paper size', '', 6, 0, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('us');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0063 end');
    });

    /**
     * @tc.name   testOptionItem0064
     * @tc.number SUB_SCAN_OPTION_01_0064
     * @tc.desc   ScanOptionItem case 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0064 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(64, 'OPT_C', 'Paper size', '', 0, 1, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0064 end');
    });

    /**
     * @tc.name   testOptionItem0065
     * @tc.number SUB_SCAN_OPTION_01_0065
     * @tc.desc   ScanOptionItem case 65
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0065 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(65, 'OPT_C', 'Paper size', '', 1, 1, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('px');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0065 end');
    });

    /**
     * @tc.name   testOptionItem0066
     * @tc.number SUB_SCAN_OPTION_01_0066
     * @tc.desc   ScanOptionItem case 66
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0066 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(66, 'OPT_C', 'Paper size', '', 2, 1, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('bit');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0066 end');
    });

    /**
     * @tc.name   testOptionItem0067
     * @tc.number SUB_SCAN_OPTION_01_0067
     * @tc.desc   ScanOptionItem case 67
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0067 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(67, 'OPT_C', 'Paper size', '', 3, 1, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('mm');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0067 end');
    });

    /**
     * @tc.name   testOptionItem0068
     * @tc.number SUB_SCAN_OPTION_01_0068
     * @tc.desc   ScanOptionItem case 68
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0068 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(68, 'OPT_C', 'Paper size', '', 4, 1, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('dpi');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0068 end');
    });

    /**
     * @tc.name   testOptionItem0069
     * @tc.number SUB_SCAN_OPTION_01_0069
     * @tc.desc   ScanOptionItem case 69
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0069 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(69, 'OPT_C', 'Paper size', '', 5, 1, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('%');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0069 end');
    });

    /**
     * @tc.name   testOptionItem0070
     * @tc.number SUB_SCAN_OPTION_01_0070
     * @tc.desc   ScanOptionItem case 70
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0070 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(70, 'OPT_C', 'Paper size', '', 6, 1, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('us');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0070 end');
    });

    /**
     * @tc.name   testOptionItem0071
     * @tc.number SUB_SCAN_OPTION_01_0071
     * @tc.desc   ScanOptionItem case 71
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0071 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(71, 'OPT_C', 'Paper size', '', 0, 2, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0071 end');
    });

    /**
     * @tc.name   testOptionItem0072
     * @tc.number SUB_SCAN_OPTION_01_0072
     * @tc.desc   ScanOptionItem case 72
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0072 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(72, 'OPT_C', 'Paper size', '', 1, 2, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('px');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0072 end');
    });

    /**
     * @tc.name   testOptionItem0073
     * @tc.number SUB_SCAN_OPTION_01_0073
     * @tc.desc   ScanOptionItem case 73
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0073 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(73, 'OPT_C', 'Paper size', '', 2, 2, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('bit');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0073 end');
    });

    /**
     * @tc.name   testOptionItem0074
     * @tc.number SUB_SCAN_OPTION_01_0074
     * @tc.desc   ScanOptionItem case 74
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0074 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(74, 'OPT_C', 'Paper size', '', 3, 2, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('mm');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0074 end');
    });

    /**
     * @tc.name   testOptionItem0075
     * @tc.number SUB_SCAN_OPTION_01_0075
     * @tc.desc   ScanOptionItem case 75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0075 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(75, 'OPT_C', 'Paper size', '', 4, 2, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('dpi');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0075 end');
    });

    /**
     * @tc.name   testOptionItem0076
     * @tc.number SUB_SCAN_OPTION_01_0076
     * @tc.desc   ScanOptionItem case 76
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0076 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(76, 'OPT_C', 'Paper size', '', 5, 2, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('%');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0076 end');
    });

    /**
     * @tc.name   testOptionItem0077
     * @tc.number SUB_SCAN_OPTION_01_0077
     * @tc.desc   ScanOptionItem case 77
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0077 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(77, 'OPT_C', 'Paper size', '', 6, 2, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('us');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0077 end');
    });

    /**
     * @tc.name   testOptionItem0078
     * @tc.number SUB_SCAN_OPTION_01_0078
     * @tc.desc   ScanOptionItem case 78
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0078 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(78, 'OPT_C', 'Paper size', '', 0, 3, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0078 end');
    });

    /**
     * @tc.name   testOptionItem0079
     * @tc.number SUB_SCAN_OPTION_01_0079
     * @tc.desc   ScanOptionItem case 79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0079 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(79, 'OPT_C', 'Paper size', '', 1, 3, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('px');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0079 end');
    });

    /**
     * @tc.name   testOptionItem0080
     * @tc.number SUB_SCAN_OPTION_01_0080
     * @tc.desc   ScanOptionItem case 80
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0080 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(80, 'OPT_C', 'Paper size', '', 2, 3, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('bit');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0080 end');
    });

    /**
     * @tc.name   testOptionItem0081
     * @tc.number SUB_SCAN_OPTION_01_0081
     * @tc.desc   ScanOptionItem case 81
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0081 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(81, 'OPT_C', 'Paper size', '', 3, 3, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('mm');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0081 end');
    });

    /**
     * @tc.name   testOptionItem0082
     * @tc.number SUB_SCAN_OPTION_01_0082
     * @tc.desc   ScanOptionItem case 82
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0082 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(82, 'OPT_C', 'Paper size', '', 4, 3, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('dpi');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0082 end');
    });

    /**
     * @tc.name   testOptionItem0083
     * @tc.number SUB_SCAN_OPTION_01_0083
     * @tc.desc   ScanOptionItem case 83
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0083 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(83, 'OPT_C', 'Paper size', '', 5, 3, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('%');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0083 end');
    });

    /**
     * @tc.name   testOptionItem0084
     * @tc.number SUB_SCAN_OPTION_01_0084
     * @tc.desc   ScanOptionItem case 84
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0084 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(84, 'OPT_C', 'Paper size', '', 6, 3, 2);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual('Paper size');
      expect(result.unitText).assertEqual('us');
      expect(result.detail).assertEqual('scan_option_no_description');
      expect(result.editable).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0084 end');
    });

    /**
     * @tc.name   testOptionItem0085
     * @tc.number SUB_SCAN_OPTION_01_0085
     * @tc.desc   read only entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0085 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(85, 'OPT_D', ' ', 'read only entry', 0, 0, 0);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual(' ');
      expect(result.unitText).assertEqual('');
      expect(result.detail).assertEqual('read only entry');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0085 end');
    });

    /**
     * @tc.name   testOptionItem0086
     * @tc.number SUB_SCAN_OPTION_01_0086
     * @tc.desc   read only entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0086 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(86, 'OPT_D', ' ', 'read only entry', 1, 0, 0);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual(' ');
      expect(result.unitText).assertEqual('px');
      expect(result.detail).assertEqual('read only entry');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0086 end');
    });

    /**
     * @tc.name   testOptionItem0087
     * @tc.number SUB_SCAN_OPTION_01_0087
     * @tc.desc   read only entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0087 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(87, 'OPT_D', ' ', 'read only entry', 2, 0, 0);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual(' ');
      expect(result.unitText).assertEqual('bit');
      expect(result.detail).assertEqual('read only entry');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0087 end');
    });

    /**
     * @tc.name   testOptionItem0088
     * @tc.number SUB_SCAN_OPTION_01_0088
     * @tc.desc   read only entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0088 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(88, 'OPT_D', ' ', 'read only entry', 3, 0, 0);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual(' ');
      expect(result.unitText).assertEqual('mm');
      expect(result.detail).assertEqual('read only entry');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0088 end');
    });

    /**
     * @tc.name   testOptionItem0089
     * @tc.number SUB_SCAN_OPTION_01_0089
     * @tc.desc   read only entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0089 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(89, 'OPT_D', ' ', 'read only entry', 4, 0, 0);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual(' ');
      expect(result.unitText).assertEqual('dpi');
      expect(result.detail).assertEqual('read only entry');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0089 end');
    });

    /**
     * @tc.name   testOptionItem0090
     * @tc.number SUB_SCAN_OPTION_01_0090
     * @tc.desc   read only entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionItem0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0090 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.param(90, 'OPT_D', ' ', 'read only entry', 5, 0, 0);
      const result: ScanOptionItem = ScanOptionModel.toItem(p);
      expect(result.title).assertEqual(' ');
      expect(result.unitText).assertEqual('%');
      expect(result.detail).assertEqual('read only entry');
      expect(result.editable).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionItem0090 end');
    });

  });
}
