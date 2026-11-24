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

export default function radioTechPair02Test() {
  describe('RadioTechPair02Test', () => {

    /**
     * @tc.name   testRadioTechPair0001
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0001
     * @tc.desc   PS unknown with CS wcdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0001 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0001 end');
    })

    /**
     * @tc.name   testRadioTechPair0002
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0002
     * @tc.desc   PS gsm with CS ehrpd formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0002 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0002 end');
    })

    /**
     * @tc.name   testRadioTechPair0003
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0003
     * @tc.desc   PS 1xrtt with CS unknown formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0003 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0003 end');
    })

    /**
     * @tc.name   testRadioTechPair0004
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0004
     * @tc.desc   PS wcdma with CS hspap formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0004 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0004 end');
    })

    /**
     * @tc.name   testRadioTechPair0005
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0005
     * @tc.desc   PS hspa with CS lte-ca formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0005 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0005 end');
    })

    /**
     * @tc.name   testRadioTechPair0006
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0006
     * @tc.desc   PS hspap with CS 1xrtt formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0006 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0006 end');
    })

    /**
     * @tc.name   testRadioTechPair0007
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0007
     * @tc.desc   PS td-scdma with CS evdo formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0007 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0007 end');
    })

    /**
     * @tc.name   testRadioTechPair0008
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0008
     * @tc.desc   PS evdo with CS nr formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0008 begin');
      const result: string = RadioTechFormatter.formatPair(7, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:evdo,cs:nr'));
      expect(result).assertEqual('ps:evdo,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0008 end');
    })

    /**
     * @tc.name   testRadioTechPair0009
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0009
     * @tc.desc   PS ehrpd with CS hspa formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0009 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0009 end');
    })

    /**
     * @tc.name   testRadioTechPair0010
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0010
     * @tc.desc   PS lte with CS lte formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0010 begin');
      const result: string = RadioTechFormatter.formatPair(9, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:lte,cs:lte'));
      expect(result).assertEqual('ps:lte,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0010 end');
    })

    /**
     * @tc.name   testRadioTechPair0011
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0011
     * @tc.desc   PS lte-ca with CS gsm formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0011 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0011 end');
    })

    /**
     * @tc.name   testRadioTechPair0012
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0012
     * @tc.desc   PS iwlan with CS td-scdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0012 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0012 end');
    })

    /**
     * @tc.name   testRadioTechPair0013
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0013
     * @tc.desc   PS nr with CS iwlan formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0013 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0013 end');
    })

    /**
     * @tc.name   testRadioTechPair0014
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0014
     * @tc.desc   PS unknown with CS wcdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0014 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0014 end');
    })

    /**
     * @tc.name   testRadioTechPair0015
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0015
     * @tc.desc   PS gsm with CS ehrpd formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0015 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0015 end');
    })

    /**
     * @tc.name   testRadioTechPair0016
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0016
     * @tc.desc   PS 1xrtt with CS unknown formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0016 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0016 end');
    })

    /**
     * @tc.name   testRadioTechPair0017
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0017
     * @tc.desc   PS wcdma with CS hspap formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0017 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0017 end');
    })

    /**
     * @tc.name   testRadioTechPair0018
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0018
     * @tc.desc   PS hspa with CS lte-ca formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0018 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0018 end');
    })

    /**
     * @tc.name   testRadioTechPair0019
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0019
     * @tc.desc   PS hspap with CS 1xrtt formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0019 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0019 end');
    })

    /**
     * @tc.name   testRadioTechPair0020
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0020
     * @tc.desc   PS td-scdma with CS evdo formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0020 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0020 end');
    })

    /**
     * @tc.name   testRadioTechPair0021
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0021
     * @tc.desc   PS evdo with CS nr formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0021 begin');
      const result: string = RadioTechFormatter.formatPair(7, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:evdo,cs:nr'));
      expect(result).assertEqual('ps:evdo,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0021 end');
    })

    /**
     * @tc.name   testRadioTechPair0022
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0022
     * @tc.desc   PS ehrpd with CS hspa formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0022 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0022 end');
    })

    /**
     * @tc.name   testRadioTechPair0023
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0023
     * @tc.desc   PS lte with CS lte formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0023 begin');
      const result: string = RadioTechFormatter.formatPair(9, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:lte,cs:lte'));
      expect(result).assertEqual('ps:lte,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0023 end');
    })

    /**
     * @tc.name   testRadioTechPair0024
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0024
     * @tc.desc   PS lte-ca with CS gsm formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0024 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0024 end');
    })

    /**
     * @tc.name   testRadioTechPair0025
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0025
     * @tc.desc   PS iwlan with CS td-scdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0025 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0025 end');
    })

    /**
     * @tc.name   testRadioTechPair0026
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0026
     * @tc.desc   PS nr with CS iwlan formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0026 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0026 end');
    })

    /**
     * @tc.name   testRadioTechPair0027
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0027
     * @tc.desc   PS unknown with CS wcdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0027 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0027 end');
    })

    /**
     * @tc.name   testRadioTechPair0028
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0028
     * @tc.desc   PS gsm with CS ehrpd formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0028 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0028 end');
    })

    /**
     * @tc.name   testRadioTechPair0029
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0029
     * @tc.desc   PS 1xrtt with CS unknown formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0029 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0029 end');
    })

    /**
     * @tc.name   testRadioTechPair0030
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0030
     * @tc.desc   PS wcdma with CS hspap formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0030 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0030 end');
    })

    /**
     * @tc.name   testRadioTechPair0031
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0031
     * @tc.desc   PS hspa with CS lte-ca formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0031 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0031 end');
    })

    /**
     * @tc.name   testRadioTechPair0032
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0032
     * @tc.desc   PS hspap with CS 1xrtt formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0032 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0032 end');
    })

    /**
     * @tc.name   testRadioTechPair0033
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0033
     * @tc.desc   PS td-scdma with CS evdo formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0033 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0033 end');
    })

    /**
     * @tc.name   testRadioTechPair0034
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0034
     * @tc.desc   PS evdo with CS nr formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0034 begin');
      const result: string = RadioTechFormatter.formatPair(7, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:evdo,cs:nr'));
      expect(result).assertEqual('ps:evdo,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0034 end');
    })

    /**
     * @tc.name   testRadioTechPair0035
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0035
     * @tc.desc   PS ehrpd with CS hspa formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0035 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0035 end');
    })

    /**
     * @tc.name   testRadioTechPair0036
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0036
     * @tc.desc   PS lte with CS lte formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0036 begin');
      const result: string = RadioTechFormatter.formatPair(9, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:lte,cs:lte'));
      expect(result).assertEqual('ps:lte,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0036 end');
    })

    /**
     * @tc.name   testRadioTechPair0037
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0037
     * @tc.desc   PS lte-ca with CS gsm formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0037 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0037 end');
    })

    /**
     * @tc.name   testRadioTechPair0038
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0038
     * @tc.desc   PS iwlan with CS td-scdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0038 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0038 end');
    })

    /**
     * @tc.name   testRadioTechPair0039
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0039
     * @tc.desc   PS nr with CS iwlan formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0039 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0039 end');
    })

    /**
     * @tc.name   testRadioTechPair0040
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0040
     * @tc.desc   PS unknown with CS wcdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0040 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0040 end');
    })

    /**
     * @tc.name   testRadioTechPair0041
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0041
     * @tc.desc   PS gsm with CS ehrpd formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0041 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0041 end');
    })

    /**
     * @tc.name   testRadioTechPair0042
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0042
     * @tc.desc   PS 1xrtt with CS unknown formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0042 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0042 end');
    })

    /**
     * @tc.name   testRadioTechPair0043
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0043
     * @tc.desc   PS wcdma with CS hspap formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0043 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0043 end');
    })

    /**
     * @tc.name   testRadioTechPair0044
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0044
     * @tc.desc   PS hspa with CS lte-ca formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0044 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0044 end');
    })

    /**
     * @tc.name   testRadioTechPair0045
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0045
     * @tc.desc   PS hspap with CS 1xrtt formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0045 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0045 end');
    })

    /**
     * @tc.name   testRadioTechPair0046
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0046
     * @tc.desc   PS td-scdma with CS evdo formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0046 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0046 end');
    })

    /**
     * @tc.name   testRadioTechPair0047
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0047
     * @tc.desc   PS evdo with CS nr formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0047 begin');
      const result: string = RadioTechFormatter.formatPair(7, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:evdo,cs:nr'));
      expect(result).assertEqual('ps:evdo,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0047 end');
    })

    /**
     * @tc.name   testRadioTechPair0048
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0048
     * @tc.desc   PS ehrpd with CS hspa formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0048 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0048 end');
    })

    /**
     * @tc.name   testRadioTechPair0049
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0049
     * @tc.desc   PS lte with CS lte formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0049 begin');
      const result: string = RadioTechFormatter.formatPair(9, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:lte,cs:lte'));
      expect(result).assertEqual('ps:lte,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0049 end');
    })

    /**
     * @tc.name   testRadioTechPair0050
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0050
     * @tc.desc   PS lte-ca with CS gsm formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0050 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0050 end');
    })

    /**
     * @tc.name   testRadioTechPair0051
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0051
     * @tc.desc   PS iwlan with CS td-scdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0051 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0051 end');
    })

    /**
     * @tc.name   testRadioTechPair0052
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0052
     * @tc.desc   PS nr with CS iwlan formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0052 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0052 end');
    })

    /**
     * @tc.name   testRadioTechPair0053
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0053
     * @tc.desc   PS unknown with CS wcdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0053 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0053 end');
    })

    /**
     * @tc.name   testRadioTechPair0054
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0054
     * @tc.desc   PS gsm with CS ehrpd formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0054 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0054 end');
    })

    /**
     * @tc.name   testRadioTechPair0055
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0055
     * @tc.desc   PS 1xrtt with CS unknown formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0055 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0055 end');
    })

    /**
     * @tc.name   testRadioTechPair0056
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0056
     * @tc.desc   PS wcdma with CS hspap formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0056 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0056 end');
    })

    /**
     * @tc.name   testRadioTechPair0057
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0057
     * @tc.desc   PS hspa with CS lte-ca formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0057 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0057 end');
    })

    /**
     * @tc.name   testRadioTechPair0058
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0058
     * @tc.desc   PS hspap with CS 1xrtt formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0058 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0058 end');
    })

    /**
     * @tc.name   testRadioTechPair0059
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0059
     * @tc.desc   PS td-scdma with CS evdo formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0059 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0059 end');
    })

    /**
     * @tc.name   testRadioTechPair0060
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0060
     * @tc.desc   PS evdo with CS nr formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0060 begin');
      const result: string = RadioTechFormatter.formatPair(7, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:evdo,cs:nr'));
      expect(result).assertEqual('ps:evdo,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0060 end');
    })

    /**
     * @tc.name   testRadioTechPair0061
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0061
     * @tc.desc   PS ehrpd with CS hspa formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0061 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0061 end');
    })

    /**
     * @tc.name   testRadioTechPair0062
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0062
     * @tc.desc   PS lte with CS lte formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0062 begin');
      const result: string = RadioTechFormatter.formatPair(9, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:lte,cs:lte'));
      expect(result).assertEqual('ps:lte,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0062 end');
    })

    /**
     * @tc.name   testRadioTechPair0063
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0063
     * @tc.desc   PS lte-ca with CS gsm formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0063 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0063 end');
    })

    /**
     * @tc.name   testRadioTechPair0064
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0064
     * @tc.desc   PS iwlan with CS td-scdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0064 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0064 end');
    })

    /**
     * @tc.name   testRadioTechPair0065
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0065
     * @tc.desc   PS nr with CS iwlan formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0065 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0065 end');
    })

    /**
     * @tc.name   testRadioTechPair0066
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0066
     * @tc.desc   PS unknown with CS wcdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0066 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0066 end');
    })

    /**
     * @tc.name   testRadioTechPair0067
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0067
     * @tc.desc   PS gsm with CS ehrpd formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0067 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0067 end');
    })

    /**
     * @tc.name   testRadioTechPair0068
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0068
     * @tc.desc   PS 1xrtt with CS unknown formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0068 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0068 end');
    })

    /**
     * @tc.name   testRadioTechPair0069
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0069
     * @tc.desc   PS wcdma with CS hspap formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0069 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0069 end');
    })

    /**
     * @tc.name   testRadioTechPair0070
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0070
     * @tc.desc   PS hspa with CS lte-ca formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0070 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0070 end');
    })

    /**
     * @tc.name   testRadioTechPair0071
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0071
     * @tc.desc   PS hspap with CS 1xrtt formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0071 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0071 end');
    })

    /**
     * @tc.name   testRadioTechPair0072
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0072
     * @tc.desc   PS td-scdma with CS evdo formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0072 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0072 end');
    })

    /**
     * @tc.name   testRadioTechPair0073
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0073
     * @tc.desc   PS evdo with CS nr formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0073 begin');
      const result: string = RadioTechFormatter.formatPair(7, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:evdo,cs:nr'));
      expect(result).assertEqual('ps:evdo,cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:evdo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0073 end');
    })

    /**
     * @tc.name   testRadioTechPair0074
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0074
     * @tc.desc   PS ehrpd with CS hspa formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0074 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0074 end');
    })

    /**
     * @tc.name   testRadioTechPair0075
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0075
     * @tc.desc   PS lte with CS lte formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0075 begin');
      const result: string = RadioTechFormatter.formatPair(9, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ps:lte,cs:lte'));
      expect(result).assertEqual('ps:lte,cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[0]));
      expect(result.split(',')[0]).assertEqual('ps:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split(',')[1]));
      expect(result.split(',')[1]).assertEqual('cs:lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0075 end');
    })

    /**
     * @tc.name   testRadioTechPair0076
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0076
     * @tc.desc   PS lte-ca with CS gsm formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0076 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0076 end');
    })

    /**
     * @tc.name   testRadioTechPair0077
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0077
     * @tc.desc   PS iwlan with CS td-scdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0077 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0077 end');
    })

    /**
     * @tc.name   testRadioTechPair0078
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0078
     * @tc.desc   PS nr with CS iwlan formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0078 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0078 end');
    })

    /**
     * @tc.name   testRadioTechPair0079
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0079
     * @tc.desc   PS unknown with CS wcdma formats both domains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0079 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0079 end');
    })

    /**
     * @tc.name   testRadioTechPair0080
     * @tc.number SUB_RADIO_RADIOTECHPAIR_0080
     * @tc.desc   NSA 场景 PS 为 NR 而 CS 回落 LTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioTechPair0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0080 begin');
      const anchorResult: string = RadioTechFormatter.formatPair(12, 9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(anchorResult));
      expect(anchorResult).assertEqual('ps:nr,cs:lte');
      expect(anchorResult.split(',').length).assertEqual(2);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioTechPair0080 end');
    })
  })
}
