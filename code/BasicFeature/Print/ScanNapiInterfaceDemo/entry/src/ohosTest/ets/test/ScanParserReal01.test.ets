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
import { ScanParameterBuilder } from '../../../main/ets/scan/model/ScanParameterBuilder';
import { ScanOptionValueParser } from '../../../main/ets/scan/model/ScanOptionValueParser';
import { scan } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanParserRealTest() {
  describe('ScanParserReal', () => {
    /**
     * @tc.number SUB_SCAN_PARSE_02_0001
     * @tc.name testParserReal0001
     * @tc.desc asNumber maps a BOOL true to one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParserReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParserReal0001 begin');
      const on: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', true);
      const off: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', false);
      expect(ScanOptionValueParser.asNumber(on)).assertEqual(1);
      expect(ScanOptionValueParser.asNumber(off)).assertEqual(0);
      expect(ScanOptionValueParser.asText(on)).assertEqual('on');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParserReal0001 end');
    });

    /**
     * @tc.number SUB_SCAN_PARSE_02_0002
     * @tc.name testParserReal0002
     * @tc.desc parseFixed rounds to two decimals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParserReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParserReal0002 begin');
      expect(ScanOptionValueParser.parseFixed('12.345')).assertEqual(12.35);
      expect(ScanOptionValueParser.parseFixed('abc')).assertEqual(0);
      expect(ScanOptionValueParser.parseFixed('')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParserReal0002 end');
    });

    /**
     * @tc.number SUB_SCAN_PARSE_02_0003
     * @tc.name testParserReal0003
     * @tc.desc clamp swaps inverted bounds before cutting
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParserReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParserReal0003 begin');
      expect(ScanOptionValueParser.clamp(5, 10, 0)).assertEqual(5);
      expect(ScanOptionValueParser.clamp(11, 10, 0)).assertEqual(10);
      expect(ScanOptionValueParser.clamp(-1, 10, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParserReal0003 end');
    });

    /**
     * @tc.number SUB_SCAN_PARSE_02_0004
     * @tc.name testParserReal0004
     * @tc.desc isNumeric rejects letters inside digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParserReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParserReal0004 begin');
      expect(ScanOptionValueParser.isNumeric('12.5')).assertTrue();
      expect(ScanOptionValueParser.isNumeric('12a5')).assertFalse();
      expect(ScanOptionValueParser.isNumeric('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParserReal0004 end');
    });

    /**
     * @tc.number SUB_SCAN_PARSE_02_0005
     * @tc.name testParserReal0005
     * @tc.desc compare orders INT values by their numeric content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParserReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParserReal0005 begin');
      const left: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '', false);
      const right: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 3, '', false);
      expect(ScanOptionValueParser.compare(left, right)).assertEqual(1);
      expect(ScanOptionValueParser.compare(right, left)).assertEqual(-1);
      expect(ScanOptionValueParser.compare(left, left)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParserReal0005 end');
    });

    /**
     * @tc.number SUB_SCAN_PARSE_02_0006
     * @tc.name testParserReal0006
     * @tc.desc describe marks missing fields with a dash
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParserReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParserReal0006 begin');
      const bare: scan.ScannerOptionValue = ScanParameterBuilder.bareOptionValue(1);
      const full: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, 'pdf', false);
      expect(ScanOptionValueParser.describe(bare)).assertEqual('type=1 num=- str=- bool=-');
      expect(ScanOptionValueParser.describe(full)).assertEqual('type=3 num=- str=pdf bool=-');
      expect(ScanOptionValueParser.rangeText(0, 10, 1)).assertEqual('0..10/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParserReal0006 end');
    });
  });
}
