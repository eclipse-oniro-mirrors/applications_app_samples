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
import { SimInfoFormatter } from '../../../main/ets/model/SimInfoFormatter';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function radioSimInfoReal01Test() {
  describe('RadioSimInfoReal01Test', () => {

    /**
     * @tc.name   testSimReal0001
     * @tc.number SUB_RADIO_SIMREAL_0001
     * @tc.desc   SPN input 1 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0001 begin');
      const raw: string = '';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0001 end');
    })

    /**
     * @tc.name   testSimReal0002
     * @tc.number SUB_RADIO_SIMREAL_0002
     * @tc.desc   SPN input 2 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0002 begin');
      const raw: string = '   ';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('\t') >= 0));
      expect(result.indexOf('\t') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0002 end');
    })

    /**
     * @tc.name   testSimReal0003
     * @tc.number SUB_RADIO_SIMREAL_0003
     * @tc.desc   SPN input 3 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0003 begin');
      const raw: string = ' China ';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('China'));
      expect(result).assertEqual('China');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0003 end');
    })

    /**
     * @tc.name   testSimReal0004
     * @tc.number SUB_RADIO_SIMREAL_0004
     * @tc.desc   SPN input 4 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0004 begin');
      const raw: string = '\tChina\t';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('China'));
      expect(result).assertEqual('China');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0004 end');
    })

    /**
     * @tc.name   testSimReal0005
     * @tc.number SUB_RADIO_SIMREAL_0005
     * @tc.desc   SPN input 5 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0005 begin');
      const raw: string = 'A\nB';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A B'));
      expect(result).assertEqual('A B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('\t') >= 0));
      expect(result.indexOf('\t') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0005 end');
    })

    /**
     * @tc.name   testSimReal0006
     * @tc.number SUB_RADIO_SIMREAL_0006
     * @tc.desc   SPN input 6 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0006 begin');
      const raw: string = 'A\tB';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A B'));
      expect(result).assertEqual('A B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0006 end');
    })

    /**
     * @tc.name   testSimReal0007
     * @tc.number SUB_RADIO_SIMREAL_0007
     * @tc.desc   SPN input 7 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0007 begin');
      const raw: string = 'A\r\nB';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A  B'));
      expect(result).assertEqual('A  B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0007 end');
    })

    /**
     * @tc.name   testSimReal0008
     * @tc.number SUB_RADIO_SIMREAL_0008
     * @tc.desc   SPN input 8 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0008 begin');
      const raw: string = '\n';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('\t') >= 0));
      expect(result.indexOf('\t') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0008 end');
    })

    /**
     * @tc.name   testSimReal0009
     * @tc.number SUB_RADIO_SIMREAL_0009
     * @tc.desc   SPN input 9 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0009 begin');
      const raw: string = '\t';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0009 end');
    })

    /**
     * @tc.name   testSimReal0010
     * @tc.number SUB_RADIO_SIMREAL_0010
     * @tc.desc   SPN input 10 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0010 begin');
      const raw: string = '中国移动';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('中国移动'));
      expect(result).assertEqual('中国移动');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0010 end');
    })

    /**
     * @tc.name   testSimReal0011
     * @tc.number SUB_RADIO_SIMREAL_0011
     * @tc.desc   SPN input 11 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0011 begin');
      const raw: string = '中国 移动';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('中国 移动'));
      expect(result).assertEqual('中国 移动');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('\t') >= 0));
      expect(result.indexOf('\t') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0011 end');
    })

    /**
     * @tc.name   testSimReal0012
     * @tc.number SUB_RADIO_SIMREAL_0012
     * @tc.desc   SPN input 12 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0012 begin');
      const raw: string = ' a ';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(result).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0012 end');
    })

    /**
     * @tc.name   testSimReal0013
     * @tc.number SUB_RADIO_SIMREAL_0013
     * @tc.desc   SPN input 13 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0013 begin');
      const raw: string = 'A  B';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A  B'));
      expect(result).assertEqual('A  B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0013 end');
    })

    /**
     * @tc.name   testSimReal0014
     * @tc.number SUB_RADIO_SIMREAL_0014
     * @tc.desc   SPN input 14 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0014 begin');
      const raw: string = '\r';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('\t') >= 0));
      expect(result.indexOf('\t') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0014 end');
    })

    /**
     * @tc.name   testSimReal0015
     * @tc.number SUB_RADIO_SIMREAL_0015
     * @tc.desc   SPN input 15 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0015 begin');
      const raw: string = 'A\rB';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A B'));
      expect(result).assertEqual('A B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0015 end');
    })

    /**
     * @tc.name   testSimReal0016
     * @tc.number SUB_RADIO_SIMREAL_0016
     * @tc.desc   SPN input 16 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0016 begin');
      const raw: string = 'x\ty';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x y'));
      expect(result).assertEqual('x y');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0016 end');
    })

    /**
     * @tc.name   testSimReal0017
     * @tc.number SUB_RADIO_SIMREAL_0017
     * @tc.desc   SPN input 17 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0017 begin');
      const raw: string = '  Leading';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Leading'));
      expect(result).assertEqual('Leading');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('\t') >= 0));
      expect(result.indexOf('\t') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0017 end');
    })

    /**
     * @tc.name   testSimReal0018
     * @tc.number SUB_RADIO_SIMREAL_0018
     * @tc.desc   SPN input 18 replaces control characters and trims
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0018 begin');
      const raw: string = 'Trailing  ';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Trailing'));
      expect(result).assertEqual('Trailing');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0018 end');
    })

    /**
     * @tc.name   testSimReal0019
     * @tc.number SUB_RADIO_SIMREAL_0019
     * @tc.desc   ISO country input 1 normalizes or falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0019 begin');
      const raw: string = 'cn';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('CN'));
      expect(result).assertEqual('CN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'not available' || result === result.toUpperCase()));
      expect(result === 'not available' || result === result.toUpperCase()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0019 end');
    })

    /**
     * @tc.name   testSimReal0020
     * @tc.number SUB_RADIO_SIMREAL_0020
     * @tc.desc   ISO country input 2 normalizes or falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0020 begin');
      const raw: string = 'CN';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('CN'));
      expect(result).assertEqual('CN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === 'not available' || result.length === 2));
      expect(result === 'not available' || result.length === 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0020 end');
    })

    /**
     * @tc.name   testSimReal0021
     * @tc.number SUB_RADIO_SIMREAL_0021
     * @tc.desc   ISO country input 3 normalizes or falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0021 begin');
      const raw: string = ' us ';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('US'));
      expect(result).assertEqual('US');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'not available' || result === result.toUpperCase()));
      expect(result === 'not available' || result === result.toUpperCase()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0021 end');
    })

    /**
     * @tc.name   testSimReal0022
     * @tc.number SUB_RADIO_SIMREAL_0022
     * @tc.desc   ISO country input 4 normalizes or falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0022 begin');
      const raw: string = 'a';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === 'not available' || result.length === 2));
      expect(result === 'not available' || result.length === 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0022 end');
    })

    /**
     * @tc.name   testSimReal0023
     * @tc.number SUB_RADIO_SIMREAL_0023
     * @tc.desc   ISO country input 5 normalizes or falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0023 begin');
      const raw: string = 'CHN';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'not available' || result === result.toUpperCase()));
      expect(result === 'not available' || result === result.toUpperCase()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0023 end');
    })

    /**
     * @tc.name   testSimReal0024
     * @tc.number SUB_RADIO_SIMREAL_0024
     * @tc.desc   ISO country input 6 normalizes or falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0024 begin');
      const raw: string = '1N';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === 'not available' || result.length === 2));
      expect(result === 'not available' || result.length === 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0024 end');
    })

    /**
     * @tc.name   testSimReal0025
     * @tc.number SUB_RADIO_SIMREAL_0025
     * @tc.desc   ISO country input 7 normalizes or falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0025 begin');
      const raw: string = '';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'not available' || result === result.toUpperCase()));
      expect(result === 'not available' || result === result.toUpperCase()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0025 end');
    })

    /**
     * @tc.name   testSimReal0026
     * @tc.number SUB_RADIO_SIMREAL_0026
     * @tc.desc   ISO country input 8 normalizes or falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0026 begin');
      const raw: string = '中国';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === 'not available' || result.length === 2));
      expect(result === 'not available' || result.length === 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0026 end');
    })

    /**
     * @tc.name   testSimReal0027
     * @tc.number SUB_RADIO_SIMREAL_0027
     * @tc.desc   ISO country input 9 normalizes or falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0027 begin');
      const raw: string = 'dE';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('DE'));
      expect(result).assertEqual('DE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'not available' || result === result.toUpperCase()));
      expect(result === 'not available' || result === result.toUpperCase()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0027 end');
    })

    /**
     * @tc.name   testSimReal0028
     * @tc.number SUB_RADIO_SIMREAL_0028
     * @tc.desc   ISO country input 10 normalizes or falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0028 begin');
      const raw: string = 'fR';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('FR'));
      expect(result).assertEqual('FR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === 'not available' || result.length === 2));
      expect(result === 'not available' || result.length === 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0028 end');
    })

    /**
     * @tc.name   testSimReal0029
     * @tc.number SUB_RADIO_SIMREAL_0029
     * @tc.desc   ISO country input 11 normalizes or falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0029 begin');
      const raw: string = 'z';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'not available' || result === result.toUpperCase()));
      expect(result === 'not available' || result === result.toUpperCase()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0029 end');
    })

    /**
     * @tc.name   testSimReal0030
     * @tc.number SUB_RADIO_SIMREAL_0030
     * @tc.desc   ISO country input 12 normalizes or falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0030 begin');
      const raw: string = 'ZZ ';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ZZ'));
      expect(result).assertEqual('ZZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === 'not available' || result.length === 2));
      expect(result === 'not available' || result.length === 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0030 end');
    })

    /**
     * @tc.name   testSimReal0031
     * @tc.number SUB_RADIO_SIMREAL_0031
     * @tc.desc   radio state true prints the documented lowercase literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0031 begin');
      const raw: boolean = true;
      const result: string = SimInfoFormatter.formatRadioOn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SimInfoFormatter.formatRadioOn(true)));
      expect(SimInfoFormatter.formatRadioOn(true)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SimInfoFormatter.formatRadioOn(false)));
      expect(SimInfoFormatter.formatRadioOn(false)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0031 end');
    })

    /**
     * @tc.name   testSimReal0032
     * @tc.number SUB_RADIO_SIMREAL_0032
     * @tc.desc   radio state false prints the documented lowercase literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0032 begin');
      const raw: boolean = false;
      const result: string = SimInfoFormatter.formatRadioOn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === 'true' || result === 'false'));
      expect(result === 'true' || result === 'false').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0032 end');
    })

    /**
     * @tc.name   testSimReal0033
     * @tc.number SUB_RADIO_SIMREAL_0033
     * @tc.desc   radio state true prints the documented lowercase literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0033 begin');
      const raw: boolean = true;
      const result: string = SimInfoFormatter.formatRadioOn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SimInfoFormatter.formatRadioOn(true)));
      expect(SimInfoFormatter.formatRadioOn(true)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SimInfoFormatter.formatRadioOn(false)));
      expect(SimInfoFormatter.formatRadioOn(false)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0033 end');
    })

    /**
     * @tc.name   testSimReal0034
     * @tc.number SUB_RADIO_SIMREAL_0034
     * @tc.desc   radio state false prints the documented lowercase literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0034 begin');
      const raw: boolean = false;
      const result: string = SimInfoFormatter.formatRadioOn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === 'true' || result === 'false'));
      expect(result === 'true' || result === 'false').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0034 end');
    })

    /**
     * @tc.name   testSimReal0035
     * @tc.number SUB_RADIO_SIMREAL_0035
     * @tc.desc   radio state true prints the documented lowercase literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSimReal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0035 begin');
      const raw: boolean = true;
      const result: string = SimInfoFormatter.formatRadioOn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SimInfoFormatter.formatRadioOn(true)));
      expect(SimInfoFormatter.formatRadioOn(true)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SimInfoFormatter.formatRadioOn(false)));
      expect(SimInfoFormatter.formatRadioOn(false)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSimReal0035 end');
    })

  })
}
