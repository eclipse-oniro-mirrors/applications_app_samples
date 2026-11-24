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

export default function radioIsoUpper02Test() {
  describe('RadioIsoUpper02Test', () => {

    /**
     * @tc.name   testRadioIsoUpper0085
     * @tc.number SUB_RADIO_ISO_0085
     * @tc.desc   country code 'GL' normalizes to GL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0085 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('GL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('GL'));
      expect(result).assertEqual('GL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0085 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0086
     * @tc.number SUB_RADIO_ISO_0086
     * @tc.desc   country code 'GM' normalizes to GM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0086 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('GM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('GM'));
      expect(result).assertEqual('GM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0086 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0087
     * @tc.number SUB_RADIO_ISO_0087
     * @tc.desc   country code 'GN' normalizes to GN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0087 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('GN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('GN'));
      expect(result).assertEqual('GN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0087 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0088
     * @tc.number SUB_RADIO_ISO_0088
     * @tc.desc   country code 'GP' normalizes to GP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0088 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('GP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('GP'));
      expect(result).assertEqual('GP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0088 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0089
     * @tc.number SUB_RADIO_ISO_0089
     * @tc.desc   country code 'GQ' normalizes to GQ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0089 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('GQ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('GQ'));
      expect(result).assertEqual('GQ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0089 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0090
     * @tc.number SUB_RADIO_ISO_0090
     * @tc.desc   country code 'GR' normalizes to GR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0090 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('GR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('GR'));
      expect(result).assertEqual('GR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0090 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0091
     * @tc.number SUB_RADIO_ISO_0091
     * @tc.desc   country code 'GS' normalizes to GS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0091 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('GS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('GS'));
      expect(result).assertEqual('GS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0091 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0092
     * @tc.number SUB_RADIO_ISO_0092
     * @tc.desc   country code 'GT' normalizes to GT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0092 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('GT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('GT'));
      expect(result).assertEqual('GT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0092 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0093
     * @tc.number SUB_RADIO_ISO_0093
     * @tc.desc   country code 'GU' normalizes to GU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0093 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('GU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('GU'));
      expect(result).assertEqual('GU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0093 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0094
     * @tc.number SUB_RADIO_ISO_0094
     * @tc.desc   country code 'GW' normalizes to GW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0094 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('GW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('GW'));
      expect(result).assertEqual('GW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0094 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0095
     * @tc.number SUB_RADIO_ISO_0095
     * @tc.desc   country code 'GY' normalizes to GY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0095 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('GY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('GY'));
      expect(result).assertEqual('GY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0095 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0096
     * @tc.number SUB_RADIO_ISO_0096
     * @tc.desc   country code 'HK' normalizes to HK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0096 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('HK');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('HK'));
      expect(result).assertEqual('HK');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0096 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0097
     * @tc.number SUB_RADIO_ISO_0097
     * @tc.desc   country code 'HM' normalizes to HM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0097 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('HM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('HM'));
      expect(result).assertEqual('HM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0097 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0098
     * @tc.number SUB_RADIO_ISO_0098
     * @tc.desc   country code 'HN' normalizes to HN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0098 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('HN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('HN'));
      expect(result).assertEqual('HN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0098 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0099
     * @tc.number SUB_RADIO_ISO_0099
     * @tc.desc   country code 'HR' normalizes to HR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0099 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('HR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('HR'));
      expect(result).assertEqual('HR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0099 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0100
     * @tc.number SUB_RADIO_ISO_0100
     * @tc.desc   country code 'HT' normalizes to HT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0100 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('HT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('HT'));
      expect(result).assertEqual('HT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0100 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0101
     * @tc.number SUB_RADIO_ISO_0101
     * @tc.desc   country code 'HU' normalizes to HU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0101 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('HU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('HU'));
      expect(result).assertEqual('HU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0101 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0102
     * @tc.number SUB_RADIO_ISO_0102
     * @tc.desc   country code 'ID' normalizes to ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0102 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('ID');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ID'));
      expect(result).assertEqual('ID');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0102 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0103
     * @tc.number SUB_RADIO_ISO_0103
     * @tc.desc   country code 'IE' normalizes to IE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0103 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('IE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('IE'));
      expect(result).assertEqual('IE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0103 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0104
     * @tc.number SUB_RADIO_ISO_0104
     * @tc.desc   country code 'IL' normalizes to IL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0104 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('IL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('IL'));
      expect(result).assertEqual('IL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0104 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0105
     * @tc.number SUB_RADIO_ISO_0105
     * @tc.desc   country code 'IM' normalizes to IM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0105 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('IM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('IM'));
      expect(result).assertEqual('IM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0105 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0106
     * @tc.number SUB_RADIO_ISO_0106
     * @tc.desc   country code 'IN' normalizes to IN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0106 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('IN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('IN'));
      expect(result).assertEqual('IN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0106 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0107
     * @tc.number SUB_RADIO_ISO_0107
     * @tc.desc   country code 'IO' normalizes to IO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0107 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('IO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('IO'));
      expect(result).assertEqual('IO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0107 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0108
     * @tc.number SUB_RADIO_ISO_0108
     * @tc.desc   country code 'IQ' normalizes to IQ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0108 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('IQ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('IQ'));
      expect(result).assertEqual('IQ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0108 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0109
     * @tc.number SUB_RADIO_ISO_0109
     * @tc.desc   country code 'IR' normalizes to IR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0109 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('IR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('IR'));
      expect(result).assertEqual('IR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0109 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0110
     * @tc.number SUB_RADIO_ISO_0110
     * @tc.desc   country code 'IS' normalizes to IS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0110 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('IS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('IS'));
      expect(result).assertEqual('IS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0110 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0111
     * @tc.number SUB_RADIO_ISO_0111
     * @tc.desc   country code 'IT' normalizes to IT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0111 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('IT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('IT'));
      expect(result).assertEqual('IT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0111 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0112
     * @tc.number SUB_RADIO_ISO_0112
     * @tc.desc   country code 'JE' normalizes to JE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0112 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('JE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('JE'));
      expect(result).assertEqual('JE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0112 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0113
     * @tc.number SUB_RADIO_ISO_0113
     * @tc.desc   country code 'JM' normalizes to JM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0113 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('JM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('JM'));
      expect(result).assertEqual('JM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0113 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0114
     * @tc.number SUB_RADIO_ISO_0114
     * @tc.desc   country code 'JO' normalizes to JO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0114 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('JO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('JO'));
      expect(result).assertEqual('JO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0114 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0115
     * @tc.number SUB_RADIO_ISO_0115
     * @tc.desc   country code 'JP' normalizes to JP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0115 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('JP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('JP'));
      expect(result).assertEqual('JP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0115 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0116
     * @tc.number SUB_RADIO_ISO_0116
     * @tc.desc   country code 'KE' normalizes to KE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0116 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('KE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('KE'));
      expect(result).assertEqual('KE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0116 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0117
     * @tc.number SUB_RADIO_ISO_0117
     * @tc.desc   country code 'KG' normalizes to KG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0117 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('KG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('KG'));
      expect(result).assertEqual('KG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0117 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0118
     * @tc.number SUB_RADIO_ISO_0118
     * @tc.desc   country code 'KH' normalizes to KH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0118 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('KH');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('KH'));
      expect(result).assertEqual('KH');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0118 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0119
     * @tc.number SUB_RADIO_ISO_0119
     * @tc.desc   country code 'KI' normalizes to KI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0119 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('KI');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('KI'));
      expect(result).assertEqual('KI');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0119 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0120
     * @tc.number SUB_RADIO_ISO_0120
     * @tc.desc   country code 'KM' normalizes to KM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0120 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('KM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('KM'));
      expect(result).assertEqual('KM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0120 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0121
     * @tc.number SUB_RADIO_ISO_0121
     * @tc.desc   country code 'KN' normalizes to KN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0121 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('KN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('KN'));
      expect(result).assertEqual('KN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0121 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0122
     * @tc.number SUB_RADIO_ISO_0122
     * @tc.desc   country code 'KP' normalizes to KP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0122 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('KP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('KP'));
      expect(result).assertEqual('KP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0122 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0123
     * @tc.number SUB_RADIO_ISO_0123
     * @tc.desc   country code 'KR' normalizes to KR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0123 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('KR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('KR'));
      expect(result).assertEqual('KR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0123 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0124
     * @tc.number SUB_RADIO_ISO_0124
     * @tc.desc   country code 'KW' normalizes to KW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0124 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('KW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('KW'));
      expect(result).assertEqual('KW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0124 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0125
     * @tc.number SUB_RADIO_ISO_0125
     * @tc.desc   country code 'KY' normalizes to KY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0125 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('KY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('KY'));
      expect(result).assertEqual('KY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0125 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0126
     * @tc.number SUB_RADIO_ISO_0126
     * @tc.desc   country code 'KZ' normalizes to KZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0126 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('KZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('KZ'));
      expect(result).assertEqual('KZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0126 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0127
     * @tc.number SUB_RADIO_ISO_0127
     * @tc.desc   country code 'LA' normalizes to LA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0127 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('LA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('LA'));
      expect(result).assertEqual('LA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0127 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0128
     * @tc.number SUB_RADIO_ISO_0128
     * @tc.desc   country code 'LB' normalizes to LB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0128 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('LB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('LB'));
      expect(result).assertEqual('LB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0128 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0129
     * @tc.number SUB_RADIO_ISO_0129
     * @tc.desc   country code 'LC' normalizes to LC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0129 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('LC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('LC'));
      expect(result).assertEqual('LC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0129 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0130
     * @tc.number SUB_RADIO_ISO_0130
     * @tc.desc   country code 'LI' normalizes to LI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0130 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('LI');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('LI'));
      expect(result).assertEqual('LI');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0130 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0131
     * @tc.number SUB_RADIO_ISO_0131
     * @tc.desc   country code 'LK' normalizes to LK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0131 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('LK');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('LK'));
      expect(result).assertEqual('LK');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0131 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0132
     * @tc.number SUB_RADIO_ISO_0132
     * @tc.desc   country code 'LR' normalizes to LR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0132 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('LR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('LR'));
      expect(result).assertEqual('LR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0132 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0133
     * @tc.number SUB_RADIO_ISO_0133
     * @tc.desc   country code 'LS' normalizes to LS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0133 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('LS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('LS'));
      expect(result).assertEqual('LS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0133 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0134
     * @tc.number SUB_RADIO_ISO_0134
     * @tc.desc   country code 'LT' normalizes to LT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0134 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('LT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('LT'));
      expect(result).assertEqual('LT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0134 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0135
     * @tc.number SUB_RADIO_ISO_0135
     * @tc.desc   country code 'LU' normalizes to LU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0135 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('LU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('LU'));
      expect(result).assertEqual('LU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0135 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0136
     * @tc.number SUB_RADIO_ISO_0136
     * @tc.desc   country code 'LV' normalizes to LV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0136 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('LV');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('LV'));
      expect(result).assertEqual('LV');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0136 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0137
     * @tc.number SUB_RADIO_ISO_0137
     * @tc.desc   country code 'LY' normalizes to LY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0137 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('LY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('LY'));
      expect(result).assertEqual('LY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0137 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0138
     * @tc.number SUB_RADIO_ISO_0138
     * @tc.desc   country code 'MA' normalizes to MA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0138 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MA'));
      expect(result).assertEqual('MA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0138 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0139
     * @tc.number SUB_RADIO_ISO_0139
     * @tc.desc   country code 'MC' normalizes to MC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0139 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MC'));
      expect(result).assertEqual('MC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0139 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0140
     * @tc.number SUB_RADIO_ISO_0140
     * @tc.desc   country code 'MD' normalizes to MD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0140 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MD');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MD'));
      expect(result).assertEqual('MD');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0140 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0141
     * @tc.number SUB_RADIO_ISO_0141
     * @tc.desc   country code 'ME' normalizes to ME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0141 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('ME');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ME'));
      expect(result).assertEqual('ME');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0141 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0142
     * @tc.number SUB_RADIO_ISO_0142
     * @tc.desc   country code 'MF' normalizes to MF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0142 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MF'));
      expect(result).assertEqual('MF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0142 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0143
     * @tc.number SUB_RADIO_ISO_0143
     * @tc.desc   country code 'MG' normalizes to MG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0143 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MG'));
      expect(result).assertEqual('MG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0143 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0144
     * @tc.number SUB_RADIO_ISO_0144
     * @tc.desc   country code 'MH' normalizes to MH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0144 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MH');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MH'));
      expect(result).assertEqual('MH');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0144 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0145
     * @tc.number SUB_RADIO_ISO_0145
     * @tc.desc   country code 'MK' normalizes to MK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0145 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MK');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MK'));
      expect(result).assertEqual('MK');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0145 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0146
     * @tc.number SUB_RADIO_ISO_0146
     * @tc.desc   country code 'ML' normalizes to ML
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0146 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('ML');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ML'));
      expect(result).assertEqual('ML');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0146 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0147
     * @tc.number SUB_RADIO_ISO_0147
     * @tc.desc   country code 'MM' normalizes to MM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0147 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MM'));
      expect(result).assertEqual('MM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0147 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0148
     * @tc.number SUB_RADIO_ISO_0148
     * @tc.desc   country code 'MN' normalizes to MN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0148 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MN'));
      expect(result).assertEqual('MN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0148 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0149
     * @tc.number SUB_RADIO_ISO_0149
     * @tc.desc   country code 'MO' normalizes to MO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0149 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MO'));
      expect(result).assertEqual('MO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0149 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0150
     * @tc.number SUB_RADIO_ISO_0150
     * @tc.desc   country code 'MP' normalizes to MP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0150 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MP'));
      expect(result).assertEqual('MP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0150 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0151
     * @tc.number SUB_RADIO_ISO_0151
     * @tc.desc   country code 'MQ' normalizes to MQ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0151 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MQ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MQ'));
      expect(result).assertEqual('MQ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0151 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0152
     * @tc.number SUB_RADIO_ISO_0152
     * @tc.desc   country code 'MR' normalizes to MR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0152 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MR'));
      expect(result).assertEqual('MR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0152 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0153
     * @tc.number SUB_RADIO_ISO_0153
     * @tc.desc   country code 'MS' normalizes to MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0153 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MS'));
      expect(result).assertEqual('MS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0153 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0154
     * @tc.number SUB_RADIO_ISO_0154
     * @tc.desc   country code 'MT' normalizes to MT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0154 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MT'));
      expect(result).assertEqual('MT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0154 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0155
     * @tc.number SUB_RADIO_ISO_0155
     * @tc.desc   country code 'MU' normalizes to MU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0155 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MU'));
      expect(result).assertEqual('MU');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0155 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0156
     * @tc.number SUB_RADIO_ISO_0156
     * @tc.desc   country code 'MV' normalizes to MV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0156 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MV');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MV'));
      expect(result).assertEqual('MV');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0156 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0157
     * @tc.number SUB_RADIO_ISO_0157
     * @tc.desc   country code 'MW' normalizes to MW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0157 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MW'));
      expect(result).assertEqual('MW');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0157 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0158
     * @tc.number SUB_RADIO_ISO_0158
     * @tc.desc   country code 'MX' normalizes to MX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0158 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MX'));
      expect(result).assertEqual('MX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0158 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0159
     * @tc.number SUB_RADIO_ISO_0159
     * @tc.desc   country code 'MY' normalizes to MY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0159 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MY'));
      expect(result).assertEqual('MY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0159 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0160
     * @tc.number SUB_RADIO_ISO_0160
     * @tc.desc   country code 'MZ' normalizes to MZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0160 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('MZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MZ'));
      expect(result).assertEqual('MZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0160 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0161
     * @tc.number SUB_RADIO_ISO_0161
     * @tc.desc   country code 'NA' normalizes to NA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0161 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('NA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NA'));
      expect(result).assertEqual('NA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0161 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0162
     * @tc.number SUB_RADIO_ISO_0162
     * @tc.desc   country code 'NC' normalizes to NC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0162 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('NC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NC'));
      expect(result).assertEqual('NC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0162 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0163
     * @tc.number SUB_RADIO_ISO_0163
     * @tc.desc   country code 'NE' normalizes to NE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0163 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('NE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NE'));
      expect(result).assertEqual('NE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0163 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0164
     * @tc.number SUB_RADIO_ISO_0164
     * @tc.desc   country code 'NF' normalizes to NF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0164 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('NF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NF'));
      expect(result).assertEqual('NF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0164 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0165
     * @tc.number SUB_RADIO_ISO_0165
     * @tc.desc   country code 'NG' normalizes to NG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0165 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('NG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NG'));
      expect(result).assertEqual('NG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0165 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0166
     * @tc.number SUB_RADIO_ISO_0166
     * @tc.desc   country code 'NI' normalizes to NI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0166 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('NI');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NI'));
      expect(result).assertEqual('NI');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0166 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0167
     * @tc.number SUB_RADIO_ISO_0167
     * @tc.desc   country code 'NL' normalizes to NL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0167 begin');
      const result: string = SimInfoFormatter.formatIsoCountryCode('NL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NL'));
      expect(result).assertEqual('NL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0167 end');
    })

    /**
     * @tc.name   testRadioIsoUpper0168
     * @tc.number SUB_RADIO_ISO_0168
     * @tc.desc   小写国家码归一化为大写且长度保持 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioIsoUpper0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0168 begin');
      const anchorResult: string = SimInfoFormatter.formatIsoCountryCode('cn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(anchorResult), String('CN'));
      expect(anchorResult).assertEqual('CN');
      expect(anchorResult.length).assertEqual(2);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioIsoUpper0168 end');
    })
  })
}
