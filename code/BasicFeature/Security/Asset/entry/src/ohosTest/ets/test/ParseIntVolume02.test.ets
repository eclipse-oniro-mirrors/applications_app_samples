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
import { myparseInt } from '../../../main/ets/common/Logger';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Asset]';

export default function parseIntVolume02() {
  describe('ParseIntVolume02Test', () => {

    /**
     * @tc.name   testParseInt020151
     * @tc.number SUB_ASSET_PARSEINT_0151
     * @tc.desc   十六进制与八进制解析结果符合 parseInt 语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020151 begin');
      const hex: number = myparseInt('ff', 16);
      const oct: number = myparseInt('17', 8);
      expect(hex).assertEqual(255);
      expect(oct).assertEqual(15);
      expect(myparseInt(' 42 ', 10)).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020151 end');
    })

    /**
     * @tc.name   testParseInt020152
     * @tc.number SUB_ASSET_PARSEINT_0152
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020152 begin');
      const result: number = myparseInt("8", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8));
      expect(result).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("8"));
      expect(String(result)).assertEqual("8");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020152 end');
    })

    /**
     * @tc.name   testParseInt020153
     * @tc.number SUB_ASSET_PARSEINT_0153
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020153 begin');
      const result: number = myparseInt("15", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(15));
      expect(result).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("15"));
      expect(String(result)).assertEqual("15");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020153 end');
    })

    /**
     * @tc.name   testParseInt020154
     * @tc.number SUB_ASSET_PARSEINT_0154
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020154 begin');
      const result: number = myparseInt("22", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(22));
      expect(result).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("22"));
      expect(String(result)).assertEqual("22");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020154 end');
    })

    /**
     * @tc.name   testParseInt020155
     * @tc.number SUB_ASSET_PARSEINT_0155
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020155 begin');
      const result: number = myparseInt("29", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(29));
      expect(result).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("29"));
      expect(String(result)).assertEqual("29");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020155 end');
    })

    /**
     * @tc.name   testParseInt020156
     * @tc.number SUB_ASSET_PARSEINT_0156
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020156 begin');
      const result: number = myparseInt("36", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(36));
      expect(result).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("36"));
      expect(String(result)).assertEqual("36");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020156 end');
    })

    /**
     * @tc.name   testParseInt020157
     * @tc.number SUB_ASSET_PARSEINT_0157
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020157 begin');
      const result: number = myparseInt("43", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(43));
      expect(result).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("43"));
      expect(String(result)).assertEqual("43");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020157 end');
    })

    /**
     * @tc.name   testParseInt020158
     * @tc.number SUB_ASSET_PARSEINT_0158
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020158 begin');
      const result: number = myparseInt("50", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(50));
      expect(result).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("50"));
      expect(String(result)).assertEqual("50");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020158 end');
    })

    /**
     * @tc.name   testParseInt020159
     * @tc.number SUB_ASSET_PARSEINT_0159
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020159 begin');
      const result: number = myparseInt("57", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(57));
      expect(result).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("57"));
      expect(String(result)).assertEqual("57");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020159 end');
    })

    /**
     * @tc.name   testParseInt020160
     * @tc.number SUB_ASSET_PARSEINT_0160
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020160 begin');
      const result: number = myparseInt("64", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(64));
      expect(result).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("64"));
      expect(String(result)).assertEqual("64");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020160 end');
    })

    /**
     * @tc.name   testParseInt020161
     * @tc.number SUB_ASSET_PARSEINT_0161
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020161 begin');
      const result: number = myparseInt("71", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(71));
      expect(result).assertEqual(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("71"));
      expect(String(result)).assertEqual("71");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020161 end');
    })

    /**
     * @tc.name   testParseInt020162
     * @tc.number SUB_ASSET_PARSEINT_0162
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020162 begin');
      const result: number = myparseInt("78", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(78));
      expect(result).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("78"));
      expect(String(result)).assertEqual("78");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020162 end');
    })

    /**
     * @tc.name   testParseInt020163
     * @tc.number SUB_ASSET_PARSEINT_0163
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020163 begin');
      const result: number = myparseInt("85", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(85));
      expect(result).assertEqual(85);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("85"));
      expect(String(result)).assertEqual("85");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020163 end');
    })

    /**
     * @tc.name   testParseInt020164
     * @tc.number SUB_ASSET_PARSEINT_0164
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020164 begin');
      const result: number = myparseInt("92", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(92));
      expect(result).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("92"));
      expect(String(result)).assertEqual("92");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020164 end');
    })

    /**
     * @tc.name   testParseInt020165
     * @tc.number SUB_ASSET_PARSEINT_0165
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020165 begin');
      const result: number = myparseInt("99", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(99));
      expect(result).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("99"));
      expect(String(result)).assertEqual("99");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020165 end');
    })

    /**
     * @tc.name   testParseInt020166
     * @tc.number SUB_ASSET_PARSEINT_0166
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020166 begin');
      const result: number = myparseInt("106", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(106));
      expect(result).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("106"));
      expect(String(result)).assertEqual("106");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020166 end');
    })

    /**
     * @tc.name   testParseInt020167
     * @tc.number SUB_ASSET_PARSEINT_0167
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020167 begin');
      const result: number = myparseInt("113", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(113));
      expect(result).assertEqual(113);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("113"));
      expect(String(result)).assertEqual("113");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020167 end');
    })

    /**
     * @tc.name   testParseInt020168
     * @tc.number SUB_ASSET_PARSEINT_0168
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020168 begin');
      const result: number = myparseInt("120", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("120"));
      expect(String(result)).assertEqual("120");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020168 end');
    })

    /**
     * @tc.name   testParseInt020169
     * @tc.number SUB_ASSET_PARSEINT_0169
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020169 begin');
      const result: number = myparseInt("127", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(127));
      expect(result).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("127"));
      expect(String(result)).assertEqual("127");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020169 end');
    })

    /**
     * @tc.name   testParseInt020170
     * @tc.number SUB_ASSET_PARSEINT_0170
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020170 begin');
      const result: number = myparseInt("134", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(134));
      expect(result).assertEqual(134);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("134"));
      expect(String(result)).assertEqual("134");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020170 end');
    })

    /**
     * @tc.name   testParseInt020171
     * @tc.number SUB_ASSET_PARSEINT_0171
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020171 begin');
      const result: number = myparseInt("141", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(141));
      expect(result).assertEqual(141);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("141"));
      expect(String(result)).assertEqual("141");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020171 end');
    })

    /**
     * @tc.name   testParseInt020172
     * @tc.number SUB_ASSET_PARSEINT_0172
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020172 begin');
      const result: number = myparseInt("148", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(148));
      expect(result).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("148"));
      expect(String(result)).assertEqual("148");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020172 end');
    })

    /**
     * @tc.name   testParseInt020173
     * @tc.number SUB_ASSET_PARSEINT_0173
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020173 begin');
      const result: number = myparseInt("155", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(155));
      expect(result).assertEqual(155);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("155"));
      expect(String(result)).assertEqual("155");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020173 end');
    })

    /**
     * @tc.name   testParseInt020174
     * @tc.number SUB_ASSET_PARSEINT_0174
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020174 begin');
      const result: number = myparseInt("162", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(162));
      expect(result).assertEqual(162);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("162"));
      expect(String(result)).assertEqual("162");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020174 end');
    })

    /**
     * @tc.name   testParseInt020175
     * @tc.number SUB_ASSET_PARSEINT_0175
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020175 begin');
      const result: number = myparseInt("169", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(169));
      expect(result).assertEqual(169);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("169"));
      expect(String(result)).assertEqual("169");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020175 end');
    })

    /**
     * @tc.name   testParseInt020176
     * @tc.number SUB_ASSET_PARSEINT_0176
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020176 begin');
      const result: number = myparseInt("176", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(176));
      expect(result).assertEqual(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("176"));
      expect(String(result)).assertEqual("176");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020176 end');
    })

    /**
     * @tc.name   testParseInt020177
     * @tc.number SUB_ASSET_PARSEINT_0177
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020177 begin');
      const result: number = myparseInt("183", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(183));
      expect(result).assertEqual(183);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("183"));
      expect(String(result)).assertEqual("183");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020177 end');
    })

    /**
     * @tc.name   testParseInt020178
     * @tc.number SUB_ASSET_PARSEINT_0178
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020178 begin');
      const result: number = myparseInt("190", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(190));
      expect(result).assertEqual(190);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("190"));
      expect(String(result)).assertEqual("190");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020178 end');
    })

    /**
     * @tc.name   testParseInt020179
     * @tc.number SUB_ASSET_PARSEINT_0179
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020179 begin');
      const result: number = myparseInt("197", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(197));
      expect(result).assertEqual(197);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("197"));
      expect(String(result)).assertEqual("197");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020179 end');
    })

    /**
     * @tc.name   testParseInt020180
     * @tc.number SUB_ASSET_PARSEINT_0180
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020180 begin');
      const result: number = myparseInt("204", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(204));
      expect(result).assertEqual(204);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("204"));
      expect(String(result)).assertEqual("204");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020180 end');
    })

    /**
     * @tc.name   testParseInt020181
     * @tc.number SUB_ASSET_PARSEINT_0181
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020181 begin');
      const result: number = myparseInt("211", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(211));
      expect(result).assertEqual(211);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("211"));
      expect(String(result)).assertEqual("211");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020181 end');
    })

    /**
     * @tc.name   testParseInt020182
     * @tc.number SUB_ASSET_PARSEINT_0182
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020182 begin');
      const result: number = myparseInt("218", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(218));
      expect(result).assertEqual(218);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("218"));
      expect(String(result)).assertEqual("218");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020182 end');
    })

    /**
     * @tc.name   testParseInt020183
     * @tc.number SUB_ASSET_PARSEINT_0183
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020183 begin');
      const result: number = myparseInt("225", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(225));
      expect(result).assertEqual(225);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("225"));
      expect(String(result)).assertEqual("225");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020183 end');
    })

    /**
     * @tc.name   testParseInt020184
     * @tc.number SUB_ASSET_PARSEINT_0184
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020184 begin');
      const result: number = myparseInt("232", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(232));
      expect(result).assertEqual(232);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("232"));
      expect(String(result)).assertEqual("232");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020184 end');
    })

    /**
     * @tc.name   testParseInt020185
     * @tc.number SUB_ASSET_PARSEINT_0185
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020185 begin');
      const result: number = myparseInt("239", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(239));
      expect(result).assertEqual(239);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("239"));
      expect(String(result)).assertEqual("239");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020185 end');
    })

    /**
     * @tc.name   testParseInt020186
     * @tc.number SUB_ASSET_PARSEINT_0186
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020186 begin');
      const result: number = myparseInt("246", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(246));
      expect(result).assertEqual(246);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("246"));
      expect(String(result)).assertEqual("246");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020186 end');
    })

    /**
     * @tc.name   testParseInt020187
     * @tc.number SUB_ASSET_PARSEINT_0187
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020187 begin');
      const result: number = myparseInt("253", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(253));
      expect(result).assertEqual(253);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("253"));
      expect(String(result)).assertEqual("253");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020187 end');
    })

    /**
     * @tc.name   testParseInt020188
     * @tc.number SUB_ASSET_PARSEINT_0188
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020188 begin');
      const result: number = myparseInt("260", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(260));
      expect(result).assertEqual(260);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("260"));
      expect(String(result)).assertEqual("260");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020188 end');
    })

    /**
     * @tc.name   testParseInt020189
     * @tc.number SUB_ASSET_PARSEINT_0189
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020189 begin');
      const result: number = myparseInt("267", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(267));
      expect(result).assertEqual(267);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("267"));
      expect(String(result)).assertEqual("267");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020189 end');
    })

    /**
     * @tc.name   testParseInt020190
     * @tc.number SUB_ASSET_PARSEINT_0190
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020190 begin');
      const result: number = myparseInt("274", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(274));
      expect(result).assertEqual(274);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("274"));
      expect(String(result)).assertEqual("274");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020190 end');
    })

    /**
     * @tc.name   testParseInt020191
     * @tc.number SUB_ASSET_PARSEINT_0191
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020191 begin');
      const result: number = myparseInt("281", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(281));
      expect(result).assertEqual(281);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("281"));
      expect(String(result)).assertEqual("281");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020191 end');
    })

    /**
     * @tc.name   testParseInt020192
     * @tc.number SUB_ASSET_PARSEINT_0192
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020192 begin');
      const result: number = myparseInt("288", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(288));
      expect(result).assertEqual(288);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("288"));
      expect(String(result)).assertEqual("288");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020192 end');
    })

    /**
     * @tc.name   testParseInt020193
     * @tc.number SUB_ASSET_PARSEINT_0193
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020193 begin');
      const result: number = myparseInt("295", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(295));
      expect(result).assertEqual(295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("295"));
      expect(String(result)).assertEqual("295");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020193 end');
    })

    /**
     * @tc.name   testParseInt020194
     * @tc.number SUB_ASSET_PARSEINT_0194
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020194 begin');
      const result: number = myparseInt("302", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(302));
      expect(result).assertEqual(302);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("302"));
      expect(String(result)).assertEqual("302");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020194 end');
    })

    /**
     * @tc.name   testParseInt020195
     * @tc.number SUB_ASSET_PARSEINT_0195
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020195 begin');
      const result: number = myparseInt("309", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(309));
      expect(result).assertEqual(309);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("309"));
      expect(String(result)).assertEqual("309");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020195 end');
    })

    /**
     * @tc.name   testParseInt020196
     * @tc.number SUB_ASSET_PARSEINT_0196
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020196 begin');
      const result: number = myparseInt("316", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(316));
      expect(result).assertEqual(316);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("316"));
      expect(String(result)).assertEqual("316");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020196 end');
    })

    /**
     * @tc.name   testParseInt020197
     * @tc.number SUB_ASSET_PARSEINT_0197
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020197 begin');
      const result: number = myparseInt("323", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(323));
      expect(result).assertEqual(323);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("323"));
      expect(String(result)).assertEqual("323");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020197 end');
    })

    /**
     * @tc.name   testParseInt020198
     * @tc.number SUB_ASSET_PARSEINT_0198
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020198 begin');
      const result: number = myparseInt("330", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(330));
      expect(result).assertEqual(330);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("330"));
      expect(String(result)).assertEqual("330");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020198 end');
    })

    /**
     * @tc.name   testParseInt020199
     * @tc.number SUB_ASSET_PARSEINT_0199
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020199 begin');
      const result: number = myparseInt("337", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(337));
      expect(result).assertEqual(337);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("337"));
      expect(String(result)).assertEqual("337");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020199 end');
    })

    /**
     * @tc.name   testParseInt020200
     * @tc.number SUB_ASSET_PARSEINT_0200
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020200 begin');
      const result: number = myparseInt("344", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(344));
      expect(result).assertEqual(344);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("344"));
      expect(String(result)).assertEqual("344");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020200 end');
    })

    /**
     * @tc.name   testParseInt020201
     * @tc.number SUB_ASSET_PARSEINT_0201
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020201 begin');
      const result: number = myparseInt("ff0", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4080));
      expect(result).assertEqual(4080);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4080"));
      expect(String(result)).assertEqual("4080");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020201 end');
    })

    /**
     * @tc.name   testParseInt020202
     * @tc.number SUB_ASSET_PARSEINT_0202
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020202 begin');
      const result: number = myparseInt("-ff1", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4081));
      expect(result).assertEqual(-4081);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4081"));
      expect(String(result)).assertEqual("-4081");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020202 end');
    })

    /**
     * @tc.name   testParseInt020203
     * @tc.number SUB_ASSET_PARSEINT_0203
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020203 begin');
      const result: number = myparseInt("ff2", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4082));
      expect(result).assertEqual(4082);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4082"));
      expect(String(result)).assertEqual("4082");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020203 end');
    })

    /**
     * @tc.name   testParseInt020204
     * @tc.number SUB_ASSET_PARSEINT_0204
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020204 begin');
      const result: number = myparseInt("-ff3", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4083));
      expect(result).assertEqual(-4083);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4083"));
      expect(String(result)).assertEqual("-4083");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020204 end');
    })

    /**
     * @tc.name   testParseInt020205
     * @tc.number SUB_ASSET_PARSEINT_0205
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020205 begin');
      const result: number = myparseInt("ff4", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4084));
      expect(result).assertEqual(4084);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4084"));
      expect(String(result)).assertEqual("4084");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020205 end');
    })

    /**
     * @tc.name   testParseInt020206
     * @tc.number SUB_ASSET_PARSEINT_0206
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020206 begin');
      const result: number = myparseInt("-ff5", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4085));
      expect(result).assertEqual(-4085);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4085"));
      expect(String(result)).assertEqual("-4085");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020206 end');
    })

    /**
     * @tc.name   testParseInt020207
     * @tc.number SUB_ASSET_PARSEINT_0207
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020207 begin');
      const result: number = myparseInt("ff6", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4086));
      expect(result).assertEqual(4086);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4086"));
      expect(String(result)).assertEqual("4086");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020207 end');
    })

    /**
     * @tc.name   testParseInt020208
     * @tc.number SUB_ASSET_PARSEINT_0208
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020208 begin');
      const result: number = myparseInt("-ff7", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4087));
      expect(result).assertEqual(-4087);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4087"));
      expect(String(result)).assertEqual("-4087");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020208 end');
    })

    /**
     * @tc.name   testParseInt020209
     * @tc.number SUB_ASSET_PARSEINT_0209
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020209 begin');
      const result: number = myparseInt("ff8", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4088));
      expect(result).assertEqual(4088);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4088"));
      expect(String(result)).assertEqual("4088");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020209 end');
    })

    /**
     * @tc.name   testParseInt020210
     * @tc.number SUB_ASSET_PARSEINT_0210
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020210 begin');
      const result: number = myparseInt("-ff9", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4089));
      expect(result).assertEqual(-4089);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4089"));
      expect(String(result)).assertEqual("-4089");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020210 end');
    })

    /**
     * @tc.name   testParseInt020211
     * @tc.number SUB_ASSET_PARSEINT_0211
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020211 begin');
      const result: number = myparseInt("ffa", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4090));
      expect(result).assertEqual(4090);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4090"));
      expect(String(result)).assertEqual("4090");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020211 end');
    })

    /**
     * @tc.name   testParseInt020212
     * @tc.number SUB_ASSET_PARSEINT_0212
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020212 begin');
      const result: number = myparseInt("-ffb", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4091));
      expect(result).assertEqual(-4091);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4091"));
      expect(String(result)).assertEqual("-4091");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020212 end');
    })

    /**
     * @tc.name   testParseInt020213
     * @tc.number SUB_ASSET_PARSEINT_0213
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020213 begin');
      const result: number = myparseInt("ffc", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4092));
      expect(result).assertEqual(4092);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4092"));
      expect(String(result)).assertEqual("4092");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020213 end');
    })

    /**
     * @tc.name   testParseInt020214
     * @tc.number SUB_ASSET_PARSEINT_0214
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020214 begin');
      const result: number = myparseInt("-ffd", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4093));
      expect(result).assertEqual(-4093);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4093"));
      expect(String(result)).assertEqual("-4093");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020214 end');
    })

    /**
     * @tc.name   testParseInt020215
     * @tc.number SUB_ASSET_PARSEINT_0215
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020215 begin');
      const result: number = myparseInt("ffe", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4094));
      expect(result).assertEqual(4094);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4094"));
      expect(String(result)).assertEqual("4094");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020215 end');
    })

    /**
     * @tc.name   testParseInt020216
     * @tc.number SUB_ASSET_PARSEINT_0216
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020216 begin');
      const result: number = myparseInt("-fff", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4095));
      expect(result).assertEqual(-4095);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4095"));
      expect(String(result)).assertEqual("-4095");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020216 end');
    })

    /**
     * @tc.name   testParseInt020217
     * @tc.number SUB_ASSET_PARSEINT_0217
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020217 begin');
      const result: number = myparseInt("ff10", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65296));
      expect(result).assertEqual(65296);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65296"));
      expect(String(result)).assertEqual("65296");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020217 end');
    })

    /**
     * @tc.name   testParseInt020218
     * @tc.number SUB_ASSET_PARSEINT_0218
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020218 begin');
      const result: number = myparseInt("-ff11", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-65297));
      expect(result).assertEqual(-65297);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result)),
        String("-65297"));
      expect(String(result)).assertEqual("-65297");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020218 end');
    })

    /**
     * @tc.name   testParseInt020219
     * @tc.number SUB_ASSET_PARSEINT_0219
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020219 begin');
      const result: number = myparseInt("ff12", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65298));
      expect(result).assertEqual(65298);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65298"));
      expect(String(result)).assertEqual("65298");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020219 end');
    })

    /**
     * @tc.name   testParseInt020220
     * @tc.number SUB_ASSET_PARSEINT_0220
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020220 begin');
      const result: number = myparseInt("-ff13", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-65299));
      expect(result).assertEqual(-65299);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result)),
        String("-65299"));
      expect(String(result)).assertEqual("-65299");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020220 end');
    })

    /**
     * @tc.name   testParseInt020221
     * @tc.number SUB_ASSET_PARSEINT_0221
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020221 begin');
      const result: number = myparseInt("ff14", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65300));
      expect(result).assertEqual(65300);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65300"));
      expect(String(result)).assertEqual("65300");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020221 end');
    })

    /**
     * @tc.name   testParseInt020222
     * @tc.number SUB_ASSET_PARSEINT_0222
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020222 begin');
      const result: number = myparseInt("-ff15", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-65301));
      expect(result).assertEqual(-65301);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result)),
        String("-65301"));
      expect(String(result)).assertEqual("-65301");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020222 end');
    })

    /**
     * @tc.name   testParseInt020223
     * @tc.number SUB_ASSET_PARSEINT_0223
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020223 begin');
      const result: number = myparseInt("ff16", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65302));
      expect(result).assertEqual(65302);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65302"));
      expect(String(result)).assertEqual("65302");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020223 end');
    })

    /**
     * @tc.name   testParseInt020224
     * @tc.number SUB_ASSET_PARSEINT_0224
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020224 begin');
      const result: number = myparseInt("-ff17", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-65303));
      expect(result).assertEqual(-65303);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result)),
        String("-65303"));
      expect(String(result)).assertEqual("-65303");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020224 end');
    })

    /**
     * @tc.name   testParseInt020225
     * @tc.number SUB_ASSET_PARSEINT_0225
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020225 begin');
      const result: number = myparseInt("ff18", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65304));
      expect(result).assertEqual(65304);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65304"));
      expect(String(result)).assertEqual("65304");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020225 end');
    })

    /**
     * @tc.name   testParseInt020226
     * @tc.number SUB_ASSET_PARSEINT_0226
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020226 begin');
      const result: number = myparseInt("-ff19", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-65305));
      expect(result).assertEqual(-65305);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result)),
        String("-65305"));
      expect(String(result)).assertEqual("-65305");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020226 end');
    })

    /**
     * @tc.name   testParseInt020227
     * @tc.number SUB_ASSET_PARSEINT_0227
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020227 begin');
      const result: number = myparseInt("ff1a", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65306));
      expect(result).assertEqual(65306);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65306"));
      expect(String(result)).assertEqual("65306");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020227 end');
    })

    /**
     * @tc.name   testParseInt020228
     * @tc.number SUB_ASSET_PARSEINT_0228
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020228 begin');
      const result: number = myparseInt("-ff1b", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-65307));
      expect(result).assertEqual(-65307);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result)),
        String("-65307"));
      expect(String(result)).assertEqual("-65307");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020228 end');
    })

    /**
     * @tc.name   testParseInt020229
     * @tc.number SUB_ASSET_PARSEINT_0229
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020229 begin');
      const result: number = myparseInt("ff1c", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65308));
      expect(result).assertEqual(65308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65308"));
      expect(String(result)).assertEqual("65308");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020229 end');
    })

    /**
     * @tc.name   testParseInt020230
     * @tc.number SUB_ASSET_PARSEINT_0230
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020230 begin');
      const result: number = myparseInt("-ff1d", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-65309));
      expect(result).assertEqual(-65309);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result)),
        String("-65309"));
      expect(String(result)).assertEqual("-65309");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020230 end');
    })

    /**
     * @tc.name   testParseInt020231
     * @tc.number SUB_ASSET_PARSEINT_0231
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020231 begin');
      const result: number = myparseInt("ff1e", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65310));
      expect(result).assertEqual(65310);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65310"));
      expect(String(result)).assertEqual("65310");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020231 end');
    })

    /**
     * @tc.name   testParseInt020232
     * @tc.number SUB_ASSET_PARSEINT_0232
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020232 begin');
      const result: number = myparseInt("-ff1f", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-65311));
      expect(result).assertEqual(-65311);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result)),
        String("-65311"));
      expect(String(result)).assertEqual("-65311");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020232 end');
    })

    /**
     * @tc.name   testParseInt020233
     * @tc.number SUB_ASSET_PARSEINT_0233
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020233 begin');
      const result: number = myparseInt("ff20", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65312));
      expect(result).assertEqual(65312);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65312"));
      expect(String(result)).assertEqual("65312");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020233 end');
    })

    /**
     * @tc.name   testParseInt020234
     * @tc.number SUB_ASSET_PARSEINT_0234
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020234 begin');
      const result: number = myparseInt("-ff21", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-65313));
      expect(result).assertEqual(-65313);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result)),
        String("-65313"));
      expect(String(result)).assertEqual("-65313");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020234 end');
    })

    /**
     * @tc.name   testParseInt020235
     * @tc.number SUB_ASSET_PARSEINT_0235
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020235 begin');
      const result: number = myparseInt("ff22", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65314));
      expect(result).assertEqual(65314);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65314"));
      expect(String(result)).assertEqual("65314");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020235 end');
    })

    /**
     * @tc.name   testParseInt020236
     * @tc.number SUB_ASSET_PARSEINT_0236
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020236 begin');
      const result: number = myparseInt("-ff23", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-65315));
      expect(result).assertEqual(-65315);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result)),
        String("-65315"));
      expect(String(result)).assertEqual("-65315");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020236 end');
    })

    /**
     * @tc.name   testParseInt020237
     * @tc.number SUB_ASSET_PARSEINT_0237
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020237 begin');
      const result: number = myparseInt("ff24", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65316));
      expect(result).assertEqual(65316);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65316"));
      expect(String(result)).assertEqual("65316");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020237 end');
    })

    /**
     * @tc.name   testParseInt020238
     * @tc.number SUB_ASSET_PARSEINT_0238
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020238 begin');
      const result: number = myparseInt("-ff25", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-65317));
      expect(result).assertEqual(-65317);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result)),
        String("-65317"));
      expect(String(result)).assertEqual("-65317");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020238 end');
    })

    /**
     * @tc.name   testParseInt020239
     * @tc.number SUB_ASSET_PARSEINT_0239
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020239 begin');
      const result: number = myparseInt("ff26", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65318));
      expect(result).assertEqual(65318);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65318"));
      expect(String(result)).assertEqual("65318");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020239 end');
    })

    /**
     * @tc.name   testParseInt020240
     * @tc.number SUB_ASSET_PARSEINT_0240
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020240 begin');
      const result: number = myparseInt("-ff27", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-65319));
      expect(result).assertEqual(-65319);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result)),
        String("-65319"));
      expect(String(result)).assertEqual("-65319");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020240 end');
    })

    /**
     * @tc.name   testParseInt020241
     * @tc.number SUB_ASSET_PARSEINT_0241
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020241 begin');
      const result: number = myparseInt("0o1", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020241 end');
    })

    /**
     * @tc.name   testParseInt020242
     * @tc.number SUB_ASSET_PARSEINT_0242
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020242 begin');
      const result: number = myparseInt("4", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4"));
      expect(String(result)).assertEqual("4");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020242 end');
    })

    /**
     * @tc.name   testParseInt020243
     * @tc.number SUB_ASSET_PARSEINT_0243
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020243 begin');
      const result: number = myparseInt("0o7", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020243 end');
    })

    /**
     * @tc.name   testParseInt020244
     * @tc.number SUB_ASSET_PARSEINT_0244
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020244 begin');
      const result: number = myparseInt("12", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(10));
      expect(result).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("10"));
      expect(String(result)).assertEqual("10");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020244 end');
    })

    /**
     * @tc.name   testParseInt020245
     * @tc.number SUB_ASSET_PARSEINT_0245
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020245 begin');
      const result: number = myparseInt("0o15", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020245 end');
    })

    /**
     * @tc.name   testParseInt020246
     * @tc.number SUB_ASSET_PARSEINT_0246
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020246 begin');
      const result: number = myparseInt("20", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16));
      expect(result).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("16"));
      expect(String(result)).assertEqual("16");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020246 end');
    })

    /**
     * @tc.name   testParseInt020247
     * @tc.number SUB_ASSET_PARSEINT_0247
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020247 begin');
      const result: number = myparseInt("0o23", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020247 end');
    })

    /**
     * @tc.name   testParseInt020248
     * @tc.number SUB_ASSET_PARSEINT_0248
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020248 begin');
      const result: number = myparseInt("26", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(22));
      expect(result).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("22"));
      expect(String(result)).assertEqual("22");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020248 end');
    })

    /**
     * @tc.name   testParseInt020249
     * @tc.number SUB_ASSET_PARSEINT_0249
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020249 begin');
      const result: number = myparseInt("0o31", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020249 end');
    })

    /**
     * @tc.name   testParseInt020250
     * @tc.number SUB_ASSET_PARSEINT_0250
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020250 begin');
      const result: number = myparseInt("34", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(28));
      expect(result).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("28"));
      expect(String(result)).assertEqual("28");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020250 end');
    })

    /**
     * @tc.name   testParseInt020251
     * @tc.number SUB_ASSET_PARSEINT_0251
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020251 begin');
      const result: number = myparseInt("0o37", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020251 end');
    })

    /**
     * @tc.name   testParseInt020252
     * @tc.number SUB_ASSET_PARSEINT_0252
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020252 begin');
      const result: number = myparseInt("42", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(34));
      expect(result).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("34"));
      expect(String(result)).assertEqual("34");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020252 end');
    })

    /**
     * @tc.name   testParseInt020253
     * @tc.number SUB_ASSET_PARSEINT_0253
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020253 begin');
      const result: number = myparseInt("0o45", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020253 end');
    })

    /**
     * @tc.name   testParseInt020254
     * @tc.number SUB_ASSET_PARSEINT_0254
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020254 begin');
      const result: number = myparseInt("50", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(40));
      expect(result).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("40"));
      expect(String(result)).assertEqual("40");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020254 end');
    })

    /**
     * @tc.name   testParseInt020255
     * @tc.number SUB_ASSET_PARSEINT_0255
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020255 begin');
      const result: number = myparseInt("0o53", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020255 end');
    })

    /**
     * @tc.name   testParseInt020256
     * @tc.number SUB_ASSET_PARSEINT_0256
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020256 begin');
      const result: number = myparseInt("56", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(46));
      expect(result).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("46"));
      expect(String(result)).assertEqual("46");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020256 end');
    })

    /**
     * @tc.name   testParseInt020257
     * @tc.number SUB_ASSET_PARSEINT_0257
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020257 begin');
      const result: number = myparseInt("0o61", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020257 end');
    })

    /**
     * @tc.name   testParseInt020258
     * @tc.number SUB_ASSET_PARSEINT_0258
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020258 begin');
      const result: number = myparseInt("64", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(52));
      expect(result).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("52"));
      expect(String(result)).assertEqual("52");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020258 end');
    })

    /**
     * @tc.name   testParseInt020259
     * @tc.number SUB_ASSET_PARSEINT_0259
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020259 begin');
      const result: number = myparseInt("0o67", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020259 end');
    })

    /**
     * @tc.name   testParseInt020260
     * @tc.number SUB_ASSET_PARSEINT_0260
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020260 begin');
      const result: number = myparseInt("72", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(58));
      expect(result).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("58"));
      expect(String(result)).assertEqual("58");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020260 end');
    })

    /**
     * @tc.name   testParseInt020261
     * @tc.number SUB_ASSET_PARSEINT_0261
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020261 begin');
      const result: number = myparseInt("0o75", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020261 end');
    })

    /**
     * @tc.name   testParseInt020262
     * @tc.number SUB_ASSET_PARSEINT_0262
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020262 begin');
      const result: number = myparseInt("100", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(64));
      expect(result).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("64"));
      expect(String(result)).assertEqual("64");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020262 end');
    })

    /**
     * @tc.name   testParseInt020263
     * @tc.number SUB_ASSET_PARSEINT_0263
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020263 begin');
      const result: number = myparseInt("0o103", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020263 end');
    })

    /**
     * @tc.name   testParseInt020264
     * @tc.number SUB_ASSET_PARSEINT_0264
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020264 begin');
      const result: number = myparseInt("106", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(70));
      expect(result).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("70"));
      expect(String(result)).assertEqual("70");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020264 end');
    })

    /**
     * @tc.name   testParseInt020265
     * @tc.number SUB_ASSET_PARSEINT_0265
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020265 begin');
      const result: number = myparseInt("0o111", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020265 end');
    })

    /**
     * @tc.name   testParseInt020266
     * @tc.number SUB_ASSET_PARSEINT_0266
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020266 begin');
      const result: number = myparseInt("114", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(76));
      expect(result).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("76"));
      expect(String(result)).assertEqual("76");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020266 end');
    })

    /**
     * @tc.name   testParseInt020267
     * @tc.number SUB_ASSET_PARSEINT_0267
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020267 begin');
      const result: number = myparseInt("0o117", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020267 end');
    })

    /**
     * @tc.name   testParseInt020268
     * @tc.number SUB_ASSET_PARSEINT_0268
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020268 begin');
      const result: number = myparseInt("122", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(82));
      expect(result).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("82"));
      expect(String(result)).assertEqual("82");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020268 end');
    })

    /**
     * @tc.name   testParseInt020269
     * @tc.number SUB_ASSET_PARSEINT_0269
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020269 begin');
      const result: number = myparseInt("0o125", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020269 end');
    })

    /**
     * @tc.name   testParseInt020270
     * @tc.number SUB_ASSET_PARSEINT_0270
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020270 begin');
      const result: number = myparseInt("130", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(88));
      expect(result).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("88"));
      expect(String(result)).assertEqual("88");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020270 end');
    })

    /**
     * @tc.name   testParseInt020271
     * @tc.number SUB_ASSET_PARSEINT_0271
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020271 begin');
      const result: number = myparseInt("0b1", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020271 end');
    })

    /**
     * @tc.name   testParseInt020272
     * @tc.number SUB_ASSET_PARSEINT_0272
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020272 begin');
      const result: number = myparseInt("110", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6));
      expect(result).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("6"));
      expect(String(result)).assertEqual("6");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020272 end');
    })

    /**
     * @tc.name   testParseInt020273
     * @tc.number SUB_ASSET_PARSEINT_0273
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020273 begin');
      const result: number = myparseInt("0b1011", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020273 end');
    })

    /**
     * @tc.name   testParseInt020274
     * @tc.number SUB_ASSET_PARSEINT_0274
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020274 begin');
      const result: number = myparseInt("10000", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16));
      expect(result).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("16"));
      expect(String(result)).assertEqual("16");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020274 end');
    })

    /**
     * @tc.name   testParseInt020275
     * @tc.number SUB_ASSET_PARSEINT_0275
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020275 begin');
      const result: number = myparseInt("0b10101", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020275 end');
    })

    /**
     * @tc.name   testParseInt020276
     * @tc.number SUB_ASSET_PARSEINT_0276
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020276 begin');
      const result: number = myparseInt("11010", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(26));
      expect(result).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("26"));
      expect(String(result)).assertEqual("26");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020276 end');
    })

    /**
     * @tc.name   testParseInt020277
     * @tc.number SUB_ASSET_PARSEINT_0277
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020277 begin');
      const result: number = myparseInt("0b11111", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020277 end');
    })

    /**
     * @tc.name   testParseInt020278
     * @tc.number SUB_ASSET_PARSEINT_0278
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020278 begin');
      const result: number = myparseInt("100100", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(36));
      expect(result).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("36"));
      expect(String(result)).assertEqual("36");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020278 end');
    })

    /**
     * @tc.name   testParseInt020279
     * @tc.number SUB_ASSET_PARSEINT_0279
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020279 begin');
      const result: number = myparseInt("0b101001", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020279 end');
    })

    /**
     * @tc.name   testParseInt020280
     * @tc.number SUB_ASSET_PARSEINT_0280
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020280 begin');
      const result: number = myparseInt("101110", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(46));
      expect(result).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("46"));
      expect(String(result)).assertEqual("46");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020280 end');
    })

    /**
     * @tc.name   testParseInt020281
     * @tc.number SUB_ASSET_PARSEINT_0281
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020281 begin');
      const result: number = myparseInt("0b110011", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020281 end');
    })

    /**
     * @tc.name   testParseInt020282
     * @tc.number SUB_ASSET_PARSEINT_0282
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020282 begin');
      const result: number = myparseInt("111000", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(56));
      expect(result).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("56"));
      expect(String(result)).assertEqual("56");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020282 end');
    })

    /**
     * @tc.name   testParseInt020283
     * @tc.number SUB_ASSET_PARSEINT_0283
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020283 begin');
      const result: number = myparseInt("0b111101", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020283 end');
    })

    /**
     * @tc.name   testParseInt020284
     * @tc.number SUB_ASSET_PARSEINT_0284
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020284 begin');
      const result: number = myparseInt("1000010", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(66));
      expect(result).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("66"));
      expect(String(result)).assertEqual("66");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020284 end');
    })

    /**
     * @tc.name   testParseInt020285
     * @tc.number SUB_ASSET_PARSEINT_0285
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020285 begin');
      const result: number = myparseInt("0b1000111", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020285 end');
    })

    /**
     * @tc.name   testParseInt020286
     * @tc.number SUB_ASSET_PARSEINT_0286
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020286 begin');
      const result: number = myparseInt("1001100", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(76));
      expect(result).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("76"));
      expect(String(result)).assertEqual("76");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020286 end');
    })

    /**
     * @tc.name   testParseInt020287
     * @tc.number SUB_ASSET_PARSEINT_0287
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020287 begin');
      const result: number = myparseInt("0b1010001", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020287 end');
    })

    /**
     * @tc.name   testParseInt020288
     * @tc.number SUB_ASSET_PARSEINT_0288
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020288 begin');
      const result: number = myparseInt("1010110", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(86));
      expect(result).assertEqual(86);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("86"));
      expect(String(result)).assertEqual("86");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020288 end');
    })

    /**
     * @tc.name   testParseInt020289
     * @tc.number SUB_ASSET_PARSEINT_0289
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020289 begin');
      const result: number = myparseInt("0b1011011", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020289 end');
    })

    /**
     * @tc.name   testParseInt020290
     * @tc.number SUB_ASSET_PARSEINT_0290
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020290 begin');
      const result: number = myparseInt("1100000", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(96));
      expect(result).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("96"));
      expect(String(result)).assertEqual("96");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020290 end');
    })

    /**
     * @tc.name   testParseInt020291
     * @tc.number SUB_ASSET_PARSEINT_0291
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020291 begin');
      const result: number = myparseInt("0b1100101", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020291 end');
    })

    /**
     * @tc.name   testParseInt020292
     * @tc.number SUB_ASSET_PARSEINT_0292
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020292 begin');
      const result: number = myparseInt("1101010", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(106));
      expect(result).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("106"));
      expect(String(result)).assertEqual("106");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020292 end');
    })

    /**
     * @tc.name   testParseInt020293
     * @tc.number SUB_ASSET_PARSEINT_0293
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020293 begin');
      const result: number = myparseInt("0b1101111", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020293 end');
    })

    /**
     * @tc.name   testParseInt020294
     * @tc.number SUB_ASSET_PARSEINT_0294
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020294 begin');
      const result: number = myparseInt("1110100", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(116));
      expect(result).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("116"));
      expect(String(result)).assertEqual("116");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020294 end');
    })

    /**
     * @tc.name   testParseInt020295
     * @tc.number SUB_ASSET_PARSEINT_0295
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020295 begin');
      const result: number = myparseInt("0b1111001", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020295 end');
    })

    /**
     * @tc.name   testParseInt020296
     * @tc.number SUB_ASSET_PARSEINT_0296
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020296 begin');
      const result: number = myparseInt("1111110", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(126));
      expect(result).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("126"));
      expect(String(result)).assertEqual("126");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020296 end');
    })

    /**
     * @tc.name   testParseInt020297
     * @tc.number SUB_ASSET_PARSEINT_0297
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020297 begin');
      const result: number = myparseInt("0b10000011", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020297 end');
    })

    /**
     * @tc.name   testParseInt020298
     * @tc.number SUB_ASSET_PARSEINT_0298
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020298 begin');
      const result: number = myparseInt("10001000", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(136));
      expect(result).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("136"));
      expect(String(result)).assertEqual("136");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020298 end');
    })

    /**
     * @tc.name   testParseInt020299
     * @tc.number SUB_ASSET_PARSEINT_0299
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020299 begin');
      const result: number = myparseInt("0b10001101", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020299 end');
    })

    /**
     * @tc.name   testParseInt020300
     * @tc.number SUB_ASSET_PARSEINT_0300
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020300 begin');
      const result: number = myparseInt("10010010", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(146));
      expect(result).assertEqual(146);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("146"));
      expect(String(result)).assertEqual("146");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt020300 end');
    })

  })
}
