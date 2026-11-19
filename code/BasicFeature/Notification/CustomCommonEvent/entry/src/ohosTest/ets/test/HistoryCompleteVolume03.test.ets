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
import historyFeature from '../../../main/ets/feature/HistoryFeature';
import { arr } from './helper/VolumeSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function historyCompleteVolume03Test(): void {
  describe('HistoryCompleteVolume03Test', () => {

    /**
     * @tc.name   testHistoryCompleteVolume030001
     * @tc.number SUB_CCE_HISTCMP_03_0001
     * @tc.desc   记录「k1|k2|k3」的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030001 begin');
      const record: Array<string> = arr('k1|k2|k3');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(3));
      expect(record.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('undefined'));
      expect(String(record[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030001 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030002
     * @tc.number SUB_CCE_HISTCMP_03_0002
     * @tc.desc   记录「a1|a2|a3」的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030002 begin');
      const record: Array<string> = arr('a1|a2|a3');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(3));
      expect(record.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('undefined'));
      expect(String(record[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030002 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030003
     * @tc.number SUB_CCE_HISTCMP_03_0003
     * @tc.desc   记录「z|y|x」的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030003 begin');
      const record: Array<string> = arr('z|y|x');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(3));
      expect(record.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('undefined'));
      expect(String(record[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030003 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030004
     * @tc.number SUB_CCE_HISTCMP_03_0004
     * @tc.desc   记录「k1|k2」的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030004 begin');
      const record: Array<string> = arr('k1|k2');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(2));
      expect(record.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('undefined'));
      expect(String(record[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030004 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030005
     * @tc.number SUB_CCE_HISTCMP_03_0005
     * @tc.desc   记录「k1」的完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030005 begin');
      const record: Array<string> = arr('k1');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(1));
      expect(record.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('undefined'));
      expect(String(record[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030005 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030006
     * @tc.number SUB_CCE_HISTCMP_03_0006
     * @tc.desc   记录「  |k|k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030006 begin');
      const record: Array<string> = arr('  |k|k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030006 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030007
     * @tc.number SUB_CCE_HISTCMP_03_0007
     * @tc.desc   记录「k|  |k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030007 begin');
      const record: Array<string> = arr('k|  |k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030007 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030008
     * @tc.number SUB_CCE_HISTCMP_03_0008
     * @tc.desc   记录「k|k|  |k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030008 begin');
      const record: Array<string> = arr('k|k|  |k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030008 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030009
     * @tc.number SUB_CCE_HISTCMP_03_0009
     * @tc.desc   记录「k|k|k|  」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030009 begin');
      const record: Array<string> = arr('k|k|k|  ');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('  '));
      expect(String(record[3])).assertEqual('  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030009 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030010
     * @tc.number SUB_CCE_HISTCMP_03_0010
     * @tc.desc   记录「 k1|k|k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030010 begin');
      const record: Array<string> = arr(' k1|k|k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030010 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030011
     * @tc.number SUB_CCE_HISTCMP_03_0011
     * @tc.desc   记录「k| k1|k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030011 begin');
      const record: Array<string> = arr('k| k1|k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030011 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030012
     * @tc.number SUB_CCE_HISTCMP_03_0012
     * @tc.desc   记录「k|k| k1|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030012 begin');
      const record: Array<string> = arr('k|k| k1|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030012 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030013
     * @tc.number SUB_CCE_HISTCMP_03_0013
     * @tc.desc   记录「k|k|k| k1」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030013 begin');
      const record: Array<string> = arr('k|k|k| k1');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String(' k1'));
      expect(String(record[3])).assertEqual(' k1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030013 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030014
     * @tc.number SUB_CCE_HISTCMP_03_0014
     * @tc.desc   记录「k1 |k|k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030014 begin');
      const record: Array<string> = arr('k1 |k|k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030014 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030015
     * @tc.number SUB_CCE_HISTCMP_03_0015
     * @tc.desc   记录「k|k1 |k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030015 begin');
      const record: Array<string> = arr('k|k1 |k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030015 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030016
     * @tc.number SUB_CCE_HISTCMP_03_0016
     * @tc.desc   记录「k|k|k1 |k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030016 begin');
      const record: Array<string> = arr('k|k|k1 |k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030016 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030017
     * @tc.number SUB_CCE_HISTCMP_03_0017
     * @tc.desc   记录「k|k|k|k1 」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030017 begin');
      const record: Array<string> = arr('k|k|k|k1 ');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k1 '));
      expect(String(record[3])).assertEqual('k1 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030017 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030018
     * @tc.number SUB_CCE_HISTCMP_03_0018
     * @tc.desc   记录「 k1 |k|k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030018 begin');
      const record: Array<string> = arr(' k1 |k|k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030018 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030019
     * @tc.number SUB_CCE_HISTCMP_03_0019
     * @tc.desc   记录「k| k1 |k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030019 begin');
      const record: Array<string> = arr('k| k1 |k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030019 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030020
     * @tc.number SUB_CCE_HISTCMP_03_0020
     * @tc.desc   记录「　|k|k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030020 begin');
      const record: Array<string> = arr('　|k|k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030020 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030021
     * @tc.number SUB_CCE_HISTCMP_03_0021
     * @tc.desc   记录「k|　|k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030021 begin');
      const record: Array<string> = arr('k|　|k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030021 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030022
     * @tc.number SUB_CCE_HISTCMP_03_0022
     * @tc.desc   记录「k|k|　|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030022 begin');
      const record: Array<string> = arr('k|k|　|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030022 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030023
     * @tc.number SUB_CCE_HISTCMP_03_0023
     * @tc.desc   记录「k|k|k|　」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030023 begin');
      const record: Array<string> = arr('k|k|k|　');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('　'));
      expect(String(record[3])).assertEqual('　');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030023 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030024
     * @tc.number SUB_CCE_HISTCMP_03_0024
     * @tc.desc   记录「k|k|k|k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030024 begin');
      const record: Array<string> = arr('k|k|k|k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030024 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030025
     * @tc.number SUB_CCE_HISTCMP_03_0025
     * @tc.desc   记录「k|k|k|k|k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030025 begin');
      const record: Array<string> = arr('k|k|k|k|k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(6));
      expect(record.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030025 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030026
     * @tc.number SUB_CCE_HISTCMP_03_0026
     * @tc.desc   记录「k|k|k|k|k|k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030026 begin');
      const record: Array<string> = arr('k|k|k|k|k|k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(7));
      expect(record.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030026 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030027
     * @tc.number SUB_CCE_HISTCMP_03_0027
     * @tc.desc   记录「k|k|k|k|k|k|k|k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030027 begin');
      const record: Array<string> = arr('k|k|k|k|k|k|k|k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(8));
      expect(record.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030027 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030028
     * @tc.number SUB_CCE_HISTCMP_03_0028
     * @tc.desc   记录「k|k|k|k|」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030028 begin');
      const record: Array<string> = arr('k|k|k|k|');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030028 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030029
     * @tc.number SUB_CCE_HISTCMP_03_0029
     * @tc.desc   记录「k|k|k|k||k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030029 begin');
      const record: Array<string> = arr('k|k|k|k||k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(6));
      expect(record.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030029 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030030
     * @tc.number SUB_CCE_HISTCMP_03_0030
     * @tc.desc   记录「k|k|k|k|k|」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030030 begin');
      const record: Array<string> = arr('k|k|k|k|k|');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(6));
      expect(record.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030030 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030031
     * @tc.number SUB_CCE_HISTCMP_03_0031
     * @tc.desc   记录「k|k|k|k||」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030031 begin');
      const record: Array<string> = arr('k|k|k|k||');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(6));
      expect(record.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030031 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030032
     * @tc.number SUB_CCE_HISTCMP_03_0032
     * @tc.desc   记录「值一|值二|值三|值四」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030032 begin');
      const record: Array<string> = arr('值一|值二|值三|值四');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('值四'));
      expect(String(record[3])).assertEqual('值四');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030032 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030033
     * @tc.number SUB_CCE_HISTCMP_03_0033
     * @tc.desc   记录「ＶＡＬ|ＶＡＬ|ＶＡＬ|ＶＡＬ」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030033 begin');
      const record: Array<string> = arr('ＶＡＬ|ＶＡＬ|ＶＡＬ|ＶＡＬ');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('ＶＡＬ'));
      expect(String(record[3])).assertEqual('ＶＡＬ');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030033 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030034
     * @tc.number SUB_CCE_HISTCMP_03_0034
     * @tc.desc   记录「值|　|值|值」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030034 begin');
      const record: Array<string> = arr('值|　|值|值');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('值'));
      expect(String(record[3])).assertEqual('值');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030034 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030035
     * @tc.number SUB_CCE_HISTCMP_03_0035
     * @tc.desc   记录「  |k1| k2|k3 」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030035 begin');
      const record: Array<string> = arr('  |k1| k2|k3 ');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k3 '));
      expect(String(record[3])).assertEqual('k3 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030035 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030036
     * @tc.number SUB_CCE_HISTCMP_03_0036
     * @tc.desc   记录「k1|  |　|k3」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030036 begin');
      const record: Array<string> = arr('k1|  |　|k3');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k3'));
      expect(String(record[3])).assertEqual('k3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030036 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030037
     * @tc.number SUB_CCE_HISTCMP_03_0037
     * @tc.desc   记录「　|　|　|　」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030037 begin');
      const record: Array<string> = arr('　|　|　|　');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('　'));
      expect(String(record[3])).assertEqual('　');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030037 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030038
     * @tc.number SUB_CCE_HISTCMP_03_0038
     * @tc.desc   记录「 k| k| k| k」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030038 begin');
      const record: Array<string> = arr(' k| k| k| k');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String(' k'));
      expect(String(record[3])).assertEqual(' k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030038 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030039
     * @tc.number SUB_CCE_HISTCMP_03_0039
     * @tc.desc   记录「k |k |k |k 」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030039 begin');
      const record: Array<string> = arr('k |k |k |k ');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k '));
      expect(String(record[3])).assertEqual('k ');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030039 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030040
     * @tc.number SUB_CCE_HISTCMP_03_0040
     * @tc.desc   记录「kk|kk|kk|kk|kk」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030040 begin');
      const record: Array<string> = arr('kk|kk|kk|kk|kk');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('kk'));
      expect(String(record[3])).assertEqual('kk');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030040 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030041
     * @tc.number SUB_CCE_HISTCMP_03_0041
     * @tc.desc   记录「k|k|k|k|　」的完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030041 begin');
      const record: Array<string> = arr('k|k|k|k|　');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('k'));
      expect(String(record[3])).assertEqual('k');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030041 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume030042
     * @tc.number SUB_CCE_HISTCMP_03_0042
     * @tc.desc   四槽全为 80 字符超长值仍完整；单槽 200 字符与其余短值混合同样完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume030042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030042 begin');
      const longAll: boolean = historyFeature.isCompleteRecord(arr('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL|LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL|LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL|LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(longAll), 'true');
      expect(longAll).assertTrue();
      const longMixed: boolean = historyFeature.isCompleteRecord(arr('s|MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM| |t'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(longMixed), 'true');
      expect(longMixed).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(longAll && longMixed));
      expect(longAll && longMixed).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume030042 end');
    })
  })
}
