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

export default function historyCompleteVolume02Test(): void {
  describe('HistoryCompleteVolume02Test', () => {

    /**
     * @tc.name   testHistoryCompleteVolume020001
     * @tc.number SUB_CCE_HISTCMP_02_0001
     * @tc.desc   第2槽取值『 』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020001 begin');
      const record: Array<string> = arr('c| |c|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020001 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020002
     * @tc.number SUB_CCE_HISTCMP_02_0002
     * @tc.desc   第3槽取值『 』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020002 begin');
      const record: Array<string> = arr('c|c| |c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020002 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020003
     * @tc.number SUB_CCE_HISTCMP_02_0003
     * @tc.desc   第4槽取值『 』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020003 begin');
      const record: Array<string> = arr('c|c|c| ');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String(' '));
      expect(String(record[3])).assertEqual(' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020003 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020004
     * @tc.number SUB_CCE_HISTCMP_02_0004
     * @tc.desc   第 5 槽取值『 』时长度 5 记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020004 begin');
      const record: Array<string> = arr('c|c|c|c| ');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020004 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020005
     * @tc.number SUB_CCE_HISTCMP_02_0005
     * @tc.desc   第2槽取值『0』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020005 begin');
      const record: Array<string> = arr('c|0|c|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020005 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020006
     * @tc.number SUB_CCE_HISTCMP_02_0006
     * @tc.desc   第3槽取值『0』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020006 begin');
      const record: Array<string> = arr('c|c|0|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020006 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020007
     * @tc.number SUB_CCE_HISTCMP_02_0007
     * @tc.desc   第4槽取值『0』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020007 begin');
      const record: Array<string> = arr('c|c|c|0');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('0'));
      expect(String(record[3])).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020007 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020008
     * @tc.number SUB_CCE_HISTCMP_02_0008
     * @tc.desc   第 5 槽取值『0』时长度 5 记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020008 begin');
      const record: Array<string> = arr('c|c|c|c|0');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020008 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020009
     * @tc.number SUB_CCE_HISTCMP_02_0009
     * @tc.desc   第2槽取值『null』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020009 begin');
      const record: Array<string> = arr('c|null|c|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020009 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020010
     * @tc.number SUB_CCE_HISTCMP_02_0010
     * @tc.desc   第3槽取值『null』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020010 begin');
      const record: Array<string> = arr('c|c|null|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020010 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020011
     * @tc.number SUB_CCE_HISTCMP_02_0011
     * @tc.desc   第4槽取值『null』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020011 begin');
      const record: Array<string> = arr('c|c|c|null');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('null'));
      expect(String(record[3])).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020011 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020012
     * @tc.number SUB_CCE_HISTCMP_02_0012
     * @tc.desc   第 5 槽取值『null』时长度 5 记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020012 begin');
      const record: Array<string> = arr('c|c|c|c|null');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020012 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020013
     * @tc.number SUB_CCE_HISTCMP_02_0013
     * @tc.desc   第2槽取值『undefined』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020013 begin');
      const record: Array<string> = arr('c|undefined|c|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020013 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020014
     * @tc.number SUB_CCE_HISTCMP_02_0014
     * @tc.desc   第3槽取值『undefined』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020014 begin');
      const record: Array<string> = arr('c|c|undefined|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020014 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020015
     * @tc.number SUB_CCE_HISTCMP_02_0015
     * @tc.desc   第4槽取值『undefined』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020015 begin');
      const record: Array<string> = arr('c|c|c|undefined');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('undefined'));
      expect(String(record[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020015 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020016
     * @tc.number SUB_CCE_HISTCMP_02_0016
     * @tc.desc   第 5 槽取值『undefined』时长度 5 记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020016 begin');
      const record: Array<string> = arr('c|c|c|c|undefined');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020016 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020017
     * @tc.number SUB_CCE_HISTCMP_02_0017
     * @tc.desc   第2槽取值『true』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020017 begin');
      const record: Array<string> = arr('c|true|c|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020017 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020018
     * @tc.number SUB_CCE_HISTCMP_02_0018
     * @tc.desc   第3槽取值『true』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020018 begin');
      const record: Array<string> = arr('c|c|true|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020018 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020019
     * @tc.number SUB_CCE_HISTCMP_02_0019
     * @tc.desc   第4槽取值『true』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020019 begin');
      const record: Array<string> = arr('c|c|c|true');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('true'));
      expect(String(record[3])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020019 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020020
     * @tc.number SUB_CCE_HISTCMP_02_0020
     * @tc.desc   第 5 槽取值『true』时长度 5 记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020020 begin');
      const record: Array<string> = arr('c|c|c|c|true');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020020 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020021
     * @tc.number SUB_CCE_HISTCMP_02_0021
     * @tc.desc   第2槽取值『-1』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020021 begin');
      const record: Array<string> = arr('c|-1|c|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020021 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020022
     * @tc.number SUB_CCE_HISTCMP_02_0022
     * @tc.desc   第3槽取值『-1』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020022 begin');
      const record: Array<string> = arr('c|c|-1|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020022 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020023
     * @tc.number SUB_CCE_HISTCMP_02_0023
     * @tc.desc   第4槽取值『-1』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020023 begin');
      const record: Array<string> = arr('c|c|c|-1');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('-1'));
      expect(String(record[3])).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020023 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020024
     * @tc.number SUB_CCE_HISTCMP_02_0024
     * @tc.desc   第 5 槽取值『-1』时长度 5 记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020024 begin');
      const record: Array<string> = arr('c|c|c|c|-1');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020024 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020025
     * @tc.number SUB_CCE_HISTCMP_02_0025
     * @tc.desc   第2槽取值『a b』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020025 begin');
      const record: Array<string> = arr('c|a b|c|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020025 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020026
     * @tc.number SUB_CCE_HISTCMP_02_0026
     * @tc.desc   第3槽取值『a b』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020026 begin');
      const record: Array<string> = arr('c|c|a b|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020026 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020027
     * @tc.number SUB_CCE_HISTCMP_02_0027
     * @tc.desc   第4槽取值『a b』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020027 begin');
      const record: Array<string> = arr('c|c|c|a b');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('a b'));
      expect(String(record[3])).assertEqual('a b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020027 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020028
     * @tc.number SUB_CCE_HISTCMP_02_0028
     * @tc.desc   第 5 槽取值『a b』时长度 5 记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020028 begin');
      const record: Array<string> = arr('c|c|c|c|a b');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020028 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020029
     * @tc.number SUB_CCE_HISTCMP_02_0029
     * @tc.desc   第2槽取值『中文』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020029 begin');
      const record: Array<string> = arr('c|中文|c|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020029 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020030
     * @tc.number SUB_CCE_HISTCMP_02_0030
     * @tc.desc   第3槽取值『中文』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020030 begin');
      const record: Array<string> = arr('c|c|中文|c');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020030 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020031
     * @tc.number SUB_CCE_HISTCMP_02_0031
     * @tc.desc   第4槽取值『中文』时四槽记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020031 begin');
      const record: Array<string> = arr('c|c|c|中文');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('中文'));
      expect(String(record[3])).assertEqual('中文');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020031 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020032
     * @tc.number SUB_CCE_HISTCMP_02_0032
     * @tc.desc   第 5 槽取值『中文』时长度 5 记录仍完整
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020032 begin');
      const record: Array<string> = arr('c|c|c|c|中文');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('c'));
      expect(String(record[3])).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020032 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020033
     * @tc.number SUB_CCE_HISTCMP_02_0033
     * @tc.desc   特殊值混合『0, ,null,true』时完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020033 begin');
      const record: Array<string> = arr('0| |null|true');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('true'));
      expect(String(record[3])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020033 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020034
     * @tc.number SUB_CCE_HISTCMP_02_0034
     * @tc.desc   特殊值混合『c,0,空串,true』时完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020034 begin');
      const record: Array<string> = arr('c|0||true');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('true'));
      expect(String(record[3])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020034 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020035
     * @tc.number SUB_CCE_HISTCMP_02_0035
     * @tc.desc   特殊值混合『空串,c, ,0』时完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020035 begin');
      const record: Array<string> = arr('|c| |0');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('0'));
      expect(String(record[3])).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020035 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020036
     * @tc.number SUB_CCE_HISTCMP_02_0036
     * @tc.desc   特殊值混合『中文, ,null,-1』时完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020036 begin');
      const record: Array<string> = arr('中文| |null|-1');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('-1'));
      expect(String(record[3])).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020036 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020037
     * @tc.number SUB_CCE_HISTCMP_02_0037
     * @tc.desc   特殊值混合『c,空串,a b,空串』时完整性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020037 begin');
      const record: Array<string> = arr('c||a b|');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String(''));
      expect(String(record[3])).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020037 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020038
     * @tc.number SUB_CCE_HISTCMP_02_0038
     * @tc.desc   特殊值混合『true, ,undefined,中文』时完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020038 begin');
      const record: Array<string> = arr('true| |undefined|中文');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(4));
      expect(record.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('中文'));
      expect(String(record[3])).assertEqual('中文');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020038 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020039
     * @tc.number SUB_CCE_HISTCMP_02_0039
     * @tc.desc   特殊值混合『0,0,0,0,0』时完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020039 begin');
      const record: Array<string> = arr('0|0|0|0|0');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('0'));
      expect(String(record[3])).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020039 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020040
     * @tc.number SUB_CCE_HISTCMP_02_0040
     * @tc.desc   特殊值混合『null,null,null,null,null』时完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020040 begin');
      const record: Array<string> = arr('null|null|null|null|null');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('null'));
      expect(String(record[3])).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020040 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020041
     * @tc.number SUB_CCE_HISTCMP_02_0041
     * @tc.desc   特殊值混合『-1, ,0,true,中文』时完整性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020041 begin');
      const record: Array<string> = arr('-1| |0|true|中文');
      const result: boolean = historyFeature.isCompleteRecord(record);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(record.length), String(5));
      expect(record.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(record[3])), String('true'));
      expect(String(record[3])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020041 end');
    })

    /**
     * @tc.name   testHistoryCompleteVolume020042
     * @tc.number SUB_CCE_HISTCMP_02_0042
     * @tc.desc   长度 6 尾部两空串仍判完整，第 4 槽空串则判不完整（前四槽口径）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryCompleteVolume020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020042 begin');
      const tailBlanks: Array<string> = ['a', 'b', 'c', 'd', '', ''];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(historyFeature.isCompleteRecord(tailBlanks)), 'true');
      expect(historyFeature.isCompleteRecord(tailBlanks)).assertTrue();
      const fourthBlank: Array<string> = ['a', 'b', 'c', '', 'd', 'x'];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(historyFeature.isCompleteRecord(fourthBlank)), 'false');
      expect(historyFeature.isCompleteRecord(fourthBlank)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tailBlanks.length), String(6));
      expect(tailBlanks.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryCompleteVolume020042 end');
    })
  })
}
