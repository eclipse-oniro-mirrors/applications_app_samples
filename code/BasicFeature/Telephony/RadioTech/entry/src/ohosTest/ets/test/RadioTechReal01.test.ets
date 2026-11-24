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
import { RadioTechFormatter, RadioTechSnapshot } from '../../../main/ets/model/RadioTechFormatter';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function radioTechReal01Test() {
  describe('RadioTechReal01Test', () => {

    /**
     * @tc.name   testTechReal0001
     * @tc.number SUB_RADIO_TECHREAL_0001
     * @tc.desc   radio technology pair 1 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0001 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 12, csRadioTech: 12 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:nr,cs:nr'));
      expect(result).assertEqual('ps:nr,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('ps:')));
      expect(result.startsWith('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0001 end');
    })

    /**
     * @tc.name   testTechReal0002
     * @tc.number SUB_RADIO_TECHREAL_0002
     * @tc.desc   radio technology pair 2 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0002 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 9, csRadioTech: 12 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes(',cs:')));
      expect(result.includes(',cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0002 end');
    })

    /**
     * @tc.name   testTechReal0003
     * @tc.number SUB_RADIO_TECHREAL_0003
     * @tc.desc   radio technology pair 3 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0003 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 0, csRadioTech: 0 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(0)));
      expect(RadioTechFormatter.techName(0)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(0)));
      expect(RadioTechFormatter.isKnown(0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(0)));
      expect(RadioTechFormatter.isNr(0)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0003 end');
    })

    /**
     * @tc.name   testTechReal0004
     * @tc.number SUB_RADIO_TECHREAL_0004
     * @tc.desc   radio technology pair 4 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0004 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 12, csRadioTech: 9 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:nr,cs:lte'));
      expect(result).assertEqual('ps:nr,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(9)));
      expect(RadioTechFormatter.isNr(9)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0004 end');
    })

    /**
     * @tc.name   testTechReal0005
     * @tc.number SUB_RADIO_TECHREAL_0005
     * @tc.desc   radio technology pair 5 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0005 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 5, csRadioTech: 5 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspap,cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('ps:')));
      expect(result.includes('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('cs:')));
      expect(result.includes('cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0005 end');
    })

    /**
     * @tc.name   testTechReal0006
     * @tc.number SUB_RADIO_TECHREAL_0006
     * @tc.desc   radio technology pair 6 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0006 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 1, csRadioTech: 1 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:gsm,cs:gsm'));
      expect(result).assertEqual('ps:gsm,cs:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('ps:')));
      expect(result.startsWith('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0006 end');
    })

    /**
     * @tc.name   testTechReal0007
     * @tc.number SUB_RADIO_TECHREAL_0007
     * @tc.desc   radio technology pair 7 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0007 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 2, csRadioTech: 2 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes(',cs:')));
      expect(result.includes(',cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0007 end');
    })

    /**
     * @tc.name   testTechReal0008
     * @tc.number SUB_RADIO_TECHREAL_0008
     * @tc.desc   radio technology pair 8 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0008 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 3, csRadioTech: 3 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(3)));
      expect(RadioTechFormatter.techName(3)).assertEqual('wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(3)));
      expect(RadioTechFormatter.isKnown(3)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(3)));
      expect(RadioTechFormatter.isNr(3)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0008 end');
    })

    /**
     * @tc.name   testTechReal0009
     * @tc.number SUB_RADIO_TECHREAL_0009
     * @tc.desc   radio technology pair 9 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0009 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 4, csRadioTech: 4 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspa,cs:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(4)));
      expect(RadioTechFormatter.isNr(4)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0009 end');
    })

    /**
     * @tc.name   testTechReal0010
     * @tc.number SUB_RADIO_TECHREAL_0010
     * @tc.desc   radio technology pair 10 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0010 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 6, csRadioTech: 6 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:td-scdma,cs:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('ps:')));
      expect(result.includes('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('cs:')));
      expect(result.includes('cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0010 end');
    })

    /**
     * @tc.name   testTechReal0011
     * @tc.number SUB_RADIO_TECHREAL_0011
     * @tc.desc   radio technology pair 11 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0011 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 7, csRadioTech: 7 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:evdo,cs:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('ps:')));
      expect(result.startsWith('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0011 end');
    })

    /**
     * @tc.name   testTechReal0012
     * @tc.number SUB_RADIO_TECHREAL_0012
     * @tc.desc   radio technology pair 12 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0012 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 8, csRadioTech: 8 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes(',cs:')));
      expect(result.includes(',cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0012 end');
    })

    /**
     * @tc.name   testTechReal0013
     * @tc.number SUB_RADIO_TECHREAL_0013
     * @tc.desc   radio technology pair 13 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0013 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 10, csRadioTech: 10 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(10)));
      expect(RadioTechFormatter.techName(10)).assertEqual('lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(10)));
      expect(RadioTechFormatter.isKnown(10)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(10)));
      expect(RadioTechFormatter.isNr(10)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0013 end');
    })

    /**
     * @tc.name   testTechReal0014
     * @tc.number SUB_RADIO_TECHREAL_0014
     * @tc.desc   radio technology pair 14 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0014 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 11, csRadioTech: 11 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:iwlan,cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(11)));
      expect(RadioTechFormatter.isNr(11)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0014 end');
    })

    /**
     * @tc.name   testTechReal0015
     * @tc.number SUB_RADIO_TECHREAL_0015
     * @tc.desc   radio technology pair 15 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0015 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 12, csRadioTech: 0 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:nr,cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('ps:')));
      expect(result.includes('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('cs:')));
      expect(result.includes('cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0015 end');
    })

    /**
     * @tc.name   testTechReal0016
     * @tc.number SUB_RADIO_TECHREAL_0016
     * @tc.desc   radio technology pair 16 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0016 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 0, csRadioTech: 12 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:unknown,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('ps:')));
      expect(result.startsWith('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0016 end');
    })

    /**
     * @tc.name   testTechReal0017
     * @tc.number SUB_RADIO_TECHREAL_0017
     * @tc.desc   radio technology pair 17 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0017 begin');
      const snap: RadioTechSnapshot = { psRadioTech: -1, csRadioTech: 12 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes(',cs:')));
      expect(result.includes(',cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0017 end');
    })

    /**
     * @tc.name   testTechReal0018
     * @tc.number SUB_RADIO_TECHREAL_0018
     * @tc.desc   radio technology pair 18 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0018 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 12, csRadioTech: -1 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(12)));
      expect(RadioTechFormatter.techName(12)).assertEqual('nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(12)));
      expect(RadioTechFormatter.isKnown(12)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(12)));
      expect(RadioTechFormatter.isNr(12)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0018 end');
    })

    /**
     * @tc.name   testTechReal0019
     * @tc.number SUB_RADIO_TECHREAL_0019
     * @tc.desc   radio technology pair 19 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0019 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 13, csRadioTech: 13 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:unknown,cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(13)));
      expect(RadioTechFormatter.isNr(13)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0019 end');
    })

    /**
     * @tc.name   testTechReal0020
     * @tc.number SUB_RADIO_TECHREAL_0020
     * @tc.desc   radio technology pair 20 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0020 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 2.5, csRadioTech: 12 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:unknown,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('ps:')));
      expect(result.includes('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('cs:')));
      expect(result.includes('cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0020 end');
    })

    /**
     * @tc.name   testTechReal0021
     * @tc.number SUB_RADIO_TECHREAL_0021
     * @tc.desc   radio technology pair 21 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0021 begin');
      const snap: RadioTechSnapshot = { psRadioTech: Number.NaN, csRadioTech: 9 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:unknown,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(17));
      expect(result.length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('ps:')));
      expect(result.startsWith('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0021 end');
    })

    /**
     * @tc.name   testTechReal0022
     * @tc.number SUB_RADIO_TECHREAL_0022
     * @tc.desc   radio technology pair 22 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0022 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 9, csRadioTech: Number.NaN };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes(',cs:')));
      expect(result.includes(',cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0022 end');
    })

    /**
     * @tc.name   testTechReal0023
     * @tc.number SUB_RADIO_TECHREAL_0023
     * @tc.desc   radio technology pair 23 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0023 begin');
      const snap: RadioTechSnapshot = { psRadioTech: -0, csRadioTech: -0 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(-0)));
      expect(RadioTechFormatter.techName(-0)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(-0)));
      expect(RadioTechFormatter.isKnown(-0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(-0)));
      expect(RadioTechFormatter.isNr(-0)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0023 end');
    })

    /**
     * @tc.name   testTechReal0024
     * @tc.number SUB_RADIO_TECHREAL_0024
     * @tc.desc   radio technology pair 24 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0024 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 12, csRadioTech: 12 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:nr,cs:nr'));
      expect(result).assertEqual('ps:nr,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(12)));
      expect(RadioTechFormatter.isNr(12)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0024 end');
    })

    /**
     * @tc.name   testTechReal0025
     * @tc.number SUB_RADIO_TECHREAL_0025
     * @tc.desc   radio technology pair 25 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0025 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 11, csRadioTech: 12 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:iwlan,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('ps:')));
      expect(result.includes('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('cs:')));
      expect(result.includes('cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0025 end');
    })

    /**
     * @tc.name   testTechReal0026
     * @tc.number SUB_RADIO_TECHREAL_0026
     * @tc.desc   radio technology pair 26 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0026 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 12, csRadioTech: 11 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:nr,cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(14));
      expect(result.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('ps:')));
      expect(result.startsWith('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0026 end');
    })

    /**
     * @tc.name   testTechReal0027
     * @tc.number SUB_RADIO_TECHREAL_0027
     * @tc.desc   radio technology pair 27 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0027 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 4, csRadioTech: 12 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes(',cs:')));
      expect(result.includes(',cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0027 end');
    })

    /**
     * @tc.name   testTechReal0028
     * @tc.number SUB_RADIO_TECHREAL_0028
     * @tc.desc   radio technology pair 28 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0028 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 6, csRadioTech: 12 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(6)));
      expect(RadioTechFormatter.techName(6)).assertEqual('td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(6)));
      expect(RadioTechFormatter.isKnown(6)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(6)));
      expect(RadioTechFormatter.isNr(6)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0028 end');
    })

    /**
     * @tc.name   testTechReal0029
     * @tc.number SUB_RADIO_TECHREAL_0029
     * @tc.desc   radio technology pair 29 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0029 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 10, csRadioTech: 12 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:lte-ca,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(12)));
      expect(RadioTechFormatter.isNr(12)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0029 end');
    })

    /**
     * @tc.name   testTechReal0030
     * @tc.number SUB_RADIO_TECHREAL_0030
     * @tc.desc   radio technology pair 30 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0030 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 9, csRadioTech: 13 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:lte,cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('ps:')));
      expect(result.includes('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('cs:')));
      expect(result.includes('cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0030 end');
    })

    /**
     * @tc.name   testTechReal0031
     * @tc.number SUB_RADIO_TECHREAL_0031
     * @tc.desc   radio technology pair 31 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0031 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 13, csRadioTech: 9 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:unknown,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(17));
      expect(result.length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('ps:')));
      expect(result.startsWith('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0031 end');
    })

    /**
     * @tc.name   testTechReal0032
     * @tc.number SUB_RADIO_TECHREAL_0032
     * @tc.desc   radio technology pair 32 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0032 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 12, csRadioTech: 2.5 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes(',cs:')));
      expect(result.includes(',cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0032 end');
    })

    /**
     * @tc.name   testTechReal0033
     * @tc.number SUB_RADIO_TECHREAL_0033
     * @tc.desc   radio technology pair 33 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0033 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 2.5, csRadioTech: 2.5 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(2.5)));
      expect(RadioTechFormatter.techName(2.5)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(2.5)));
      expect(RadioTechFormatter.isKnown(2.5)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(2.5)));
      expect(RadioTechFormatter.isNr(2.5)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0033 end');
    })

    /**
     * @tc.name   testTechReal0034
     * @tc.number SUB_RADIO_TECHREAL_0034
     * @tc.desc   radio technology pair 34 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0034 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 0, csRadioTech: -1 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:unknown,cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(-1)));
      expect(RadioTechFormatter.isNr(-1)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0034 end');
    })

    /**
     * @tc.name   testTechReal0035
     * @tc.number SUB_RADIO_TECHREAL_0035
     * @tc.desc   radio technology pair 35 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0035 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 12, csRadioTech: Number.NaN };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:nr,cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('ps:')));
      expect(result.includes('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('cs:')));
      expect(result.includes('cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0035 end');
    })

    /**
     * @tc.name   testTechReal0036
     * @tc.number SUB_RADIO_TECHREAL_0036
     * @tc.desc   radio technology pair 36 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0036 begin');
      const snap: RadioTechSnapshot = { psRadioTech: Number.NaN, csRadioTech: Number.NaN };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:unknown,cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('ps:')));
      expect(result.startsWith('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0036 end');
    })

    /**
     * @tc.name   testTechReal0037
     * @tc.number SUB_RADIO_TECHREAL_0037
     * @tc.desc   radio technology pair 37 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0037 begin');
      const snap: RadioTechSnapshot = { psRadioTech: -0, csRadioTech: 12 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes(',cs:')));
      expect(result.includes(',cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0037 end');
    })

    /**
     * @tc.name   testTechReal0038
     * @tc.number SUB_RADIO_TECHREAL_0038
     * @tc.desc   radio technology pair 38 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0038 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 5, csRadioTech: 12 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(5)));
      expect(RadioTechFormatter.techName(5)).assertEqual('hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(5)));
      expect(RadioTechFormatter.isKnown(5)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(5)));
      expect(RadioTechFormatter.isNr(5)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0038 end');
    })

    /**
     * @tc.name   testTechReal0039
     * @tc.number SUB_RADIO_TECHREAL_0039
     * @tc.desc   radio technology pair 39 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0039 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 12, csRadioTech: 5 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:nr,cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(5)));
      expect(RadioTechFormatter.isNr(5)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0039 end');
    })

    /**
     * @tc.name   testTechReal0040
     * @tc.number SUB_RADIO_TECHREAL_0040
     * @tc.desc   radio technology pair 40 maps ps and cs independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTechReal0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0040 begin');
      const snap: RadioTechSnapshot = { psRadioTech: 8, csRadioTech: 12 };
      const result: string = RadioTechFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:ehrpd,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('ps:')));
      expect(result.includes('ps:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('cs:')));
      expect(result.includes('cs:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTechReal0040 end');
    })

  })
}
