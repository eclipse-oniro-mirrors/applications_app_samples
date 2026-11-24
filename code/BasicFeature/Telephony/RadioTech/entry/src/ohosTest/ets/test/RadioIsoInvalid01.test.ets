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

export default function radioIsoInvalid01Test() {
  describe('RadioIsoInvalid01Test', () => {

    /**
     * @tc.name   testRadioIsoInvalid0001
     * @tc.number SUB_RADIO_ISOINVALID_0001
     * @tc.desc   invalid country code #1 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0001 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0001 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0002
     * @tc.number SUB_RADIO_ISOINVALID_0002
     * @tc.desc   invalid country code #2 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0002 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode(' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0002 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0003
     * @tc.number SUB_RADIO_ISOINVALID_0003
     * @tc.desc   invalid country code #3 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0003 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0003 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0004
     * @tc.number SUB_RADIO_ISOINVALID_0004
     * @tc.desc   invalid country code #4 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0004 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('C');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0004 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0005
     * @tc.number SUB_RADIO_ISOINVALID_0005
     * @tc.desc   invalid country code #5 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0005 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('CHN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0005 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0006
     * @tc.number SUB_RADIO_ISOINVALID_0006
     * @tc.desc   invalid country code #6 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0006 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('1N');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0006 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0007
     * @tc.number SUB_RADIO_ISOINVALID_0007
     * @tc.desc   invalid country code #7 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0007 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('N1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0007 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0008
     * @tc.number SUB_RADIO_ISOINVALID_0008
     * @tc.desc   invalid country code #8 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0008 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('--');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0008 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0009
     * @tc.number SUB_RADIO_ISOINVALID_0009
     * @tc.desc   invalid country code #9 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0009 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('C1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0009 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0010
     * @tc.number SUB_RADIO_ISOINVALID_0010
     * @tc.desc   invalid country code #10 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0010 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('1C');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0010 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0011
     * @tc.number SUB_RADIO_ISOINVALID_0011
     * @tc.desc   invalid country code #11 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0011 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0011 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0012
     * @tc.number SUB_RADIO_ISOINVALID_0012
     * @tc.desc   invalid country code #12 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0012 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('ab c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0012 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0013
     * @tc.number SUB_RADIO_ISOINVALID_0013
     * @tc.desc   invalid country code #13 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0013 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode(' c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0013 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0014
     * @tc.number SUB_RADIO_ISOINVALID_0014
     * @tc.desc   invalid country code #14 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0014 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('c ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0014 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0015
     * @tc.number SUB_RADIO_ISOINVALID_0015
     * @tc.desc   invalid country code #15 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0015 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('中国');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0015 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0016
     * @tc.number SUB_RADIO_ISOINVALID_0016
     * @tc.desc   invalid country code #16 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0016 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('A B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0016 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0017
     * @tc.number SUB_RADIO_ISOINVALID_0017
     * @tc.desc   invalid country code #17 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0017 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('A\tB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0017 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0018
     * @tc.number SUB_RADIO_ISOINVALID_0018
     * @tc.desc   invalid country code #18 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0018 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('A\nB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0018 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0019
     * @tc.number SUB_RADIO_ISOINVALID_0019
     * @tc.desc   invalid country code #19 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0019 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('A-B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0019 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0020
     * @tc.number SUB_RADIO_ISOINVALID_0020
     * @tc.desc   invalid country code #20 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0020 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('A_B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0020 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0021
     * @tc.number SUB_RADIO_ISOINVALID_0021
     * @tc.desc   invalid country code #21 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0021 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('A.B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0021 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0022
     * @tc.number SUB_RADIO_ISOINVALID_0022
     * @tc.desc   invalid country code #22 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0022 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('A1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0022 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0023
     * @tc.number SUB_RADIO_ISOINVALID_0023
     * @tc.desc   invalid country code #23 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0023 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('1A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0023 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0024
     * @tc.number SUB_RADIO_ISOINVALID_0024
     * @tc.desc   invalid country code #24 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0024 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('ZZZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0024 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0025
     * @tc.number SUB_RADIO_ISOINVALID_0025
     * @tc.desc   invalid country code #25 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0025 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('zzz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0025 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0026
     * @tc.number SUB_RADIO_ISOINVALID_0026
     * @tc.desc   invalid country code #26 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0026 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('ZZ0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'not available'));
      expect(result === 'not available').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0026 end');
    })

    /**
     * @tc.name   testRadioIsoInvalid0027
     * @tc.number SUB_RADIO_ISOINVALID_0027
     * @tc.desc   字母加数字的两位组合不是合法 ISO 码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoInvalid0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0027 begin');
      const anchorResult: string = SimInfoFormatter.formatIsoCountryCode('A1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(anchorResult));
      expect(anchorResult).assertEqual('not available');
      expect(anchorResult.length).assertEqual(13);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoInvalid0027 end');
    })
  })
}
