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

export default function radioTechPair03Test() {
  describe('RadioTechPair03Test', () => {

    /**
     * @tc.name   testRadioTechPair0081
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0081
     * @tc.desc   PS gsm with CS ehrpd formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0081 begin');
      const result: string = RadioTechFormatter.formatPair(1, 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:gsm,cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0081 end');
    })

    /**
     * @tc.name   testRadioTechPair0082
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0082
     * @tc.desc   PS 1xrtt with CS unknown formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0082 begin');
      const result: string = RadioTechFormatter.formatPair(2, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:1xrtt,cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0082 end');
    })

    /**
     * @tc.name   testRadioTechPair0083
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0083
     * @tc.desc   PS wcdma with CS hspap formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0083 begin');
      const result: string = RadioTechFormatter.formatPair(3, 5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:wcdma,cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0083 end');
    })

    /**
     * @tc.name   testRadioTechPair0084
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0084
     * @tc.desc   PS hspa with CS lte-ca formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0084 begin');
      const result: string = RadioTechFormatter.formatPair(4, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspa,cs:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0084 end');
    })

    /**
     * @tc.name   testRadioTechPair0085
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0085
     * @tc.desc   PS hspap with CS 1xrtt formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0085 begin');
      const result: string = RadioTechFormatter.formatPair(5, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspap,cs:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0085 end');
    })

    /**
     * @tc.name   testRadioTechPair0086
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0086
     * @tc.desc   PS td-scdma with CS evdo formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0086 begin');
      const result: string = RadioTechFormatter.formatPair(6, 7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:td-scdma,cs:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0086 end');
    })

    /**
     * @tc.name   testRadioTechPair0087
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0087
     * @tc.desc   PS evdo with CS nr formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0087 begin');
      const result: string = RadioTechFormatter.formatPair(7, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:evdo,cs:nr'));
      expect(result).assertEqual('ps:evdo,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0087 end');
    })

    /**
     * @tc.name   testRadioTechPair0088
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0088
     * @tc.desc   PS ehrpd with CS hspa formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0088 begin');
      const result: string = RadioTechFormatter.formatPair(8, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:ehrpd,cs:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0088 end');
    })

    /**
     * @tc.name   testRadioTechPair0089
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0089
     * @tc.desc   PS lte with CS lte formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0089 begin');
      const result: string = RadioTechFormatter.formatPair(9, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:lte,cs:lte'));
      expect(result).assertEqual('ps:lte,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0089 end');
    })

    /**
     * @tc.name   testRadioTechPair0090
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0090
     * @tc.desc   PS lte-ca with CS gsm formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0090 begin');
      const result: string = RadioTechFormatter.formatPair(10, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:lte-ca,cs:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0090 end');
    })

    /**
     * @tc.name   testRadioTechPair0091
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0091
     * @tc.desc   PS iwlan with CS td-scdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0091 begin');
      const result: string = RadioTechFormatter.formatPair(11, 6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:iwlan,cs:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0091 end');
    })

    /**
     * @tc.name   testRadioTechPair0092
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0092
     * @tc.desc   PS nr with CS iwlan formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0092 begin');
      const result: string = RadioTechFormatter.formatPair(12, 11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:nr,cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0092 end');
    })

    /**
     * @tc.name   testRadioTechPair0093
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0093
     * @tc.desc   PS unknown with CS wcdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0093 begin');
      const result: string = RadioTechFormatter.formatPair(0, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:unknown,cs:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0093 end');
    })

    /**
     * @tc.name   testRadioTechPair0094
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0094
     * @tc.desc   PS gsm with CS ehrpd formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0094 begin');
      const result: string = RadioTechFormatter.formatPair(1, 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:gsm,cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0094 end');
    })

    /**
     * @tc.name   testRadioTechPair0095
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0095
     * @tc.desc   PS 1xrtt with CS unknown formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0095 begin');
      const result: string = RadioTechFormatter.formatPair(2, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:1xrtt,cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0095 end');
    })

    /**
     * @tc.name   testRadioTechPair0096
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0096
     * @tc.desc   PS wcdma with CS hspap formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0096 begin');
      const result: string = RadioTechFormatter.formatPair(3, 5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:wcdma,cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0096 end');
    })

    /**
     * @tc.name   testRadioTechPair0097
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0097
     * @tc.desc   PS hspa with CS lte-ca formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0097 begin');
      const result: string = RadioTechFormatter.formatPair(4, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspa,cs:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0097 end');
    })

    /**
     * @tc.name   testRadioTechPair0098
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0098
     * @tc.desc   PS hspap with CS 1xrtt formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0098 begin');
      const result: string = RadioTechFormatter.formatPair(5, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspap,cs:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0098 end');
    })

    /**
     * @tc.name   testRadioTechPair0099
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0099
     * @tc.desc   PS td-scdma with CS evdo formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0099 begin');
      const result: string = RadioTechFormatter.formatPair(6, 7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:td-scdma,cs:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0099 end');
    })

    /**
     * @tc.name   testRadioTechPair0100
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0100
     * @tc.desc   PS evdo with CS nr formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0100 begin');
      const result: string = RadioTechFormatter.formatPair(7, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:evdo,cs:nr'));
      expect(result).assertEqual('ps:evdo,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0100 end');
    })

    /**
     * @tc.name   testRadioTechPair0101
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0101
     * @tc.desc   PS ehrpd with CS hspa formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0101 begin');
      const result: string = RadioTechFormatter.formatPair(8, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:ehrpd,cs:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0101 end');
    })

    /**
     * @tc.name   testRadioTechPair0102
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0102
     * @tc.desc   PS lte with CS lte formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0102 begin');
      const result: string = RadioTechFormatter.formatPair(9, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:lte,cs:lte'));
      expect(result).assertEqual('ps:lte,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0102 end');
    })

    /**
     * @tc.name   testRadioTechPair0103
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0103
     * @tc.desc   PS lte-ca with CS gsm formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0103 begin');
      const result: string = RadioTechFormatter.formatPair(10, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:lte-ca,cs:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0103 end');
    })

    /**
     * @tc.name   testRadioTechPair0104
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0104
     * @tc.desc   PS iwlan with CS td-scdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0104 begin');
      const result: string = RadioTechFormatter.formatPair(11, 6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:iwlan,cs:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0104 end');
    })

    /**
     * @tc.name   testRadioTechPair0105
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0105
     * @tc.desc   PS nr with CS iwlan formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0105 begin');
      const result: string = RadioTechFormatter.formatPair(12, 11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:nr,cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0105 end');
    })

    /**
     * @tc.name   testRadioTechPair0106
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0106
     * @tc.desc   PS unknown with CS wcdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0106 begin');
      const result: string = RadioTechFormatter.formatPair(0, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:unknown,cs:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0106 end');
    })

    /**
     * @tc.name   testRadioTechPair0107
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0107
     * @tc.desc   PS gsm with CS ehrpd formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0107 begin');
      const result: string = RadioTechFormatter.formatPair(1, 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:gsm,cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0107 end');
    })

    /**
     * @tc.name   testRadioTechPair0108
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0108
     * @tc.desc   PS 1xrtt with CS unknown formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0108 begin');
      const result: string = RadioTechFormatter.formatPair(2, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:1xrtt,cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0108 end');
    })

    /**
     * @tc.name   testRadioTechPair0109
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0109
     * @tc.desc   PS wcdma with CS hspap formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0109 begin');
      const result: string = RadioTechFormatter.formatPair(3, 5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:wcdma,cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0109 end');
    })

    /**
     * @tc.name   testRadioTechPair0110
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0110
     * @tc.desc   PS hspa with CS lte-ca formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0110 begin');
      const result: string = RadioTechFormatter.formatPair(4, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspa,cs:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0110 end');
    })

    /**
     * @tc.name   testRadioTechPair0111
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0111
     * @tc.desc   PS hspap with CS 1xrtt formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0111 begin');
      const result: string = RadioTechFormatter.formatPair(5, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspap,cs:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0111 end');
    })

    /**
     * @tc.name   testRadioTechPair0112
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0112
     * @tc.desc   PS td-scdma with CS evdo formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0112 begin');
      const result: string = RadioTechFormatter.formatPair(6, 7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:td-scdma,cs:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0112 end');
    })

    /**
     * @tc.name   testRadioTechPair0113
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0113
     * @tc.desc   PS evdo with CS nr formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0113 begin');
      const result: string = RadioTechFormatter.formatPair(7, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:evdo,cs:nr'));
      expect(result).assertEqual('ps:evdo,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0113 end');
    })

    /**
     * @tc.name   testRadioTechPair0114
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0114
     * @tc.desc   PS ehrpd with CS hspa formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0114 begin');
      const result: string = RadioTechFormatter.formatPair(8, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:ehrpd,cs:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0114 end');
    })

    /**
     * @tc.name   testRadioTechPair0115
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0115
     * @tc.desc   PS lte with CS lte formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0115 begin');
      const result: string = RadioTechFormatter.formatPair(9, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:lte,cs:lte'));
      expect(result).assertEqual('ps:lte,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0115 end');
    })

    /**
     * @tc.name   testRadioTechPair0116
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0116
     * @tc.desc   PS lte-ca with CS gsm formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0116 begin');
      const result: string = RadioTechFormatter.formatPair(10, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:lte-ca,cs:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0116 end');
    })

    /**
     * @tc.name   testRadioTechPair0117
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0117
     * @tc.desc   PS iwlan with CS td-scdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0117 begin');
      const result: string = RadioTechFormatter.formatPair(11, 6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:iwlan,cs:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0117 end');
    })

    /**
     * @tc.name   testRadioTechPair0118
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0118
     * @tc.desc   PS nr with CS iwlan formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0118 begin');
      const result: string = RadioTechFormatter.formatPair(12, 11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:nr,cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0118 end');
    })

    /**
     * @tc.name   testRadioTechPair0119
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0119
     * @tc.desc   PS unknown with CS wcdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0119 begin');
      const result: string = RadioTechFormatter.formatPair(0, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:unknown,cs:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0119 end');
    })

    /**
     * @tc.name   testRadioTechPair0120
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0120
     * @tc.desc   PS gsm with CS ehrpd formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0120 begin');
      const result: string = RadioTechFormatter.formatPair(1, 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:gsm,cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0120 end');
    })

    /**
     * @tc.name   testRadioTechPair0121
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0121
     * @tc.desc   PS 1xrtt with CS unknown formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0121 begin');
      const result: string = RadioTechFormatter.formatPair(2, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:1xrtt,cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0121 end');
    })

    /**
     * @tc.name   testRadioTechPair0122
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0122
     * @tc.desc   PS wcdma with CS hspap formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0122 begin');
      const result: string = RadioTechFormatter.formatPair(3, 5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:wcdma,cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0122 end');
    })

    /**
     * @tc.name   testRadioTechPair0123
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0123
     * @tc.desc   PS hspa with CS lte-ca formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0123 begin');
      const result: string = RadioTechFormatter.formatPair(4, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspa,cs:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0123 end');
    })

    /**
     * @tc.name   testRadioTechPair0124
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0124
     * @tc.desc   PS hspap with CS 1xrtt formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0124 begin');
      const result: string = RadioTechFormatter.formatPair(5, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspap,cs:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0124 end');
    })

    /**
     * @tc.name   testRadioTechPair0125
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0125
     * @tc.desc   PS td-scdma with CS evdo formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0125 begin');
      const result: string = RadioTechFormatter.formatPair(6, 7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:td-scdma,cs:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0125 end');
    })

    /**
     * @tc.name   testRadioTechPair0126
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0126
     * @tc.desc   PS evdo with CS nr formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0126 begin');
      const result: string = RadioTechFormatter.formatPair(7, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:evdo,cs:nr'));
      expect(result).assertEqual('ps:evdo,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0126 end');
    })

    /**
     * @tc.name   testRadioTechPair0127
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0127
     * @tc.desc   PS ehrpd with CS hspa formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0127 begin');
      const result: string = RadioTechFormatter.formatPair(8, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:ehrpd,cs:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0127 end');
    })

    /**
     * @tc.name   testRadioTechPair0128
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0128
     * @tc.desc   PS lte with CS lte formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0128 begin');
      const result: string = RadioTechFormatter.formatPair(9, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:lte,cs:lte'));
      expect(result).assertEqual('ps:lte,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0128 end');
    })

    /**
     * @tc.name   testRadioTechPair0129
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0129
     * @tc.desc   PS lte-ca with CS gsm formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0129 begin');
      const result: string = RadioTechFormatter.formatPair(10, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:lte-ca,cs:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0129 end');
    })

    /**
     * @tc.name   testRadioTechPair0130
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0130
     * @tc.desc   PS iwlan with CS td-scdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0130 begin');
      const result: string = RadioTechFormatter.formatPair(11, 6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:iwlan,cs:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0130 end');
    })

    /**
     * @tc.name   testRadioTechPair0131
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0131
     * @tc.desc   PS nr with CS iwlan formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0131 begin');
      const result: string = RadioTechFormatter.formatPair(12, 11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:nr,cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0131 end');
    })

    /**
     * @tc.name   testRadioTechPair0132
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0132
     * @tc.desc   PS unknown with CS wcdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0132 begin');
      const result: string = RadioTechFormatter.formatPair(0, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:unknown,cs:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0132 end');
    })

    /**
     * @tc.name   testRadioTechPair0133
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0133
     * @tc.desc   PS gsm with CS ehrpd formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0133 begin');
      const result: string = RadioTechFormatter.formatPair(1, 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:gsm,cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0133 end');
    })

    /**
     * @tc.name   testRadioTechPair0134
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0134
     * @tc.desc   PS 1xrtt with CS unknown formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0134 begin');
      const result: string = RadioTechFormatter.formatPair(2, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:1xrtt,cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0134 end');
    })

    /**
     * @tc.name   testRadioTechPair0135
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0135
     * @tc.desc   PS wcdma with CS hspap formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0135 begin');
      const result: string = RadioTechFormatter.formatPair(3, 5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:wcdma,cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0135 end');
    })

    /**
     * @tc.name   testRadioTechPair0136
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0136
     * @tc.desc   PS hspa with CS lte-ca formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0136 begin');
      const result: string = RadioTechFormatter.formatPair(4, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspa,cs:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0136 end');
    })

    /**
     * @tc.name   testRadioTechPair0137
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0137
     * @tc.desc   PS hspap with CS 1xrtt formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0137 begin');
      const result: string = RadioTechFormatter.formatPair(5, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspap,cs:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0137 end');
    })

    /**
     * @tc.name   testRadioTechPair0138
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0138
     * @tc.desc   PS td-scdma with CS evdo formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0138 begin');
      const result: string = RadioTechFormatter.formatPair(6, 7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:td-scdma,cs:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0138 end');
    })

    /**
     * @tc.name   testRadioTechPair0139
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0139
     * @tc.desc   PS evdo with CS nr formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0139 begin');
      const result: string = RadioTechFormatter.formatPair(7, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:evdo,cs:nr'));
      expect(result).assertEqual('ps:evdo,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0139 end');
    })

    /**
     * @tc.name   testRadioTechPair0140
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0140
     * @tc.desc   PS ehrpd with CS hspa formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0140 begin');
      const result: string = RadioTechFormatter.formatPair(8, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:ehrpd,cs:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0140 end');
    })

    /**
     * @tc.name   testRadioTechPair0141
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0141
     * @tc.desc   PS lte with CS lte formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0141 begin');
      const result: string = RadioTechFormatter.formatPair(9, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:lte,cs:lte'));
      expect(result).assertEqual('ps:lte,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0141 end');
    })

    /**
     * @tc.name   testRadioTechPair0142
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0142
     * @tc.desc   PS lte-ca with CS gsm formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0142 begin');
      const result: string = RadioTechFormatter.formatPair(10, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:lte-ca,cs:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0142 end');
    })

    /**
     * @tc.name   testRadioTechPair0143
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0143
     * @tc.desc   PS iwlan with CS td-scdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0143 begin');
      const result: string = RadioTechFormatter.formatPair(11, 6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:iwlan,cs:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0143 end');
    })

    /**
     * @tc.name   testRadioTechPair0144
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0144
     * @tc.desc   PS nr with CS iwlan formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0144 begin');
      const result: string = RadioTechFormatter.formatPair(12, 11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:nr,cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0144 end');
    })

    /**
     * @tc.name   testRadioTechPair0145
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0145
     * @tc.desc   PS unknown with CS wcdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0145 begin');
      const result: string = RadioTechFormatter.formatPair(0, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:unknown,cs:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0145 end');
    })

    /**
     * @tc.name   testRadioTechPair0146
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0146
     * @tc.desc   PS gsm with CS ehrpd formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0146 begin');
      const result: string = RadioTechFormatter.formatPair(1, 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:gsm,cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0146 end');
    })

    /**
     * @tc.name   testRadioTechPair0147
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0147
     * @tc.desc   PS 1xrtt with CS unknown formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0147 begin');
      const result: string = RadioTechFormatter.formatPair(2, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:1xrtt,cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0147 end');
    })

    /**
     * @tc.name   testRadioTechPair0148
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0148
     * @tc.desc   PS wcdma with CS hspap formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0148 begin');
      const result: string = RadioTechFormatter.formatPair(3, 5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:wcdma,cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0148 end');
    })

    /**
     * @tc.name   testRadioTechPair0149
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0149
     * @tc.desc   PS hspa with CS lte-ca formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0149 begin');
      const result: string = RadioTechFormatter.formatPair(4, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspa,cs:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0149 end');
    })

    /**
     * @tc.name   testRadioTechPair0150
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0150
     * @tc.desc   PS hspap with CS 1xrtt formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0150 begin');
      const result: string = RadioTechFormatter.formatPair(5, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:hspap,cs:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:hspap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:1xrtt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0150 end');
    })

    /**
     * @tc.name   testRadioTechPair0151
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0151
     * @tc.desc   PS td-scdma with CS evdo formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0151 begin');
      const result: string = RadioTechFormatter.formatPair(6, 7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:td-scdma,cs:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0151 end');
    })

    /**
     * @tc.name   testRadioTechPair0152
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0152
     * @tc.desc   PS evdo with CS nr formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0152 begin');
      const result: string = RadioTechFormatter.formatPair(7, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:evdo,cs:nr'));
      expect(result).assertEqual('ps:evdo,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0152 end');
    })

    /**
     * @tc.name   testRadioTechPair0153
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0153
     * @tc.desc   PS ehrpd with CS hspa formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0153 begin');
      const result: string = RadioTechFormatter.formatPair(8, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:ehrpd,cs:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:hspa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0153 end');
    })

    /**
     * @tc.name   testRadioTechPair0154
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0154
     * @tc.desc   PS lte with CS lte formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0154 begin');
      const result: string = RadioTechFormatter.formatPair(9, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:lte,cs:lte'));
      expect(result).assertEqual('ps:lte,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0154 end');
    })

    /**
     * @tc.name   testRadioTechPair0155
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0155
     * @tc.desc   PS lte-ca with CS gsm formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0155 begin');
      const result: string = RadioTechFormatter.formatPair(10, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:lte-ca,cs:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte-ca');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0155 end');
    })

    /**
     * @tc.name   testRadioTechPair0156
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0156
     * @tc.desc   PS iwlan with CS td-scdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0156 begin');
      const result: string = RadioTechFormatter.formatPair(11, 6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:iwlan,cs:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:td-scdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0156 end');
    })

    /**
     * @tc.name   testRadioTechPair0157
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0157
     * @tc.desc   PS nr with CS iwlan formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0157 begin');
      const result: string = RadioTechFormatter.formatPair(12, 11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:nr,cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:iwlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0157 end');
    })

    /**
     * @tc.name   testRadioTechPair0158
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0158
     * @tc.desc   PS unknown with CS wcdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0158 begin');
      const result: string = RadioTechFormatter.formatPair(0, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:unknown,cs:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:wcdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0158 end');
    })

    /**
     * @tc.name   testRadioTechPair0159
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0159
     * @tc.desc   PS gsm with CS ehrpd formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0159 begin');
      const result: string = RadioTechFormatter.formatPair(1, 8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('ps:gsm,cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:ehrpd');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0159 end');
    })

    /**
     * @tc.name   testRadioTechPair0160
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0160
     * @tc.desc   NSA 场景 PS 为 NR 而 CS 回落 LTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0160 begin');
      const anchorResult: string = RadioTechFormatter.formatPair(12, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(anchorResult));
      expect(anchorResult).assertEqual('ps:nr,cs:lte');
      expect(anchorResult.split(',').length).assertEqual(2);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0160 end');
    })
  })
}
