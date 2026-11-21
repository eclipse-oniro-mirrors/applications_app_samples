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
import { RadioTechFormatter } from '../../../main/ets/model/RadioTechFormatter';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function radioTechName01Test() {
  describe('RadioTechName01Test', () => {

    /**
     * @tc.name   testRadioTech0001
     * @tc.number SUB_RADIO_RADIOTECH_0001
     * @tc.desc   radio technology 0 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0001 begin');
      const result: string = RadioTechFormatter.techName(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(0)));
      expect(RadioTechFormatter.isKnown(0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0001 end');
    })

    /**
     * @tc.name   testRadioTech0002
     * @tc.number SUB_RADIO_RADIOTECH_0002
     * @tc.desc   radio technology 1 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0002 begin');
      const result: string = RadioTechFormatter.techName(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm'));
      expect(result).assertEqual('gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(1)));
      expect(RadioTechFormatter.isKnown(1)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0002 end');
    })

    /**
     * @tc.name   testRadioTech0003
     * @tc.number SUB_RADIO_RADIOTECH_0003
     * @tc.desc   radio technology 2 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0003 begin');
      const result: string = RadioTechFormatter.techName(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1xrtt'));
      expect(result).assertEqual('1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(2)));
      expect(RadioTechFormatter.isKnown(2)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0003 end');
    })

    /**
     * @tc.name   testRadioTech0004
     * @tc.number SUB_RADIO_RADIOTECH_0004
     * @tc.desc   radio technology 3 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0004 begin');
      const result: string = RadioTechFormatter.techName(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('wcdma'));
      expect(result).assertEqual('wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(3)));
      expect(RadioTechFormatter.isKnown(3)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0004 end');
    })

    /**
     * @tc.name   testRadioTech0005
     * @tc.number SUB_RADIO_RADIOTECH_0005
     * @tc.desc   radio technology 4 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0005 begin');
      const result: string = RadioTechFormatter.techName(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hspa'));
      expect(result).assertEqual('hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(4)));
      expect(RadioTechFormatter.isKnown(4)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0005 end');
    })

    /**
     * @tc.name   testRadioTech0006
     * @tc.number SUB_RADIO_RADIOTECH_0006
     * @tc.desc   radio technology 5 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0006 begin');
      const result: string = RadioTechFormatter.techName(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hspap'));
      expect(result).assertEqual('hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(5)));
      expect(RadioTechFormatter.isKnown(5)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0006 end');
    })

    /**
     * @tc.name   testRadioTech0007
     * @tc.number SUB_RADIO_RADIOTECH_0007
     * @tc.desc   radio technology 6 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0007 begin');
      const result: string = RadioTechFormatter.techName(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('td-scdma'));
      expect(result).assertEqual('td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(6)));
      expect(RadioTechFormatter.isKnown(6)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0007 end');
    })

    /**
     * @tc.name   testRadioTech0008
     * @tc.number SUB_RADIO_RADIOTECH_0008
     * @tc.desc   radio technology 7 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0008 begin');
      const result: string = RadioTechFormatter.techName(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('evdo'));
      expect(result).assertEqual('evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(7)));
      expect(RadioTechFormatter.isKnown(7)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0008 end');
    })

    /**
     * @tc.name   testRadioTech0009
     * @tc.number SUB_RADIO_RADIOTECH_0009
     * @tc.desc   radio technology 8 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0009 begin');
      const result: string = RadioTechFormatter.techName(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ehrpd'));
      expect(result).assertEqual('ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(8)));
      expect(RadioTechFormatter.isKnown(8)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0009 end');
    })

    /**
     * @tc.name   testRadioTech0010
     * @tc.number SUB_RADIO_RADIOTECH_0010
     * @tc.desc   radio technology 9 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0010 begin');
      const result: string = RadioTechFormatter.techName(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte'));
      expect(result).assertEqual('lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(9)));
      expect(RadioTechFormatter.isKnown(9)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0010 end');
    })

    /**
     * @tc.name   testRadioTech0011
     * @tc.number SUB_RADIO_RADIOTECH_0011
     * @tc.desc   radio technology 10 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0011 begin');
      const result: string = RadioTechFormatter.techName(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte-ca'));
      expect(result).assertEqual('lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(10)));
      expect(RadioTechFormatter.isKnown(10)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0011 end');
    })

    /**
     * @tc.name   testRadioTech0012
     * @tc.number SUB_RADIO_RADIOTECH_0012
     * @tc.desc   radio technology 11 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0012 begin');
      const result: string = RadioTechFormatter.techName(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('iwlan'));
      expect(result).assertEqual('iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(11)));
      expect(RadioTechFormatter.isKnown(11)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0012 end');
    })

    /**
     * @tc.name   testRadioTech0013
     * @tc.number SUB_RADIO_RADIOTECH_0013
     * @tc.desc   radio technology 12 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0013 begin');
      const result: string = RadioTechFormatter.techName(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr'));
      expect(result).assertEqual('nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(12)));
      expect(RadioTechFormatter.isKnown(12)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0013 end');
    })

    /**
     * @tc.name   testRadioTech0014
     * @tc.number SUB_RADIO_RADIOTECH_0014
     * @tc.desc   radio technology 13 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0014 begin');
      const result: string = RadioTechFormatter.techName(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(13)));
      expect(RadioTechFormatter.isKnown(13)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0014 end');
    })

    /**
     * @tc.name   testRadioTech0015
     * @tc.number SUB_RADIO_RADIOTECH_0015
     * @tc.desc   radio technology 14 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0015 begin');
      const result: string = RadioTechFormatter.techName(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(14)));
      expect(RadioTechFormatter.isKnown(14)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0015 end');
    })

    /**
     * @tc.name   testRadioTech0016
     * @tc.number SUB_RADIO_RADIOTECH_0016
     * @tc.desc   radio technology 15 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0016 begin');
      const result: string = RadioTechFormatter.techName(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(15)));
      expect(RadioTechFormatter.isKnown(15)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0016 end');
    })

    /**
     * @tc.name   testRadioTech0017
     * @tc.number SUB_RADIO_RADIOTECH_0017
     * @tc.desc   radio technology 16 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0017 begin');
      const result: string = RadioTechFormatter.techName(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(16)));
      expect(RadioTechFormatter.isKnown(16)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0017 end');
    })

    /**
     * @tc.name   testRadioTech0018
     * @tc.number SUB_RADIO_RADIOTECH_0018
     * @tc.desc   radio technology 17 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0018 begin');
      const result: string = RadioTechFormatter.techName(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(17)));
      expect(RadioTechFormatter.isKnown(17)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0018 end');
    })

    /**
     * @tc.name   testRadioTech0019
     * @tc.number SUB_RADIO_RADIOTECH_0019
     * @tc.desc   radio technology 18 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0019 begin');
      const result: string = RadioTechFormatter.techName(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(18)));
      expect(RadioTechFormatter.isKnown(18)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0019 end');
    })

    /**
     * @tc.name   testRadioTech0020
     * @tc.number SUB_RADIO_RADIOTECH_0020
     * @tc.desc   radio technology 19 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0020 begin');
      const result: string = RadioTechFormatter.techName(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(19)));
      expect(RadioTechFormatter.isKnown(19)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0020 end');
    })

    /**
     * @tc.name   testRadioTech0021
     * @tc.number SUB_RADIO_RADIOTECH_0021
     * @tc.desc   radio technology 20 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0021 begin');
      const result: string = RadioTechFormatter.techName(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(20)));
      expect(RadioTechFormatter.isKnown(20)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0021 end');
    })

    /**
     * @tc.name   testRadioTech0022
     * @tc.number SUB_RADIO_RADIOTECH_0022
     * @tc.desc   radio technology 21 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0022 begin');
      const result: string = RadioTechFormatter.techName(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(21)));
      expect(RadioTechFormatter.isKnown(21)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0022 end');
    })

    /**
     * @tc.name   testRadioTech0023
     * @tc.number SUB_RADIO_RADIOTECH_0023
     * @tc.desc   radio technology 22 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0023 begin');
      const result: string = RadioTechFormatter.techName(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(22)));
      expect(RadioTechFormatter.isKnown(22)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0023 end');
    })

    /**
     * @tc.name   testRadioTech0024
     * @tc.number SUB_RADIO_RADIOTECH_0024
     * @tc.desc   radio technology 23 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0024 begin');
      const result: string = RadioTechFormatter.techName(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(23)));
      expect(RadioTechFormatter.isKnown(23)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0024 end');
    })

    /**
     * @tc.name   testRadioTech0025
     * @tc.number SUB_RADIO_RADIOTECH_0025
     * @tc.desc   radio technology 24 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0025 begin');
      const result: string = RadioTechFormatter.techName(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(24)));
      expect(RadioTechFormatter.isKnown(24)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0025 end');
    })

    /**
     * @tc.name   testRadioTech0026
     * @tc.number SUB_RADIO_RADIOTECH_0026
     * @tc.desc   radio technology 25 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0026 begin');
      const result: string = RadioTechFormatter.techName(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(25)));
      expect(RadioTechFormatter.isKnown(25)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0026 end');
    })

    /**
     * @tc.name   testRadioTech0027
     * @tc.number SUB_RADIO_RADIOTECH_0027
     * @tc.desc   radio technology 26 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0027 begin');
      const result: string = RadioTechFormatter.techName(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(26)));
      expect(RadioTechFormatter.isKnown(26)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0027 end');
    })

    /**
     * @tc.name   testRadioTech0028
     * @tc.number SUB_RADIO_RADIOTECH_0028
     * @tc.desc   radio technology 27 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0028 begin');
      const result: string = RadioTechFormatter.techName(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(27)));
      expect(RadioTechFormatter.isKnown(27)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0028 end');
    })

    /**
     * @tc.name   testRadioTech0029
     * @tc.number SUB_RADIO_RADIOTECH_0029
     * @tc.desc   radio technology 28 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0029 begin');
      const result: string = RadioTechFormatter.techName(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(28)));
      expect(RadioTechFormatter.isKnown(28)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0029 end');
    })

    /**
     * @tc.name   testRadioTech0030
     * @tc.number SUB_RADIO_RADIOTECH_0030
     * @tc.desc   radio technology 29 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0030 begin');
      const result: string = RadioTechFormatter.techName(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(29)));
      expect(RadioTechFormatter.isKnown(29)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0030 end');
    })

    /**
     * @tc.name   testRadioTech0031
     * @tc.number SUB_RADIO_RADIOTECH_0031
     * @tc.desc   radio technology 30 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0031 begin');
      const result: string = RadioTechFormatter.techName(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(30)));
      expect(RadioTechFormatter.isKnown(30)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0031 end');
    })

    /**
     * @tc.name   testRadioTech0032
     * @tc.number SUB_RADIO_RADIOTECH_0032
     * @tc.desc   radio technology 31 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0032 begin');
      const result: string = RadioTechFormatter.techName(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(31)));
      expect(RadioTechFormatter.isKnown(31)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0032 end');
    })

    /**
     * @tc.name   testRadioTech0033
     * @tc.number SUB_RADIO_RADIOTECH_0033
     * @tc.desc   radio technology 32 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0033 begin');
      const result: string = RadioTechFormatter.techName(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(32)));
      expect(RadioTechFormatter.isKnown(32)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0033 end');
    })

    /**
     * @tc.name   testRadioTech0034
     * @tc.number SUB_RADIO_RADIOTECH_0034
     * @tc.desc   radio technology 33 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0034 begin');
      const result: string = RadioTechFormatter.techName(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(33)));
      expect(RadioTechFormatter.isKnown(33)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0034 end');
    })

    /**
     * @tc.name   testRadioTech0035
     * @tc.number SUB_RADIO_RADIOTECH_0035
     * @tc.desc   radio technology 34 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0035 begin');
      const result: string = RadioTechFormatter.techName(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(34)));
      expect(RadioTechFormatter.isKnown(34)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0035 end');
    })

    /**
     * @tc.name   testRadioTech0036
     * @tc.number SUB_RADIO_RADIOTECH_0036
     * @tc.desc   radio technology 35 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0036 begin');
      const result: string = RadioTechFormatter.techName(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(35)));
      expect(RadioTechFormatter.isKnown(35)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0036 end');
    })

    /**
     * @tc.name   testRadioTech0037
     * @tc.number SUB_RADIO_RADIOTECH_0037
     * @tc.desc   radio technology 36 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0037 begin');
      const result: string = RadioTechFormatter.techName(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(36)));
      expect(RadioTechFormatter.isKnown(36)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0037 end');
    })

    /**
     * @tc.name   testRadioTech0038
     * @tc.number SUB_RADIO_RADIOTECH_0038
     * @tc.desc   radio technology 37 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0038 begin');
      const result: string = RadioTechFormatter.techName(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(37)));
      expect(RadioTechFormatter.isKnown(37)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0038 end');
    })

    /**
     * @tc.name   testRadioTech0039
     * @tc.number SUB_RADIO_RADIOTECH_0039
     * @tc.desc   radio technology 38 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0039 begin');
      const result: string = RadioTechFormatter.techName(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(38)));
      expect(RadioTechFormatter.isKnown(38)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0039 end');
    })

    /**
     * @tc.name   testRadioTech0040
     * @tc.number SUB_RADIO_RADIOTECH_0040
     * @tc.desc   radio technology 39 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0040 begin');
      const result: string = RadioTechFormatter.techName(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(39)));
      expect(RadioTechFormatter.isKnown(39)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0040 end');
    })

    /**
     * @tc.name   testRadioTech0041
     * @tc.number SUB_RADIO_RADIOTECH_0041
     * @tc.desc   radio technology 40 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0041 begin');
      const result: string = RadioTechFormatter.techName(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(40)));
      expect(RadioTechFormatter.isKnown(40)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0041 end');
    })

    /**
     * @tc.name   testRadioTech0042
     * @tc.number SUB_RADIO_RADIOTECH_0042
     * @tc.desc   radio technology 41 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0042 begin');
      const result: string = RadioTechFormatter.techName(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(41)));
      expect(RadioTechFormatter.isKnown(41)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0042 end');
    })

    /**
     * @tc.name   testRadioTech0043
     * @tc.number SUB_RADIO_RADIOTECH_0043
     * @tc.desc   radio technology 42 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0043 begin');
      const result: string = RadioTechFormatter.techName(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(42)));
      expect(RadioTechFormatter.isKnown(42)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0043 end');
    })

    /**
     * @tc.name   testRadioTech0044
     * @tc.number SUB_RADIO_RADIOTECH_0044
     * @tc.desc   radio technology 43 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0044 begin');
      const result: string = RadioTechFormatter.techName(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(43)));
      expect(RadioTechFormatter.isKnown(43)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0044 end');
    })

    /**
     * @tc.name   testRadioTech0045
     * @tc.number SUB_RADIO_RADIOTECH_0045
     * @tc.desc   radio technology 44 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0045 begin');
      const result: string = RadioTechFormatter.techName(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(44)));
      expect(RadioTechFormatter.isKnown(44)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0045 end');
    })

    /**
     * @tc.name   testRadioTech0046
     * @tc.number SUB_RADIO_RADIOTECH_0046
     * @tc.desc   radio technology 45 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0046 begin');
      const result: string = RadioTechFormatter.techName(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(45)));
      expect(RadioTechFormatter.isKnown(45)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0046 end');
    })

    /**
     * @tc.name   testRadioTech0047
     * @tc.number SUB_RADIO_RADIOTECH_0047
     * @tc.desc   radio technology 46 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0047 begin');
      const result: string = RadioTechFormatter.techName(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(46)));
      expect(RadioTechFormatter.isKnown(46)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0047 end');
    })

    /**
     * @tc.name   testRadioTech0048
     * @tc.number SUB_RADIO_RADIOTECH_0048
     * @tc.desc   radio technology 47 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0048 begin');
      const result: string = RadioTechFormatter.techName(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(47)));
      expect(RadioTechFormatter.isKnown(47)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0048 end');
    })

    /**
     * @tc.name   testRadioTech0049
     * @tc.number SUB_RADIO_RADIOTECH_0049
     * @tc.desc   radio technology 48 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0049 begin');
      const result: string = RadioTechFormatter.techName(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(48)));
      expect(RadioTechFormatter.isKnown(48)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0049 end');
    })

    /**
     * @tc.name   testRadioTech0050
     * @tc.number SUB_RADIO_RADIOTECH_0050
     * @tc.desc   radio technology 49 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0050 begin');
      const result: string = RadioTechFormatter.techName(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(49)));
      expect(RadioTechFormatter.isKnown(49)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0050 end');
    })

    /**
     * @tc.name   testRadioTech0051
     * @tc.number SUB_RADIO_RADIOTECH_0051
     * @tc.desc   radio technology 50 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0051 begin');
      const result: string = RadioTechFormatter.techName(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(50)));
      expect(RadioTechFormatter.isKnown(50)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0051 end');
    })

    /**
     * @tc.name   testRadioTech0052
     * @tc.number SUB_RADIO_RADIOTECH_0052
     * @tc.desc   radio technology 51 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0052 begin');
      const result: string = RadioTechFormatter.techName(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(51)));
      expect(RadioTechFormatter.isKnown(51)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0052 end');
    })

    /**
     * @tc.name   testRadioTech0053
     * @tc.number SUB_RADIO_RADIOTECH_0053
     * @tc.desc   radio technology 52 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0053 begin');
      const result: string = RadioTechFormatter.techName(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(52)));
      expect(RadioTechFormatter.isKnown(52)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0053 end');
    })

    /**
     * @tc.name   testRadioTech0054
     * @tc.number SUB_RADIO_RADIOTECH_0054
     * @tc.desc   radio technology 53 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0054 begin');
      const result: string = RadioTechFormatter.techName(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(53)));
      expect(RadioTechFormatter.isKnown(53)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0054 end');
    })

    /**
     * @tc.name   testRadioTech0055
     * @tc.number SUB_RADIO_RADIOTECH_0055
     * @tc.desc   radio technology 54 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0055 begin');
      const result: string = RadioTechFormatter.techName(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(54)));
      expect(RadioTechFormatter.isKnown(54)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0055 end');
    })

    /**
     * @tc.name   testRadioTech0056
     * @tc.number SUB_RADIO_RADIOTECH_0056
     * @tc.desc   radio technology 55 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0056 begin');
      const result: string = RadioTechFormatter.techName(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(55)));
      expect(RadioTechFormatter.isKnown(55)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0056 end');
    })

    /**
     * @tc.name   testRadioTech0057
     * @tc.number SUB_RADIO_RADIOTECH_0057
     * @tc.desc   radio technology 56 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0057 begin');
      const result: string = RadioTechFormatter.techName(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(56)));
      expect(RadioTechFormatter.isKnown(56)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0057 end');
    })

    /**
     * @tc.name   testRadioTech0058
     * @tc.number SUB_RADIO_RADIOTECH_0058
     * @tc.desc   radio technology 57 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0058 begin');
      const result: string = RadioTechFormatter.techName(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(57)));
      expect(RadioTechFormatter.isKnown(57)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0058 end');
    })

    /**
     * @tc.name   testRadioTech0059
     * @tc.number SUB_RADIO_RADIOTECH_0059
     * @tc.desc   radio technology 58 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0059 begin');
      const result: string = RadioTechFormatter.techName(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(58)));
      expect(RadioTechFormatter.isKnown(58)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0059 end');
    })

    /**
     * @tc.name   testRadioTech0060
     * @tc.number SUB_RADIO_RADIOTECH_0060
     * @tc.desc   radio technology 59 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0060 begin');
      const result: string = RadioTechFormatter.techName(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(59)));
      expect(RadioTechFormatter.isKnown(59)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0060 end');
    })

    /**
     * @tc.name   testRadioTech0061
     * @tc.number SUB_RADIO_RADIOTECH_0061
     * @tc.desc   radio technology 60 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0061 begin');
      const result: string = RadioTechFormatter.techName(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(60)));
      expect(RadioTechFormatter.isKnown(60)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0061 end');
    })

    /**
     * @tc.name   testRadioTech0062
     * @tc.number SUB_RADIO_RADIOTECH_0062
     * @tc.desc   radio technology 61 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0062 begin');
      const result: string = RadioTechFormatter.techName(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(61)));
      expect(RadioTechFormatter.isKnown(61)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0062 end');
    })

    /**
     * @tc.name   testRadioTech0063
     * @tc.number SUB_RADIO_RADIOTECH_0063
     * @tc.desc   radio technology 62 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0063 begin');
      const result: string = RadioTechFormatter.techName(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(62)));
      expect(RadioTechFormatter.isKnown(62)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0063 end');
    })

    /**
     * @tc.name   testRadioTech0064
     * @tc.number SUB_RADIO_RADIOTECH_0064
     * @tc.desc   radio technology 63 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0064 begin');
      const result: string = RadioTechFormatter.techName(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(63)));
      expect(RadioTechFormatter.isKnown(63)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0064 end');
    })

    /**
     * @tc.name   testRadioTech0065
     * @tc.number SUB_RADIO_RADIOTECH_0065
     * @tc.desc   radio technology 64 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0065 begin');
      const result: string = RadioTechFormatter.techName(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(64)));
      expect(RadioTechFormatter.isKnown(64)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0065 end');
    })

    /**
     * @tc.name   testRadioTech0066
     * @tc.number SUB_RADIO_RADIOTECH_0066
     * @tc.desc   radio technology 65 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0066 begin');
      const result: string = RadioTechFormatter.techName(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(65)));
      expect(RadioTechFormatter.isKnown(65)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0066 end');
    })

    /**
     * @tc.name   testRadioTech0067
     * @tc.number SUB_RADIO_RADIOTECH_0067
     * @tc.desc   radio technology 66 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0067 begin');
      const result: string = RadioTechFormatter.techName(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(66)));
      expect(RadioTechFormatter.isKnown(66)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0067 end');
    })

    /**
     * @tc.name   testRadioTech0068
     * @tc.number SUB_RADIO_RADIOTECH_0068
     * @tc.desc   radio technology 67 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0068 begin');
      const result: string = RadioTechFormatter.techName(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(67)));
      expect(RadioTechFormatter.isKnown(67)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0068 end');
    })

    /**
     * @tc.name   testRadioTech0069
     * @tc.number SUB_RADIO_RADIOTECH_0069
     * @tc.desc   radio technology 68 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0069 begin');
      const result: string = RadioTechFormatter.techName(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(68)));
      expect(RadioTechFormatter.isKnown(68)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0069 end');
    })

    /**
     * @tc.name   testRadioTech0070
     * @tc.number SUB_RADIO_RADIOTECH_0070
     * @tc.desc   radio technology 69 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0070 begin');
      const result: string = RadioTechFormatter.techName(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(69)));
      expect(RadioTechFormatter.isKnown(69)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0070 end');
    })

    /**
     * @tc.name   testRadioTech0071
     * @tc.number SUB_RADIO_RADIOTECH_0071
     * @tc.desc   radio technology 70 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0071 begin');
      const result: string = RadioTechFormatter.techName(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(70)));
      expect(RadioTechFormatter.isKnown(70)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0071 end');
    })

    /**
     * @tc.name   testRadioTech0072
     * @tc.number SUB_RADIO_RADIOTECH_0072
     * @tc.desc   radio technology -1 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0072 begin');
      const result: string = RadioTechFormatter.techName(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(-1)));
      expect(RadioTechFormatter.isKnown(-1)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0072 end');
    })

    /**
     * @tc.name   testRadioTech0073
     * @tc.number SUB_RADIO_RADIOTECH_0073
     * @tc.desc   radio technology -2 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0073 begin');
      const result: string = RadioTechFormatter.techName(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(-2)));
      expect(RadioTechFormatter.isKnown(-2)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0073 end');
    })

    /**
     * @tc.name   testRadioTech0074
     * @tc.number SUB_RADIO_RADIOTECH_0074
     * @tc.desc   radio technology -12 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0074 begin');
      const result: string = RadioTechFormatter.techName(-12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(-12)));
      expect(RadioTechFormatter.isKnown(-12)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0074 end');
    })

    /**
     * @tc.name   testRadioTech0075
     * @tc.number SUB_RADIO_RADIOTECH_0075
     * @tc.desc   radio technology -100 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0075 begin');
      const result: string = RadioTechFormatter.techName(-100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(-100)));
      expect(RadioTechFormatter.isKnown(-100)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0075 end');
    })

    /**
     * @tc.name   testRadioTech0076
     * @tc.number SUB_RADIO_RADIOTECH_0076
     * @tc.desc   radio technology 0.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0076 begin');
      const result: string = RadioTechFormatter.techName(0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(0.5)));
      expect(RadioTechFormatter.isKnown(0.5)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0076 end');
    })

    /**
     * @tc.name   testRadioTech0077
     * @tc.number SUB_RADIO_RADIOTECH_0077
     * @tc.desc   radio technology 1.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0077 begin');
      const result: string = RadioTechFormatter.techName(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(1.5)));
      expect(RadioTechFormatter.isKnown(1.5)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0077 end');
    })

    /**
     * @tc.name   testRadioTech0078
     * @tc.number SUB_RADIO_RADIOTECH_0078
     * @tc.desc   radio technology 11.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0078 begin');
      const result: string = RadioTechFormatter.techName(11.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(11.5)));
      expect(RadioTechFormatter.isKnown(11.5)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0078 end');
    })

    /**
     * @tc.name   testRadioTech0079
     * @tc.number SUB_RADIO_RADIOTECH_0079
     * @tc.desc   radio technology 71 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0079 begin');
      const result: string = RadioTechFormatter.techName(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(71)));
      expect(RadioTechFormatter.isKnown(71)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0079 end');
    })

    /**
     * @tc.name   testRadioTech0080
     * @tc.number SUB_RADIO_RADIOTECH_0080
     * @tc.desc   NR 是 5G 制式的固定名称
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTech0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0080 begin');
      const anchorResult: string = RadioTechFormatter.techName(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(anchorResult), String('nr'));
      expect(anchorResult).assertEqual('nr');
      expect(anchorResult.length).assertEqual(2);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTech0080 end');
    })
  })
}
