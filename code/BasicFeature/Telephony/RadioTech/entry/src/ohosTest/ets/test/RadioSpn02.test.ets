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

export default function radioSpn02Test() {
  describe('RadioSpn02Test', () => {

    /**
     * @tc.name   testRadioSpn0081
     * @tc.number SUB_RADIO_SPN_0081
     * @tc.desc   SPN 'DTAC' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0081 begin');
      const result: string = SimInfoFormatter.formatSpn('  DTAC  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('DTAC'));
      expect(result).assertEqual('DTAC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0081 end');
    })

    /**
     * @tc.name   testRadioSpn0082
     * @tc.number SUB_RADIO_SPN_0082
     * @tc.desc   SPN 'Globe' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0082 begin');
      const result: string = SimInfoFormatter.formatSpn('  Globe  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Globe'));
      expect(result).assertEqual('Globe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0082 end');
    })

    /**
     * @tc.name   testRadioSpn0083
     * @tc.number SUB_RADIO_SPN_0083
     * @tc.desc   SPN 'Smart' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0083 begin');
      const result: string = SimInfoFormatter.formatSpn('  Smart  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Smart'));
      expect(result).assertEqual('Smart');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0083 end');
    })

    /**
     * @tc.name   testRadioSpn0084
     * @tc.number SUB_RADIO_SPN_0084
     * @tc.desc   SPN 'Telkomsel' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0084 begin');
      const result: string = SimInfoFormatter.formatSpn('  Telkomsel  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Telkomsel'));
      expect(result).assertEqual('Telkomsel');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0084 end');
    })

    /**
     * @tc.name   testRadioSpn0085
     * @tc.number SUB_RADIO_SPN_0085
     * @tc.desc   SPN 'Singtel' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0085 begin');
      const result: string = SimInfoFormatter.formatSpn('  Singtel  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Singtel'));
      expect(result).assertEqual('Singtel');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0085 end');
    })

    /**
     * @tc.name   testRadioSpn0086
     * @tc.number SUB_RADIO_SPN_0086
     * @tc.desc   SPN 'Maxis' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0086 begin');
      const result: string = SimInfoFormatter.formatSpn('  Maxis  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Maxis'));
      expect(result).assertEqual('Maxis');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0086 end');
    })

    /**
     * @tc.name   testRadioSpn0087
     * @tc.number SUB_RADIO_SPN_0087
     * @tc.desc   SPN 'Celcom' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0087 begin');
      const result: string = SimInfoFormatter.formatSpn('  Celcom  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Celcom'));
      expect(result).assertEqual('Celcom');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0087 end');
    })

    /**
     * @tc.name   testRadioSpn0088
     * @tc.number SUB_RADIO_SPN_0088
     * @tc.desc   SPN 'Viettel' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0088 begin');
      const result: string = SimInfoFormatter.formatSpn('  Viettel  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Viettel'));
      expect(result).assertEqual('Viettel');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0088 end');
    })

    /**
     * @tc.name   testRadioSpn0089
     * @tc.number SUB_RADIO_SPN_0089
     * @tc.desc   SPN 'Vinaphone' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0089 begin');
      const result: string = SimInfoFormatter.formatSpn('  Vinaphone  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Vinaphone'));
      expect(result).assertEqual('Vinaphone');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0089 end');
    })

    /**
     * @tc.name   testRadioSpn0090
     * @tc.number SUB_RADIO_SPN_0090
     * @tc.desc   SPN 'MobiFone' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0090 begin');
      const result: string = SimInfoFormatter.formatSpn('  MobiFone  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MobiFone'));
      expect(result).assertEqual('MobiFone');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0090 end');
    })

    /**
     * @tc.name   testRadioSpn0091
     * @tc.number SUB_RADIO_SPN_0091
     * @tc.desc   SPN 'Cellcard' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0091 begin');
      const result: string = SimInfoFormatter.formatSpn('  Cellcard  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Cellcard'));
      expect(result).assertEqual('Cellcard');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0091 end');
    })

    /**
     * @tc.name   testRadioSpn0092
     * @tc.number SUB_RADIO_SPN_0092
     * @tc.desc   SPN 'Unitel' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0092 begin');
      const result: string = SimInfoFormatter.formatSpn('  Unitel  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Unitel'));
      expect(result).assertEqual('Unitel');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0092 end');
    })

    /**
     * @tc.name   testRadioSpn0093
     * @tc.number SUB_RADIO_SPN_0093
     * @tc.desc   SPN 'Beeline' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0093 begin');
      const result: string = SimInfoFormatter.formatSpn('  Beeline  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Beeline'));
      expect(result).assertEqual('Beeline');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0093 end');
    })

    /**
     * @tc.name   testRadioSpn0094
     * @tc.number SUB_RADIO_SPN_0094
     * @tc.desc   SPN 'MegaFon' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0094 begin');
      const result: string = SimInfoFormatter.formatSpn('  MegaFon  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MegaFon'));
      expect(result).assertEqual('MegaFon');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0094 end');
    })

    /**
     * @tc.name   testRadioSpn0095
     * @tc.number SUB_RADIO_SPN_0095
     * @tc.desc   SPN 'Tele2' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0095 begin');
      const result: string = SimInfoFormatter.formatSpn('  Tele2  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Tele2'));
      expect(result).assertEqual('Tele2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0095 end');
    })

    /**
     * @tc.name   testRadioSpn0096
     * @tc.number SUB_RADIO_SPN_0096
     * @tc.desc   SPN 'Elisa' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0096 begin');
      const result: string = SimInfoFormatter.formatSpn('  Elisa  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Elisa'));
      expect(result).assertEqual('Elisa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0096 end');
    })

    /**
     * @tc.name   testRadioSpn0097
     * @tc.number SUB_RADIO_SPN_0097
     * @tc.desc   SPN 'Telia' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0097 begin');
      const result: string = SimInfoFormatter.formatSpn('  Telia  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Telia'));
      expect(result).assertEqual('Telia');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0097 end');
    })

    /**
     * @tc.name   testRadioSpn0098
     * @tc.number SUB_RADIO_SPN_0098
     * @tc.desc   SPN 'DNA' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0098 begin');
      const result: string = SimInfoFormatter.formatSpn('  DNA  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('DNA'));
      expect(result).assertEqual('DNA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0098 end');
    })

    /**
     * @tc.name   testRadioSpn0099
     * @tc.number SUB_RADIO_SPN_0099
     * @tc.desc   SPN 'Telenor' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0099 begin');
      const result: string = SimInfoFormatter.formatSpn('  Telenor  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Telenor'));
      expect(result).assertEqual('Telenor');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0099 end');
    })

    /**
     * @tc.name   testRadioSpn0100
     * @tc.number SUB_RADIO_SPN_0100
     * @tc.desc   SPN 'Ice' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0100 begin');
      const result: string = SimInfoFormatter.formatSpn('  Ice  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Ice'));
      expect(result).assertEqual('Ice');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0100 end');
    })

    /**
     * @tc.name   testRadioSpn0101
     * @tc.number SUB_RADIO_SPN_0101
     * @tc.desc   SPN 'LMT' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0101 begin');
      const result: string = SimInfoFormatter.formatSpn('  LMT  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('LMT'));
      expect(result).assertEqual('LMT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0101 end');
    })

    /**
     * @tc.name   testRadioSpn0102
     * @tc.number SUB_RADIO_SPN_0102
     * @tc.desc   SPN 'Telekom' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0102 begin');
      const result: string = SimInfoFormatter.formatSpn('  Telekom  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Telekom'));
      expect(result).assertEqual('Telekom');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0102 end');
    })

    /**
     * @tc.name   testRadioSpn0103
     * @tc.number SUB_RADIO_SPN_0103
     * @tc.desc   SPN control characters #1 become spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0103 begin');
      const result: string = SimInfoFormatter.formatSpn('a\nb');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a b'));
      expect(result).assertEqual('a b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0103 end');
    })

    /**
     * @tc.name   testRadioSpn0104
     * @tc.number SUB_RADIO_SPN_0104
     * @tc.desc   SPN control characters #2 become spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0104 begin');
      const result: string = SimInfoFormatter.formatSpn('a\tb');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a b'));
      expect(result).assertEqual('a b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0104 end');
    })

    /**
     * @tc.name   testRadioSpn0105
     * @tc.number SUB_RADIO_SPN_0105
     * @tc.desc   SPN control characters #3 become spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0105 begin');
      const result: string = SimInfoFormatter.formatSpn('a\r\nb');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a  b'));
      expect(result).assertEqual('a  b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0105 end');
    })

    /**
     * @tc.name   testRadioSpn0106
     * @tc.number SUB_RADIO_SPN_0106
     * @tc.desc   SPN control characters #4 become spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0106 begin');
      const result: string = SimInfoFormatter.formatSpn('\nChina\nMobile\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('China Mobile'));
      expect(result).assertEqual('China Mobile');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0106 end');
    })

    /**
     * @tc.name   testRadioSpn0107
     * @tc.number SUB_RADIO_SPN_0107
     * @tc.desc   SPN control characters #5 become spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0107 begin');
      const result: string = SimInfoFormatter.formatSpn('\tChina\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('China'));
      expect(result).assertEqual('China');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0107 end');
    })

    /**
     * @tc.name   testRadioSpn0108
     * @tc.number SUB_RADIO_SPN_0108
     * @tc.desc   SPN control characters #6 become spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0108 begin');
      const result: string = SimInfoFormatter.formatSpn('A\nB\tC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A B C'));
      expect(result).assertEqual('A B C');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0108 end');
    })

    /**
     * @tc.name   testRadioSpn0109
     * @tc.number SUB_RADIO_SPN_0109
     * @tc.desc   whitespace-only SPN #1 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0109 begin');
      const result: string = SimInfoFormatter.formatSpn('   ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0109 end');
    })

    /**
     * @tc.name   testRadioSpn0110
     * @tc.number SUB_RADIO_SPN_0110
     * @tc.desc   whitespace-only SPN #2 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0110 begin');
      const result: string = SimInfoFormatter.formatSpn('\t\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0110 end');
    })

    /**
     * @tc.name   testRadioSpn0111
     * @tc.number SUB_RADIO_SPN_0111
     * @tc.desc   whitespace-only SPN #3 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0111 begin');
      const result: string = SimInfoFormatter.formatSpn('\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0111 end');
    })

    /**
     * @tc.name   testRadioSpn0112
     * @tc.number SUB_RADIO_SPN_0112
     * @tc.desc   whitespace-only SPN #4 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0112 begin');
      const result: string = SimInfoFormatter.formatSpn('\r\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0112 end');
    })

    /**
     * @tc.name   testRadioSpn0113
     * @tc.number SUB_RADIO_SPN_0113
     * @tc.desc   whitespace-only SPN #5 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0113 begin');
      const result: string = SimInfoFormatter.formatSpn(' \t \n ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0113 end');
    })

    /**
     * @tc.name   testRadioSpn0114
     * @tc.number SUB_RADIO_SPN_0114
     * @tc.desc   long SPN of length 61 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0114 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0114 end');
    })

    /**
     * @tc.name   testRadioSpn0115
     * @tc.number SUB_RADIO_SPN_0115
     * @tc.desc   long SPN of length 63 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0115 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0115 end');
    })

    /**
     * @tc.name   testRadioSpn0116
     * @tc.number SUB_RADIO_SPN_0116
     * @tc.desc   long SPN of length 65 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0116 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0116 end');
    })

    /**
     * @tc.name   testRadioSpn0117
     * @tc.number SUB_RADIO_SPN_0117
     * @tc.desc   long SPN of length 67 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0117 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0117 end');
    })

    /**
     * @tc.name   testRadioSpn0118
     * @tc.number SUB_RADIO_SPN_0118
     * @tc.desc   long SPN of length 69 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0118 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0118 end');
    })

    /**
     * @tc.name   testRadioSpn0119
     * @tc.number SUB_RADIO_SPN_0119
     * @tc.desc   long SPN of length 71 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0119 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0119 end');
    })

    /**
     * @tc.name   testRadioSpn0120
     * @tc.number SUB_RADIO_SPN_0120
     * @tc.desc   long SPN of length 73 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0120 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0120 end');
    })

    /**
     * @tc.name   testRadioSpn0121
     * @tc.number SUB_RADIO_SPN_0121
     * @tc.desc   long SPN of length 75 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0121 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0121 end');
    })

    /**
     * @tc.name   testRadioSpn0122
     * @tc.number SUB_RADIO_SPN_0122
     * @tc.desc   long SPN of length 77 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0122 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0122 end');
    })

    /**
     * @tc.name   testRadioSpn0123
     * @tc.number SUB_RADIO_SPN_0123
     * @tc.desc   long SPN of length 79 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0123 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0123 end');
    })

    /**
     * @tc.name   testRadioSpn0124
     * @tc.number SUB_RADIO_SPN_0124
     * @tc.desc   long SPN of length 81 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0124 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0124 end');
    })

    /**
     * @tc.name   testRadioSpn0125
     * @tc.number SUB_RADIO_SPN_0125
     * @tc.desc   long SPN of length 83 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0125 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0125 end');
    })

    /**
     * @tc.name   testRadioSpn0126
     * @tc.number SUB_RADIO_SPN_0126
     * @tc.desc   long SPN of length 85 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0126 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0126 end');
    })

    /**
     * @tc.name   testRadioSpn0127
     * @tc.number SUB_RADIO_SPN_0127
     * @tc.desc   long SPN of length 87 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0127 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0127 end');
    })

    /**
     * @tc.name   testRadioSpn0128
     * @tc.number SUB_RADIO_SPN_0128
     * @tc.desc   long SPN of length 89 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0128 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0128 end');
    })

    /**
     * @tc.name   testRadioSpn0129
     * @tc.number SUB_RADIO_SPN_0129
     * @tc.desc   long SPN of length 91 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0129 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0129 end');
    })

    /**
     * @tc.name   testRadioSpn0130
     * @tc.number SUB_RADIO_SPN_0130
     * @tc.desc   long SPN of length 93 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0130 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0130 end');
    })

    /**
     * @tc.name   testRadioSpn0131
     * @tc.number SUB_RADIO_SPN_0131
     * @tc.desc   long SPN of length 95 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0131 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0131 end');
    })

    /**
     * @tc.name   testRadioSpn0132
     * @tc.number SUB_RADIO_SPN_0132
     * @tc.desc   long SPN of length 97 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0132 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0132 end');
    })

    /**
     * @tc.name   testRadioSpn0133
     * @tc.number SUB_RADIO_SPN_0133
     * @tc.desc   long SPN of length 99 is not truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0133 begin');
      const result: string =
        SimInfoFormatter.formatSpn(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0133 end');
    })

    /**
     * @tc.name   testRadioSpn0134
     * @tc.number SUB_RADIO_SPN_0134
     * @tc.desc   换行在裁剪前先变成空格
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0134 begin');
      const anchorResult: string = SimInfoFormatter.formatSpn('  China\nMobile  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(anchorResult));
      expect(anchorResult).assertEqual('China Mobile');
      expect(anchorResult.length).assertEqual(12);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0134 end');
    })
  })
}
