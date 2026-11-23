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
import { SignalFormatter, SignalSnapshot } from '../../../main/ets/model/SignalFormatter';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function radioSignalLevel01Test() {
  describe('RadioSignalLevel01Test', () => {

    /**
     * @tc.name   testRadioSignalLevel0001
     * @tc.number SUB_RADIO_SIGNALLEVEL_0001
     * @tc.desc   signal level 0 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0001 begin');
      const result: string = SignalFormatter.levelName(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(0) !== 4));
      expect(result === 'great' && Number(0) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0001 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0002
     * @tc.number SUB_RADIO_SIGNALLEVEL_0002
     * @tc.desc   signal level 1 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0002 begin');
      const result: string = SignalFormatter.levelName(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('poor'));
      expect(result).assertEqual('poor');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(1) !== 4));
      expect(result === 'great' && Number(1) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0002 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0003
     * @tc.number SUB_RADIO_SIGNALLEVEL_0003
     * @tc.desc   signal level 2 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0003 begin');
      const result: string = SignalFormatter.levelName(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('moderate'));
      expect(result).assertEqual('moderate');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(2) !== 4));
      expect(result === 'great' && Number(2) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0003 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0004
     * @tc.number SUB_RADIO_SIGNALLEVEL_0004
     * @tc.desc   signal level 3 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0004 begin');
      const result: string = SignalFormatter.levelName(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('good'));
      expect(result).assertEqual('good');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(3) !== 4));
      expect(result === 'great' && Number(3) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0004 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0005
     * @tc.number SUB_RADIO_SIGNALLEVEL_0005
     * @tc.desc   signal level 4 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0005 begin');
      const result: string = SignalFormatter.levelName(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('great'));
      expect(result).assertEqual('great');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(4) !== 4));
      expect(result === 'great' && Number(4) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0005 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0006
     * @tc.number SUB_RADIO_SIGNALLEVEL_0006
     * @tc.desc   signal level 5 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0006 begin');
      const result: string = SignalFormatter.levelName(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(5) !== 4));
      expect(result === 'great' && Number(5) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0006 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0007
     * @tc.number SUB_RADIO_SIGNALLEVEL_0007
     * @tc.desc   signal level 6 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0007 begin');
      const result: string = SignalFormatter.levelName(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(6) !== 4));
      expect(result === 'great' && Number(6) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0007 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0008
     * @tc.number SUB_RADIO_SIGNALLEVEL_0008
     * @tc.desc   signal level 7 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0008 begin');
      const result: string = SignalFormatter.levelName(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(7) !== 4));
      expect(result === 'great' && Number(7) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0008 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0009
     * @tc.number SUB_RADIO_SIGNALLEVEL_0009
     * @tc.desc   signal level 8 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0009 begin');
      const result: string = SignalFormatter.levelName(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(8) !== 4));
      expect(result === 'great' && Number(8) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0009 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0010
     * @tc.number SUB_RADIO_SIGNALLEVEL_0010
     * @tc.desc   signal level 9 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0010 begin');
      const result: string = SignalFormatter.levelName(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(9) !== 4));
      expect(result === 'great' && Number(9) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0010 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0011
     * @tc.number SUB_RADIO_SIGNALLEVEL_0011
     * @tc.desc   signal level 10 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0011 begin');
      const result: string = SignalFormatter.levelName(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(10) !== 4));
      expect(result === 'great' && Number(10) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0011 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0012
     * @tc.number SUB_RADIO_SIGNALLEVEL_0012
     * @tc.desc   signal level 11 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0012 begin');
      const result: string = SignalFormatter.levelName(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(11) !== 4));
      expect(result === 'great' && Number(11) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0012 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0013
     * @tc.number SUB_RADIO_SIGNALLEVEL_0013
     * @tc.desc   signal level 12 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0013 begin');
      const result: string = SignalFormatter.levelName(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(12) !== 4));
      expect(result === 'great' && Number(12) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0013 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0014
     * @tc.number SUB_RADIO_SIGNALLEVEL_0014
     * @tc.desc   signal level 13 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0014 begin');
      const result: string = SignalFormatter.levelName(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(13) !== 4));
      expect(result === 'great' && Number(13) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0014 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0015
     * @tc.number SUB_RADIO_SIGNALLEVEL_0015
     * @tc.desc   signal level 14 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0015 begin');
      const result: string = SignalFormatter.levelName(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(14) !== 4));
      expect(result === 'great' && Number(14) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0015 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0016
     * @tc.number SUB_RADIO_SIGNALLEVEL_0016
     * @tc.desc   signal level 15 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0016 begin');
      const result: string = SignalFormatter.levelName(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(15) !== 4));
      expect(result === 'great' && Number(15) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0016 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0017
     * @tc.number SUB_RADIO_SIGNALLEVEL_0017
     * @tc.desc   signal level 16 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0017 begin');
      const result: string = SignalFormatter.levelName(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(16) !== 4));
      expect(result === 'great' && Number(16) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0017 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0018
     * @tc.number SUB_RADIO_SIGNALLEVEL_0018
     * @tc.desc   signal level 17 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0018 begin');
      const result: string = SignalFormatter.levelName(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(17) !== 4));
      expect(result === 'great' && Number(17) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0018 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0019
     * @tc.number SUB_RADIO_SIGNALLEVEL_0019
     * @tc.desc   signal level 18 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0019 begin');
      const result: string = SignalFormatter.levelName(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(18) !== 4));
      expect(result === 'great' && Number(18) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0019 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0020
     * @tc.number SUB_RADIO_SIGNALLEVEL_0020
     * @tc.desc   signal level 19 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0020 begin');
      const result: string = SignalFormatter.levelName(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(19) !== 4));
      expect(result === 'great' && Number(19) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0020 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0021
     * @tc.number SUB_RADIO_SIGNALLEVEL_0021
     * @tc.desc   signal level 20 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0021 begin');
      const result: string = SignalFormatter.levelName(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(20) !== 4));
      expect(result === 'great' && Number(20) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0021 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0022
     * @tc.number SUB_RADIO_SIGNALLEVEL_0022
     * @tc.desc   signal level 21 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0022 begin');
      const result: string = SignalFormatter.levelName(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(21) !== 4));
      expect(result === 'great' && Number(21) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0022 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0023
     * @tc.number SUB_RADIO_SIGNALLEVEL_0023
     * @tc.desc   signal level 22 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0023 begin');
      const result: string = SignalFormatter.levelName(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(22) !== 4));
      expect(result === 'great' && Number(22) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0023 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0024
     * @tc.number SUB_RADIO_SIGNALLEVEL_0024
     * @tc.desc   signal level 23 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0024 begin');
      const result: string = SignalFormatter.levelName(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(23) !== 4));
      expect(result === 'great' && Number(23) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0024 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0025
     * @tc.number SUB_RADIO_SIGNALLEVEL_0025
     * @tc.desc   signal level 24 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0025 begin');
      const result: string = SignalFormatter.levelName(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(24) !== 4));
      expect(result === 'great' && Number(24) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0025 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0026
     * @tc.number SUB_RADIO_SIGNALLEVEL_0026
     * @tc.desc   signal level 25 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0026 begin');
      const result: string = SignalFormatter.levelName(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(25) !== 4));
      expect(result === 'great' && Number(25) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0026 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0027
     * @tc.number SUB_RADIO_SIGNALLEVEL_0027
     * @tc.desc   signal level 26 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0027 begin');
      const result: string = SignalFormatter.levelName(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(26) !== 4));
      expect(result === 'great' && Number(26) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0027 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0028
     * @tc.number SUB_RADIO_SIGNALLEVEL_0028
     * @tc.desc   signal level 27 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0028 begin');
      const result: string = SignalFormatter.levelName(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(27) !== 4));
      expect(result === 'great' && Number(27) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0028 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0029
     * @tc.number SUB_RADIO_SIGNALLEVEL_0029
     * @tc.desc   signal level 28 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0029 begin');
      const result: string = SignalFormatter.levelName(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(28) !== 4));
      expect(result === 'great' && Number(28) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0029 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0030
     * @tc.number SUB_RADIO_SIGNALLEVEL_0030
     * @tc.desc   signal level 29 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0030 begin');
      const result: string = SignalFormatter.levelName(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(29) !== 4));
      expect(result === 'great' && Number(29) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0030 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0031
     * @tc.number SUB_RADIO_SIGNALLEVEL_0031
     * @tc.desc   signal level 30 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0031 begin');
      const result: string = SignalFormatter.levelName(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(30) !== 4));
      expect(result === 'great' && Number(30) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0031 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0032
     * @tc.number SUB_RADIO_SIGNALLEVEL_0032
     * @tc.desc   signal level 31 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0032 begin');
      const result: string = SignalFormatter.levelName(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(31) !== 4));
      expect(result === 'great' && Number(31) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0032 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0033
     * @tc.number SUB_RADIO_SIGNALLEVEL_0033
     * @tc.desc   signal level 32 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0033 begin');
      const result: string = SignalFormatter.levelName(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(32) !== 4));
      expect(result === 'great' && Number(32) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0033 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0034
     * @tc.number SUB_RADIO_SIGNALLEVEL_0034
     * @tc.desc   signal level 33 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0034 begin');
      const result: string = SignalFormatter.levelName(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(33) !== 4));
      expect(result === 'great' && Number(33) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0034 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0035
     * @tc.number SUB_RADIO_SIGNALLEVEL_0035
     * @tc.desc   signal level 34 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0035 begin');
      const result: string = SignalFormatter.levelName(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(34) !== 4));
      expect(result === 'great' && Number(34) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0035 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0036
     * @tc.number SUB_RADIO_SIGNALLEVEL_0036
     * @tc.desc   signal level 35 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0036 begin');
      const result: string = SignalFormatter.levelName(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(35) !== 4));
      expect(result === 'great' && Number(35) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0036 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0037
     * @tc.number SUB_RADIO_SIGNALLEVEL_0037
     * @tc.desc   signal level 36 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0037 begin');
      const result: string = SignalFormatter.levelName(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(36) !== 4));
      expect(result === 'great' && Number(36) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0037 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0038
     * @tc.number SUB_RADIO_SIGNALLEVEL_0038
     * @tc.desc   signal level 37 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0038 begin');
      const result: string = SignalFormatter.levelName(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(37) !== 4));
      expect(result === 'great' && Number(37) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0038 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0039
     * @tc.number SUB_RADIO_SIGNALLEVEL_0039
     * @tc.desc   signal level 38 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0039 begin');
      const result: string = SignalFormatter.levelName(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(38) !== 4));
      expect(result === 'great' && Number(38) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0039 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0040
     * @tc.number SUB_RADIO_SIGNALLEVEL_0040
     * @tc.desc   signal level 39 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0040 begin');
      const result: string = SignalFormatter.levelName(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(39) !== 4));
      expect(result === 'great' && Number(39) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0040 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0041
     * @tc.number SUB_RADIO_SIGNALLEVEL_0041
     * @tc.desc   signal level 40 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0041 begin');
      const result: string = SignalFormatter.levelName(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(40) !== 4));
      expect(result === 'great' && Number(40) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0041 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0042
     * @tc.number SUB_RADIO_SIGNALLEVEL_0042
     * @tc.desc   signal level 41 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0042 begin');
      const result: string = SignalFormatter.levelName(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(41) !== 4));
      expect(result === 'great' && Number(41) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0042 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0043
     * @tc.number SUB_RADIO_SIGNALLEVEL_0043
     * @tc.desc   signal level 42 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0043 begin');
      const result: string = SignalFormatter.levelName(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(42) !== 4));
      expect(result === 'great' && Number(42) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0043 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0044
     * @tc.number SUB_RADIO_SIGNALLEVEL_0044
     * @tc.desc   signal level 43 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0044 begin');
      const result: string = SignalFormatter.levelName(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(43) !== 4));
      expect(result === 'great' && Number(43) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0044 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0045
     * @tc.number SUB_RADIO_SIGNALLEVEL_0045
     * @tc.desc   signal level 44 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0045 begin');
      const result: string = SignalFormatter.levelName(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(44) !== 4));
      expect(result === 'great' && Number(44) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0045 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0046
     * @tc.number SUB_RADIO_SIGNALLEVEL_0046
     * @tc.desc   signal level 45 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0046 begin');
      const result: string = SignalFormatter.levelName(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(45) !== 4));
      expect(result === 'great' && Number(45) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0046 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0047
     * @tc.number SUB_RADIO_SIGNALLEVEL_0047
     * @tc.desc   signal level 46 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0047 begin');
      const result: string = SignalFormatter.levelName(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(46) !== 4));
      expect(result === 'great' && Number(46) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0047 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0048
     * @tc.number SUB_RADIO_SIGNALLEVEL_0048
     * @tc.desc   signal level 47 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0048 begin');
      const result: string = SignalFormatter.levelName(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(47) !== 4));
      expect(result === 'great' && Number(47) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0048 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0049
     * @tc.number SUB_RADIO_SIGNALLEVEL_0049
     * @tc.desc   signal level 48 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0049 begin');
      const result: string = SignalFormatter.levelName(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(48) !== 4));
      expect(result === 'great' && Number(48) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0049 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0050
     * @tc.number SUB_RADIO_SIGNALLEVEL_0050
     * @tc.desc   signal level 49 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0050 begin');
      const result: string = SignalFormatter.levelName(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(49) !== 4));
      expect(result === 'great' && Number(49) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0050 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0051
     * @tc.number SUB_RADIO_SIGNALLEVEL_0051
     * @tc.desc   signal level 50 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0051 begin');
      const result: string = SignalFormatter.levelName(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(50) !== 4));
      expect(result === 'great' && Number(50) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0051 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0052
     * @tc.number SUB_RADIO_SIGNALLEVEL_0052
     * @tc.desc   signal level 51 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0052 begin');
      const result: string = SignalFormatter.levelName(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(51) !== 4));
      expect(result === 'great' && Number(51) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0052 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0053
     * @tc.number SUB_RADIO_SIGNALLEVEL_0053
     * @tc.desc   signal level 52 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0053 begin');
      const result: string = SignalFormatter.levelName(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(52) !== 4));
      expect(result === 'great' && Number(52) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0053 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0054
     * @tc.number SUB_RADIO_SIGNALLEVEL_0054
     * @tc.desc   signal level 53 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0054 begin');
      const result: string = SignalFormatter.levelName(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(53) !== 4));
      expect(result === 'great' && Number(53) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0054 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0055
     * @tc.number SUB_RADIO_SIGNALLEVEL_0055
     * @tc.desc   signal level 54 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0055 begin');
      const result: string = SignalFormatter.levelName(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(54) !== 4));
      expect(result === 'great' && Number(54) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0055 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0056
     * @tc.number SUB_RADIO_SIGNALLEVEL_0056
     * @tc.desc   signal level 55 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0056 begin');
      const result: string = SignalFormatter.levelName(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(55) !== 4));
      expect(result === 'great' && Number(55) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0056 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0057
     * @tc.number SUB_RADIO_SIGNALLEVEL_0057
     * @tc.desc   signal level 56 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0057 begin');
      const result: string = SignalFormatter.levelName(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(56) !== 4));
      expect(result === 'great' && Number(56) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0057 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0058
     * @tc.number SUB_RADIO_SIGNALLEVEL_0058
     * @tc.desc   signal level 57 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0058 begin');
      const result: string = SignalFormatter.levelName(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(57) !== 4));
      expect(result === 'great' && Number(57) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0058 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0059
     * @tc.number SUB_RADIO_SIGNALLEVEL_0059
     * @tc.desc   signal level 58 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0059 begin');
      const result: string = SignalFormatter.levelName(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(58) !== 4));
      expect(result === 'great' && Number(58) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0059 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0060
     * @tc.number SUB_RADIO_SIGNALLEVEL_0060
     * @tc.desc   signal level 59 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0060 begin');
      const result: string = SignalFormatter.levelName(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(59) !== 4));
      expect(result === 'great' && Number(59) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0060 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0061
     * @tc.number SUB_RADIO_SIGNALLEVEL_0061
     * @tc.desc   signal level 60 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0061 begin');
      const result: string = SignalFormatter.levelName(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(60) !== 4));
      expect(result === 'great' && Number(60) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0061 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0062
     * @tc.number SUB_RADIO_SIGNALLEVEL_0062
     * @tc.desc   signal level 61 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0062 begin');
      const result: string = SignalFormatter.levelName(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(61) !== 4));
      expect(result === 'great' && Number(61) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0062 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0063
     * @tc.number SUB_RADIO_SIGNALLEVEL_0063
     * @tc.desc   signal level 62 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0063 begin');
      const result: string = SignalFormatter.levelName(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(62) !== 4));
      expect(result === 'great' && Number(62) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0063 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0064
     * @tc.number SUB_RADIO_SIGNALLEVEL_0064
     * @tc.desc   signal level 63 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0064 begin');
      const result: string = SignalFormatter.levelName(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(63) !== 4));
      expect(result === 'great' && Number(63) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0064 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0065
     * @tc.number SUB_RADIO_SIGNALLEVEL_0065
     * @tc.desc   signal level 64 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0065 begin');
      const result: string = SignalFormatter.levelName(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(64) !== 4));
      expect(result === 'great' && Number(64) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0065 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0066
     * @tc.number SUB_RADIO_SIGNALLEVEL_0066
     * @tc.desc   signal level 65 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0066 begin');
      const result: string = SignalFormatter.levelName(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(65) !== 4));
      expect(result === 'great' && Number(65) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0066 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0067
     * @tc.number SUB_RADIO_SIGNALLEVEL_0067
     * @tc.desc   signal level 66 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0067 begin');
      const result: string = SignalFormatter.levelName(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(66) !== 4));
      expect(result === 'great' && Number(66) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0067 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0068
     * @tc.number SUB_RADIO_SIGNALLEVEL_0068
     * @tc.desc   signal level 67 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0068 begin');
      const result: string = SignalFormatter.levelName(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(67) !== 4));
      expect(result === 'great' && Number(67) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0068 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0069
     * @tc.number SUB_RADIO_SIGNALLEVEL_0069
     * @tc.desc   signal level 68 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0069 begin');
      const result: string = SignalFormatter.levelName(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(68) !== 4));
      expect(result === 'great' && Number(68) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0069 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0070
     * @tc.number SUB_RADIO_SIGNALLEVEL_0070
     * @tc.desc   signal level 69 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0070 begin');
      const result: string = SignalFormatter.levelName(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(69) !== 4));
      expect(result === 'great' && Number(69) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0070 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0071
     * @tc.number SUB_RADIO_SIGNALLEVEL_0071
     * @tc.desc   signal level 70 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0071 begin');
      const result: string = SignalFormatter.levelName(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(70) !== 4));
      expect(result === 'great' && Number(70) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0071 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0072
     * @tc.number SUB_RADIO_SIGNALLEVEL_0072
     * @tc.desc   signal level 71 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0072 begin');
      const result: string = SignalFormatter.levelName(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(71) !== 4));
      expect(result === 'great' && Number(71) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0072 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0073
     * @tc.number SUB_RADIO_SIGNALLEVEL_0073
     * @tc.desc   signal level 72 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0073 begin');
      const result: string = SignalFormatter.levelName(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(72) !== 4));
      expect(result === 'great' && Number(72) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0073 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0074
     * @tc.number SUB_RADIO_SIGNALLEVEL_0074
     * @tc.desc   signal level 73 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0074 begin');
      const result: string = SignalFormatter.levelName(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(73) !== 4));
      expect(result === 'great' && Number(73) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0074 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0075
     * @tc.number SUB_RADIO_SIGNALLEVEL_0075
     * @tc.desc   signal level 74 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0075 begin');
      const result: string = SignalFormatter.levelName(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(74) !== 4));
      expect(result === 'great' && Number(74) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0075 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0076
     * @tc.number SUB_RADIO_SIGNALLEVEL_0076
     * @tc.desc   signal level -1 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0076 begin');
      const result: string = SignalFormatter.levelName(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(-1) !== 4));
      expect(result === 'great' && Number(-1) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0076 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0077
     * @tc.number SUB_RADIO_SIGNALLEVEL_0077
     * @tc.desc   signal level -4 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0077 begin');
      const result: string = SignalFormatter.levelName(-4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(-4) !== 4));
      expect(result === 'great' && Number(-4) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0077 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0078
     * @tc.number SUB_RADIO_SIGNALLEVEL_0078
     * @tc.desc   signal level 0.5 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0078 begin');
      const result: string = SignalFormatter.levelName(0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(0.5) !== 4));
      expect(result === 'great' && Number(0.5) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0078 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0079
     * @tc.number SUB_RADIO_SIGNALLEVEL_0079
     * @tc.desc   signal level 4.5 maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0079 begin');
      const result: string = SignalFormatter.levelName(4.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'great' && Number(4.5) !== 4));
      expect(result === 'great' && Number(4.5) !== 4).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0079 end');
    })

    /**
     * @tc.name   testRadioSignalLevel0080
     * @tc.number SUB_RADIO_SIGNALLEVEL_0080
     * @tc.desc   最高信号档位映射到 great
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalLevel0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0080 begin');
      const anchorResult: string = SignalFormatter.levelName(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(anchorResult), String('great'));
      expect(anchorResult).assertEqual('great');
      expect(anchorResult.length).assertEqual(5);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalLevel0080 end');
    })
  })
}
