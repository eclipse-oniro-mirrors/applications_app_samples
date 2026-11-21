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

export default function radioIsoUpper03Test() {
  describe('RadioIsoUpper03Test', () => {

    /**
     * @tc.name   testRadioIsoUpper0169
     * @tc.number SUB_RADIO_ISO_0169
     * @tc.desc   country code 'NO' normalizes to NO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0169 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('NO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NO'));
      expect(result).assertEqual('NO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0169 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0170
     * @tc.number SUB_RADIO_ISO_0170
     * @tc.desc   country code 'NP' normalizes to NP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0170 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('NP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NP'));
      expect(result).assertEqual('NP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0170 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0171
     * @tc.number SUB_RADIO_ISO_0171
     * @tc.desc   country code 'NR' normalizes to NR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0171 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('NR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NR'));
      expect(result).assertEqual('NR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0171 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0172
     * @tc.number SUB_RADIO_ISO_0172
     * @tc.desc   country code 'NU' normalizes to NU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0172 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('NU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NU'));
      expect(result).assertEqual('NU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0172 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0173
     * @tc.number SUB_RADIO_ISO_0173
     * @tc.desc   country code 'NZ' normalizes to NZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0173 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('NZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NZ'));
      expect(result).assertEqual('NZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0173 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0174
     * @tc.number SUB_RADIO_ISO_0174
     * @tc.desc   country code 'OM' normalizes to OM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0174 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('OM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('OM'));
      expect(result).assertEqual('OM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0174 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0175
     * @tc.number SUB_RADIO_ISO_0175
     * @tc.desc   country code 'PA' normalizes to PA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0175 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PA'));
      expect(result).assertEqual('PA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0175 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0176
     * @tc.number SUB_RADIO_ISO_0176
     * @tc.desc   country code 'PE' normalizes to PE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0176 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PE'));
      expect(result).assertEqual('PE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0176 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0177
     * @tc.number SUB_RADIO_ISO_0177
     * @tc.desc   country code 'PF' normalizes to PF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0177 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PF'));
      expect(result).assertEqual('PF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0177 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0178
     * @tc.number SUB_RADIO_ISO_0178
     * @tc.desc   country code 'PG' normalizes to PG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0178 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PG'));
      expect(result).assertEqual('PG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0178 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0179
     * @tc.number SUB_RADIO_ISO_0179
     * @tc.desc   country code 'PH' normalizes to PH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0179 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PH');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PH'));
      expect(result).assertEqual('PH');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0179 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0180
     * @tc.number SUB_RADIO_ISO_0180
     * @tc.desc   country code 'PK' normalizes to PK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0180 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PK');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PK'));
      expect(result).assertEqual('PK');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0180 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0181
     * @tc.number SUB_RADIO_ISO_0181
     * @tc.desc   country code 'PL' normalizes to PL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0181 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PL'));
      expect(result).assertEqual('PL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0181 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0182
     * @tc.number SUB_RADIO_ISO_0182
     * @tc.desc   country code 'PM' normalizes to PM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0182 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PM'));
      expect(result).assertEqual('PM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0182 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0183
     * @tc.number SUB_RADIO_ISO_0183
     * @tc.desc   country code 'PN' normalizes to PN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0183 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PN'));
      expect(result).assertEqual('PN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0183 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0184
     * @tc.number SUB_RADIO_ISO_0184
     * @tc.desc   country code 'PR' normalizes to PR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0184 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PR'));
      expect(result).assertEqual('PR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0184 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0185
     * @tc.number SUB_RADIO_ISO_0185
     * @tc.desc   country code 'PS' normalizes to PS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0185 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PS'));
      expect(result).assertEqual('PS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0185 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0186
     * @tc.number SUB_RADIO_ISO_0186
     * @tc.desc   country code 'PT' normalizes to PT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0186 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PT'));
      expect(result).assertEqual('PT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0186 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0187
     * @tc.number SUB_RADIO_ISO_0187
     * @tc.desc   country code 'PW' normalizes to PW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0187 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PW'));
      expect(result).assertEqual('PW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0187 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0188
     * @tc.number SUB_RADIO_ISO_0188
     * @tc.desc   country code 'PY' normalizes to PY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0188 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('PY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('PY'));
      expect(result).assertEqual('PY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0188 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0189
     * @tc.number SUB_RADIO_ISO_0189
     * @tc.desc   country code 'QA' normalizes to QA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0189 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('QA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('QA'));
      expect(result).assertEqual('QA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0189 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0190
     * @tc.number SUB_RADIO_ISO_0190
     * @tc.desc   country code 'RE' normalizes to RE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0190 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('RE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('RE'));
      expect(result).assertEqual('RE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0190 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0191
     * @tc.number SUB_RADIO_ISO_0191
     * @tc.desc   country code 'RO' normalizes to RO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0191 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('RO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('RO'));
      expect(result).assertEqual('RO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0191 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0192
     * @tc.number SUB_RADIO_ISO_0192
     * @tc.desc   country code 'RS' normalizes to RS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0192 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('RS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('RS'));
      expect(result).assertEqual('RS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0192 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0193
     * @tc.number SUB_RADIO_ISO_0193
     * @tc.desc   country code 'RU' normalizes to RU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0193 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('RU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('RU'));
      expect(result).assertEqual('RU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0193 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0194
     * @tc.number SUB_RADIO_ISO_0194
     * @tc.desc   country code 'RW' normalizes to RW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0194 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('RW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('RW'));
      expect(result).assertEqual('RW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0194 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0195
     * @tc.number SUB_RADIO_ISO_0195
     * @tc.desc   country code 'SA' normalizes to SA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0195 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SA'));
      expect(result).assertEqual('SA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0195 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0196
     * @tc.number SUB_RADIO_ISO_0196
     * @tc.desc   country code 'SB' normalizes to SB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0196 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SB'));
      expect(result).assertEqual('SB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0196 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0197
     * @tc.number SUB_RADIO_ISO_0197
     * @tc.desc   country code 'SC' normalizes to SC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0197 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SC'));
      expect(result).assertEqual('SC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0197 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0198
     * @tc.number SUB_RADIO_ISO_0198
     * @tc.desc   country code 'SD' normalizes to SD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0198 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SD');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SD'));
      expect(result).assertEqual('SD');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0198 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0199
     * @tc.number SUB_RADIO_ISO_0199
     * @tc.desc   country code 'SE' normalizes to SE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0199 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SE'));
      expect(result).assertEqual('SE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0199 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0200
     * @tc.number SUB_RADIO_ISO_0200
     * @tc.desc   country code 'SG' normalizes to SG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0200 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SG'));
      expect(result).assertEqual('SG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0200 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0201
     * @tc.number SUB_RADIO_ISO_0201
     * @tc.desc   country code 'SH' normalizes to SH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0201 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SH');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SH'));
      expect(result).assertEqual('SH');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0201 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0202
     * @tc.number SUB_RADIO_ISO_0202
     * @tc.desc   country code 'SI' normalizes to SI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0202 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SI');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SI'));
      expect(result).assertEqual('SI');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0202 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0203
     * @tc.number SUB_RADIO_ISO_0203
     * @tc.desc   country code 'SJ' normalizes to SJ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0203 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SJ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SJ'));
      expect(result).assertEqual('SJ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0203 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0204
     * @tc.number SUB_RADIO_ISO_0204
     * @tc.desc   country code 'SK' normalizes to SK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0204 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SK');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SK'));
      expect(result).assertEqual('SK');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0204 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0205
     * @tc.number SUB_RADIO_ISO_0205
     * @tc.desc   country code 'SL' normalizes to SL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0205 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SL'));
      expect(result).assertEqual('SL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0205 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0206
     * @tc.number SUB_RADIO_ISO_0206
     * @tc.desc   country code 'SM' normalizes to SM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0206 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SM'));
      expect(result).assertEqual('SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0206 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0207
     * @tc.number SUB_RADIO_ISO_0207
     * @tc.desc   country code 'SN' normalizes to SN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0207 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SN'));
      expect(result).assertEqual('SN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0207 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0208
     * @tc.number SUB_RADIO_ISO_0208
     * @tc.desc   country code 'SO' normalizes to SO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0208 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SO'));
      expect(result).assertEqual('SO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0208 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0209
     * @tc.number SUB_RADIO_ISO_0209
     * @tc.desc   country code 'SR' normalizes to SR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0209 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SR'));
      expect(result).assertEqual('SR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0209 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0210
     * @tc.number SUB_RADIO_ISO_0210
     * @tc.desc   country code 'SS' normalizes to SS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0210 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SS'));
      expect(result).assertEqual('SS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0210 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0211
     * @tc.number SUB_RADIO_ISO_0211
     * @tc.desc   country code 'ST' normalizes to ST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0211 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('ST');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ST'));
      expect(result).assertEqual('ST');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0211 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0212
     * @tc.number SUB_RADIO_ISO_0212
     * @tc.desc   country code 'SV' normalizes to SV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0212 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SV');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SV'));
      expect(result).assertEqual('SV');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0212 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0213
     * @tc.number SUB_RADIO_ISO_0213
     * @tc.desc   country code 'SX' normalizes to SX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0213 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SX'));
      expect(result).assertEqual('SX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0213 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0214
     * @tc.number SUB_RADIO_ISO_0214
     * @tc.desc   country code 'SY' normalizes to SY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0214 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SY'));
      expect(result).assertEqual('SY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0214 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0215
     * @tc.number SUB_RADIO_ISO_0215
     * @tc.desc   country code 'SZ' normalizes to SZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0215 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('SZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SZ'));
      expect(result).assertEqual('SZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0215 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0216
     * @tc.number SUB_RADIO_ISO_0216
     * @tc.desc   country code 'TC' normalizes to TC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0216 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TC'));
      expect(result).assertEqual('TC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0216 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0217
     * @tc.number SUB_RADIO_ISO_0217
     * @tc.desc   country code 'TD' normalizes to TD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0217 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TD');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TD'));
      expect(result).assertEqual('TD');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0217 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0218
     * @tc.number SUB_RADIO_ISO_0218
     * @tc.desc   country code 'TF' normalizes to TF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0218 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TF'));
      expect(result).assertEqual('TF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0218 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0219
     * @tc.number SUB_RADIO_ISO_0219
     * @tc.desc   country code 'TG' normalizes to TG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0219 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TG'));
      expect(result).assertEqual('TG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0219 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0220
     * @tc.number SUB_RADIO_ISO_0220
     * @tc.desc   country code 'TH' normalizes to TH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0220 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TH');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TH'));
      expect(result).assertEqual('TH');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0220 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0221
     * @tc.number SUB_RADIO_ISO_0221
     * @tc.desc   country code 'TJ' normalizes to TJ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0221 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TJ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TJ'));
      expect(result).assertEqual('TJ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0221 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0222
     * @tc.number SUB_RADIO_ISO_0222
     * @tc.desc   country code 'TK' normalizes to TK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0222 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TK');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TK'));
      expect(result).assertEqual('TK');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0222 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0223
     * @tc.number SUB_RADIO_ISO_0223
     * @tc.desc   country code 'TL' normalizes to TL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0223 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TL'));
      expect(result).assertEqual('TL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0223 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0224
     * @tc.number SUB_RADIO_ISO_0224
     * @tc.desc   country code 'TM' normalizes to TM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0224 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TM'));
      expect(result).assertEqual('TM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0224 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0225
     * @tc.number SUB_RADIO_ISO_0225
     * @tc.desc   country code 'TN' normalizes to TN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0225 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TN'));
      expect(result).assertEqual('TN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0225 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0226
     * @tc.number SUB_RADIO_ISO_0226
     * @tc.desc   country code 'TO' normalizes to TO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0226 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TO'));
      expect(result).assertEqual('TO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0226 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0227
     * @tc.number SUB_RADIO_ISO_0227
     * @tc.desc   country code 'TR' normalizes to TR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0227 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TR'));
      expect(result).assertEqual('TR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0227 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0228
     * @tc.number SUB_RADIO_ISO_0228
     * @tc.desc   country code 'TT' normalizes to TT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0228 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TT'));
      expect(result).assertEqual('TT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0228 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0229
     * @tc.number SUB_RADIO_ISO_0229
     * @tc.desc   country code 'TV' normalizes to TV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0229 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TV');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TV'));
      expect(result).assertEqual('TV');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0229 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0230
     * @tc.number SUB_RADIO_ISO_0230
     * @tc.desc   country code 'TW' normalizes to TW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0230 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TW'));
      expect(result).assertEqual('TW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0230 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0231
     * @tc.number SUB_RADIO_ISO_0231
     * @tc.desc   country code 'TZ' normalizes to TZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0231 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('TZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TZ'));
      expect(result).assertEqual('TZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0231 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0232
     * @tc.number SUB_RADIO_ISO_0232
     * @tc.desc   country code 'UA' normalizes to UA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0232 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('UA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('UA'));
      expect(result).assertEqual('UA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0232 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0233
     * @tc.number SUB_RADIO_ISO_0233
     * @tc.desc   country code 'UG' normalizes to UG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0233 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('UG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('UG'));
      expect(result).assertEqual('UG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0233 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0234
     * @tc.number SUB_RADIO_ISO_0234
     * @tc.desc   country code 'UM' normalizes to UM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0234 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('UM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('UM'));
      expect(result).assertEqual('UM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0234 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0235
     * @tc.number SUB_RADIO_ISO_0235
     * @tc.desc   country code 'US' normalizes to US
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0235 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('US');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('US'));
      expect(result).assertEqual('US');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0235 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0236
     * @tc.number SUB_RADIO_ISO_0236
     * @tc.desc   country code 'UY' normalizes to UY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0236 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('UY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('UY'));
      expect(result).assertEqual('UY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0236 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0237
     * @tc.number SUB_RADIO_ISO_0237
     * @tc.desc   country code 'UZ' normalizes to UZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0237 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('UZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('UZ'));
      expect(result).assertEqual('UZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0237 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0238
     * @tc.number SUB_RADIO_ISO_0238
     * @tc.desc   country code 'VA' normalizes to VA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0238 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('VA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('VA'));
      expect(result).assertEqual('VA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0238 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0239
     * @tc.number SUB_RADIO_ISO_0239
     * @tc.desc   country code 'VC' normalizes to VC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0239 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('VC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('VC'));
      expect(result).assertEqual('VC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0239 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0240
     * @tc.number SUB_RADIO_ISO_0240
     * @tc.desc   country code 'VE' normalizes to VE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0240 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('VE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('VE'));
      expect(result).assertEqual('VE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0240 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0241
     * @tc.number SUB_RADIO_ISO_0241
     * @tc.desc   country code 'VG' normalizes to VG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0241 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('VG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('VG'));
      expect(result).assertEqual('VG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0241 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0242
     * @tc.number SUB_RADIO_ISO_0242
     * @tc.desc   country code 'VI' normalizes to VI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0242 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('VI');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('VI'));
      expect(result).assertEqual('VI');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0242 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0243
     * @tc.number SUB_RADIO_ISO_0243
     * @tc.desc   country code 'VN' normalizes to VN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0243 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('VN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('VN'));
      expect(result).assertEqual('VN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0243 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0244
     * @tc.number SUB_RADIO_ISO_0244
     * @tc.desc   country code 'VU' normalizes to VU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0244 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('VU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('VU'));
      expect(result).assertEqual('VU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0244 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0245
     * @tc.number SUB_RADIO_ISO_0245
     * @tc.desc   country code 'WF' normalizes to WF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0245 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('WF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('WF'));
      expect(result).assertEqual('WF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0245 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0246
     * @tc.number SUB_RADIO_ISO_0246
     * @tc.desc   country code 'WS' normalizes to WS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0246 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('WS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('WS'));
      expect(result).assertEqual('WS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0246 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0247
     * @tc.number SUB_RADIO_ISO_0247
     * @tc.desc   country code 'YE' normalizes to YE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0247 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('YE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('YE'));
      expect(result).assertEqual('YE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0247 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0248
     * @tc.number SUB_RADIO_ISO_0248
     * @tc.desc   country code 'YT' normalizes to YT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0248 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('YT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('YT'));
      expect(result).assertEqual('YT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0248 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0249
     * @tc.number SUB_RADIO_ISO_0249
     * @tc.desc   country code 'ZA' normalizes to ZA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0249 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('ZA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ZA'));
      expect(result).assertEqual('ZA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0249 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0250
     * @tc.number SUB_RADIO_ISO_0250
     * @tc.desc   country code 'ZM' normalizes to ZM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0250 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('ZM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ZM'));
      expect(result).assertEqual('ZM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0250 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0251
     * @tc.number SUB_RADIO_ISO_0251
     * @tc.desc   country code 'ZW' normalizes to ZW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0251 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('ZW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ZW'));
      expect(result).assertEqual('ZW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0251 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0252
     * @tc.number SUB_RADIO_ISO_0252
     * @tc.desc   小写国家码归一化为大写且长度保持 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0252 begin');
      const anchorResult: string = SimInfoFormatter.formatIsoCountryCode('cn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(anchorResult), String('CN'));
      expect(anchorResult).assertEqual('CN');
      expect(anchorResult.length).assertEqual(2);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0252 end');
    })
  })
}
