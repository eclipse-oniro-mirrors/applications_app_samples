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

export default function parseIntVolume01() {
  describe('ParseIntVolume01Test', () => {

    /**
     * @tc.name   testParseInt010001
     * @tc.number SUB_ASSET_PARSEINT_0001
     * @tc.desc   十六进制与八进制解析结果符合 parseInt 语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010001 begin');
      const hex: number = myparseInt('ff', 16);
      const oct: number = myparseInt('17', 8);
      expect(hex).assertEqual(255);
      expect(oct).assertEqual(15);
      expect(myparseInt(' 42 ', 10)).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010001 end');
    })

    /**
     * @tc.name   testParseInt010002
     * @tc.number SUB_ASSET_PARSEINT_0002
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010002 begin');
      const result: number = myparseInt("8", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8));
      expect(result).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("8"));
      expect(String(result)).assertEqual("8");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010002 end');
    })

    /**
     * @tc.name   testParseInt010003
     * @tc.number SUB_ASSET_PARSEINT_0003
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010003 begin');
      const result: number = myparseInt("15", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(15));
      expect(result).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("15"));
      expect(String(result)).assertEqual("15");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010003 end');
    })

    /**
     * @tc.name   testParseInt010004
     * @tc.number SUB_ASSET_PARSEINT_0004
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010004 begin');
      const result: number = myparseInt("22", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(22));
      expect(result).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("22"));
      expect(String(result)).assertEqual("22");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010004 end');
    })

    /**
     * @tc.name   testParseInt010005
     * @tc.number SUB_ASSET_PARSEINT_0005
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010005 begin');
      const result: number = myparseInt("29", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(29));
      expect(result).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("29"));
      expect(String(result)).assertEqual("29");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010005 end');
    })

    /**
     * @tc.name   testParseInt010006
     * @tc.number SUB_ASSET_PARSEINT_0006
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010006 begin');
      const result: number = myparseInt("36", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(36));
      expect(result).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("36"));
      expect(String(result)).assertEqual("36");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010006 end');
    })

    /**
     * @tc.name   testParseInt010007
     * @tc.number SUB_ASSET_PARSEINT_0007
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010007 begin');
      const result: number = myparseInt("43", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(43));
      expect(result).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("43"));
      expect(String(result)).assertEqual("43");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010007 end');
    })

    /**
     * @tc.name   testParseInt010008
     * @tc.number SUB_ASSET_PARSEINT_0008
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010008 begin');
      const result: number = myparseInt("50", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(50));
      expect(result).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("50"));
      expect(String(result)).assertEqual("50");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010008 end');
    })

    /**
     * @tc.name   testParseInt010009
     * @tc.number SUB_ASSET_PARSEINT_0009
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010009 begin');
      const result: number = myparseInt("57", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(57));
      expect(result).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("57"));
      expect(String(result)).assertEqual("57");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010009 end');
    })

    /**
     * @tc.name   testParseInt010010
     * @tc.number SUB_ASSET_PARSEINT_0010
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010010 begin');
      const result: number = myparseInt("64", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(64));
      expect(result).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("64"));
      expect(String(result)).assertEqual("64");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010010 end');
    })

    /**
     * @tc.name   testParseInt010011
     * @tc.number SUB_ASSET_PARSEINT_0011
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010011 begin');
      const result: number = myparseInt("71", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(71));
      expect(result).assertEqual(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("71"));
      expect(String(result)).assertEqual("71");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010011 end');
    })

    /**
     * @tc.name   testParseInt010012
     * @tc.number SUB_ASSET_PARSEINT_0012
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010012 begin');
      const result: number = myparseInt("78", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(78));
      expect(result).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("78"));
      expect(String(result)).assertEqual("78");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010012 end');
    })

    /**
     * @tc.name   testParseInt010013
     * @tc.number SUB_ASSET_PARSEINT_0013
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010013 begin');
      const result: number = myparseInt("85", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(85));
      expect(result).assertEqual(85);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("85"));
      expect(String(result)).assertEqual("85");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010013 end');
    })

    /**
     * @tc.name   testParseInt010014
     * @tc.number SUB_ASSET_PARSEINT_0014
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010014 begin');
      const result: number = myparseInt("92", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(92));
      expect(result).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("92"));
      expect(String(result)).assertEqual("92");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010014 end');
    })

    /**
     * @tc.name   testParseInt010015
     * @tc.number SUB_ASSET_PARSEINT_0015
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010015 begin');
      const result: number = myparseInt("99", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(99));
      expect(result).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("99"));
      expect(String(result)).assertEqual("99");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010015 end');
    })

    /**
     * @tc.name   testParseInt010016
     * @tc.number SUB_ASSET_PARSEINT_0016
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010016 begin');
      const result: number = myparseInt("106", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(106));
      expect(result).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("106"));
      expect(String(result)).assertEqual("106");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010016 end');
    })

    /**
     * @tc.name   testParseInt010017
     * @tc.number SUB_ASSET_PARSEINT_0017
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010017 begin');
      const result: number = myparseInt("113", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(113));
      expect(result).assertEqual(113);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("113"));
      expect(String(result)).assertEqual("113");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010017 end');
    })

    /**
     * @tc.name   testParseInt010018
     * @tc.number SUB_ASSET_PARSEINT_0018
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010018 begin');
      const result: number = myparseInt("120", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("120"));
      expect(String(result)).assertEqual("120");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010018 end');
    })

    /**
     * @tc.name   testParseInt010019
     * @tc.number SUB_ASSET_PARSEINT_0019
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010019 begin');
      const result: number = myparseInt("127", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(127));
      expect(result).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("127"));
      expect(String(result)).assertEqual("127");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010019 end');
    })

    /**
     * @tc.name   testParseInt010020
     * @tc.number SUB_ASSET_PARSEINT_0020
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010020 begin');
      const result: number = myparseInt("134", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(134));
      expect(result).assertEqual(134);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("134"));
      expect(String(result)).assertEqual("134");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010020 end');
    })

    /**
     * @tc.name   testParseInt010021
     * @tc.number SUB_ASSET_PARSEINT_0021
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010021 begin');
      const result: number = myparseInt("141", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(141));
      expect(result).assertEqual(141);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("141"));
      expect(String(result)).assertEqual("141");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010021 end');
    })

    /**
     * @tc.name   testParseInt010022
     * @tc.number SUB_ASSET_PARSEINT_0022
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010022 begin');
      const result: number = myparseInt("148", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(148));
      expect(result).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("148"));
      expect(String(result)).assertEqual("148");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010022 end');
    })

    /**
     * @tc.name   testParseInt010023
     * @tc.number SUB_ASSET_PARSEINT_0023
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010023 begin');
      const result: number = myparseInt("155", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(155));
      expect(result).assertEqual(155);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("155"));
      expect(String(result)).assertEqual("155");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010023 end');
    })

    /**
     * @tc.name   testParseInt010024
     * @tc.number SUB_ASSET_PARSEINT_0024
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010024 begin');
      const result: number = myparseInt("162", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(162));
      expect(result).assertEqual(162);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("162"));
      expect(String(result)).assertEqual("162");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010024 end');
    })

    /**
     * @tc.name   testParseInt010025
     * @tc.number SUB_ASSET_PARSEINT_0025
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010025 begin');
      const result: number = myparseInt("169", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(169));
      expect(result).assertEqual(169);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("169"));
      expect(String(result)).assertEqual("169");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010025 end');
    })

    /**
     * @tc.name   testParseInt010026
     * @tc.number SUB_ASSET_PARSEINT_0026
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010026 begin');
      const result: number = myparseInt("176", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(176));
      expect(result).assertEqual(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("176"));
      expect(String(result)).assertEqual("176");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010026 end');
    })

    /**
     * @tc.name   testParseInt010027
     * @tc.number SUB_ASSET_PARSEINT_0027
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010027 begin');
      const result: number = myparseInt("183", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(183));
      expect(result).assertEqual(183);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("183"));
      expect(String(result)).assertEqual("183");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010027 end');
    })

    /**
     * @tc.name   testParseInt010028
     * @tc.number SUB_ASSET_PARSEINT_0028
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010028 begin');
      const result: number = myparseInt("190", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(190));
      expect(result).assertEqual(190);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("190"));
      expect(String(result)).assertEqual("190");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010028 end');
    })

    /**
     * @tc.name   testParseInt010029
     * @tc.number SUB_ASSET_PARSEINT_0029
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010029 begin');
      const result: number = myparseInt("197", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(197));
      expect(result).assertEqual(197);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("197"));
      expect(String(result)).assertEqual("197");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010029 end');
    })

    /**
     * @tc.name   testParseInt010030
     * @tc.number SUB_ASSET_PARSEINT_0030
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010030 begin');
      const result: number = myparseInt("204", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(204));
      expect(result).assertEqual(204);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("204"));
      expect(String(result)).assertEqual("204");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010030 end');
    })

    /**
     * @tc.name   testParseInt010031
     * @tc.number SUB_ASSET_PARSEINT_0031
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010031 begin');
      const result: number = myparseInt("211", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(211));
      expect(result).assertEqual(211);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("211"));
      expect(String(result)).assertEqual("211");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010031 end');
    })

    /**
     * @tc.name   testParseInt010032
     * @tc.number SUB_ASSET_PARSEINT_0032
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010032 begin');
      const result: number = myparseInt("218", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(218));
      expect(result).assertEqual(218);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("218"));
      expect(String(result)).assertEqual("218");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010032 end');
    })

    /**
     * @tc.name   testParseInt010033
     * @tc.number SUB_ASSET_PARSEINT_0033
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010033 begin');
      const result: number = myparseInt("225", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(225));
      expect(result).assertEqual(225);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("225"));
      expect(String(result)).assertEqual("225");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010033 end');
    })

    /**
     * @tc.name   testParseInt010034
     * @tc.number SUB_ASSET_PARSEINT_0034
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010034 begin');
      const result: number = myparseInt("232", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(232));
      expect(result).assertEqual(232);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("232"));
      expect(String(result)).assertEqual("232");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010034 end');
    })

    /**
     * @tc.name   testParseInt010035
     * @tc.number SUB_ASSET_PARSEINT_0035
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010035 begin');
      const result: number = myparseInt("239", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(239));
      expect(result).assertEqual(239);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("239"));
      expect(String(result)).assertEqual("239");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010035 end');
    })

    /**
     * @tc.name   testParseInt010036
     * @tc.number SUB_ASSET_PARSEINT_0036
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010036 begin');
      const result: number = myparseInt("246", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(246));
      expect(result).assertEqual(246);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("246"));
      expect(String(result)).assertEqual("246");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010036 end');
    })

    /**
     * @tc.name   testParseInt010037
     * @tc.number SUB_ASSET_PARSEINT_0037
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010037 begin');
      const result: number = myparseInt("253", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(253));
      expect(result).assertEqual(253);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("253"));
      expect(String(result)).assertEqual("253");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010037 end');
    })

    /**
     * @tc.name   testParseInt010038
     * @tc.number SUB_ASSET_PARSEINT_0038
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010038 begin');
      const result: number = myparseInt("260", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(260));
      expect(result).assertEqual(260);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("260"));
      expect(String(result)).assertEqual("260");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010038 end');
    })

    /**
     * @tc.name   testParseInt010039
     * @tc.number SUB_ASSET_PARSEINT_0039
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010039 begin');
      const result: number = myparseInt("267", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(267));
      expect(result).assertEqual(267);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("267"));
      expect(String(result)).assertEqual("267");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010039 end');
    })

    /**
     * @tc.name   testParseInt010040
     * @tc.number SUB_ASSET_PARSEINT_0040
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010040 begin');
      const result: number = myparseInt("274", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(274));
      expect(result).assertEqual(274);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("274"));
      expect(String(result)).assertEqual("274");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010040 end');
    })

    /**
     * @tc.name   testParseInt010041
     * @tc.number SUB_ASSET_PARSEINT_0041
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010041 begin');
      const result: number = myparseInt("281", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(281));
      expect(result).assertEqual(281);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("281"));
      expect(String(result)).assertEqual("281");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010041 end');
    })

    /**
     * @tc.name   testParseInt010042
     * @tc.number SUB_ASSET_PARSEINT_0042
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010042 begin');
      const result: number = myparseInt("288", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(288));
      expect(result).assertEqual(288);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("288"));
      expect(String(result)).assertEqual("288");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010042 end');
    })

    /**
     * @tc.name   testParseInt010043
     * @tc.number SUB_ASSET_PARSEINT_0043
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010043 begin');
      const result: number = myparseInt("295", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(295));
      expect(result).assertEqual(295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("295"));
      expect(String(result)).assertEqual("295");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010043 end');
    })

    /**
     * @tc.name   testParseInt010044
     * @tc.number SUB_ASSET_PARSEINT_0044
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010044 begin');
      const result: number = myparseInt("302", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(302));
      expect(result).assertEqual(302);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("302"));
      expect(String(result)).assertEqual("302");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010044 end');
    })

    /**
     * @tc.name   testParseInt010045
     * @tc.number SUB_ASSET_PARSEINT_0045
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010045 begin');
      const result: number = myparseInt("309", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(309));
      expect(result).assertEqual(309);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("309"));
      expect(String(result)).assertEqual("309");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010045 end');
    })

    /**
     * @tc.name   testParseInt010046
     * @tc.number SUB_ASSET_PARSEINT_0046
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010046 begin');
      const result: number = myparseInt("316", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(316));
      expect(result).assertEqual(316);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("316"));
      expect(String(result)).assertEqual("316");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010046 end');
    })

    /**
     * @tc.name   testParseInt010047
     * @tc.number SUB_ASSET_PARSEINT_0047
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010047 begin');
      const result: number = myparseInt("323", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(323));
      expect(result).assertEqual(323);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("323"));
      expect(String(result)).assertEqual("323");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010047 end');
    })

    /**
     * @tc.name   testParseInt010048
     * @tc.number SUB_ASSET_PARSEINT_0048
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010048 begin');
      const result: number = myparseInt("330", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(330));
      expect(result).assertEqual(330);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("330"));
      expect(String(result)).assertEqual("330");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010048 end');
    })

    /**
     * @tc.name   testParseInt010049
     * @tc.number SUB_ASSET_PARSEINT_0049
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010049 begin');
      const result: number = myparseInt("337", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(337));
      expect(result).assertEqual(337);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("337"));
      expect(String(result)).assertEqual("337");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010049 end');
    })

    /**
     * @tc.name   testParseInt010050
     * @tc.number SUB_ASSET_PARSEINT_0050
     * @tc.desc   合法值：十进制数字串解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010050 begin');
      const result: number = myparseInt("344", 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(344));
      expect(result).assertEqual(344);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("344"));
      expect(String(result)).assertEqual("344");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010050 end');
    })

    /**
     * @tc.name   testParseInt010051
     * @tc.number SUB_ASSET_PARSEINT_0051
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010051 begin');
      const result: number = myparseInt("ff0", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4080));
      expect(result).assertEqual(4080);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4080"));
      expect(String(result)).assertEqual("4080");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010051 end');
    })

    /**
     * @tc.name   testParseInt010052
     * @tc.number SUB_ASSET_PARSEINT_0052
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010052 begin');
      const result: number = myparseInt("-ff1", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4081));
      expect(result).assertEqual(-4081);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4081"));
      expect(String(result)).assertEqual("-4081");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010052 end');
    })

    /**
     * @tc.name   testParseInt010053
     * @tc.number SUB_ASSET_PARSEINT_0053
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010053 begin');
      const result: number = myparseInt("ff2", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4082));
      expect(result).assertEqual(4082);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4082"));
      expect(String(result)).assertEqual("4082");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010053 end');
    })

    /**
     * @tc.name   testParseInt010054
     * @tc.number SUB_ASSET_PARSEINT_0054
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010054 begin');
      const result: number = myparseInt("-ff3", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4083));
      expect(result).assertEqual(-4083);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4083"));
      expect(String(result)).assertEqual("-4083");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010054 end');
    })

    /**
     * @tc.name   testParseInt010055
     * @tc.number SUB_ASSET_PARSEINT_0055
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010055 begin');
      const result: number = myparseInt("ff4", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4084));
      expect(result).assertEqual(4084);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4084"));
      expect(String(result)).assertEqual("4084");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010055 end');
    })

    /**
     * @tc.name   testParseInt010056
     * @tc.number SUB_ASSET_PARSEINT_0056
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010056 begin');
      const result: number = myparseInt("-ff5", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4085));
      expect(result).assertEqual(-4085);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4085"));
      expect(String(result)).assertEqual("-4085");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010056 end');
    })

    /**
     * @tc.name   testParseInt010057
     * @tc.number SUB_ASSET_PARSEINT_0057
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010057 begin');
      const result: number = myparseInt("ff6", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4086));
      expect(result).assertEqual(4086);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4086"));
      expect(String(result)).assertEqual("4086");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010057 end');
    })

    /**
     * @tc.name   testParseInt010058
     * @tc.number SUB_ASSET_PARSEINT_0058
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010058 begin');
      const result: number = myparseInt("-ff7", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4087));
      expect(result).assertEqual(-4087);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4087"));
      expect(String(result)).assertEqual("-4087");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010058 end');
    })

    /**
     * @tc.name   testParseInt010059
     * @tc.number SUB_ASSET_PARSEINT_0059
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010059 begin');
      const result: number = myparseInt("ff8", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4088));
      expect(result).assertEqual(4088);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4088"));
      expect(String(result)).assertEqual("4088");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010059 end');
    })

    /**
     * @tc.name   testParseInt010060
     * @tc.number SUB_ASSET_PARSEINT_0060
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010060 begin');
      const result: number = myparseInt("-ff9", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4089));
      expect(result).assertEqual(-4089);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4089"));
      expect(String(result)).assertEqual("-4089");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010060 end');
    })

    /**
     * @tc.name   testParseInt010061
     * @tc.number SUB_ASSET_PARSEINT_0061
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010061 begin');
      const result: number = myparseInt("ffa", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4090));
      expect(result).assertEqual(4090);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4090"));
      expect(String(result)).assertEqual("4090");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010061 end');
    })

    /**
     * @tc.name   testParseInt010062
     * @tc.number SUB_ASSET_PARSEINT_0062
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010062 begin');
      const result: number = myparseInt("-ffb", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4091));
      expect(result).assertEqual(-4091);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4091"));
      expect(String(result)).assertEqual("-4091");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010062 end');
    })

    /**
     * @tc.name   testParseInt010063
     * @tc.number SUB_ASSET_PARSEINT_0063
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010063 begin');
      const result: number = myparseInt("ffc", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4092));
      expect(result).assertEqual(4092);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4092"));
      expect(String(result)).assertEqual("4092");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010063 end');
    })

    /**
     * @tc.name   testParseInt010064
     * @tc.number SUB_ASSET_PARSEINT_0064
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010064 begin');
      const result: number = myparseInt("-ffd", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4093));
      expect(result).assertEqual(-4093);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4093"));
      expect(String(result)).assertEqual("-4093");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010064 end');
    })

    /**
     * @tc.name   testParseInt010065
     * @tc.number SUB_ASSET_PARSEINT_0065
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010065 begin');
      const result: number = myparseInt("ffe", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4094));
      expect(result).assertEqual(4094);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4094"));
      expect(String(result)).assertEqual("4094");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010065 end');
    })

    /**
     * @tc.name   testParseInt010066
     * @tc.number SUB_ASSET_PARSEINT_0066
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010066 begin');
      const result: number = myparseInt("-fff", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4095));
      expect(result).assertEqual(-4095);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("-4095"));
      expect(String(result)).assertEqual("-4095");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010066 end');
    })

    /**
     * @tc.name   testParseInt010067
     * @tc.number SUB_ASSET_PARSEINT_0067
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010067 begin');
      const result: number = myparseInt("ff10", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65296));
      expect(result).assertEqual(65296);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65296"));
      expect(String(result)).assertEqual("65296");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010067 end');
    })

    /**
     * @tc.name   testParseInt010068
     * @tc.number SUB_ASSET_PARSEINT_0068
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010068 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010068 end');
    })

    /**
     * @tc.name   testParseInt010069
     * @tc.number SUB_ASSET_PARSEINT_0069
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010069 begin');
      const result: number = myparseInt("ff12", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65298));
      expect(result).assertEqual(65298);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65298"));
      expect(String(result)).assertEqual("65298");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010069 end');
    })

    /**
     * @tc.name   testParseInt010070
     * @tc.number SUB_ASSET_PARSEINT_0070
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010070 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010070 end');
    })

    /**
     * @tc.name   testParseInt010071
     * @tc.number SUB_ASSET_PARSEINT_0071
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010071 begin');
      const result: number = myparseInt("ff14", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65300));
      expect(result).assertEqual(65300);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65300"));
      expect(String(result)).assertEqual("65300");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010071 end');
    })

    /**
     * @tc.name   testParseInt010072
     * @tc.number SUB_ASSET_PARSEINT_0072
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010072 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010072 end');
    })

    /**
     * @tc.name   testParseInt010073
     * @tc.number SUB_ASSET_PARSEINT_0073
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010073 begin');
      const result: number = myparseInt("ff16", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65302));
      expect(result).assertEqual(65302);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65302"));
      expect(String(result)).assertEqual("65302");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010073 end');
    })

    /**
     * @tc.name   testParseInt010074
     * @tc.number SUB_ASSET_PARSEINT_0074
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010074 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010074 end');
    })

    /**
     * @tc.name   testParseInt010075
     * @tc.number SUB_ASSET_PARSEINT_0075
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010075 begin');
      const result: number = myparseInt("ff18", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65304));
      expect(result).assertEqual(65304);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65304"));
      expect(String(result)).assertEqual("65304");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010075 end');
    })

    /**
     * @tc.name   testParseInt010076
     * @tc.number SUB_ASSET_PARSEINT_0076
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010076 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010076 end');
    })

    /**
     * @tc.name   testParseInt010077
     * @tc.number SUB_ASSET_PARSEINT_0077
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010077 begin');
      const result: number = myparseInt("ff1a", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65306));
      expect(result).assertEqual(65306);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65306"));
      expect(String(result)).assertEqual("65306");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010077 end');
    })

    /**
     * @tc.name   testParseInt010078
     * @tc.number SUB_ASSET_PARSEINT_0078
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010078 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010078 end');
    })

    /**
     * @tc.name   testParseInt010079
     * @tc.number SUB_ASSET_PARSEINT_0079
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010079 begin');
      const result: number = myparseInt("ff1c", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65308));
      expect(result).assertEqual(65308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65308"));
      expect(String(result)).assertEqual("65308");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010079 end');
    })

    /**
     * @tc.name   testParseInt010080
     * @tc.number SUB_ASSET_PARSEINT_0080
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010080 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010080 end');
    })

    /**
     * @tc.name   testParseInt010081
     * @tc.number SUB_ASSET_PARSEINT_0081
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010081 begin');
      const result: number = myparseInt("ff1e", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65310));
      expect(result).assertEqual(65310);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65310"));
      expect(String(result)).assertEqual("65310");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010081 end');
    })

    /**
     * @tc.name   testParseInt010082
     * @tc.number SUB_ASSET_PARSEINT_0082
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010082 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010082 end');
    })

    /**
     * @tc.name   testParseInt010083
     * @tc.number SUB_ASSET_PARSEINT_0083
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010083 begin');
      const result: number = myparseInt("ff20", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65312));
      expect(result).assertEqual(65312);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65312"));
      expect(String(result)).assertEqual("65312");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010083 end');
    })

    /**
     * @tc.name   testParseInt010084
     * @tc.number SUB_ASSET_PARSEINT_0084
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010084 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010084 end');
    })

    /**
     * @tc.name   testParseInt010085
     * @tc.number SUB_ASSET_PARSEINT_0085
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010085 begin');
      const result: number = myparseInt("ff22", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65314));
      expect(result).assertEqual(65314);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65314"));
      expect(String(result)).assertEqual("65314");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010085 end');
    })

    /**
     * @tc.name   testParseInt010086
     * @tc.number SUB_ASSET_PARSEINT_0086
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010086 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010086 end');
    })

    /**
     * @tc.name   testParseInt010087
     * @tc.number SUB_ASSET_PARSEINT_0087
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010087 begin');
      const result: number = myparseInt("ff24", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65316));
      expect(result).assertEqual(65316);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65316"));
      expect(String(result)).assertEqual("65316");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010087 end');
    })

    /**
     * @tc.name   testParseInt010088
     * @tc.number SUB_ASSET_PARSEINT_0088
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010088 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010088 end');
    })

    /**
     * @tc.name   testParseInt010089
     * @tc.number SUB_ASSET_PARSEINT_0089
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010089 begin');
      const result: number = myparseInt("ff26", 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65318));
      expect(result).assertEqual(65318);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("65318"));
      expect(String(result)).assertEqual("65318");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010089 end');
    })

    /**
     * @tc.name   testParseInt010090
     * @tc.number SUB_ASSET_PARSEINT_0090
     * @tc.desc   合法值：十六进制串解析（含符号）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010090 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010090 end');
    })

    /**
     * @tc.name   testParseInt010091
     * @tc.number SUB_ASSET_PARSEINT_0091
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010091 begin');
      const result: number = myparseInt("0o1", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010091 end');
    })

    /**
     * @tc.name   testParseInt010092
     * @tc.number SUB_ASSET_PARSEINT_0092
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010092 begin');
      const result: number = myparseInt("4", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("4"));
      expect(String(result)).assertEqual("4");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010092 end');
    })

    /**
     * @tc.name   testParseInt010093
     * @tc.number SUB_ASSET_PARSEINT_0093
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010093 begin');
      const result: number = myparseInt("0o7", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010093 end');
    })

    /**
     * @tc.name   testParseInt010094
     * @tc.number SUB_ASSET_PARSEINT_0094
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010094 begin');
      const result: number = myparseInt("12", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(10));
      expect(result).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("10"));
      expect(String(result)).assertEqual("10");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010094 end');
    })

    /**
     * @tc.name   testParseInt010095
     * @tc.number SUB_ASSET_PARSEINT_0095
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010095 begin');
      const result: number = myparseInt("0o15", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010095 end');
    })

    /**
     * @tc.name   testParseInt010096
     * @tc.number SUB_ASSET_PARSEINT_0096
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010096 begin');
      const result: number = myparseInt("20", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16));
      expect(result).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("16"));
      expect(String(result)).assertEqual("16");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010096 end');
    })

    /**
     * @tc.name   testParseInt010097
     * @tc.number SUB_ASSET_PARSEINT_0097
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010097 begin');
      const result: number = myparseInt("0o23", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010097 end');
    })

    /**
     * @tc.name   testParseInt010098
     * @tc.number SUB_ASSET_PARSEINT_0098
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010098 begin');
      const result: number = myparseInt("26", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(22));
      expect(result).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("22"));
      expect(String(result)).assertEqual("22");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010098 end');
    })

    /**
     * @tc.name   testParseInt010099
     * @tc.number SUB_ASSET_PARSEINT_0099
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010099 begin');
      const result: number = myparseInt("0o31", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010099 end');
    })

    /**
     * @tc.name   testParseInt010100
     * @tc.number SUB_ASSET_PARSEINT_0100
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010100 begin');
      const result: number = myparseInt("34", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(28));
      expect(result).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("28"));
      expect(String(result)).assertEqual("28");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010100 end');
    })

    /**
     * @tc.name   testParseInt010101
     * @tc.number SUB_ASSET_PARSEINT_0101
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010101 begin');
      const result: number = myparseInt("0o37", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010101 end');
    })

    /**
     * @tc.name   testParseInt010102
     * @tc.number SUB_ASSET_PARSEINT_0102
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010102 begin');
      const result: number = myparseInt("42", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(34));
      expect(result).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("34"));
      expect(String(result)).assertEqual("34");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010102 end');
    })

    /**
     * @tc.name   testParseInt010103
     * @tc.number SUB_ASSET_PARSEINT_0103
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010103 begin');
      const result: number = myparseInt("0o45", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010103 end');
    })

    /**
     * @tc.name   testParseInt010104
     * @tc.number SUB_ASSET_PARSEINT_0104
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010104 begin');
      const result: number = myparseInt("50", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(40));
      expect(result).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("40"));
      expect(String(result)).assertEqual("40");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010104 end');
    })

    /**
     * @tc.name   testParseInt010105
     * @tc.number SUB_ASSET_PARSEINT_0105
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010105 begin');
      const result: number = myparseInt("0o53", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010105 end');
    })

    /**
     * @tc.name   testParseInt010106
     * @tc.number SUB_ASSET_PARSEINT_0106
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010106 begin');
      const result: number = myparseInt("56", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(46));
      expect(result).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("46"));
      expect(String(result)).assertEqual("46");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010106 end');
    })

    /**
     * @tc.name   testParseInt010107
     * @tc.number SUB_ASSET_PARSEINT_0107
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010107 begin');
      const result: number = myparseInt("0o61", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010107 end');
    })

    /**
     * @tc.name   testParseInt010108
     * @tc.number SUB_ASSET_PARSEINT_0108
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010108 begin');
      const result: number = myparseInt("64", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(52));
      expect(result).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("52"));
      expect(String(result)).assertEqual("52");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010108 end');
    })

    /**
     * @tc.name   testParseInt010109
     * @tc.number SUB_ASSET_PARSEINT_0109
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010109 begin');
      const result: number = myparseInt("0o67", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010109 end');
    })

    /**
     * @tc.name   testParseInt010110
     * @tc.number SUB_ASSET_PARSEINT_0110
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010110 begin');
      const result: number = myparseInt("72", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(58));
      expect(result).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("58"));
      expect(String(result)).assertEqual("58");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010110 end');
    })

    /**
     * @tc.name   testParseInt010111
     * @tc.number SUB_ASSET_PARSEINT_0111
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010111 begin');
      const result: number = myparseInt("0o75", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010111 end');
    })

    /**
     * @tc.name   testParseInt010112
     * @tc.number SUB_ASSET_PARSEINT_0112
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010112 begin');
      const result: number = myparseInt("100", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(64));
      expect(result).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("64"));
      expect(String(result)).assertEqual("64");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010112 end');
    })

    /**
     * @tc.name   testParseInt010113
     * @tc.number SUB_ASSET_PARSEINT_0113
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010113 begin');
      const result: number = myparseInt("0o103", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010113 end');
    })

    /**
     * @tc.name   testParseInt010114
     * @tc.number SUB_ASSET_PARSEINT_0114
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010114 begin');
      const result: number = myparseInt("106", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(70));
      expect(result).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("70"));
      expect(String(result)).assertEqual("70");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010114 end');
    })

    /**
     * @tc.name   testParseInt010115
     * @tc.number SUB_ASSET_PARSEINT_0115
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010115 begin');
      const result: number = myparseInt("0o111", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010115 end');
    })

    /**
     * @tc.name   testParseInt010116
     * @tc.number SUB_ASSET_PARSEINT_0116
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010116 begin');
      const result: number = myparseInt("114", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(76));
      expect(result).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("76"));
      expect(String(result)).assertEqual("76");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010116 end');
    })

    /**
     * @tc.name   testParseInt010117
     * @tc.number SUB_ASSET_PARSEINT_0117
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010117 begin');
      const result: number = myparseInt("0o117", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010117 end');
    })

    /**
     * @tc.name   testParseInt010118
     * @tc.number SUB_ASSET_PARSEINT_0118
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010118 begin');
      const result: number = myparseInt("122", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(82));
      expect(result).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("82"));
      expect(String(result)).assertEqual("82");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010118 end');
    })

    /**
     * @tc.name   testParseInt010119
     * @tc.number SUB_ASSET_PARSEINT_0119
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010119 begin');
      const result: number = myparseInt("0o125", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010119 end');
    })

    /**
     * @tc.name   testParseInt010120
     * @tc.number SUB_ASSET_PARSEINT_0120
     * @tc.desc   合法值：八进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010120 begin');
      const result: number = myparseInt("130", 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(88));
      expect(result).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("88"));
      expect(String(result)).assertEqual("88");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010120 end');
    })

    /**
     * @tc.name   testParseInt010121
     * @tc.number SUB_ASSET_PARSEINT_0121
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010121 begin');
      const result: number = myparseInt("0b1", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010121 end');
    })

    /**
     * @tc.name   testParseInt010122
     * @tc.number SUB_ASSET_PARSEINT_0122
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010122 begin');
      const result: number = myparseInt("110", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6));
      expect(result).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("6"));
      expect(String(result)).assertEqual("6");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010122 end');
    })

    /**
     * @tc.name   testParseInt010123
     * @tc.number SUB_ASSET_PARSEINT_0123
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010123 begin');
      const result: number = myparseInt("0b1011", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010123 end');
    })

    /**
     * @tc.name   testParseInt010124
     * @tc.number SUB_ASSET_PARSEINT_0124
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010124 begin');
      const result: number = myparseInt("10000", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16));
      expect(result).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("16"));
      expect(String(result)).assertEqual("16");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010124 end');
    })

    /**
     * @tc.name   testParseInt010125
     * @tc.number SUB_ASSET_PARSEINT_0125
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010125 begin');
      const result: number = myparseInt("0b10101", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010125 end');
    })

    /**
     * @tc.name   testParseInt010126
     * @tc.number SUB_ASSET_PARSEINT_0126
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010126 begin');
      const result: number = myparseInt("11010", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(26));
      expect(result).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("26"));
      expect(String(result)).assertEqual("26");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010126 end');
    })

    /**
     * @tc.name   testParseInt010127
     * @tc.number SUB_ASSET_PARSEINT_0127
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010127 begin');
      const result: number = myparseInt("0b11111", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010127 end');
    })

    /**
     * @tc.name   testParseInt010128
     * @tc.number SUB_ASSET_PARSEINT_0128
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010128 begin');
      const result: number = myparseInt("100100", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(36));
      expect(result).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("36"));
      expect(String(result)).assertEqual("36");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010128 end');
    })

    /**
     * @tc.name   testParseInt010129
     * @tc.number SUB_ASSET_PARSEINT_0129
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010129 begin');
      const result: number = myparseInt("0b101001", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010129 end');
    })

    /**
     * @tc.name   testParseInt010130
     * @tc.number SUB_ASSET_PARSEINT_0130
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010130 begin');
      const result: number = myparseInt("101110", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(46));
      expect(result).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("46"));
      expect(String(result)).assertEqual("46");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010130 end');
    })

    /**
     * @tc.name   testParseInt010131
     * @tc.number SUB_ASSET_PARSEINT_0131
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010131 begin');
      const result: number = myparseInt("0b110011", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010131 end');
    })

    /**
     * @tc.name   testParseInt010132
     * @tc.number SUB_ASSET_PARSEINT_0132
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010132 begin');
      const result: number = myparseInt("111000", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(56));
      expect(result).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("56"));
      expect(String(result)).assertEqual("56");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010132 end');
    })

    /**
     * @tc.name   testParseInt010133
     * @tc.number SUB_ASSET_PARSEINT_0133
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010133 begin');
      const result: number = myparseInt("0b111101", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010133 end');
    })

    /**
     * @tc.name   testParseInt010134
     * @tc.number SUB_ASSET_PARSEINT_0134
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010134 begin');
      const result: number = myparseInt("1000010", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(66));
      expect(result).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("66"));
      expect(String(result)).assertEqual("66");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010134 end');
    })

    /**
     * @tc.name   testParseInt010135
     * @tc.number SUB_ASSET_PARSEINT_0135
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010135 begin');
      const result: number = myparseInt("0b1000111", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010135 end');
    })

    /**
     * @tc.name   testParseInt010136
     * @tc.number SUB_ASSET_PARSEINT_0136
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010136 begin');
      const result: number = myparseInt("1001100", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(76));
      expect(result).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("76"));
      expect(String(result)).assertEqual("76");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010136 end');
    })

    /**
     * @tc.name   testParseInt010137
     * @tc.number SUB_ASSET_PARSEINT_0137
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010137 begin');
      const result: number = myparseInt("0b1010001", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010137 end');
    })

    /**
     * @tc.name   testParseInt010138
     * @tc.number SUB_ASSET_PARSEINT_0138
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010138 begin');
      const result: number = myparseInt("1010110", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(86));
      expect(result).assertEqual(86);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("86"));
      expect(String(result)).assertEqual("86");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010138 end');
    })

    /**
     * @tc.name   testParseInt010139
     * @tc.number SUB_ASSET_PARSEINT_0139
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010139 begin');
      const result: number = myparseInt("0b1011011", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010139 end');
    })

    /**
     * @tc.name   testParseInt010140
     * @tc.number SUB_ASSET_PARSEINT_0140
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010140 begin');
      const result: number = myparseInt("1100000", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(96));
      expect(result).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("96"));
      expect(String(result)).assertEqual("96");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010140 end');
    })

    /**
     * @tc.name   testParseInt010141
     * @tc.number SUB_ASSET_PARSEINT_0141
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010141 begin');
      const result: number = myparseInt("0b1100101", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010141 end');
    })

    /**
     * @tc.name   testParseInt010142
     * @tc.number SUB_ASSET_PARSEINT_0142
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010142 begin');
      const result: number = myparseInt("1101010", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(106));
      expect(result).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("106"));
      expect(String(result)).assertEqual("106");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010142 end');
    })

    /**
     * @tc.name   testParseInt010143
     * @tc.number SUB_ASSET_PARSEINT_0143
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010143 begin');
      const result: number = myparseInt("0b1101111", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010143 end');
    })

    /**
     * @tc.name   testParseInt010144
     * @tc.number SUB_ASSET_PARSEINT_0144
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010144 begin');
      const result: number = myparseInt("1110100", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(116));
      expect(result).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("116"));
      expect(String(result)).assertEqual("116");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010144 end');
    })

    /**
     * @tc.name   testParseInt010145
     * @tc.number SUB_ASSET_PARSEINT_0145
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010145 begin');
      const result: number = myparseInt("0b1111001", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010145 end');
    })

    /**
     * @tc.name   testParseInt010146
     * @tc.number SUB_ASSET_PARSEINT_0146
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010146 begin');
      const result: number = myparseInt("1111110", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(126));
      expect(result).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("126"));
      expect(String(result)).assertEqual("126");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010146 end');
    })

    /**
     * @tc.name   testParseInt010147
     * @tc.number SUB_ASSET_PARSEINT_0147
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010147 begin');
      const result: number = myparseInt("0b10000011", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010147 end');
    })

    /**
     * @tc.name   testParseInt010148
     * @tc.number SUB_ASSET_PARSEINT_0148
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010148 begin');
      const result: number = myparseInt("10001000", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(136));
      expect(result).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("136"));
      expect(String(result)).assertEqual("136");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010148 end');
    })

    /**
     * @tc.name   testParseInt010149
     * @tc.number SUB_ASSET_PARSEINT_0149
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010149 begin');
      const result: number = myparseInt("0b10001101", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("0"));
      expect(String(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010149 end');
    })

    /**
     * @tc.name   testParseInt010150
     * @tc.number SUB_ASSET_PARSEINT_0150
     * @tc.desc   合法值：二进制串解析（含前缀）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseInt010150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010150 begin');
      const result: number = myparseInt("10010010", 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(146));
      expect(result).assertEqual(146);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String("146"));
      expect(String(result)).assertEqual("146");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseInt010150 end');
    })

  })
}
