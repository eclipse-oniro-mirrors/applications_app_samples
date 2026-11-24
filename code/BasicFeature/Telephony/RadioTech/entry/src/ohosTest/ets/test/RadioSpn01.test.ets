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

export default function radioSpn01Test() {
  describe('RadioSpn01Test', () => {

    /**
     * @tc.name   testRadioSpn0001
     * @tc.number SUB_RADIO_SPN_0001
     * @tc.desc   SPN length 0 falls back to not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0001 begin');
      const result: string = SimInfoFormatter.formatSpn('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0001 end');
    })

    /**
     * @tc.name   testRadioSpn0002
     * @tc.number SUB_RADIO_SPN_0002
     * @tc.desc   SPN length 1 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0002 begin');
      const result: string = SimInfoFormatter.formatSpn('A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A'));
      expect(result).assertEqual('A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0002 end');
    })

    /**
     * @tc.name   testRadioSpn0003
     * @tc.number SUB_RADIO_SPN_0003
     * @tc.desc   SPN length 2 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0003 begin');
      const result: string = SimInfoFormatter.formatSpn('AB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AB'));
      expect(result).assertEqual('AB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0003 end');
    })

    /**
     * @tc.name   testRadioSpn0004
     * @tc.number SUB_RADIO_SPN_0004
     * @tc.desc   SPN length 3 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0004 begin');
      const result: string = SimInfoFormatter.formatSpn('AAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AAA'));
      expect(result).assertEqual('AAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0004 end');
    })

    /**
     * @tc.name   testRadioSpn0005
     * @tc.number SUB_RADIO_SPN_0005
     * @tc.desc   SPN length 4 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0005 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AAAA'));
      expect(result).assertEqual('AAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0005 end');
    })

    /**
     * @tc.name   testRadioSpn0006
     * @tc.number SUB_RADIO_SPN_0006
     * @tc.desc   SPN length 5 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0006 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AAAAA'));
      expect(result).assertEqual('AAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0006 end');
    })

    /**
     * @tc.name   testRadioSpn0007
     * @tc.number SUB_RADIO_SPN_0007
     * @tc.desc   SPN length 6 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0007 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AAAAAA'));
      expect(result).assertEqual('AAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0007 end');
    })

    /**
     * @tc.name   testRadioSpn0008
     * @tc.number SUB_RADIO_SPN_0008
     * @tc.desc   SPN length 7 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0008 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AAAAAAA'));
      expect(result).assertEqual('AAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0008 end');
    })

    /**
     * @tc.name   testRadioSpn0009
     * @tc.number SUB_RADIO_SPN_0009
     * @tc.desc   SPN length 8 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0009 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AAAAAAAA'));
      expect(result).assertEqual('AAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0009 end');
    })

    /**
     * @tc.name   testRadioSpn0010
     * @tc.number SUB_RADIO_SPN_0010
     * @tc.desc   SPN length 9 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0010 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AAAAAAAAA'));
      expect(result).assertEqual('AAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0010 end');
    })

    /**
     * @tc.name   testRadioSpn0011
     * @tc.number SUB_RADIO_SPN_0011
     * @tc.desc   SPN length 10 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0011 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AAAAAAAAAA'));
      expect(result).assertEqual('AAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0011 end');
    })

    /**
     * @tc.name   testRadioSpn0012
     * @tc.number SUB_RADIO_SPN_0012
     * @tc.desc   SPN length 11 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0012 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AAAAAAAAAAA'));
      expect(result).assertEqual('AAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0012 end');
    })

    /**
     * @tc.name   testRadioSpn0013
     * @tc.number SUB_RADIO_SPN_0013
     * @tc.desc   SPN length 12 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0013 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AAAAAAAAAAAA'));
      expect(result).assertEqual('AAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0013 end');
    })

    /**
     * @tc.name   testRadioSpn0014
     * @tc.number SUB_RADIO_SPN_0014
     * @tc.desc   SPN length 13 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0014 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AAAAAAAAAAAAA'));
      expect(result).assertEqual('AAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0014 end');
    })

    /**
     * @tc.name   testRadioSpn0015
     * @tc.number SUB_RADIO_SPN_0015
     * @tc.desc   SPN length 14 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0015 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0015 end');
    })

    /**
     * @tc.name   testRadioSpn0016
     * @tc.number SUB_RADIO_SPN_0016
     * @tc.desc   SPN length 15 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0016 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0016 end');
    })

    /**
     * @tc.name   testRadioSpn0017
     * @tc.number SUB_RADIO_SPN_0017
     * @tc.desc   SPN length 16 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0017 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0017 end');
    })

    /**
     * @tc.name   testRadioSpn0018
     * @tc.number SUB_RADIO_SPN_0018
     * @tc.desc   SPN length 17 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0018 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0018 end');
    })

    /**
     * @tc.name   testRadioSpn0019
     * @tc.number SUB_RADIO_SPN_0019
     * @tc.desc   SPN length 18 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0019 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0019 end');
    })

    /**
     * @tc.name   testRadioSpn0020
     * @tc.number SUB_RADIO_SPN_0020
     * @tc.desc   SPN length 19 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0020 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0020 end');
    })

    /**
     * @tc.name   testRadioSpn0021
     * @tc.number SUB_RADIO_SPN_0021
     * @tc.desc   SPN length 20 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0021 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0021 end');
    })

    /**
     * @tc.name   testRadioSpn0022
     * @tc.number SUB_RADIO_SPN_0022
     * @tc.desc   SPN length 21 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0022 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0022 end');
    })

    /**
     * @tc.name   testRadioSpn0023
     * @tc.number SUB_RADIO_SPN_0023
     * @tc.desc   SPN length 22 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0023 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0023 end');
    })

    /**
     * @tc.name   testRadioSpn0024
     * @tc.number SUB_RADIO_SPN_0024
     * @tc.desc   SPN length 23 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0024 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0024 end');
    })

    /**
     * @tc.name   testRadioSpn0025
     * @tc.number SUB_RADIO_SPN_0025
     * @tc.desc   SPN length 24 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0025 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0025 end');
    })

    /**
     * @tc.name   testRadioSpn0026
     * @tc.number SUB_RADIO_SPN_0026
     * @tc.desc   SPN length 25 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0026 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0026 end');
    })

    /**
     * @tc.name   testRadioSpn0027
     * @tc.number SUB_RADIO_SPN_0027
     * @tc.desc   SPN length 26 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0027 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0027 end');
    })

    /**
     * @tc.name   testRadioSpn0028
     * @tc.number SUB_RADIO_SPN_0028
     * @tc.desc   SPN length 27 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0028 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0028 end');
    })

    /**
     * @tc.name   testRadioSpn0029
     * @tc.number SUB_RADIO_SPN_0029
     * @tc.desc   SPN length 28 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0029 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0029 end');
    })

    /**
     * @tc.name   testRadioSpn0030
     * @tc.number SUB_RADIO_SPN_0030
     * @tc.desc   SPN length 29 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0030 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0030 end');
    })

    /**
     * @tc.name   testRadioSpn0031
     * @tc.number SUB_RADIO_SPN_0031
     * @tc.desc   SPN length 30 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0031 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0031 end');
    })

    /**
     * @tc.name   testRadioSpn0032
     * @tc.number SUB_RADIO_SPN_0032
     * @tc.desc   SPN length 31 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0032 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0032 end');
    })

    /**
     * @tc.name   testRadioSpn0033
     * @tc.number SUB_RADIO_SPN_0033
     * @tc.desc   SPN length 32 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0033 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0033 end');
    })

    /**
     * @tc.name   testRadioSpn0034
     * @tc.number SUB_RADIO_SPN_0034
     * @tc.desc   SPN length 33 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0034 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0034 end');
    })

    /**
     * @tc.name   testRadioSpn0035
     * @tc.number SUB_RADIO_SPN_0035
     * @tc.desc   SPN length 34 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0035 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0035 end');
    })

    /**
     * @tc.name   testRadioSpn0036
     * @tc.number SUB_RADIO_SPN_0036
     * @tc.desc   SPN length 35 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0036 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0036 end');
    })

    /**
     * @tc.name   testRadioSpn0037
     * @tc.number SUB_RADIO_SPN_0037
     * @tc.desc   SPN length 36 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0037 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0037 end');
    })

    /**
     * @tc.name   testRadioSpn0038
     * @tc.number SUB_RADIO_SPN_0038
     * @tc.desc   SPN length 37 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0038 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0038 end');
    })

    /**
     * @tc.name   testRadioSpn0039
     * @tc.number SUB_RADIO_SPN_0039
     * @tc.desc   SPN length 38 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0039 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0039 end');
    })

    /**
     * @tc.name   testRadioSpn0040
     * @tc.number SUB_RADIO_SPN_0040
     * @tc.desc   SPN length 39 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0040 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0040 end');
    })

    /**
     * @tc.name   testRadioSpn0041
     * @tc.number SUB_RADIO_SPN_0041
     * @tc.desc   SPN length 40 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0041 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0041 end');
    })

    /**
     * @tc.name   testRadioSpn0042
     * @tc.number SUB_RADIO_SPN_0042
     * @tc.desc   SPN length 41 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0042 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0042 end');
    })

    /**
     * @tc.name   testRadioSpn0043
     * @tc.number SUB_RADIO_SPN_0043
     * @tc.desc   SPN length 42 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0043 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0043 end');
    })

    /**
     * @tc.name   testRadioSpn0044
     * @tc.number SUB_RADIO_SPN_0044
     * @tc.desc   SPN length 43 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0044 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0044 end');
    })

    /**
     * @tc.name   testRadioSpn0045
     * @tc.number SUB_RADIO_SPN_0045
     * @tc.desc   SPN length 44 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0045 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0045 end');
    })

    /**
     * @tc.name   testRadioSpn0046
     * @tc.number SUB_RADIO_SPN_0046
     * @tc.desc   SPN length 45 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0046 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0046 end');
    })

    /**
     * @tc.name   testRadioSpn0047
     * @tc.number SUB_RADIO_SPN_0047
     * @tc.desc   SPN length 46 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0047 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0047 end');
    })

    /**
     * @tc.name   testRadioSpn0048
     * @tc.number SUB_RADIO_SPN_0048
     * @tc.desc   SPN length 47 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0048 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0048 end');
    })

    /**
     * @tc.name   testRadioSpn0049
     * @tc.number SUB_RADIO_SPN_0049
     * @tc.desc   SPN length 48 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0049 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0049 end');
    })

    /**
     * @tc.name   testRadioSpn0050
     * @tc.number SUB_RADIO_SPN_0050
     * @tc.desc   SPN length 49 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0050 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0050 end');
    })

    /**
     * @tc.name   testRadioSpn0051
     * @tc.number SUB_RADIO_SPN_0051
     * @tc.desc   SPN length 50 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0051 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0051 end');
    })

    /**
     * @tc.name   testRadioSpn0052
     * @tc.number SUB_RADIO_SPN_0052
     * @tc.desc   SPN length 51 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0052 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0052 end');
    })

    /**
     * @tc.name   testRadioSpn0053
     * @tc.number SUB_RADIO_SPN_0053
     * @tc.desc   SPN length 52 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0053 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0053 end');
    })

    /**
     * @tc.name   testRadioSpn0054
     * @tc.number SUB_RADIO_SPN_0054
     * @tc.desc   SPN length 53 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0054 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0054 end');
    })

    /**
     * @tc.name   testRadioSpn0055
     * @tc.number SUB_RADIO_SPN_0055
     * @tc.desc   SPN length 54 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0055 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0055 end');
    })

    /**
     * @tc.name   testRadioSpn0056
     * @tc.number SUB_RADIO_SPN_0056
     * @tc.desc   SPN length 55 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0056 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0056 end');
    })

    /**
     * @tc.name   testRadioSpn0057
     * @tc.number SUB_RADIO_SPN_0057
     * @tc.desc   SPN length 56 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0057 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0057 end');
    })

    /**
     * @tc.name   testRadioSpn0058
     * @tc.number SUB_RADIO_SPN_0058
     * @tc.desc   SPN length 57 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0058 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0058 end');
    })

    /**
     * @tc.name   testRadioSpn0059
     * @tc.number SUB_RADIO_SPN_0059
     * @tc.desc   SPN length 58 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0059 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0059 end');
    })

    /**
     * @tc.name   testRadioSpn0060
     * @tc.number SUB_RADIO_SPN_0060
     * @tc.desc   SPN length 59 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0060 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0060 end');
    })

    /**
     * @tc.name   testRadioSpn0061
     * @tc.number SUB_RADIO_SPN_0061
     * @tc.desc   SPN length 60 is kept as is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0061 begin');
      const result: string = SimInfoFormatter.formatSpn('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0061 end');
    })

    /**
     * @tc.name   testRadioSpn0062
     * @tc.number SUB_RADIO_SPN_0062
     * @tc.desc   SPN 'China Mobile' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0062 begin');
      const result: string = SimInfoFormatter.formatSpn('  China Mobile  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('China Mobile'));
      expect(result).assertEqual('China Mobile');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0062 end');
    })

    /**
     * @tc.name   testRadioSpn0063
     * @tc.number SUB_RADIO_SPN_0063
     * @tc.desc   SPN '中国移动' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0063 begin');
      const result: string = SimInfoFormatter.formatSpn('  中国移动  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('中国移动'));
      expect(result).assertEqual('中国移动');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0063 end');
    })

    /**
     * @tc.name   testRadioSpn0064
     * @tc.number SUB_RADIO_SPN_0064
     * @tc.desc   SPN 'ドコモ' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0064 begin');
      const result: string = SimInfoFormatter.formatSpn('  ドコモ  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ドコモ'));
      expect(result).assertEqual('ドコモ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0064 end');
    })

    /**
     * @tc.name   testRadioSpn0065
     * @tc.number SUB_RADIO_SPN_0065
     * @tc.desc   SPN 'Telefónica' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0065 begin');
      const result: string = SimInfoFormatter.formatSpn('  Telefónica  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Telefónica'));
      expect(result).assertEqual('Telefónica');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0065 end');
    })

    /**
     * @tc.name   testRadioSpn0066
     * @tc.number SUB_RADIO_SPN_0066
     * @tc.desc   SPN 'Vodafone' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0066 begin');
      const result: string = SimInfoFormatter.formatSpn('  Vodafone  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Vodafone'));
      expect(result).assertEqual('Vodafone');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0066 end');
    })

    /**
     * @tc.name   testRadioSpn0067
     * @tc.number SUB_RADIO_SPN_0067
     * @tc.desc   SPN 'MTN' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0067 begin');
      const result: string = SimInfoFormatter.formatSpn('  MTN  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('MTN'));
      expect(result).assertEqual('MTN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0067 end');
    })

    /**
     * @tc.name   testRadioSpn0068
     * @tc.number SUB_RADIO_SPN_0068
     * @tc.desc   SPN 'A1' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0068 begin');
      const result: string = SimInfoFormatter.formatSpn('  A1  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A1'));
      expect(result).assertEqual('A1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0068 end');
    })

    /**
     * @tc.name   testRadioSpn0069
     * @tc.number SUB_RADIO_SPN_0069
     * @tc.desc   SPN 'T-Mobile' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0069 begin');
      const result: string = SimInfoFormatter.formatSpn('  T-Mobile  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('T-Mobile'));
      expect(result).assertEqual('T-Mobile');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0069 end');
    })

    /**
     * @tc.name   testRadioSpn0070
     * @tc.number SUB_RADIO_SPN_0070
     * @tc.desc   SPN 'Orange' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0070 begin');
      const result: string = SimInfoFormatter.formatSpn('  Orange  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Orange'));
      expect(result).assertEqual('Orange');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0070 end');
    })

    /**
     * @tc.name   testRadioSpn0071
     * @tc.number SUB_RADIO_SPN_0071
     * @tc.desc   SPN 'KDDI' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0071 begin');
      const result: string = SimInfoFormatter.formatSpn('  KDDI  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('KDDI'));
      expect(result).assertEqual('KDDI');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0071 end');
    })

    /**
     * @tc.name   testRadioSpn0072
     * @tc.number SUB_RADIO_SPN_0072
     * @tc.desc   SPN 'Sample LTE' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0072 begin');
      const result: string = SimInfoFormatter.formatSpn('  Sample LTE  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Sample LTE'));
      expect(result).assertEqual('Sample LTE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0072 end');
    })

    /**
     * @tc.name   testRadioSpn0073
     * @tc.number SUB_RADIO_SPN_0073
     * @tc.desc   SPN 'NTT DOCOMO' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0073 begin');
      const result: string = SimInfoFormatter.formatSpn('  NTT DOCOMO  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('NTT DOCOMO'));
      expect(result).assertEqual('NTT DOCOMO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0073 end');
    })

    /**
     * @tc.name   testRadioSpn0074
     * @tc.number SUB_RADIO_SPN_0074
     * @tc.desc   SPN '中国联通' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0074 begin');
      const result: string = SimInfoFormatter.formatSpn('  中国联通  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('中国联通'));
      expect(result).assertEqual('中国联通');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0074 end');
    })

    /**
     * @tc.name   testRadioSpn0075
     * @tc.number SUB_RADIO_SPN_0075
     * @tc.desc   SPN '中国电信' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0075 begin');
      const result: string = SimInfoFormatter.formatSpn('  中国电信  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('中国电信'));
      expect(result).assertEqual('中国电信');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0075 end');
    })

    /**
     * @tc.name   testRadioSpn0076
     * @tc.number SUB_RADIO_SPN_0076
     * @tc.desc   SPN 'CHINA UNICOM' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0076 begin');
      const result: string = SimInfoFormatter.formatSpn('  CHINA UNICOM  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('CHINA UNICOM'));
      expect(result).assertEqual('CHINA UNICOM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0076 end');
    })

    /**
     * @tc.name   testRadioSpn0077
     * @tc.number SUB_RADIO_SPN_0077
     * @tc.desc   SPN 'CTExcel' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0077 begin');
      const result: string = SimInfoFormatter.formatSpn('  CTExcel  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('CTExcel'));
      expect(result).assertEqual('CTExcel');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0077 end');
    })

    /**
     * @tc.name   testRadioSpn0078
     * @tc.number SUB_RADIO_SPN_0078
     * @tc.desc   SPN 'TRUE-H' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0078 begin');
      const result: string = SimInfoFormatter.formatSpn('  TRUE-H  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TRUE-H'));
      expect(result).assertEqual('TRUE-H');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0078 end');
    })

    /**
     * @tc.name   testRadioSpn0079
     * @tc.number SUB_RADIO_SPN_0079
     * @tc.desc   SPN 'AIS' is trimmed on both sides
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0079 begin');
      const result: string = SimInfoFormatter.formatSpn('  AIS  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AIS'));
      expect(result).assertEqual('AIS');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('\n') >= 0));
      expect(result.indexOf('\n') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0079 end');
    })

    /**
     * @tc.name   testRadioSpn0080
     * @tc.number SUB_RADIO_SPN_0080
     * @tc.desc   换行在裁剪前先变成空格
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSpn0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0080 begin');
      const anchorResult: string = SimInfoFormatter.formatSpn('  China\nMobile  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(anchorResult));
      expect(anchorResult).assertEqual('China Mobile');
      expect(anchorResult.length).assertEqual(12);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSpn0080 end');
    })
  })
}
