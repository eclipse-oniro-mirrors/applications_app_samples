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
import { ScanConstraintKind } from '../../../main/ets/scan/model/ScanOptionConstraint';
import { ScanOptionItem, ScanOptionModel } from '../../../main/ets/scan/model/ScanOptionViewModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanOptionMatrixRealTest() {
  describe('ScanOptionMatrixReal', () => {
    /**
     * @tc.number SUB_SCAN_OPMATRIX_02_0001
     * @tc.name testOptionMatrixReal0001
     * @tc.desc formatNumber appends the unit suffix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testOptionMatrixReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionMatrixReal0001 begin');
      expect(ScanOptionModel.formatNumber(5, scan.PhysicalUnit.SCAN_UNIT_MM)).assertEqual('5 mm');
      expect(ScanOptionModel.formatNumber(5, scan.PhysicalUnit.SCAN_UNIT_PERCENT)).assertEqual('5 %');
      expect(ScanOptionModel.formatNumber(5, scan.PhysicalUnit.SCAN_UNIT_NONE)).assertEqual('5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionMatrixReal0001 end');
    });

    /**
     * @tc.number SUB_SCAN_OPMATRIX_02_0002
     * @tc.name testOptionMatrixReal0002
     * @tc.desc toItem maps constraint kind and editable flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testOptionMatrixReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionMatrixReal0002 begin');
      const rangeItem: ScanOptionItem = ScanOptionModel.toItem(ScanParameterBuilder.intRange(0, 100, 1));
      const freeItem: ScanOptionItem = ScanOptionModel.toItem(ScanParameterBuilder.free(1));
      expect(rangeItem.kind).assertEqual(ScanConstraintKind.RANGE);
      expect(rangeItem.editable).assertTrue();
      expect(freeItem.editable).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionMatrixReal0002 end');
    });

    /**
     * @tc.number SUB_SCAN_OPMATRIX_02_0003
     * @tc.name testOptionMatrixReal0003
     * @tc.desc getTitle falls back to the option name
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testOptionMatrixReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionMatrixReal0003 begin');
      const named: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', '', '', 0, 0, 0);
      const titled: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', '', 0, 0, 0);
      expect(ScanOptionModel.getTitle(named)).assertEqual('k');
      expect(ScanOptionModel.getTitle(titled)).assertEqual('t');
      expect(ScanOptionModel.getTitle(named)).assertEqual(named.optionName);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionMatrixReal0003 end');
    });

    /**
     * @tc.number SUB_SCAN_OPMATRIX_02_0004
     * @tc.name testOptionMatrixReal0004
     * @tc.desc getDetail falls back to the no-description key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testOptionMatrixReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionMatrixReal0004 begin');
      const empty: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', '', 0, 0, 0);
      const described: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 0);
      expect(ScanOptionModel.getDetail(empty)).assertEqual('scan_option_no_description');
      expect(ScanOptionModel.getDetail(described)).assertEqual('d');
      expect(ScanOptionModel.NO_DESCRIPTION_KEY).assertEqual('scan_option_no_description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionMatrixReal0004 end');
    });

    /**
     * @tc.number SUB_SCAN_OPMATRIX_02_0005
     * @tc.name testOptionMatrixReal0005
     * @tc.desc findItem locates by option index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testOptionMatrixReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionMatrixReal0005 begin');
      const items: ScanOptionItem[] = ScanOptionModel.buildItems([
        ScanParameterBuilder.param(3, 'a', 'ta', 'da', 0, 0, 0),
        ScanParameterBuilder.param(7, 'b', 'tb', 'db', 0, 0, 0)
      ]);
      const hit: ScanOptionItem | undefined = ScanOptionModel.findItem(items, 7);
      expect(hit === undefined).assertFalse();
      if (hit !== undefined) {
        expect(hit.optionName).assertEqual('b');
      }
      expect(items.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionMatrixReal0005 end');
    });

    /**
     * @tc.number SUB_SCAN_OPMATRIX_02_0006
     * @tc.name testOptionMatrixReal0006
     * @tc.desc sortByIndex orders items ascending
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testOptionMatrixReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionMatrixReal0006 begin');
      const items: ScanOptionItem[] = ScanOptionModel.buildItems([
        ScanParameterBuilder.param(9, 'c', 'tc', 'dc', 0, 0, 0),
        ScanParameterBuilder.param(1, 'a', 'ta', 'da', 0, 0, 0),
        ScanParameterBuilder.param(5, 'b', 'tb', 'db', 0, 0, 0)
      ]);
      const sorted: ScanOptionItem[] = ScanOptionModel.sortByIndex(items);
      expect(sorted[0].optionIndex).assertEqual(1);
      expect(sorted[2].optionIndex).assertEqual(9);
      expect(sorted.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionMatrixReal0006 end');
    });
  });
}
