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
import { ScanConstraintKind } from '../../../main/ets/scan/model/ScanOptionConstraint';
import { ScanParameterBuilder } from '../../../main/ets/scan/model/ScanParameterBuilder';
import { scan } from '@kit.BasicServicesKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanOptionRealTest() {
  describe('ScanOptionModel', () => {

    /**
     * @tc.name   testOptionReal0001
     * @tc.number SUB_SCAN_OPTION_02_0001
     * @tc.desc   unit text table covers all seven physical units
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0001 begin');
      const texts: string[] = ['', 'px', 'bit', 'mm', 'dpi', '%', 'us'];
      let covered: number = 0;
      for (let unit = 0; unit < texts.length; unit++) {
        const actual: string = ScanOptionModel.getUnitText(ScanParameterBuilder.unit(unit));
        if (actual === texts[unit]) {
          covered++;
        }
      }
      expect(covered).assertEqual(7);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(0))).assertEqual('');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(6))).assertEqual('us');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0001 end');
    });

    /**
     * @tc.name   testOptionReal0002
     * @tc.number SUB_SCAN_OPTION_02_0002
     * @tc.desc   roundFixed keeps two decimals and handles negatives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0002 begin');
      const up: number = ScanOptionModel.roundFixed(2.446);
      const down: number = ScanOptionModel.roundFixed(2.444);
      expect(up).assertEqual(2.45);
      expect(down).assertEqual(2.44);
      expect(ScanOptionModel.roundFixed(-2.444)).assertEqual(-2.44);
      expect(ScanOptionModel.roundFixed(0)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0002 end');
    });

    /**
     * @tc.name   testOptionReal0003
     * @tc.number SUB_SCAN_OPTION_02_0003
     * @tc.desc   trimZeros removes trailing zeros only after a decimal point
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0003 begin');
      expect(ScanOptionModel.trimZeros('2.50')).assertEqual('2.5');
      expect(ScanOptionModel.trimZeros('3.00')).assertEqual('3');
      expect(ScanOptionModel.trimZeros('0.00')).assertEqual('0');
      expect(ScanOptionModel.trimZeros('120')).assertEqual('120');
      expect(ScanOptionModel.trimZeros('0.10')).assertEqual('0.1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0003 end');
    });

    /**
     * @tc.name   testOptionReal0004
     * @tc.number SUB_SCAN_OPTION_02_0004
     * @tc.desc   formatNumber appends unit suffix after trimming zeros
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0004 begin');
      expect(ScanOptionModel.formatNumber(12.3456, ScanParameterBuilder.unit(0))).assertEqual('12.35');
      expect(ScanOptionModel.formatNumber(12, ScanParameterBuilder.unit(3))).assertEqual('12 mm');
      expect(ScanOptionModel.formatNumber(7.1, ScanParameterBuilder.unit(4))).assertEqual('7.1 dpi');
      expect(ScanOptionModel.formatNumber(-3.456, ScanParameterBuilder.unit(6))).assertEqual('-3.46 us');
      expect(ScanOptionModel.formatNumber(0, ScanParameterBuilder.unit(5))).assertEqual('0 %');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0004 end');
    });

    /**
     * @tc.name   testOptionReal0005
     * @tc.number SUB_SCAN_OPTION_02_0005
     * @tc.desc   bool value falls back to false when the field is absent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0005 begin');
      const on: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(ScanParameterBuilder.TYPE_BOOL, 0, '', true);
      const off: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(
        ScanParameterBuilder.TYPE_BOOL, 0, '', false);
      const bare: scan.ScannerOptionValue = ScanParameterBuilder.bareOptionValue(ScanParameterBuilder.TYPE_BOOL);
      expect(ScanOptionModel.formatValue(on)).assertEqual('true');
      expect(ScanOptionModel.formatValue(off)).assertEqual('false');
      expect(ScanOptionModel.formatValue(bare)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0005 end');
    });

    /**
     * @tc.name   testOptionReal0006
     * @tc.number SUB_SCAN_OPTION_02_0006
     * @tc.desc   int value is rounded half up and negatives follow Math.round
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0006 begin');
      const high: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(
        ScanParameterBuilder.TYPE_INT, 3.6, '', false);
      const half: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(
        ScanParameterBuilder.TYPE_INT, 2.5, '', false);
      const negative: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(
        ScanParameterBuilder.TYPE_INT, -3.5, '', false);
      expect(ScanOptionModel.formatValue(high)).assertEqual('4');
      expect(ScanOptionModel.formatValue(half)).assertEqual('3');
      expect(ScanOptionModel.formatValue(negative)).assertEqual('-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0006 end');
    });

    /**
     * @tc.name   testOptionReal0007
     * @tc.number SUB_SCAN_OPTION_02_0007
     * @tc.desc   fixed value keeps two decimals then trims trailing zeros
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0007 begin');
      const up: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(
        ScanParameterBuilder.TYPE_FIXED, 2.346, '', false);
      const half: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(
        ScanParameterBuilder.TYPE_FIXED, 1.5, '', false);
      const whole: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(
        ScanParameterBuilder.TYPE_FIXED, 1, '', false);
      expect(ScanOptionModel.formatValue(up)).assertEqual('2.35');
      expect(ScanOptionModel.formatValue(half)).assertEqual('1.5');
      expect(ScanOptionModel.formatValue(whole)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0007 end');
    });

    /**
     * @tc.name   testOptionReal0008
     * @tc.number SUB_SCAN_OPTION_02_0008
     * @tc.desc   string value is returned as is and empty text is preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0008 begin');
      const named: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(
        ScanParameterBuilder.TYPE_STRING, 0, 'gray', false);
      const blank: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(
        ScanParameterBuilder.TYPE_STRING, 0, '', true);
      const bare: scan.ScannerOptionValue = ScanParameterBuilder.bareOptionValue(ScanParameterBuilder.TYPE_STRING);
      expect(ScanOptionModel.formatValue(named)).assertEqual('gray');
      expect(ScanOptionModel.formatValue(blank)).assertEqual('');
      expect(ScanOptionModel.formatValue(bare)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0008 end');
    });

    /**
     * @tc.name   testOptionReal0009
     * @tc.number SUB_SCAN_OPTION_02_0009
     * @tc.desc   title falls back to name and detail falls back to the resource key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0009 begin');
      const fallback: scan.ScannerParameter = ScanParameterBuilder.param(1, 'OPT_A', '', '', 0, 0, 1);
      const kept: scan.ScannerParameter = ScanParameterBuilder.param(2, 'OPT_B', 'Resolution', 'dots per inch',
        0, 0, 1);
      expect(ScanOptionModel.getTitle(fallback)).assertEqual('OPT_A');
      expect(ScanOptionModel.getDetail(fallback)).assertEqual('scan_option_no_description');
      expect(ScanOptionModel.getTitle(kept)).assertEqual('Resolution');
      expect(ScanOptionModel.getDetail(kept)).assertEqual('dots per inch');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0009 end');
    });

    /**
     * @tc.name   testOptionReal0010
     * @tc.number SUB_SCAN_OPTION_02_0010
     * @tc.desc   toItem copies every field of the source parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0010 begin');
      const param: scan.ScannerParameter = ScanParameterBuilder.param(3, 'OPT_RES', 'Resolution', '', 4, 1, 1);
      const item: ScanOptionItem = ScanOptionModel.toItem(param);
      expect(item.optionIndex).assertEqual(3);
      expect(item.optionName).assertEqual('OPT_RES');
      expect(item.title).assertEqual('Resolution');
      expect(item.detail).assertEqual(ScanOptionModel.NO_DESCRIPTION_KEY);
      expect(item.unitText).assertEqual('dpi');
      expect(item.editable).assertTrue();
      expect(item.kind).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0010 end');
    });

    /**
     * @tc.name   testOptionReal0011
     * @tc.number SUB_SCAN_OPTION_02_0011
     * @tc.desc   constraint type maps to the four option kinds in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0011 begin');
      const kinds: ScanConstraintKind[] = [ScanConstraintKind.NONE, ScanConstraintKind.RANGE,
        ScanConstraintKind.NUMBER_LIST, ScanConstraintKind.STRING_LIST];
      let matched: number = 0;
      for (let c = 0; c < kinds.length; c++) {
        const param: scan.ScannerParameter = ScanParameterBuilder.param(c, 'OPT_K', 'Kind', 'kind probe', 0, c, 1);
        if (ScanOptionModel.toItem(param).kind === kinds[c]) {
          matched++;
        }
      }
      expect(matched).assertEqual(4);
      const noneItem: ScanOptionItem = ScanOptionModel.toItem(
        ScanParameterBuilder.param(0, 'OPT_Z', 'Z', 'z', 0, 0, 1));
      expect(noneItem.kind).assertEqual(ScanConstraintKind.NONE);
      expect(noneItem.editable).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0011 end');
    });

    /**
     * @tc.name   testOptionReal0012
     * @tc.number SUB_SCAN_OPTION_02_0012
     * @tc.desc   buildItems keeps the source order of parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0012 begin');
      const params: scan.ScannerParameter[] = [
        ScanParameterBuilder.param(2, 'OPT_C', 'Third', 'c', 1, 0, 1),
        ScanParameterBuilder.param(1, 'OPT_B', 'Second', 'b', 0, 1, 1),
        ScanParameterBuilder.param(3, 'OPT_D', 'Fourth', 'd', 3, 2, 1)
      ];
      const items: ScanOptionItem[] = ScanOptionModel.buildItems(params);
      expect(items.length).assertEqual(3);
      expect(ScanOptionModel.toIndexList(items).join(',')).assertEqual('2,1,3');
      expect(items[0].unitText).assertEqual('px');
      expect(items[1].kind).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0012 end');
    });

    /**
     * @tc.name   testOptionReal0013
     * @tc.number SUB_SCAN_OPTION_02_0013
     * @tc.desc   buildItems returns an empty list for empty input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0013 begin');
      const items: ScanOptionItem[] = ScanOptionModel.buildItems(ScanParameterBuilder.noParams());
      expect(items.length).assertEqual(0);
      expect(ScanOptionModel.countEditable(items)).assertEqual(0);
      expect(ScanOptionModel.findItem(items, 0) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0013 end');
    });

    /**
     * @tc.name   testOptionReal0014
     * @tc.number SUB_SCAN_OPTION_02_0014
     * @tc.desc   findItem locates by option index and reports misses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0014 begin');
      const params: scan.ScannerParameter[] = [
        ScanParameterBuilder.param(2, 'OPT_C', 'Third', 'c', 1, 0, 1),
        ScanParameterBuilder.param(5, 'OPT_E', 'Fifth', 'e', 2, 2, 1)
      ];
      const items: ScanOptionItem[] = ScanOptionModel.buildItems(params);
      const hit: ScanOptionItem | undefined = ScanOptionModel.findItem(items, 5);
      expect(hit === undefined).assertFalse();
      expect(ScanOptionModel.findItem(items, 99) === undefined).assertTrue();
      expect(ScanOptionModel.findItem(items, 2) === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0014 end');
    });

    /**
     * @tc.name   testOptionReal0015
     * @tc.number SUB_SCAN_OPTION_02_0015
     * @tc.desc   countEditable ignores parameters without a constraint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0015 begin');
      const params: scan.ScannerParameter[] = [
        ScanParameterBuilder.param(1, 'OPT_A', 'A', 'a', 0, 0, 1),
        ScanParameterBuilder.param(2, 'OPT_B', 'B', 'b', 1, 1, 1),
        ScanParameterBuilder.param(3, 'OPT_C', 'C', 'c', 2, 2, 1),
        ScanParameterBuilder.param(4, 'OPT_D', 'D', 'd', 3, 3, 3)
      ];
      const items: ScanOptionItem[] = ScanOptionModel.buildItems(params);
      expect(ScanOptionModel.countEditable(items)).assertEqual(3);
      expect(items[0].editable).assertFalse();
      expect(items[3].editable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0015 end');
    });

    /**
     * @tc.name   testOptionReal0016
     * @tc.number SUB_SCAN_OPTION_02_0016
     * @tc.desc   toIndexList preserves order and yields an empty list for empty input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0016 begin');
      const params: scan.ScannerParameter[] = [
        ScanParameterBuilder.param(4, 'OPT_D', 'D', 'd', 3, 1, 1),
        ScanParameterBuilder.param(1, 'OPT_A', 'A', 'a', 0, 0, 1)
      ];
      const indexes: number[] = ScanOptionModel.toIndexList(ScanOptionModel.buildItems(params));
      expect(indexes.join('|')).assertEqual('4|1');
      expect(indexes[0]).assertEqual(4);
      expect(indexes.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0016 end');
    });

    /**
     * @tc.name   testOptionReal0017
     * @tc.number SUB_SCAN_OPTION_02_0017
     * @tc.desc   sortByIndex sorts a copy and leaves the input untouched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0017 begin');
      const params: scan.ScannerParameter[] = [
        ScanParameterBuilder.param(3, 'OPT_C', 'C', 'c', 0, 0, 1),
        ScanParameterBuilder.param(1, 'OPT_A', 'A', 'a', 0, 1, 1),
        ScanParameterBuilder.param(2, 'OPT_B', 'B', 'b', 0, 2, 1)
      ];
      const items: ScanOptionItem[] = ScanOptionModel.buildItems(params);
      const sorted: ScanOptionItem[] = ScanOptionModel.sortByIndex(items);
      expect(ScanOptionModel.toIndexList(sorted).join(',')).assertEqual('1,2,3');
      expect(ScanOptionModel.toIndexList(items).join(',')).assertEqual('3,1,2');
      expect(sorted[0].optionIndex).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0017 end');
    });

    /**
     * @tc.name   testOptionReal0018
     * @tc.number SUB_SCAN_OPTION_02_0018
     * @tc.desc   filterByKind keeps range entries in source order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0018 begin');
      const ranged: ScanOptionItem[] = ScanOptionModel.filterByKind(mixedItems(), ScanConstraintKind.RANGE);
      expect(ranged.length).assertEqual(2);
      expect(ranged[0].optionIndex).assertEqual(2);
      expect(ranged[1].optionIndex).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0018 end');
    });

    /**
     * @tc.name   testOptionReal0019
     * @tc.number SUB_SCAN_OPTION_02_0019
     * @tc.desc   filterByKind returns the single number list entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0019 begin');
      const listed: ScanOptionItem[] = ScanOptionModel.filterByKind(mixedItems(), ScanConstraintKind.NUMBER_LIST);
      expect(listed.length).assertEqual(1);
      expect(listed[0].optionIndex).assertEqual(4);
      expect(listed[0].title).assertEqual('Fourth');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0019 end');
    });

    /**
     * @tc.name   testOptionReal0020
     * @tc.number SUB_SCAN_OPTION_02_0020
     * @tc.desc   filterByKind keeps both string list entries and their units
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0020 begin');
      const texts: ScanOptionItem[] = ScanOptionModel.filterByKind(mixedItems(), ScanConstraintKind.STRING_LIST);
      expect(texts.length).assertEqual(2);
      expect(ScanOptionModel.toIndexList(texts).join(',')).assertEqual('5,6');
      expect(texts[0].unitText).assertEqual('%');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0020 end');
    });

    /**
     * @tc.name   testOptionReal0021
     * @tc.number SUB_SCAN_OPTION_02_0021
     * @tc.desc   filterByKind finds the single unconstrained entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0021 begin');
      const plain: ScanOptionItem[] = ScanOptionModel.filterByKind(mixedItems(), ScanConstraintKind.NONE);
      expect(plain.length).assertEqual(1);
      expect(plain[0].optionIndex).assertEqual(1);
      expect(plain[0].editable).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0021 end');
    });

    /**
     * @tc.name   testOptionReal0022
     * @tc.number SUB_SCAN_OPTION_02_0022
     * @tc.desc   documented constants stay stable for resource binding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0022 begin');
      expect(ScanOptionModel.NO_DESCRIPTION_KEY).assertEqual('scan_option_no_description');
      expect(ScanOptionModel.FIXED_DIGITS).assertEqual(2);
      expect(ScanOptionModel.roundFixed(1 / 3)).assertEqual(0.33);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0022 end');
    });

    /**
     * @tc.name   testOptionReal0023
     * @tc.number SUB_SCAN_OPTION_02_0023
     * @tc.desc   out of range unit index degrades to no unit text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0023 begin');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(9))).assertEqual('');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(-1))).assertEqual('');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(7))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0023 end');
    });

    /**
     * @tc.name   testOptionReal0024
     * @tc.number SUB_SCAN_OPTION_02_0024
     * @tc.desc   numeric value types degrade to empty text when numValue is absent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0024 begin');
      const bareFixed: scan.ScannerOptionValue = ScanParameterBuilder.bareOptionValue(ScanParameterBuilder.TYPE_FIXED);
      const bareInt: scan.ScannerOptionValue = ScanParameterBuilder.bareOptionValue(ScanParameterBuilder.TYPE_INT);
      const mixed: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(
        ScanParameterBuilder.TYPE_FIXED, 5.5, 'ignored', true);
      expect(ScanOptionModel.formatValue(bareFixed)).assertEqual('');
      expect(ScanOptionModel.formatValue(bareInt)).assertEqual('');
      expect(ScanOptionModel.formatValue(mixed)).assertEqual('5.5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionReal0024 end');
    });
  });
}

/**
 * 固定组合的参数表：无约束 1 项、区间 2 项、整数列表 1 项、字符串列表 2 项。
 */
function mixedItems(): ScanOptionItem[] {
  const params: scan.ScannerParameter[] = [
    ScanParameterBuilder.param(1, 'OPT_A', 'First', 'a', 0, 0, 1),
    ScanParameterBuilder.param(2, 'OPT_B', 'Second', 'b', 1, 1, 1),
    ScanParameterBuilder.param(3, 'OPT_C', 'Third', 'c', 2, 1, 1),
    ScanParameterBuilder.param(4, 'OPT_D', 'Fourth', 'd', 3, 2, 1),
    ScanParameterBuilder.param(5, 'OPT_E', 'Fifth', 'e', 5, 3, 3),
    ScanParameterBuilder.param(6, 'OPT_F', 'Sixth', 'f', 4, 3, 3)
  ];
  return ScanOptionModel.buildItems(params);
}
